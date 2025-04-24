import ArgumentParser
import Foundation
import GenerationHelpers
import swsh
import Yams

public struct PackageInit: ParsableCommand {
    public static var configuration = CommandConfiguration(abstract: "create/update the recommended files for a bindings repo in the current directory")

    @Flag(help: "continue with generation, even if not in a clean git state")
    var force = false

    var includeFilesNotMarkedAsGenerated = true
    var config: FishyJoesConfig!
    @NilDecode var phasesList: [any Phases]?
    var templateReplacements: [String: String]!
    var swiftPackage: SwiftPackage?
    var swiftPackageResolved: SwiftPackageResolved?

    struct Error: Swift.Error {}

    public init() {}
    init(
        config: FishyJoesConfig,
        phasesList: [any Phases],
        swiftPackage: SwiftPackage,
        swiftPackageResolved: SwiftPackageResolved,
        includeFilesNotMarkedAsGenerated: Bool
    ) throws {
        self.config = config
        self.phasesList = phasesList
        self.swiftPackage = swiftPackage
        self.swiftPackageResolved = swiftPackageResolved
        self.includeFilesNotMarkedAsGenerated = includeFilesNotMarkedAsGenerated
        self.templateReplacements = try generateTemplateReplacements()
    }

    public mutating func run() throws {
        ExternalCommand.verbose = true

        if (try? cmd("git", "status", "--porcelain", ".").runString().isEmpty) != true {
            guard force else {
                Log.error("Uncommitted changes present. Refusing to run. Specify --force to override safety")
                throw Error()
            }
            Log.warn("Uncommitted changes present. Continuing anyway.")
        }
        if config == nil {
            config = try (try? FishyJoesConfig.readFromFile(basePath: ".")) ?? promptForConfig()
            self.templateReplacements = try generateTemplateReplacements()
        }

        try installTemplate()
        try setupKotlin(config: config)
        try setupCSharp(config: config)
    }

    func installTemplate() throws {
        let templateRoot = Bundle.module.resourceURL!.appendingPathComponent("bindings-template", isDirectory: true).path
        try install(".", in: templateRoot, to: "bindings")
    }

    func setupKotlin(config: FishyJoesConfig) throws {
        // Install gradle
        if !cmd("gradle", "--version").runBool() {
            try Interactive.confirmCommand(description: "Install gradle", cmd("brew", "install", "gradle"))
        }
    }

    func setupCSharp(config: FishyJoesConfig) throws {
        // Install dotnet
        if !cmd("dotnet", "--version").runBool() {
            try Interactive.confirmCommand(description: "Install dotnet", cmd("brew", "install", "dotnet"))
        }
    }

    enum InstallBehavior {
        case skip, copy, template
        case symlink(installName: String)

        // When installing a file marked with this, PackageInit should template first, then merge the resulting JSON or YAML file with a user customization file
        case templateAndMergeWithOverride(overridePath: String)
    }

    func installBehavior(for fileName: String, in directory: String, templateRoot: String) throws -> InstallBehavior {
        let path = "\(templateRoot)/\(directory)/\(fileName)"
        if [".DS_Store", ".gradle"].contains(fileName) {
            return .skip
        }

        if let installName = fileName.trimmingIfSuffixed(".symlink") {
            return .symlink(installName: String(installName))
        }

        // Mapping from paths of customizable files to the path of the override file
        let overridablePaths = [
            "./dart/__TEMPLATE__/pubspec.yaml": "bindings/dart/pubspec.override.yaml",
            "./dart/__TEMPLATE__/flutter-pubspec.yaml": "bindings/dart/flutter-pubspec.override.yaml",
            "./ts/__TEMPLATE__/package.wasm.json": "bindings/ts/package.override.json",
            "./ts/__TEMPLATE__/package.native-macos.json": "bindings/ts/package.override.json",
            "./ts/__TEMPLATE__/package.native-ubuntu.json": "bindings/ts/package.override.json",
            "./ts/__TEMPLATE__/package.native-windows.json": "bindings/ts/package.override.json",
            "./ts/tests/__TEMPLATE__/package.__TEMPLATE__.json": "bindings/ts/tests/package.override.json",
        ]
        if let overridePath = overridablePaths["\(directory)/\(fileName)"] {
            return .templateAndMergeWithOverride(overridePath: overridePath)
        }

        let fileType = try FileManager.default.attributesOfItem(atPath: path)[.type] as! FileAttributeType
        if
            !includeFilesNotMarkedAsGenerated,
            fileType == .typeRegular,
            path.range(of: #"\b(generated|__template__)\b"#, options: [.regularExpression, .caseInsensitive]) == nil
        {
            return .skip
        }

        if fileName == "gradlew" || fileName.hasSuffix(".jar") {
            return .copy
        }

        return .template
    }

    func install(_ localSourcePath: String, in templateRoot: String, to destPath: String) throws {
        // Log.info("installing \(sourcePath) -> \(destPath)")
        let absoluteSourcePath = "\(templateRoot)/\(localSourcePath)"
        let manager = FileManager.default
        var isDirectory: ObjCBool = false
        guard manager.fileExists(atPath: absoluteSourcePath, isDirectory: &isDirectory) else {
            fatalError("Internal error. I was sure that path existed... \(absoluteSourcePath)")
        }
        if isDirectory.boolValue {
            try manager.createDirectory(atPath: destPath, withIntermediateDirectories: true)
            for sourceName in try manager.contentsOfDirectory(atPath: absoluteSourcePath) {
                let destName = processString(sourceName)
                switch try installBehavior(for: sourceName, in: localSourcePath, templateRoot: templateRoot) {
                case .skip: continue
                case .copy:
                    try cmd(
                        "cp", "-Rfp",
                        "\(absoluteSourcePath)/\(sourceName)",
                        "\(destPath)/\(destName)"
                    ).run()
                case .template:
                    try install(
                        "\(localSourcePath)/\(sourceName)",
                        in: templateRoot,
                        to: "\(destPath)/\(destName)"
                    )
                case .symlink(let installName):
                    let linkDestination = try cmd("cat", "\(absoluteSourcePath)/\(sourceName)").runString()
                    try cmd("ln", "-sf", linkDestination, "\(destPath)/\(installName)").run()
                case .templateAndMergeWithOverride(let overridePath):
                    if FileManager.default.fileExists(atPath: overridePath) {
                        Log.info("Applying customiziations from \(overridePath) to \(destPath)/\(destName)")
                    }
                    let contents = processString(try String(contentsOfFile: "\(absoluteSourcePath)/\(sourceName)"))
                    if sourceName.hasSuffix(".json") {
                        try outputMergedJSON(
                            baseJSON: contents,
                            overridePath: overridePath,
                            overwritingFile: "\(destPath)/\(destName)"
                        )
                    } else if sourceName.hasSuffix(".yaml") {
                        try outputMergedYAML(
                            baseYAML: contents,
                            overridePath: overridePath,
                            overwritingFile: "\(destPath)/\(destName)"
                        )
                    } else {
                        fatalError("Internal error. Don't know how to apply overrides to template file '\(sourceName)'")
                    }
                }
            }
        } else {
            let contents = processString(try String(contentsOfFile: absoluteSourcePath))
            try contents.write(toFile: destPath, atomically: true, encoding: .utf8)
        }
    }

    private func outputMergedJSON(baseJSON: String, overridePath: String, overwritingFile: String) throws {
        let command: any Command
        if FileManager.default.fileExists(atPath: overridePath) {
            // Recursively merge 2 JSON files, preferring entries in the 2nd
            command = cmd("jq", "-e", "-s", ".[0] * .[1]", "-", overridePath)
        } else {
            command = cmd("cat")
        }
        try command
            .input(baseJSON)
            .output(overwritingFile: overwritingFile)
            .run()
    }

    private func outputMergedYAML(baseYAML: String, overridePath: String, overwritingFile: String) throws {
        let command: any Command
        if FileManager.default.fileExists(atPath: overridePath) {
            // Recursively merge 2 yaml files, preferring entries in the 2nd
            command = cmd("yq", "-e", "-p=yaml", "-o=yaml", #". * load("\#(overridePath)")"#)
        } else {
            command = cmd("cat")
        }
        try command
            .input(baseYAML)
            .output(overwritingFile: overwritingFile)
            .run()
    }

    func generateTemplateReplacements() throws -> [String: String] {
        var replacements: [String: String] = [:]

        // MARK: generic replacements
        replacements["__MODULE_NAME__"] = config.module
        replacements["__LOWERCASE_MODULE_NAME__"] = config.module.lowercased()
        replacements["__LOWERCASE_FIRST_MODULE_NAME__"] = (config.module.first?.lowercased() ?? "") + config.module.dropFirst()
        replacements["__BINDINGS_REPO__"] = config.publishRepository

        // A template file is hand-crafted, and then it turns into a generated file, which should not be modified
        replacements["__TEMPLATE__"] = "generated"
        replacements["__TEMPLATE_CAPS__"] = "GENERATED"
        replacements["__AUTOGEN_WARNING__"] = "THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT."

        // Collect language-specific replacements from phases
        for phases in phasesList ?? [] {
            for (key, value) in try phases.generationPhaseTemplateReplacements() {
                if let oldValue = replacements[key], oldValue != value {
                    fatalError("Conflicting templates for key '\(key)':\n  \(oldValue)\n  \(value)")
                }
                replacements[key] = value
            }
        }

        // MARK: CI replacements
        let ciPreBuildHook = config.ciPreBuildHook ?? "# Build customization can be added here with the `CIPreBuildHook` key in fishy-joes.yaml"
        let lines = ciPreBuildHook.split(separator: "\n").map(String.init)
        replacements["__PRE_BUILD_HOOK_YAML__"] = "|" + join(lines: lines, indent: 10)

        return replacements
    }

    // Fill in templates for both filenames and file contents
    func processString(_ input: String) -> String {
        var string = input
        for (key, replacement) in templateReplacements.sorted(by: <) {
            string = string.replacingOccurrences(of: key, with: replacement)
        }
        return string
    }

    func promptForConfig() throws -> FishyJoesConfig {
        Log.warn("No fishy-joes.yaml found. Will create one in \(FileManager.default.currentDirectoryPath)")
        let module = try Interactive.prompt("Name of swift product you're generating bindings for (e.g. CriGeo): ")
        let defaultRepository = "github.com/cricut/\(module)"
        var publishRepository: String? = try Interactive.prompt(
            "url of repository to publish bindings to, or \"nil\". Default [\(defaultRepository)]: ",
            allowEmpty: true
        )
        if publishRepository == "nil" {
            publishRepository = nil
        } else if publishRepository?.isEmpty == true {
            publishRepository = defaultRepository
        }

        let requiredModules = try Interactive.prompt(
            "Exported dependencies of \(module), space separated. Default []: ",
            allowEmpty: true
        )

        let extraDynamicLibraries = try Interactive.prompt(
            "Dynamic library names that do not have a -bindings repo and so are not in the requiredModules of \(module), space separated. Default []: ",
            allowEmpty: true
        )

        let excludeSources = try Interactive.prompt(
            "File or directory paths to exclude from generation, space separated. Default []:",
            allowEmpty: true
        )

        let config = FishyJoesConfig(
            module: module,
            publishRepository: publishRepository,
            requiredModules: requiredModules.split(separator: " ").map(String.init),
            extraDynamicLibraries: extraDynamicLibraries.split(separator: " ").map(String.init),
            excludeSources: excludeSources.split(separator: " ").map(String.init),
            ciPreBuildHook: nil
        )

        let encoder = YAMLEncoder()
        let yaml = try encoder.encode(config)
        let path = "\(FileManager.default.currentDirectoryPath)/fishy-joes.yaml"

        Log.info("Will write to \(path):")
        print(yaml)
        Log.info("continue? ", terminator: "")
        guard try Interactive.promptYesNo() else {
            throw Error()
        }

        try cmd("cat").input(yaml).output(overwritingFile: path).run()

        return config
    }
}

import ArgumentParser
import Foundation
import swsh
import Yams

public struct PackageInit: ParsableCommand {
    public static var configuration = CommandConfiguration(abstract: "create/update the recommended files for a bindings repo in the current directory")

    @Flag(help: "continue with generation, even if not in a clean git state")
    var force = false

    var includeFilesNotMarkedAsGenerated = true
    var config: FishyJoesConfig!
    var templateReplacements: [String: String]!
    var swiftPackage: SwiftPackage?
    var swiftPackageResolved: SwiftPackageResolved?

    struct Error: Swift.Error {}

    public init() {}
    init(
        config: FishyJoesConfig,
        swiftPackage: SwiftPackage,
        swiftPackageResolved: SwiftPackageResolved,
        includeFilesNotMarkedAsGenerated: Bool
    ) {
        self.config = config
        self.swiftPackage = swiftPackage
        self.swiftPackageResolved = swiftPackageResolved
        self.includeFilesNotMarkedAsGenerated = includeFilesNotMarkedAsGenerated
        self.templateReplacements = generateTemplateReplacements()
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
            self.templateReplacements = generateTemplateReplacements()
        }

        try installTemplate()
        try setupKotlin(config: config)
        try setupCSharp(config: config)
    }

    func installTemplate() throws {
        let sourcePath = Bundle.module.resourceURL!.appendingPathComponent("bindings-template", isDirectory: true).path
        try install(sourcePath, to: "bindings")
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
    }

    func installBehavior(for fileName: String, in directory: String) throws -> InstallBehavior {
        let path = "\(directory)/\(fileName)"
        if [".DS_Store", ".gradle"].contains(fileName) {
            return .skip
        }

        if let installName = fileName.trimmingIfSuffixed(".symlink") {
            return .symlink(installName: String(installName))
        }

        let fileType = try FileManager.default.attributesOfItem(atPath: path)[.type] as! FileAttributeType
        if
            !includeFilesNotMarkedAsGenerated,
            fileType == .typeRegular,
            path.range(of: #"\bgenerated\b"#, options: [.regularExpression, .caseInsensitive]) == nil
        {
            return .skip
        }

        if fileName == "gradlew" || fileName.hasSuffix(".jar") {
            return .copy
        }

        return .template
    }

    func install(_ sourcePath: String, to destPath: String) throws {
        // Log.info("installing \(sourcePath) -> \(destPath)")
        let manager = FileManager.default
        var isDirectory: ObjCBool = false
        guard manager.fileExists(atPath: sourcePath, isDirectory: &isDirectory) else {
            fatalError("Internal error. I was sure that path existed... \(sourcePath)")
        }
        if isDirectory.boolValue {
            try manager.createDirectory(atPath: destPath, withIntermediateDirectories: true)
            for sourceName in try manager.contentsOfDirectory(atPath: sourcePath) {
                let destName = processString(sourceName)
                switch try installBehavior(for: sourceName, in: sourcePath) {
                case .skip: continue
                case .copy:
                    try cmd(
                        "cp", "-Rfp",
                        "\(sourcePath)/\(sourceName)",
                        "\(destPath)/\(destName)"
                    ).run()
                case .template:
                    try install(
                        "\(sourcePath)/\(sourceName)",
                        to: "\(destPath)/\(destName)"
                    )
                case .symlink(let installName):
                    let linkDestination = try cmd("cat", "\(sourcePath)/\(sourceName)").runString()
                    // TODO: different command for windows?
                    try cmd("ln", "-sf", linkDestination, "\(destPath)/\(installName)").run()
                }
            }
        } else {
            let contents = processString(try String(contentsOfFile: sourcePath))
            try contents.write(toFile: destPath, atomically: true, encoding: .utf8)
        }
    }

    func join(lines: [String], indent: Int) -> String {
        lines.map { "\n\(String(repeating: " ", count: indent))\($0)" }.joined()
    }

    func generateTemplateReplacements() -> [String: String] {
        var replacements: [String: String] = [:]

        // MARK: generic replacements
        replacements["__MODULE_NAME__"] = config.module
        replacements["__LOWERCASE_MODULE_NAME__"] = config.module.lowercased()
        replacements["__LOWERCASE_FIRST_MODULE_NAME__"] = (config.module.first?.lowercased() ?? "") + config.module.dropFirst()
        replacements["__AUTOGEN_WARNING__"] = "THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT."
        replacements["__BINDINGS_REPO__"] = config.publishRepository

        // MARK: kotlin replacements
        let gradleDependencies = [
            (swift: "FishyJoes", groupId: "com.cricut.fishyjoes", artifactId: "runtime")
        ] + config.requiredModules.map {
            (swift: $0, groupId: "com.cricut.\($0)", artifactId: $0.lowercased())
        }
        let gradleDependencyLines = gradleDependencies.map {
            let version = swiftPackage?.dependencyMap[$0.swift]?.versionInGradleFormat ?? "local"
            return "api(\"\($0.groupId):\($0.artifactId):\(version)\")"
        }
        replacements["__GRADLE_DEPENDENCIES__"] = join(lines: gradleDependencyLines, indent: 4)

        // MARK: C# replacements
        replacements["__LIBRARY_CSPROJ_UUID__"] = UUID(deterministicFrom: "Cricut.\(config.module).csproj").uuidString
        replacements["__TESTS_CSPROJ_UUID__"] = UUID(deterministicFrom: "Cricut.\(config.module).Tests.csproj").uuidString

        let csProjDependencies = [
            (swift: "FishyJoes", nupkgsPath: "c-sharp-runtime/nupkgs", nuget: "Cricut.FishyJoesRuntime")
        ] + config.requiredModules.map {
            (swift: $0, nupkgsPath: "bindings/c-sharp/nupkgs", nuget: "Cricut.\($0)")
        }
        let csProjDependencyLines = {
            var dependencyPaths: [String] = []
            let deps = csProjDependencies.map {
                guard let dependency = swiftPackage?.dependencyMap[$0.swift] else {
                    return #"<ItemGroup><PackageReference Include="\#($0.nuget)" Version="[0.0.1-unknown]" /></ItemGroup>"#
                }
                if let version = dependency.versionInNugetFormat {
                    return #"<ItemGroup><PackageReference Include="\#($0.nuget)" Version="\#(version)" /></ItemGroup>"#
                } else {
                    let path = relativePath(of: dependency.localPath, relativeTo: "bindings/c-sharp/generated/Cricut.\(config.module)/")
                    dependencyPaths.append("$(MSBuildThisFileDirectory)\(path)/\($0.nupkgsPath)")
                    return #"<ItemGroup><PackageReference Include="\#($0.nuget)" Version="[0.0.1-unknown]" /></ItemGroup>"#
                }
            }

            if dependencyPaths.isEmpty {
                return deps
            } else {
                return [
                    // Note: All these being in one line as one item seems to be important, even though ugly
                    #"<PropertyGroup><RestoreAdditionalProjectSources>\#(dependencyPaths.joined(separator: ";"))</RestoreAdditionalProjectSources></PropertyGroup>"#,
                ] + deps
            }
        }()
        replacements["__CSPROJ_DEPENDENCIES__"] = join(lines: csProjDependencyLines, indent: 2)

        // MARK: dart replacements
        let dartDependencies = [
            (swift: "FishyJoes", dart: "fishyjoes_dart", path: "dart-runtime", flutter: "flutter-fishyjoes-runtime")
        ] + config.requiredModules.map {
            (swift: $0, dart: "cricut_\($0.lowercased())", path: "bindings/dart/generated", flutter: "flutter-cricut_\($0.lowercased())")
        }
        let dartDependencyLines = dartDependencies.flatMap {
            guard let dependency = swiftPackage?.dependencyMap[$0.swift] else {
                return [
                    "\($0.dart):",
                    "  path: DEPENDENCY_NOT_FOUND",
                ]
            }
            var lines = ["\($0.dart):"]
            if let resolvedState = swiftPackageResolved?.state(for: $0.swift) {
                lines.append(
                    contentsOf: [
                        #"  git:"#,
                        #"    url: "https://github.com/cricut/\#($0.swift).git""#,
                        #"    ref: "\#(resolvedState.version ?? resolvedState.branch ?? resolvedState.revision)""#,
                        #"    path: "\#($0.path)""#,
                    ]
                )
            } else {
                let dependencyPath = relativePath(of: dependency.localPath, relativeTo: "bindings/dart/generated")
                lines.append("  path: \(dependencyPath)/\($0.path)")
            }
            return lines
        }
        replacements["__PUBSPEC_DART_DEPENDENCIES__"] = join(lines: dartDependencyLines, indent: 2)

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

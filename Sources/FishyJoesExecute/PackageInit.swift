import ArgumentParser
import Foundation
import swsh
import Yams

public struct PackageInit: ParsableCommand {
    public static var configuration = CommandConfiguration(abstract: "create/update the recommended files for a bindings repo in the current directory")

    @Flag(help: "continue with generation, even if not in a clean git state")
    var force = false

    var config: FishyJoesConfig!

    struct Error: Swift.Error {}

    public init() {}

    public mutating func run() throws {
        ExternalCommand.verbose = true

        if (try? cmd("git", "status", "--porcelain", ".").runString().isEmpty) != true {
            guard force else {
                Log.error("Uncommitted changes present. Refusing to run. Specify --force to override safety")
                throw Error()
            }
            Log.warn("Uncommitted changes present. Continuing anyway.")
        }
        config = try (try? FishyJoesConfig.readFromFile()) ?? promptForConfig()

        let sourcePath = Bundle.module.resourceURL!.appendingPathComponent("bindings-template", isDirectory: true).path
        let destPath = FileManager.default.currentDirectoryPath
        try install(sourcePath, to: destPath)
        try setupKotlin(config: config)
        try setupCSharp(config: config)
    }

    func setupKotlin(config: FishyJoesConfig) throws {
        // Install gradle
        if !cmd("gradle", "--version").runBool() {
            try Interactive.confirmCommand(description: "Install gradle", cmd("brew", "install", "gradle"))
        }
        try cmd("mkdir", "-p", "kotlin").run()
        try FileManager.default.withCurrentDirectoryPath("kotlin") {
            try cmd("gradle", ":wrapper").run()
        }
    }

    func setupCSharp(config: FishyJoesConfig) throws {
        // Install dotnet
        if !cmd("dotnet", "--version").runBool() {
            try Interactive.confirmCommand(description: "Install dotnet", cmd("brew", "install", "dotnet"))
        }
        try cmd("mkdir", "-p", "c-sharp").run()
        try FileManager.default.withCurrentDirectoryPath("c-sharp") {
            let module = "Cricut.\(config.module)"
            try cmd("dotnet", "new", "sln", "--output", ".", "--name", module, "--force").run()

            try cmd("dotnet", "sln", "add", "./\(module)/\(module).csproj").run()
            try cmd("dotnet", "sln", "add", "./\(module).Tests/\(module).Tests.csproj").run()

            try cmd("dotnet", "add", "./\(module).Tests/\(module).Tests.csproj", "reference", "./\(module)/\(module).csproj").run()
        }
    }

    func shouldIgnore(_ fileName: String) -> Bool {
        switch fileName {
        case ".DS_Store":
            return true
        default:
            return false
        }
    }

    func install(_ sourcePath: String, to destPath: String) throws {
        Log.info("installing \(sourcePath) -> \(destPath)")
        let manager = FileManager.default
        var isDirectory: ObjCBool = false
        guard manager.fileExists(atPath: sourcePath, isDirectory: &isDirectory) else {
            fatalError("Internal error. I was sure that path existed... \(sourcePath)")
        }
        if isDirectory.boolValue {
            try manager.createDirectory(atPath: destPath, withIntermediateDirectories: true)
            for sourceName in try manager.contentsOfDirectory(atPath: sourcePath) {
                if shouldIgnore(sourceName) { continue }

                let destName = processString(sourceName)
                try install(
                    "\(sourcePath)/\(sourceName)",
                    to: "\(destPath)/\(destName)"
                )
            }
        } else {
            let contents = processString(try String(contentsOfFile: sourcePath))
            try contents.write(toFile: destPath, atomically: true, encoding: .utf8)
        }
    }

    func join(lines: [String], indent: Int) -> String {
        lines.map { "\n\(String(repeating: " ", count: indent))\($0)" }.joined()
    }

    // Fill in templates for both filenames and file contents
    func processString(_ input: String) -> String {
        var string = input
        string = string.replacingOccurrences(of: "__MODULE_NAME__", with: config.module)
        string = string.replacingOccurrences(of: "__LOWERCASE_MODULE_NAME__", with: config.module.lowercased())

        if let publishRepository = config.publishRepository {
            string = string.replacingOccurrences(of: "__BINDINGS_REPO__", with: publishRepository)
        }

        let packageDependencyLines = config.requiredModules.flatMap { dependency in
            [
                ".package(",
                "    // url: \"https://github.com/cricut/\(dependency)-bindings\", .branch(\"main\")",
                "    path: \"../\(dependency)-bindings\"",
                "),",
            ]
        }
        string = string.replacingOccurrences(
            of: "__PACKAGE_DEPENDENCY_DECLARATIONS__",
            with: join(lines: packageDependencyLines, indent: 8)
        )

        let nodeDependencyLines = config.requiredModules.map { dependency in
            ".product(name: wasmCompatibleOnly ? \"\(dependency)-wasm\" : \"\(dependency)-node\", package: \"\(dependency)-bindings\"),"
        }
        string = string.replacingOccurrences(
            of: "__NODE_TARGET_DEPENDENCIES__",
            with: join(lines: nodeDependencyLines, indent: 16)
        )

        func targetDependencyLines(suffix: String) -> [String] {
            config.requiredModules.map { dependency in
                ".product(name: \"\(dependency)-\(suffix)\", package: \"\(dependency)-bindings\"),"
            }
        }

        string = string.replacingOccurrences(
            of: "__JAVA_TARGET_DEPENDENCIES__",
            with: join(lines: targetDependencyLines(suffix: "java"), indent: 20)
        )
        string = string.replacingOccurrences(
            of: "__IOTA_TARGET_DEPENDENCIES__",
            with: join(lines: targetDependencyLines(suffix: "iota"), indent: 20)
        )

        let registerDependencyLines = (config.requiredModules + [config.module]).map { dependency in
            "exports = try registerModule\(dependency)(env: env, exports: exports)"
        }
        string = string.replacingOccurrences(
            of: "__REGISTER_DEPENDENCIES__",
            with: join(lines: registerDependencyLines, indent: 8)
        )

        return string
    }

    func promptForConfig() throws -> FishyJoesConfig {
        Log.warn("No fishy-joes.yaml found. Will create one in \(FileManager.default.currentDirectoryPath)")
        let module = try Interactive.prompt("Name of swift product you're generating bindings for (e.g. CriGeo): ")
        let defaultRepository = "github.com/cricut/\(module)-bindings"
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

        let excludeSources = try Interactive.prompt(
            "File or directory paths to exclude from generation, space separated. Default []:",
            allowEmpty: true
        )

        let config = FishyJoesConfig(
            module: module,
            publishRepository: publishRepository,
            requiredModules: requiredModules.split(separator: " ").map(String.init),
            excludeSources: excludeSources.split(separator: " ").map(String.init)
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

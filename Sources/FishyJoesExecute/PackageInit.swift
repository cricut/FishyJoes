import ArgumentParser
import Foundation
import swsh
import Yams

extension UUID {
    /// Pretends to be a version 5 uuid (sha1), but using a less secure hash to avoid dependencies
    public init(deterministicFrom key: String) {
        // Swift version of https://github.com/tidwall/th64
        func tinyHash64(_ data: Data, seed: UInt64 = 0) -> UInt64 {
            data.withUnsafeBytes { (buffer: UnsafeRawBufferPointer) -> UInt64 in
                let r: UInt64 = 0x14020a57acced8b7
                var h: UInt64 = seed
                for offset in stride(from: 0, through: buffer.count - 8, by: 8) {
                    let x = buffer.loadUnaligned(fromByteOffset: offset, as: UInt64.self) &* r
                    h = h &* r ^ (x << 31 | x >> 33)
                    h = h << 31 | h >> 33
                }
                for byte in buffer[(buffer.count - buffer.count % 8)..<buffer.count] {
                    h = h &* r ^ UInt64(byte)
                }
                h = h &* r &+ UInt64(buffer.count)
                h = (h ^ (h >> 31)) &* r
                h = (h ^ (h >> 31)) &* r
                h = (h ^ (h >> 31)) &* r
                return h
            }
        }
        let utf8 = Data(key.utf8)
        var bytes = unsafeBitCast((tinyHash64(utf8, seed: 0), tinyHash64(utf8, seed: 1)), to: uuid_t.self)
        // set version nibble to 0x5
        bytes.6 = bytes.6 & 0x0f | 0x50
        // set variant bits to 0b10
        bytes.8 = bytes.8 & 0x3f | 0x80
        self.init(uuid: bytes)
    }
}

public struct PackageInit: ParsableCommand {
    public static var configuration = CommandConfiguration(abstract: "create/update the recommended files for a bindings repo in the current directory")

    @Flag(help: "continue with generation, even if not in a clean git state")
    var force = false

    var config: FishyJoesConfig!
    var swiftPackage: SwiftPackage?

    struct Error: Swift.Error {}

    public init() {}
    init(
        config: FishyJoesConfig,
        swiftPackage: SwiftPackage
    ) {
        self.config = config
        self.swiftPackage = swiftPackage
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
            config = try (try? FishyJoesConfig.readFromFile()) ?? promptForConfig()
        }

        try installTemplate()
        try setupKotlin(config: config)
        try setupCSharp(config: config)
    }

    func installTemplate(to destPath: String? = nil) throws {
        let sourcePath = Bundle.module.resourceURL!.appendingPathComponent("bindings-template", isDirectory: true).path
        try install(sourcePath, to: destPath ?? FileManager.default.currentDirectoryPath)
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
    }

    func installBehavior(for fileName: String, in directory: String) throws -> InstallBehavior {
        func oneOfSuffix(_ suffixes: String...) -> Bool {
            suffixes.contains(where: fileName.hasSuffix)
        }

        let attributes = try FileManager.default.attributesOfItem(atPath: "\(directory)/\(fileName)")
        if attributes[.type] as? FileAttributeType == FileAttributeType.typeSymbolicLink {
            return .copy
        }

        switch fileName {
        case ".DS_Store", ".gradle":
            return .skip
        case "gradlew",
             _ where oneOfSuffix(".jar"):
            return .copy
        default:
            return .template
        }
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

    // Fill in templates for both filenames and file contents
    func processString(_ input: String) -> String {
        var string = input
        string = string.replacingOccurrences(of: "__MODULE_NAME__", with: config.module)
        string = string.replacingOccurrences(of: "__LOWERCASE_MODULE_NAME__", with: config.module.lowercased())
        string = string.replacingOccurrences(of: "__LOWERCASE_FIRST_MODULE_NAME__", with: (config.module.first?.lowercased() ?? "") + config.module.dropFirst())

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

        let gradleDependencies = [
            (swift: "FishyJoes", groupId: "com.cricut.fishyjoes", artifactId: "runtime")
        ] + config.requiredModules.map {
            (swift: $0, groupId: "com.cricut.\($0)", artifactId: $0.lowercased())
        }
        let gradleDependencyLines = gradleDependencies.map {
            let version = (swiftPackage?.dependencyMap[$0.swift]?.version ?? "local")
                .replacingOccurrences(of: "/", with: "-")
            return "api(\"\($0.groupId):\($0.artifactId):\(version)\")"
        }
        string = string.replacingOccurrences(
            of: "__GRADLE_DEPENDENCIES__",
            with: join(lines: gradleDependencyLines, indent: 4)
        )

        string = string.replacingOccurrences(
            of: "__LIBRARY_CSPROJ_UUID__",
            with: UUID(deterministicFrom: "Cricut.\(config.module).csproj").uuidString
        )
        string = string.replacingOccurrences(
            of: "__TESTS_CSPROJ_UUID__",
            with: UUID(deterministicFrom: "Cricut.\(config.module).Tests.csproj").uuidString
        )
        let csProjDependencies = [
            (swift: "FishyJoes", nupkgsPath: "c-sharp-runtime/nupkgs", nuget: "Cricut.FishyJoesRuntime")
        ] + config.requiredModules.map {
            (swift: $0, nupkgsPath: "bindings/c-sharp/nupkgs", nuget: "Cricut.\($0)")
        }
        let csProjDependencyLines = csProjDependencies.flatMap {
            guard let dependency = swiftPackage?.dependencyMap[$0.swift] else {
                fatalError("Couldn't find version of dependency \($0.swift)")
            }
            if let version = dependency.version {
                return ["<ItemGroup><PackageReference Include=\"\($0.nuget)\" Version=\"\(version)\" /></ItemGroup>"]
            } else {
                let dependencyPath = relativePath(of: dependency.localPath, relativeTo: "bindings/c-sharp/generated/Cricut.\(config.module)/")
                return [
                    "<PropertyGroup><RestoreAdditionalProjectSources>$(ProjectDir)\(dependencyPath)/\($0.nupkgsPath)</RestoreAdditionalProjectSources></PropertyGroup>",
                    "<ItemGroup><PackageReference Include=\"\($0.nuget)\" Version=\"0.0.1-unknown\" /></ItemGroup>",
                ]
            }
        }
        string = string.replacingOccurrences(
            of: "__CSPROJ_DEPENDENCIES__",
            with: join(lines: csProjDependencyLines, indent: 2)
        )

        let dartDependencies = [
            (swift: "FishyJoes", dart: "fishyjoes_dart", path: "dart-runtime", flutter: "flutter-fishyjoes-runtime")
        ] + config.requiredModules.map {
            (swift: $0, dart: "cricut_\($0.lowercased())", path: "bindings/dart/generated", flutter: "flutter-cricut_\($0.lowercased())")
        }
        let dartDependencyLines = dartDependencies.flatMap {
            guard let dependency = swiftPackage?.dependencyMap[$0.swift] else {
                fatalError("Couldn't find version of dependency \($0.swift)")
            }
            var lines = ["\($0.dart):"]
            if let version = dependency.version {
                lines.append(
                    contentsOf: [
                        "  git:",
                        "    url: \"https://github.com/cricut/\($0.swift).git\"",
                        "    ref: \"\(version)\"",
                        "    path: \"\($0.path)\"",
                    ]
                )
            } else {
                let dependencyPath = relativePath(of: dependency.localPath, relativeTo: "bindings/dart/generated")
                lines.append("  path: \(dependencyPath)/\($0.path)")
            }
            return lines
        }
        string = string.replacingOccurrences(
            of: "__PUBSPEC_DART_DEPENDENCIES__",
            with: join(lines: dartDependencyLines, indent: 2)
        )

        string = string.replacingOccurrences(
            of: "__AUTOGEN_WARNING__",
            with: "THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT."
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

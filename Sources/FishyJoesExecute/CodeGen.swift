import ArgumentParser
import Foundation
import swsh

let dylibExt: String = {
    #if os(macOS)
    "dylib"
    #elseif os(Linux)
    "so"
    #elseif os(Windows)
    "dll"
    #else
    fatalError("unknown host OS")
    #endif
}()

public struct CodeGen: ParsableCommand {
    @Flag(name: .shortAndLong, help: "suppress verbose output")
    var quiet = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a NodeJS N-API based node package")
    var nodejs = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a Web-assembly based node package")
    var wasm = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a C++ package")
    var cpp = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a Kotlin package")
    var kotlin = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a Kotlin package without android support (much faster)")
    var kotlinFast = false

    @Flag(name: [.long, .customLong("C🗡️")], inversion: .prefixedNo, help: "Generate a C# Package")
    var cSharp = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Additional wasm optimizations (takes some time)")
    var wasmOpt = true

    @Flag(name: .long, help: "Build library in debug mode")
    var debug = false

    @Option(help: "Used for debugging fishy-joes code generation")
    var sourceryDumpPath: String?

    @Option(name: .long, help: "Update version number of generated package.")
    var version: String?

    enum BuildStep: String, CaseIterable, ExpressibleByArgument {
        case generate, build, test, pack
    }

    let codeCoveragePath = ProcessInfo.processInfo.environment["FISHYJOES_COVERAGE_PATH"]

    @Argument(
        help: """
            one or more of:
             - generate: run sourcery code-generation step
             - build: compile generated bindings into a dynamic library
             - test: test calling dynamic library from typescript
             - pack: create tgz package of npm module in root

            """
    )
    var buildStep: [BuildStep] = [.generate, .build, .test]

    enum CodingKeys: CodingKey {
        case quiet
        case nodejs
        case wasm
        case cpp
        case kotlin
        case kotlinFast
        case cSharp
        case wasmOpt
        case sourceryDumpPath
        case version
        case buildStep
        case debug
    }

    var config: FishyJoesConfig!
    var platforms: [Platform] = []

    public init() {}
}

extension CodeGen {
    public mutating func validate() throws {
        ExternalCommand.verbose = !quiet

        config = try FishyJoesConfig.readFromFile()

        guard cmd("test", "-f", "Package.swift").runBool() else {
            throw ValidationError("No Package.swift found in current directory. fishy-joes must be run in the root of the bindings package")
        }

        if wasm {
            platforms.append(.wasm)
        }
        if nodejs {
            platforms.append(.node)
        }
        if cpp {
            platforms.append(.cpp)
        }
        if kotlin || kotlinFast {
            platforms.append(.kotlinSystem)
        }
        if kotlin && !kotlinFast {
            platforms.append(contentsOf: AndroidArchitecture.allCases.map(Platform.kotlinAndroid))
        }
        if cSharp {
            platforms.append(.cSharp)
        }
    }

    public mutating func run() throws {
        if buildStep.contains(.generate) {
            let packageJSON = try cmd("swift", "package", "dump-package").runData()

            let packageInfo: SwiftPackage
            do {
                packageInfo = try JSONDecoder().decode(SwiftPackage.self, from: packageJSON)
            } catch let error {
                fatalError("Couldn't parse swift package: \(error)")
            }
            let translateeSources: String
            if let translateeDependency = packageInfo.dependencyMap[config.module.lowercased()] {
                translateeSources = (translateeDependency.scheme == nil ? translateeDependency.path : ".build/checkouts/\(config.module)") + "/Sources"
            } else if let sourcePath = packageInfo.path(toTarget: config.module) {
                translateeSources = sourcePath
            } else {
                fatalError("Couldn't locate module for translation '\(config.module)' in Package.swift")
            }
            guard packageInfo.dependencyMap["fishyjoes"] != nil else {
                fatalError("Couldn't locate FishyJoes in Package.swift")
            }

            var fishyJoesModuleFiles: [String] = []
            for moduleName in config.requiredModules {
                let bindingModule = "\(moduleName)-bindings"
                guard let dependencyURL = packageInfo.dependencyMap[bindingModule.lowercased()] else {
                    fatalError("Couldn't locate \(bindingModule) in Package.swift, but it's required by fishyjoes.json")
                }
                let dependencyPath = (dependencyURL.scheme == nil ? dependencyURL.path : ".build/checkouts/\(bindingModule)") + "/Sources"
                fishyJoesModuleFiles.append("\(dependencyPath)/Generated/\(moduleName).fishyjoesmodule")
            }

            // MARK: Generate code
            try cmd("rm", "-rf", "Sources/Generated", "kotlin/src/generated", "DebugGenerated", "cpp").run()
            try cmd("mkdir", "-p",
                    "Sources/Generated/CSharpInterface",
                    "Sources/Generated/NodeInterface",
                    "Sources/Generated/JavaInterface",
                    "Sources/Generated/CPPInterface",
                    "kotlin/src/generated/kotlin/com/cricut/\(config.module.lowercased())"
            ).run()
            try cmd(
                "touch",
                "Sources/Generated/CSharpInterface/EmptyPlaceholder.swift",
                "Sources/Generated/NodeInterface/EmptyPlaceholder.swift",
                "Sources/Generated/JavaInterface/EmptyPlaceholder.swift",
                "Sources/Generated/CPPInterface/EmptyPlaceholder.swift"
            ).run()
            try cmd("swift", "build", "--product", "sourcery").run()
            try cmd("swift", arguments: ["build"] + (codeCoveragePath == nil ? [] : ["--enable-code-coverage"]) + ["--product", "🐟☕️"]).run()

            // Trampoline into fishy-joes-execution-helper via Sourcery
            var sourceryEnv: [String: String] = [:]
            if let sourceryDumpPath = sourceryDumpPath {
                sourceryEnv["DUMP_SOURCERY_DATA"] = URL(fileURLWithPath: (sourceryDumpPath as NSString).expandingTildeInPath, isDirectory: false).path
            }
            if let codeCoveragePath = codeCoveragePath {
                sourceryEnv["LLVM_PROFILE_FILE"] = "\(codeCoveragePath)/fishy-joes-execution-helper-\(UUID()).profraw"
            }
            try cmd(
                ".build/debug/sourcery",
                arguments: [
                    quiet ? "-q" : nil,
                    "--disableCache",
                    "--parseDocumentation",
                    "--sources", translateeSources,
                    "--templates", ".build/debug/FishyJoes_FishyJoesExecutionHelper.bundle/FishyJoes.swifttemplate",
                    "--args", "module=\(config.module)",
                    "--args", "debugRepresentation=\(debug)",
                    "--args", "requiredModules=\"\(try! JSONEncoder().encode(fishyJoesModuleFiles).base64EncodedString())\"",
                    "--args", "fishyJoesExecutable=.build/debug/🐟☕️",
                    "--output", "Sources/Generated"
                ].compactMap { $0 },
                addEnv: sourceryEnv
            ).run()
        }

        if buildStep.contains(.build) {
            // MARK: Build library
            let configuration = BuildConfiguration(debug: debug, codeCoverage: codeCoveragePath != nil)
            for platform in platforms {
                switch platform {
                case .wasm:
                    try platform.swiftBuild(configuration: configuration)
                case .node:
                    try platform.swiftBuild("--product", "\(config.module)-node", configuration: configuration)
                case .kotlinSystem, .kotlinAndroid:
                    try platform.swiftBuild("--product", "\(config.module)-java", configuration: configuration)
                case .cpp:
                    try platform.swiftBuild("--product", "\(config.module)-cpp", configuration: configuration)
                case .cSharp:
                    try platform.swiftBuild("--product", "\(config.module)-c-sharp", configuration: configuration)
                }
            }

            // MARK: Install library to ./output
            for platform in platforms {
                try cmd("rm", "-rf", platform.outputDir(config)).run()
                try cmd("mkdir", "-p", platform.outputDir(config)).run()
            }

            for platform in platforms {
                let outputDir = platform.outputDir(config)
                switch platform {
                case .wasm:
                    if wasmOpt, cmd("wasm-opt", "--version").runBool() {
                        try cmd("wasm-opt", "\(platform.buildDir(debug: debug))/DummyMain.wasm", "-O1", "-o", "\(outputDir)/\(config.module).wasm").run()
                    } else {
                        if wasmOpt {
                            print("WARNING: wasm-opt is not installed, resulting build will be bigger and possibly slower")
                        } else {
                            print("skipping wasm-opt")
                        }
                        try cmd("cp", "\(platform.buildDir(debug: debug))/DummyMain.wasm", "\(outputDir)/\(config.module).wasm").run()
                    }
                    try cmd(
                        "cp",
                        "\(platform.buildDir(debug: debug))/FishyJoes_FishyJoesNodeRuntime.resources/js/wasm-napi.js",
                        "Sources/Generated/NodeInterface/\(config.module).d.ts",
                        outputDir
                    ).run()
                    let dependencySplat = config.requiredModules.map { ", \($0)" }.joined()
                    try cmd(
                        "sed",
                        "-e", "s/__MODULE_NAME__/\(config.module)/g",
                        "-e", "s/__MODULE_DEPENDENCIES__/\(dependencySplat)/g",
                        "\(platform.buildDir(debug: debug))/FishyJoes_FishyJoesNodeRuntime.resources/js/__MODULE_NAME__.js"
                    ).output(overwritingFile: "\(outputDir)/\(config.module).js").run()
                    try cmd(
                        "sed",
                        "-e", "s/__MODULE_NAME__/\(config.module)/g",
                        "-e", "s/__MODULE_DEPENDENCIES__/\(dependencySplat)/g",
                        "\(platform.buildDir(debug: debug))/FishyJoes_FishyJoesNodeRuntime.resources/js/__MODULE_NAME__.browser.js"
                    ).output(overwritingFile: "\(outputDir)/\(config.module).browser.js").run()
                case .node:
                    try cmd("cp", "\(platform.buildDir(debug: debug))/libFishyJoesNodeRuntime.\(dylibExt)", "\(outputDir)/").run()
                    for dependency in config.requiredModules + [config.module] {
                        try cmd("cp", "\(platform.buildDir(debug: debug))/lib\(dependency).\(dylibExt)", "\(outputDir)/").run()

                        // For node to load a library correctly, the file must be ".cjs.node" and not a symlink
                        // But for the linker to find required libraries, they need their original names.
                        // So we symlink `libModule-node.dylib` -> `module.cjs.node`
                        let compiledLibName = "lib\(dependency)-node.\(dylibExt)"
                        let nodeLibName = "\(dependency).cjs.node"
                        try cmd("cp", "\(platform.buildDir(debug: debug))/\(compiledLibName)", "\(outputDir)/\(nodeLibName)").run()
                        try cmd("ln", "-s", nodeLibName, "\(outputDir)/\(compiledLibName)").run()
                    }
                    try cmd(
                        "cp",
                        "Sources/Generated/NodeInterface/\(config.module).d.ts",
                        outputDir
                    ).run()
                    var moduleDotJS = [
                        "import { createRequire } from 'module';",
                        "const require = createRequire(import.meta.url);",
                    ]
                    for module in config.requiredModules + [config.module] {
                        moduleDotJS.append("export const { \(module) } = require('./\(module).cjs');")
                    }
                    moduleDotJS.append("export default \(config.module);")
                    try cmd("echo", moduleDotJS.joined(separator: "\n")).output(overwritingFile: "\(outputDir)/\(config.module).js").run()
                case .kotlinSystem:
                    try cmd("mkdir", "-p", outputDir).run()
                    try cmd("cp", "\(platform.buildDir(debug: debug))/lib\(config.module).\(dylibExt)", outputDir).run()
                    try cmd("cp", "\(platform.buildDir(debug: debug))/lib\(config.module)-java.\(dylibExt)", outputDir).run()
                case .kotlinAndroid:
                    try cmd("mkdir", "-p", outputDir).run()
                    try cmd("cp", "\(platform.buildDir(debug: debug))/lib\(config.module).so", outputDir).run()
                    try cmd("cp", "\(platform.buildDir(debug: debug))/lib\(config.module)-java.so", outputDir).run()
                case .cpp:
                    try cmd("mkdir", "-p", outputDir).run()
                case .cSharp:
                    try cmd("mkdir", "-p", outputDir).run()
                    try cmd("cp", "\(platform.buildDir(debug: debug))/lib\(config.module).\(dylibExt)", outputDir).run()
                    try cmd("cp", "\(platform.buildDir(debug: debug))/lib\(config.module)-c-sharp.\(dylibExt)", outputDir).run()
                }
            }
            if platforms.contains(.kotlinSystem) {
                try FileManager.default.withCurrentDirectoryPath("kotlin") {
                    try cmd("./gradlew", "build", "-Dskip.tests").run()
                }
            }
            if platforms.contains(.cSharp) {
                try FileManager.default.withCurrentDirectoryPath("c-sharp") {
                    try cmd("dotnet", "build", "Cricut.\(config.module).sln").run()
                }
            }
            if version == nil {
                // use dummy version to build package
                version = "0.0.1"
            }
        }

        for platform in platforms {
            switch platform {
            case .wasm, .node:
                if let version = version {
                    // MARK: generate package.json from template
                    let packageJsonPath = "\(platform.outputDir(config))/package.json"
                    let prettyEncoder = JSONEncoder()
                    prettyEncoder.outputFormatting = [
                        .prettyPrinted,
                        .withoutEscapingSlashes
                    ]
                    let templatePackage = try cmd("cat", "package.template.json").runJSON(NPMPackage.self)
                    let package = NPMPackage(
                        config: config,
                        platform: platform,
                        version: version,
                        dependencies: templatePackage.dependencies
                    )
                    try cmd("cat")
                        .inputJSON(from: package, encoder: prettyEncoder)
                        .output(overwritingFile: packageJsonPath)
                        .run()
                    // Be a good unix citizen and terminate with a newline
                    try cmd("echo")
                        .append(toFile: packageJsonPath)
                        .run()
                }
            case .kotlinSystem, .kotlinAndroid, .cpp, .cSharp:
                break
            }
        }

        // MARK: test that things run properly
        if buildStep.contains(.test) {
            for platform in platforms {
                let env = codeCoveragePath.map {
                    [
                        "LLVM_PROFILE_FILE": "\($0)/fishy-joes-test-\(platform)-\(UUID()).profraw",
                        "NODE_V8_COVERAGE": "\($0)/node",
                    ]
                } ?? [:]
                switch platform {
                case .wasm, .node:
                    try FileManager.default.withCurrentDirectoryPath("node-test") {
                        try cmd("npm", "install").run()
                        try cmd("npm", "run", "clear-cache").run()
                        try cmd("npm", "run", "test-\(platform.platform)").run()
                    }
                case .kotlinSystem:
                    try FileManager.default.withCurrentDirectoryPath("kotlin") {
                        let tasks = ["cleanTest", "test"] + (codeCoveragePath == nil ? [] : ["jacocoTestReport"])
                        try cmd("./gradlew", arguments: tasks, addEnv: env).run()
                    }
                case .kotlinAndroid, .cpp:
                    // TODO
                    break
                case .cSharp:
                    try FileManager.default.withCurrentDirectoryPath("c-sharp") {
                        var commandParts = ["dotnet", "test", "Cricut.\(config.module).sln"]
                        if let path = codeCoveragePath {
                            commandParts = ["dotnet-coverage", "collect", "-f", "xml", "-o", "\(path)/integration-tests-c-sharp.xml"] + commandParts
                        }
                        try cmd(commandParts.first!, arguments: Array(commandParts.dropFirst()), addEnv: env).run()
                    }
                }
            }
        }

        if buildStep.contains(.pack) {
            let version = version ?? "0.0.1"
            for platform in platforms {
                if platform.isTs {
                    try cmd("npm", "pack", "./\(platform.outputDir(config))").run()
                } else if platform == .cSharp {
                    let name = "Cricut.\(config.module)"
                    try cmd("dotnet", "pack", "-c", "Release", "c-sharp/\(name)/\(name).csproj", "/p:Version=\(version)").run()
                    try cmd("cp", "c-sharp/\(name)/bin/Release/\(name).\(version).nupkg", ".").run()
                }
            }
        }
    }
}

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

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a Web-assembly based node package")
    var nodejs = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a NodeJS N-API based node package")
    var wasm = false

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
            try cmd("rm", "-rf", "Sources/Generated", "kotlin/src/generated").run()
            try cmd("mkdir", "-p",
                    "Sources/Generated/CSharpInterface",
                    "Sources/Generated/NodeInterface",
                    "Sources/Generated/JavaInterface",
                    "kotlin/src/generated/kotlin/com/cricut/\(config.module.lowercased())"
            ).run()
            try cmd(
                "touch",
                "Sources/Generated/CSharpInterface/EmptyPlaceholder.swift",
                "Sources/Generated/NodeInterface/EmptyPlaceholder.swift",
                "Sources/Generated/JavaInterface/EmptyPlaceholder.swift"
            ).run()
            try cmd("swift", "build", "--product", "sourcery").run()
            try cmd("swift", "build", "--product", "🐟☕️").run()
            // Trampoline into fishy-joes-execution-helper via Sourcery
            try cmd(
                ".build/debug/sourcery",
                arguments: [
                    quiet ? "-q" : nil,
                    "--disableCache",
                    "--parseDocumentation",
                    "--sources", translateeSources,
                    "--templates", ".build/debug/FishyJoes_FishyJoesExecutionHelper.bundle/FishyJoes.swifttemplate",
                    "--args", "module=\(config.module)",
                    "--args", "requiredModules=\"\(try! JSONEncoder().encode(fishyJoesModuleFiles).base64EncodedString())\"",
                    "--args", "fishyJoesExecutable=.build/debug/🐟☕️",
                    "--output", "Sources/Generated"
                ].compactMap { $0 },
                addEnv: sourceryDumpPath.map {
                    [
                        "DUMP_SOURCERY_DATA": URL(fileURLWithPath: ($0 as NSString).expandingTildeInPath, isDirectory: false).path,
                    ]
                } ?? [:]
            ).run()
        }

        if buildStep.contains(.build) {
            // MARK: Build library
            for platform in platforms {
                switch platform {
                case .wasm:
                    try platform.swiftBuild(debug: debug)
                case .node:
                    try platform.swiftBuild("--product", "\(config.module)-node", debug: debug)
                case .kotlinSystem, .kotlinAndroid:
                    try platform.swiftBuild("--product", "\(config.module)-java", debug: debug)
                case .cSharp:
                    try platform.swiftBuild("--product", "\(config.module)-c-sharp", debug: debug)
                }
            }

            // MARK: Install library to ./output
            for platform in platforms {
                try cmd("rm", "-rf", platform.outputDir).run()
                try cmd("mkdir", "-p", platform.outputDir).run()
            }

            for platform in platforms {
                switch platform {
                case .wasm:
                    if wasmOpt, cmd("wasm-opt", "--version").runBool() {
                        try cmd("wasm-opt", "\(platform.buildDir(debug: debug))/DummyMain.wasm", "-O1", "-o", "\(platform.outputDir)/\(config.module).wasm").run()
                    } else {
                        if wasmOpt {
                            print("WARNING: wasm-opt is not installed, resulting build will be bigger and possibly slower")
                        } else {
                            print("skipping wasm-opt")
                        }
                        try cmd("cp", "\(platform.buildDir(debug: debug))/DummyMain.wasm", "\(platform.outputDir)/\(config.module).wasm").run()
                    }
                    try cmd(
                        "cp",
                        "\(platform.buildDir(debug: debug))/FishyJoes_FishyJoesNodeRuntime.resources/js/wasm-napi.js",
                        "Sources/Generated/NodeInterface/\(config.module).d.ts",
                        platform.outputDir
                    ).run()
                    try cmd(
                        "sed",
                        "-e", "s/__MODULE_NAME__/\(config.module)/g",
                        "\(platform.buildDir(debug: debug))/FishyJoes_FishyJoesNodeRuntime.resources/js/__MODULE_NAME__.js"
                    ).output(overwritingFile: "\(platform.outputDir)/\(config.module).js").run()
                    try cmd(
                        "sed",
                        "-e", "s/__MODULE_NAME__/\(config.module)/g",
                        "\(platform.buildDir(debug: debug))/FishyJoes_FishyJoesNodeRuntime.resources/js/__MODULE_NAME__.browser.js"
                    ).output(overwritingFile: "\(platform.outputDir)/\(config.module).browser.js").run()
                case .node:
                    try cmd("cp", "\(platform.buildDir(debug: debug))/libFishyJoesNodeRuntime.\(dylibExt)", "\(platform.outputDir)/").run()
                    for dependency in config.requiredModules + [config.module] {
                        try cmd("cp", "\(platform.buildDir(debug: debug))/lib\(dependency).\(dylibExt)", "\(platform.outputDir)/").run()

                        // For node to load a library correctly, the file must be ".cjs.node" and not a symlink
                        // But for the linker to find required libraries, they need their original names.
                        // So we symlink `libModule-node.dylib` -> `module.cjs.node`
                        let compiledLibName = "lib\(dependency)-node.\(dylibExt)"
                        let nodeLibName = "\(dependency).cjs.node"
                        try cmd("cp", "\(platform.buildDir(debug: debug))/\(compiledLibName)", "\(platform.outputDir)/\(nodeLibName)").run()
                        try cmd("ln", "-s", nodeLibName, "\(platform.outputDir)/\(compiledLibName)").run()
                    }
                    try cmd(
                        "cp",
                        "Sources/Generated/NodeInterface/\(config.module).d.ts",
                        platform.outputDir
                    ).run()
                    var moduleDotJS = [
                        "import { createRequire } from 'module';",
                        "const require = createRequire(import.meta.url);",
                    ]
                    for module in config.requiredModules + [config.module] {
                        moduleDotJS.append("export const { \(module) } = require('./\(module).cjs');")
                    }
                    moduleDotJS.append("export default \(config.module);")
                    try cmd("echo", moduleDotJS.joined(separator: "\n")).output(overwritingFile: "\(platform.outputDir)/\(config.module).js").run()
                case .kotlinSystem:
                    try cmd("mkdir", "-p", platform.outputDir).run()
                    try cmd("cp", "\(platform.buildDir(debug: debug))/lib\(config.module).\(dylibExt)", platform.outputDir).run()
                    try cmd("cp", "\(platform.buildDir(debug: debug))/lib\(config.module)-java.\(dylibExt)", platform.outputDir).run()
                case .kotlinAndroid:
                    try cmd("mkdir", "-p", platform.outputDir).run()
                    try cmd("cp", "\(platform.buildDir(debug: debug))/lib\(config.module).so", platform.outputDir).run()
                    try cmd("cp", "\(platform.buildDir(debug: debug))/lib\(config.module)-java.so", platform.outputDir).run()
                case .cSharp:
                    try cmd("mkdir", "-p", platform.outputDir).run()
                    try cmd("cp", "\(platform.buildDir(debug: debug))/lib\(config.module)-c-sharp.\(dylibExt)", platform.outputDir).run()
                }
            }
            if platforms.contains(.kotlinSystem) {
                try FileManager.default.withCurrentDirectoryPath("kotlin") {
                    try cmd("./gradlew", "build").run()
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
                    // MARK: generate package.json
                    let packageJsonPath = "\(platform.outputDir)/package.json"
                    let prettyEncoder = JSONEncoder()
                    prettyEncoder.outputFormatting = [
                        .prettyPrinted,
                        .withoutEscapingSlashes
                    ]
                    let selfPackage = try cmd("cat", "package.json").runJSON(NPMPackage.self)
                    let package = NPMPackage(
                        config: config,
                        platform: platform,
                        version: version,
                        dependencies: selfPackage.dependencies
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
            case .kotlinSystem, .kotlinAndroid, .cSharp:
                break
            }
        }

        // MARK: test that things run properly
        if buildStep.contains(.test) {
            for platform in platforms {
                switch platform {
                case .wasm, .node:
                    try cmd("mkdir", "-p", "output/test/").run()

                    try cmd("echo", "const MODULE_PATH = '../\(platform.platform)';").output(overwritingFile: "output/test/test.ts").run()
                    try cmd("cat", "node-test/test.ts").append(toFile: "output/test/test.ts").run()

                    try cmd("npm", "run", "compile-test").run()
                    try cmd("mv", "output/test/test.js", "output/test/test.mjs").run()
                    try cmd("node", "--expose-gc", "--unhandled-rejections=strict", "output/test/test.mjs").run()
                case .kotlinSystem:
                    try FileManager.default.withCurrentDirectoryPath("kotlin") {
                        try cmd("./gradlew", "test").run()
                    }
                case .kotlinAndroid:
                    // TODO
                    break
                case .cSharp:
                    // TODO
                    break
                }
            }
        }

        if buildStep.contains(.pack) {
            for platform in platforms {
                guard platform.isTs else { continue }
                try cmd("npm", "pack", "./\(platform.outputDir)").run()
            }
        }
    }
}

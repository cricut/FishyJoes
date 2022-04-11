import swsh
import Foundation
import ArgumentParser
import Yams

let wasmToolchain = "/Library/Developer/Toolchains/swift-wasm-5.6.0-RELEASE.xctoolchain"
let androidToolchain = "/Library/Developer/Toolchains/swift-android-toolchain"

let dylibExt: String = {
	#if os(macOS)
	"dylib"
	#elseif os(Linux)
	"so"
	#else
	fatalError("unknown host OS")
	#endif
}()

struct CodeGen: ParsableCommand {
    @Flag(name: .shortAndLong, help: "suppress verbose output")
    var quiet: Bool = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a Web-assembly based node package")
    var nodejs: Bool = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a NodeJS N-API based node package")
    var wasm: Bool = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a Kotlin package")
    var kotlin: Bool = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Generate a Kotlin package without android support (much faster)")
    var kotlinFast: Bool = false

    @Flag(name: .long, inversion: .prefixedNo, help: "Additional wasm optimizations (takes some time)")
    var wasmOpt: Bool = true

    @Option(help: "Used for debugging fishy-joes code generation")
    var sourceryDumpPath: String?

    enum BuildStep: String, CaseIterable, ExpressibleByArgument {
        case generate, build, test, pack
    }

    @Option(name: .long, help: "Update version number of generated package.")
    var version: String?

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
}

struct SwiftPackage: Codable {
    struct Dependency: Codable {
        struct SCM: Codable {
            struct Location: Codable {
                let remote: [URL]?
            }
            let identity: String
            let location: Location
        }
        struct Local: Codable {
            let identity: String
            let path: String
        }
        let scm: [SCM]?
        let sourceControl: [SCM]?
        let local: [Local]?
        let fileSystem: [Local]?
    }
    struct Target: Codable {
        let name: String
        let path: String?
    }
    let dependencies: [Dependency]
    let targets: [Target]
}

extension SwiftPackage {
    var dependencyMap: [String: URL] {
        let locals = dependencies.flatMap { ($0.local ?? []) + ($0.fileSystem ?? []) }.map { ($0.identity.lowercased(), URL(string: $0.path)!) }
        let scms = dependencies.flatMap { ($0.scm ?? []) + ($0.sourceControl ?? []) }.compactMap { (scm: Dependency.SCM) -> (String, URL)? in
            guard let url = scm.location.remote?.first else { return nil }
            return (scm.identity.lowercased(), url)
        }
        return Dictionary(uniqueKeysWithValues: locals + scms)
    }

    func path(toTarget targetName: String) -> String? {
        guard let target = targets.first(where: { $0.name == targetName }) else {
            return nil
        }
        return target.path ?? "./Sources/\(targetName)"
    }
}

struct FishyJoesConfig: Codable {
    let module: String
    let publishRepository: String?

    static func readFromFile() -> FishyJoesConfig {
        guard let configData = try? cmd("cat", "fishy-joes.yaml").runString() else {
            fatalError("missing config file fishy-joes.yaml")
        }
        guard let configObject = try? Yams.load(yaml: configData) else {
            print("fishy-joes.yaml is not valid YAML. Should be something like:")
            print("---")
            print("module: MyModule")
            fatalError("invalid YAML")
        }
        guard let configDictionary = configObject as? [String: Any] else {
            print("fishy-joes.yaml root object must be a dictionary. Should be something like:")
            print("---")
            print("module: MyModule")
            fatalError("invalid YAML")
        }
        guard let moduleObj = configDictionary["module"] else {
            fatalError("fishy-joes.yaml missing key `module`. Should be the name of the library target you're exporting.")
        }
        guard let module = moduleObj as? String else {
            fatalError("fishy-joes.yaml value for key `module` is not a string. Should be the name of the library target you're exporting.")
        }
        let publishRepository = configDictionary["publishRepository"].map { obj -> String in
            guard let str = obj as? String else {
                fatalError("fishy-joes.yaml value for key `publishRepository` is not a string")
            }
            return str
        }
        return FishyJoesConfig(module: module, publishRepository: publishRepository)
    }
}

struct NPMPackage: Codable {
    var name: String
    var version: String?
    var description: String?
    var main: String?
    var type: String?
    var types: String?
    var browser: String?
    var author: String?
    var repository: Repository?
    var publishConfig: PublishConfig? = PublishConfig()
    var dependencies: [String: String]?

    init(config: FishyJoesConfig, platform: Platform, version: String, dependencies: [String: String]?) {
        self.name = "@cricut/\(config.module.lowercased())-\(platform.platform.replacingOccurrences(of: "node-", with: ""))"
        self.version = version
        self.description = platform.packageDescription(config: config)
        self.dependencies = dependencies
        self.main = "\(config.module).js"
        self.type = "module"
        self.types = "\(config.module).d.ts"
        self.browser = "\(config.module).browser.js"
        self.repository = config.publishRepository.map {
            Repository(type: "git", url: "ssh://git@\($0).git", directory: "packages")
        }
    }

    struct Repository: Codable {
        var type: String
        var url: String
        var directory: String
    }

    struct PublishConfig: Codable  {
        var registry: String = "https://npm.pkg.github.com/"
    }
}

extension CodeGen {
    mutating func run() throws {
        ExternalCommand.verbose = !quiet

        guard cmd("test", "-f", "Package.swift").runBool() else {
            fatalError("No Package.swift found in current directory. fishy-joes must be run in the root of the bindings package")
        }

        let config = FishyJoesConfig.readFromFile()

        var platforms: [Platform] = []
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

        let generateOnly = Set(buildStep) == [.generate]
        guard !platforms.isEmpty || generateOnly else {
            fatalError("must specify at least one of --wasm, --nodejs, or --kotlin for requested build steps")
        }

        if buildStep.contains(.generate) {
            let packageJSON = try cmd("swift", "package", "dump-package").runData()

            guard let packageInfo = try? JSONDecoder().decode(SwiftPackage.self, from: packageJSON) else {
                fatalError("Couldn't parse swift package")
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

            // MARK: Generate code
            try cmd("rm", "-rf", "Sources/Generated", "kotlin/src/generated").run()
            try cmd("mkdir", "-p",
                    "Sources/Generated/NodeInterface",
                    "Sources/Generated/JavaInterface",
                    "kotlin/src/generated/kotlin/com/cricut/\(config.module.lowercased())"
            ).run()
            try cmd(
                "touch",
                "Sources/Generated/NodeInterface/EmptyPlaceholder.swift",
                "Sources/Generated/JavaInterface/EmptyPlaceholder.swift"
            ).run()
            try cmd("swift", "build", "--product", "sourcery").run()
            try cmd("swift", "build", "--product", "fishy-joes-execution-helper").run()
            try cmd(
                ".build/debug/sourcery",
                arguments: [
                    quiet ? "-q" : nil,
                    "--disableCache",
                    "--parseDocumentation",
                    "--sources", translateeSources,
                    "--templates", ".build/debug/FishyJoes_FishyJoesExecutionHelper.bundle/FishyJoes.swifttemplate",
                    "--args", "module=\(config.module)",
                    "--args", "fishyJoesExecutable=.build/debug/fishy-joes-execution-helper",
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
                    try platform.swiftBuild()
                case .node:
                    try platform.swiftBuild("--product", "\(config.module)-node")
                case .kotlinSystem, .kotlinAndroid:
                    try platform.swiftBuild("--product", "\(config.module)-java")
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
                        try cmd("wasm-opt", "\(platform.buildDir)/DummyMain.wasm", "-O1", "-o", "\(platform.outputDir)/\(config.module).wasm").run()
                    } else {
                        if wasmOpt {
                            print("WARNING: wasm-opt is not installed, resulting build will be bigger and possibly slower")
                        } else {
                            print("skipping wasm-opt")
                        }
                        try cmd("cp", "\(platform.buildDir)/DummyMain.wasm", "\(platform.outputDir)/\(config.module).wasm").run()
                    }
                    try cmd(
                        "cp",
                        "\(platform.buildDir)/FishyJoes_FishyJoesNodeRuntime.resources/js/wasm-napi.js",
                        "Sources/Generated/NodeInterface/\(config.module).d.ts",
                        platform.outputDir
                    ).run()
                    try cmd(
                        "sed",
                        "-e", "s/__MODULE_NAME__/\(config.module)/g",
                        "\(platform.buildDir)/FishyJoes_FishyJoesNodeRuntime.resources/js/__MODULE_NAME__.js"
                    ).output(overwritingFile: "\(platform.outputDir)/\(config.module).js").run()
                    try cmd(
                        "sed",
                        "-e", "s/__MODULE_NAME__/\(config.module)/g",
                        "\(platform.buildDir)/FishyJoes_FishyJoesNodeRuntime.resources/js/__MODULE_NAME__.browser.js"
                    ).output(overwritingFile: "\(platform.outputDir)/\(config.module).browser.js").run()
                case .node:
                    try cmd("cp", "\(platform.buildDir)/lib\(config.module)-node.\(dylibExt)", "\(platform.outputDir)/\(config.module).cjs.node").run()
                    try cmd(
                        "cp",
                        "Sources/Generated/NodeInterface/\(config.module).d.ts",
                        platform.outputDir
                    ).run()
                    try cmd(
                        "echo",
                        """
                            import { createRequire } from 'module';
                            const require = createRequire(import.meta.url);
                            export const { \(config.module) } = require('./\(config.module).cjs')
                            export default \(config.module)
                            """
                    ).output(overwritingFile: "\(platform.outputDir)/\(config.module).js").run()
                case .kotlinSystem:
                    try cmd("mkdir", "-p", platform.outputDir).run()
                    try cmd("cp", "\(platform.buildDir)/lib\(config.module)-java.\(dylibExt)", platform.outputDir).run()
                case .kotlinAndroid:
                    try cmd("mkdir", "-p", platform.outputDir).run()
                    try cmd("cp", "\(platform.buildDir)/lib\(config.module)-java.so", platform.outputDir).run()
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
            case .kotlinSystem, .kotlinAndroid:
                ()
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
                    ()
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

enum AndroidArchitecture: String, Equatable, CaseIterable {
    case arm, i686, x86_64, aarch64

    var triple: String {
        switch self {
        case .arm: return "armv7-none-linux-androideabi"
        default: return "\(rawValue)-unknown-linux-android"
        }
    }

    var ndkName: String {
        switch self {
        case .arm: return "armeabi-v7a"
        case .i686: return "x86"
        case .x86_64: return "x86_64"
        case .aarch64: return "arm64-v8a"
        }
    }
}

enum Platform: Hashable {
    case wasm, node, kotlinSystem, kotlinAndroid(AndroidArchitecture)

    static let nativeMacSwiftBuild = try! cmd("xcrun", "-f", "swift-build").runString()

    func swiftBuild(arguments: [String]) throws {
        var args = arguments
        args.append(contentsOf: ["--configuration", "release"])
        let path: String
        var env: [String: String] = [:]
        switch self {
        case .wasm:
            path = "\(wasmToolchain)/usr/bin/swift-build"
            args.append(contentsOf: ["--triple", "wasm32-unknown-wasi"])
            // custom build paths to avoid different versions of spm destroying each other's caches
            args.append(contentsOf: ["--build-path", "./.build/wasm-build"])
            env = ["WASM_ONLY": "1"]
        case .node, .kotlinSystem:
            #if os(macOS)
            path = Platform.nativeMacSwiftBuild
            #elseif os(Linux)
            path = "swift"
            args = ["build", "-Xswiftc", "-static-stdlib"] + args
            #else
            fatalError("unknown host OS")
            #endif
        case .kotlinAndroid(.arm):
            path = "\(androidToolchain)/usr/bin/swift-build-arm-linux-androideabi"
            args.append(
                contentsOf: [
                    "--build-path", "./.build/android-build",
                ]
            )
        case .kotlinAndroid(let arch):
            path = "\(androidToolchain)/usr/bin/swift-build-\(arch.rawValue)-linux-android"
            args.append(
                contentsOf: [
                    "--build-path", "./.build/android-build",
                ]
            )
        }
        try cmd(path, arguments: args, addEnv: env).run()
    }

    func swiftBuild(_ arguments: String...) throws {
        try swiftBuild(arguments: arguments)
    }

    var platform: String {
        switch self {
        case .wasm: return "wasm"
        case .node:
            #if os(macOS)
            return "node-native-macos"
            #elseif os(Linux)
            return "node-native-ubuntu"
            #else
            fatalError("unknown host OS")
            #endif
        case .kotlinSystem:
            #if os(macOS)
            return "jni-macos"
            #elseif os(Linux)
            return "jni-ubuntu"
            #else
            fatalError("unknown host OS")
            #endif
        case .kotlinAndroid: return "jni-android"
        }
    }
    var outputDir: String {
        switch self {
        case .wasm, .node: return "output/\(platform)"
        case .kotlinSystem:
            #if os(macOS)
            return "kotlin/src/generated/resources/mac"
            #elseif os(Linux)
            return "kotlin/src/generated/resources/linux"
            #else
            fatalError("unknown host OS")
            #endif
        case .kotlinAndroid(let arch): return "kotlin/src/generated/resources/lib/\(arch.ndkName)"
        }
    }
    func packageDescription(config: FishyJoesConfig) -> String {
        switch self {
        case .wasm: return "\(config.module) packaged as a typescript library using WebAssembly"
        case .node: return "\(platform) <-> node/ts bindings for \(config.module)"
        case .kotlinSystem, .kotlinAndroid: return "A JNI wrapper for \(config.module)"
        }
    }
    var buildDir: String {
        switch self {
        case .wasm: return ".build/wasm-build/wasm32-unknown-wasi/release"
        case .node, .kotlinSystem:
            #if os(macOS)
            return ".build/x86_64-apple-macosx/release"
            #elseif os(Linux)
            return ".build/x86_64-unknown-linux-gnu/release"
            #else
            fatalError("unknown host OS")
            #endif
        case .kotlinAndroid(.arm):
            return ".build/android-build/armv7-none-linux-androideabi/release"
        case .kotlinAndroid(let arch):
            return ".build/android-build/\(arch.rawValue)-unknown-linux-android/release"
        }
    }
    var isTs: Bool {
        self == .wasm || self == .node
    }
}

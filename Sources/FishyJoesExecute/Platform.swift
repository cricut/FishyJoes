import Foundation
import swsh

#if os(macOS)
let wasmToolchain = "/Library/Developer/Toolchains/swift-wasm-5.9.1-RELEASE.xctoolchain"
#elseif os(Linux)
let wasmToolchain = "/Library/Developer/Toolchains/swift-wasm-5.9.1-RELEASE.xctoolchain"
#elseif os(Windows)
// TODO: There does not appear to be a Windows-native version of this. WSL could maybe use this, but would it still identify the platform as Windows?
let wasmToolchain = "C:\\Library\\Developer\\Toolchains\\swift-wasm-5.9.1-RELEASE-ubuntu22.04_x86_64"
#endif

#if os(macOS)
private let ps: String = "/"
#elseif os(Linux)
private let ps: String = "/"
#elseif os(Windows)
private let ps: String = "\\"
#endif

struct BuildConfiguration: Hashable {
    let debug: Bool
    let fat: Bool
    let codeCoveragePath: String?
    var baseDockerContext: Lazy<DockerContext?>
    let disableParallelism: Bool

    var codeCoverage: Bool { codeCoveragePath != nil }
}

enum Platform: CustomStringConvertible, Hashable {
    case wasm
    case node
    case kotlinSystem
    case kotlinAndroid(AndroidArchitecture)
    case cSharp
    case dart

    enum AndroidArchitecture: String, Equatable, CaseIterable {
        case armv7, x86_64, aarch64

        static let apiVersion = 24

        var triple: String {
            "\(rawValue)-unknown-linux-android\(AndroidArchitecture.apiVersion)"
        }

        var ndkName: String {
            switch self {
            case .armv7: return "armeabi-v7a"
            case .x86_64: return "x86_64"
            case .aarch64: return "arm64-v8a"
            }
        }

        var toolchainPath: String {
            "\(ps)swift-android-\(self)"
        }
    }

    var description: String {
        switch self {
        case .wasm:
            return "wasm"
        case .node:
            return "node"
        case .kotlinSystem:
            return "kotlinSystem"
        case let .kotlinAndroid(arch):
            return "kotlinAndroid(\(arch.rawValue))"
        case .cSharp:
            return "cSharp"
        case .dart:
            return "dart"
        }
    }

    static let pathSeparator = ps

    static let nativeMacSwiftBuild = try! cmd("xcrun", "-f", "swift-build").runString()

    // swift 5.7 no longer recognizes "--enable-code-coverage" outside of the "test" command
    static let coverageFlags = [
        "-Xswiftc", "-profile-coverage-mapping",
        "-Xswiftc", "-profile-generate",
    ]

    var isNative: Bool {
        switch self {
        case .wasm, .kotlinAndroid:
            return false
        case .node, .kotlinSystem, .cSharp, .dart:
            return true
        }
    }

    func needsDocker(configuration: BuildConfiguration) -> Bool {
        if case .kotlinAndroid = self {
            return configuration.baseDockerContext.get() != nil
        }
        return false
    }

    var dylibExt: String {
        switch self {
        case .wasm:
            return "wasmlib" // not a real thing
        case .kotlinAndroid:
            return "so"
        default:
            #if os(macOS)
            return "dylib"
            #elseif os(Linux)
            return "so"
            #elseif os(Windows)
            return "dll"
            #else
            fatalError("unknown host OS")
            #endif
        }
    }

    var dylibPrefix: String {
        switch self {
        case .wasm:
            fatalError("dynamic linking is currently unsupported in wasm")
        case .kotlinAndroid:
            return "lib"
        default:
            #if os(macOS)
            return "lib"
            #elseif os(Linux)
            return "lib"
            #elseif os(Windows)
            return ""
            #else
            fatalError("unknown host OS")
            #endif
        }
    }

    func build(product: String? = nil, libs: [String] = [], configuration: BuildConfiguration, addEnv: [String: String] = [:]) throws {
        if isNative, configuration.fat {
            guard let product = product else {
                fatalError("Can't infer products in fat builds")
            }
            try cmd("mkdir", "-p", buildDir(configuration)).run()
            let confName = configuration.debug ? "debug" : "release"

            try swiftBuild("--product", product, "--triple", "arm64-apple-macosx", configuration: configuration, addEnv: addEnv).run()
            try swiftBuild("--product", product, "--triple", "x86_64-apple-macosx", configuration: configuration, addEnv: addEnv).run()

            for lib in libs {
                let libName = "lib\(lib).dylib"
                try cmd(
                    "lipo", "-create",
                    "-output", "\(buildDir(configuration))\(ps)\(libName)",
                    ".build\(ps)arm64-apple-macosx\(ps)\(confName)\(ps)\(libName)",
                    ".build\(ps)x86_64-apple-macosx\(ps)\(confName)\(ps)\(libName)"
                ).run()
            }
        } else {
            try swiftBuild(arguments: product.map { ["--product", $0] } ?? [], configuration: configuration, addEnv: addEnv).run()
        }
    }

    func swiftBuild(arguments: [String], configuration: BuildConfiguration, addEnv: [String: String] = [:]) -> Command {
        var args = arguments
        args.append(contentsOf: ["--configuration", configuration.debug ? "debug" : "release"])
        if configuration.codeCoverage {
            args.append(contentsOf: Platform.coverageFlags)
        }
        if configuration.disableParallelism {
            args.append(contentsOf: ["-j", "1"])
        }
        let path: String
        var env: [String: String] = addEnv
        env["SWIFT_PACKAGE_FORCE_DYNAMIC"] = "1"
        env["FISHYJOES_TARGET_PLATFORM"] = "\(self)"
        env["EXTRA_LIBPATH"] = try platform.extraLibPathDir(configuration)
        switch self {
        case .wasm:
            path = "\(wasmToolchain)\(ps)usr\(ps)bin\(ps)swift-build"
            args.append(contentsOf: ["--triple", "wasm32-unknown-wasi"])
            // custom build paths to avoid different versions of spm destroying each other's caches
            args.append(contentsOf: ["--build-path", ".\(ps).build\(ps)wasm-build"])

            // TODO: see https://blog.swiftwasm.org/posts/5-6-released/
            // args.append(contentsOf: ["-Xswiftc", "-Xclang-linker", "-Xswiftc", "-mexec-model=reactor"])

            env = ["WASM_ONLY": "1"]
        case .node, .kotlinSystem, .dart:
            #if os(macOS)
            path = Platform.nativeMacSwiftBuild
            args.append(contentsOf: ["-Xlinker", "-rpath", "-Xlinker", "@loader_path"])
            #elseif os(Linux)
            path = "swift"
            args = ["build"] + args
            #elseif os(Windows)
            path = "swift"
            args = ["build"] + args
            #else
            fatalError("unknown host OS")
            #endif
        case let .kotlinAndroid(arch):
            path = "swift-build"
            args.append(
                contentsOf: [
                    "--scratch-path", ".\(ps).build\(ps)android-build",
                    "--destination", "\(arch.toolchainPath)\(ps)usr\(ps)swiftpm-android-\(arch).json",
                ]
            )
            env["ANDROID_COMPATIBLE_ONLY"] = "1"

            guard var dockerContext = configuration.baseDockerContext.get() else {
                print("WARNING: building for android without using a docker context (expecting to already be inside container)")
                break
            }
            dockerContext.env.merge(env) { $1 }
            return dockerContext.cmd("swift-build", arguments: args)

        case .cSharp:
            #if os(macOS)
            path = Platform.nativeMacSwiftBuild
            // This seems to be needed because of https://github.com/mono/mono/issues/21049
            args.append(contentsOf: ["-Xlinker", "-rpath", "-Xlinker", "@loader_path"])
            #elseif os(Linux)
            path = "swift"
            args = ["build"] + args
            #elseif os(Windows)
            path = "swift"
            args = ["build"] + args
            #else
            fatalError("unknown host OS")
            #endif
        }
        return cmd(path, arguments: args, addEnv: env)
    }

    func swiftBuild(_ arguments: String..., configuration: BuildConfiguration, addEnv: [String: String] = [:]) -> Command {
        swiftBuild(arguments: arguments, configuration: configuration, addEnv: addEnv)
    }

    func clangBuild(
        sources: [String],
        dependencies: [String] = [],
        headerSearchPaths: [String] = [],
        librarySearchPaths: [String] = [],
        omitLocalRPath: Bool = false,
        dynamic: Bool = true,
        outputPath: String? = nil,
        configuration: BuildConfiguration
    ) throws {
        if isNative, configuration.fat {
            let triples = ["arm64-apple-macosx", "x86_64-apple-macosx"]
            let libs = triples.map { "\((outputPath as? NSString)?.lastPathComponent ?? dylibName(for: "out"))_\($0)" }
            for (triple, lib) in zip(triples, libs) {
                try clangBuild(
                    sources: sources,
                    dependencies: dependencies,
                    headerSearchPaths: headerSearchPaths,
                    librarySearchPaths: librarySearchPaths,
                    omitLocalRPath: omitLocalRPath,
                    dynamic: dynamic,
                    optimize: !configuration.debug,
                    targetTriple: triple,
                    outputPath: lib
                ).run()
            }
            try cmd("lipo", arguments: ["-create"] + (outputPath != nil ? ["-output", outputPath!] : []) + libs).run()
            for lib in libs {
                if cmd("test", "-f", lib).runBool() {
                    try? cmd("rm", lib).run()
                }
            }
        } else {
            try clangBuild(
                sources: sources,
                dependencies: dependencies,
                headerSearchPaths: headerSearchPaths,
                librarySearchPaths: librarySearchPaths,
                omitLocalRPath: omitLocalRPath,
                dynamic: dynamic,
                optimize: !configuration.debug,
                outputPath: outputPath
            ).run()
        }
    }

    func clangBuild(
        sources: [String],
        dependencies: [String] = [],
        headerSearchPaths: [String] = [],
        librarySearchPaths: [String] = [],
        omitLocalRPath: Bool = false,
        dynamic: Bool = true,
        optimize: Bool = true,
        targetTriple: String? = nil,
        outputPath: String? = nil
    ) -> Command {
        #if os(macOS) || os(Linux)
        var args: [String] = []
        if dynamic {
            args.append(contentsOf: ["-shared", "-undefined", "dynamic_lookup"])
        }
        if optimize {
            args.append("-Ofast")
        }
        for headerSearchPath in headerSearchPaths {
            args.append("-I\(headerSearchPath)")
        }
        for librarySearchPath in librarySearchPaths {
            args.append("-L\(librarySearchPath)")
        }
        for dependency in dependencies {
            args.append("-l\(dependency)")
        }
        if let targetTriple = targetTriple {
            args.append("--target=\(targetTriple)")
        }
        if let outputPath = outputPath {
            args.append(contentsOf: ["-o", outputPath])
        }
        if !omitLocalRPath {
            #if os(macOS)
            args.append(contentsOf: ["-rpath", "@loader_path"])
            #elseif os(Linux)
            args.append(contentsOf: ["-rpath", "$ORIGIN"])
            #endif
        }
        args.append(contentsOf: sources)
        return cmd("clang", arguments: args)
        #elseif os(Windows)
        var args: [String] = []
        if dynamic {
            args.append("/LD")
        }
        if optimize {
            args.append("/O2")
        } else {
            args.append("/Od")
        }
        for headerSearchPath in headerSearchPaths {
            args.append("/I\(headerSearchPath)")
        }
        args.append(contentsOf: sources)
        if !dependencies.isEmpty || !librarySearchPaths.isEmpty || outputPath != nil {
            args.append("/link")
        }
        for librarySearchPath in librarySearchPaths {
            args.append("/LIBPATH:\(librarySearchPath)")
        }
        for dependency in dependencies {
            args.append("\(dependency).lib")
        }
        if let targetTriple = targetTriple {
            fatalError("Windows clang cross-compile builds not supported: \(targetTriple)")
        }
        if let outputPath = outputPath {
            args.append("/OUT:\(outputPath)")
        }
        return cmd("clang-cl", arguments: args)
        #else
        fatalError("unknown host OS")
        #endif
    }

    func gradleBuild(arguments: [String], configuration: BuildConfiguration) -> Command {
        #if os(macOS)
        return cmd("./gradlew", arguments: arguments)
        #elseif os(Linux)
        return cmd("./gradlew", arguments: arguments)
        #elseif os(Windows)
        return cmd("cmd.exe", arguments: ["/c", "gradlew.bat"] + arguments)
        #else
        fatalError("unknown host OS")
        #endif
    }

    func gradleBuild(_ arguments: String..., configuration: BuildConfiguration) -> Command {
        gradleBuild(arguments: arguments, configuration: configuration)
    }

    func gradleTest(arguments: [String], codeCoveragePath: String?) -> Command {
        let args = ["cleanTest", "test"] + (codeCoveragePath == nil ? [] : ["jacocoTestReport"]) + arguments
        let env = codeCoveragePath.map {
            [
                "LLVM_PROFILE_FILE": "\($0)\(ps)fishy-joes-test-\(platform)-\(UUID()).profraw",
            ]
        } ?? [:]
        #if os(macOS)
        return cmd("./gradlew", arguments: args, addEnv: env)
        #elseif os(Linux)
        return cmd("./gradlew", arguments: args, addEnv: env)
        #elseif os(Windows)
        return cmd("cmd.exe", arguments: ["/c", "gradlew.bat"] + args, addEnv: env)
        #else
        fatalError("unknown host OS")
        #endif
    }

    func gradleTest(_ arguments: String..., codeCoveragePath: String?) -> Command {
        gradleTest(arguments: arguments, codeCoveragePath: codeCoveragePath)
    }

    func dotnetBuild(arguments: [String], configuration: BuildConfiguration) -> Command {
        let args = ["build"] + arguments + (configuration.debug ? [] : ["--configuration", "Debug"])
        return cmd("dotnet", arguments: args)
    }

    func dotnetBuild(_ arguments: String..., configuration: BuildConfiguration) -> Command {
        dotnetBuild(arguments: arguments, configuration: configuration)
    }

    func dotnetTest(arguments: [String], codeCoveragePath: String?) -> Command {
        let env = codeCoveragePath.map {
            [
                "LLVM_PROFILE_FILE": "\($0)\(ps)fishy-joes-test-\(platform)-\(UUID()).profraw",
            ]
        } ?? [:]
        var commandParts = ["dotnet", "test"] + arguments
        if let path = codeCoveragePath {
            commandParts = ["dotnet-coverage", "collect", "-f", "xml", "-o", "\(path)\(ps)integration-tests-c-sharp.xml"] + commandParts
        }
        return cmd(commandParts.first!, arguments: Array(commandParts.dropFirst()), addEnv: env)
    }

    func dotnetTest(_ arguments: String..., codeCoveragePath: String?) -> Command {
        dotnetTest(arguments: arguments, codeCoveragePath: codeCoveragePath)
    }

    func dartBuild(arguments: [String], configuration: BuildConfiguration) -> Command {
        return cmd("dart", arguments: ["run", "build_runner", "build", "--delete-conflicting-outputs"])
    }

    func dartBuild(_ arguments: String..., configuration: BuildConfiguration) -> Command {
        dartBuild(arguments: arguments, configuration: configuration)
    }

    func dartTest(arguments: [String], codeCoveragePath: String?) -> Command {
        let env = codeCoveragePath.map {
            [
                "LLVM_PROFILE_FILE": "\($0)\(ps)fishy-joes-test-\(platform)-\(UUID()).profraw",
            ]
        } ?? [:]
        return cmd("dart", arguments: ["test", "--chain-stack-traces"], addEnv: env)
    }

    func dartTest(_ arguments: String..., codeCoveragePath: String?) -> Command {
        dartTest(arguments: arguments, codeCoveragePath: codeCoveragePath)
    }

    func npm(arguments: [String]) -> Command {
        #if os(macOS)
        return cmd("npm", arguments: arguments)
        #elseif os(Linux)
        return cmd("npm", arguments: arguments)
        #elseif os(Windows)
        return cmd("cmd.exe", arguments: ["/c", "npm"] + arguments)
        #else
        fatalError("unknown host OS")
        #endif
    }

    func npm(_ arguments: String...) -> Command {
        npm(arguments: arguments)
    }

    func npmTest(arguments: [String], codeCoveragePath: String?) -> Command {
        let env = codeCoveragePath.map {
            [
                "LLVM_PROFILE_FILE": "\($0)\(ps)fishy-joes-test-\(platform)-\(UUID()).profraw",
                "NODE_V8_COVERAGE": "\($0)\(ps)node",
            ]
        } ?? [:]
        let args = ["run", "test-\(nodeExecutionEnvironment)"] + arguments
        #if os(macOS)
        return cmd("npm", arguments: args, addEnv: env)
        #elseif os(Linux)
        return cmd("npm", arguments: args, addEnv: env)
        #elseif os(Windows)
        return cmd("cmd.exe", arguments: ["/c", "npm"] + args, addEnv: env)
        #else
        fatalError("unknown host OS")
        #endif
    }

    func npmTest(_ arguments: String..., codeCoveragePath: String?) -> Command {
        npmTest(arguments: arguments, codeCoveragePath: codeCoveragePath)
    }

    func dylibName(for lib: String) -> String {
        return "\(dylibPrefix)\(lib).\(dylibExt)"
    }

    func dylibPath(for lib: String, configuration: BuildConfiguration) throws -> String {
        try buildDir(configuration) + "\(ps)" + dylibName(for: lib)
    }

    var platform: String {
        switch self {
        case .wasm: return "wasm"
        case .node:
            #if os(macOS)
            return "node-native-macos"
            #elseif os(Linux)
            return "node-native-ubuntu"
            #elseif os(Windows)
            return "node-native-windows"
            #else
            fatalError("unknown host OS")
            #endif
        case .kotlinSystem:
            #if os(macOS)
            return "jni-macos"
            #elseif os(Linux)
            return "jni-ubuntu"
            #elseif os(Windows)
            return "jni-windows"
            #else
            fatalError("unknown host OS")
            #endif
        case .kotlinAndroid: return "jni-android"
        case .cSharp:
            #if os(macOS)
            return "c-sharp-macos"
            #elseif os(Linux)
            return "c-sharp-ubuntu"
            #elseif os(Windows)
            return "c-sharp-windows"
            #else
            fatalError("unknown host OS")
            #endif
        case .dart: return "dart"
        }
    }

    var nodeExecutionEnvironment: String {
        switch self {
        case .node, .wasm: return platform.replacingOccurrences(of: "node-native-", with: "native-")
        default:
            fatalError("\(self) is not a node platform")
        }
    }

    func outputDir(_ config: FishyJoesConfig) -> String {
        switch self {
        case .wasm, .node: return "output\(ps)\(platform)"
        case .kotlinSystem:
            #if os(macOS)
            return "kotlin\(ps)src\(ps)generated\(ps)resources\(ps)mac"
            #elseif os(Linux)
            return "kotlin\(ps)src\(ps)generated\(ps)resources\(ps)linux"
            #elseif os(Windows)
            return "kotlin\(ps)src\(ps)generated\(ps)resources\(ps)windows"
            #else
            fatalError("unknown host OS")
            #endif
        case .kotlinAndroid(let arch): return "kotlin\(ps)src\(ps)generated\(ps)resources\(ps)lib\(ps)\(arch.ndkName)"
        case .cSharp:
            #if os(macOS)
            return "c-sharp\(ps)Cricut.\(config.module)\(ps)runtimes\(ps)osx\(ps)native"
            #elseif os(Linux)
            return "c-sharp\(ps)Cricut.\(config.module)\(ps)runtimes\(ps)linux\(ps)native"
            #elseif os(Windows)
            return "c-sharp\(ps)Cricut.\(config.module)\(ps)runtimes\(ps)win\(ps)native"
            #else
            fatalError("unknown host OS")
            #endif
        case .dart:
            #if os(macOS)
            return "dart\(ps)macos\(ps)native"
            #elseif os(Linux)
            return "dart\(ps)linux\(ps)native"
            #elseif os(Windows)
            return "dart\(ps)windows\(ps)native"
            #else
            fatalError("unknown host OS")
            #endif
        }
    }

    func packageDescription(config: FishyJoesConfig) -> String {
        switch self {
        case .wasm: return "\(config.module) packaged as a typescript library using WebAssembly"
        case .node: return "\(platform) <-> node/ts bindings for \(config.module)"
        case .kotlinSystem, .kotlinAndroid: return "A JNI wrapper for \(config.module)"
        case .cSharp: return "A C# wrapper for \(config.module)"
        case .dart: return "A Dart wrapper for \(config.module)"
        }
    }

    func buildDir(_ configuration: BuildConfiguration) throws -> String {
        let directory: String
        if isNative, configuration.fat {
            directory = "\(FileManager.default.currentDirectoryPath)\(ps).build\(ps)apple\(ps)\(configuration.debug ? "debug" : "release")"
        } else if case .kotlinAndroid(let arch) = self {
            directory = "\(FileManager.default.currentDirectoryPath)\(ps).build\(ps)android-build\(ps)\(arch.triple)\(ps)\(configuration.debug ? "debug" : "release")"
        } else {
            directory = try swiftBuild("--show-bin-path", configuration: configuration).runString().trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return directory
    }

    func extraLibPathDir(_ configuration: BuildConfiguration) throws -> String {
        return "\(try buildDir(configuration))\(ps)lib"
    }
}

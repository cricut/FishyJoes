import Foundation
import swsh

#if os(macOS)
let wasmToolchain = "/Library/Developer/Toolchains/swift-wasm-5.9-SNAPSHOT-2024-03-27-a.xctoolchain"
#elseif os(Linux)
let wasmToolchain = "/Library/Developer/Toolchains/swift-wasm-5.9-SNAPSHOT-2024-03-27-a.xctoolchain"
#else
let wasmToolchain: String = { fatalError("wasm compilation is currently only supported on mac and linux") }()
#endif

#if os(macOS)
private let ps: String = "/"
#elseif os(Linux)
private let ps: String = "/"
#elseif os(Windows)
private let ps: String = "\\"
#endif

struct BuildConfiguration: Hashable {
    let packagePath: String?
    let scratchPath: String
    let debug: Bool
    let fat: Bool
    let codeCoveragePath: String?
    var baseDockerContext: Lazy<DockerContext?>
    let disableParallelism: Bool
    var codeCoverage: Bool { codeCoveragePath != nil }
    var injectedSwiftDependencies: [String: PackageDotSwiftDependency.Dependency]
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

    func build(product: String? = nil, libs: [String] = [], configuration: BuildConfiguration, addEnv: [String: String] = [:]) throws {
        var buildArguments: [String] = []
        if let product = product {
            buildArguments.append(contentsOf: ["--product", product])
        }
        if isNative, configuration.fat {
            guard product != nil else {
                fatalError("Can't infer products in fat builds")
            }
            try cmd("mkdir", "-p", buildDir(configuration)).run()
            let confName = configuration.debug ? "debug" : "release"

            try swiftBuild(arguments: buildArguments + ["--triple", "arm64-apple-macosx"], configuration: configuration, addEnv: addEnv).run()
            try swiftBuild(arguments: buildArguments + ["--triple", "x86_64-apple-macosx"], configuration: configuration, addEnv: addEnv).run()

            for lib in libs {
                let libName = "lib\(lib).dylib"
                try cmd(
                    "lipo", "-create",
                    "-output", "\(buildDir(configuration))/\(libName)",
                    "\(configuration.scratchPath)/arm64-apple-macosx/\(confName)/\(libName)",
                    "\(configuration.scratchPath)/x86_64-apple-macosx/\(confName)/\(libName)"
                ).run()
            }
        } else {
            try swiftBuild(arguments: buildArguments, configuration: configuration, addEnv: addEnv).run()
        }
    }

    func swiftBuild(arguments: [String], configuration: BuildConfiguration, addEnv: [String: String] = [:]) -> Command {
        var args = arguments

        // Read "SWIFT_PACKAGE_RESOLVE" from our environment variables, and pass as flag to swift compiler
        if ProcessInfo.processInfo.environment["SWIFT_PACKAGE_RESOLVE"] == "0" {
            args.append("--disable-automatic-resolution")
        }

        args.append(contentsOf: ["--configuration", configuration.debug ? "debug" : "release"])
        if let packagePath = configuration.packagePath {
            args.append(contentsOf: ["--package-path", packagePath])
        }
        if configuration.codeCoverage {
            args.append(contentsOf: Platform.coverageFlags)
        }
        if configuration.disableParallelism {
            args.append(contentsOf: ["-j", "1"])
        }
        let swiftBuild: [String]
        var env: [String: String] = addEnv
        env["SWIFT_PACKAGE_FORCE_DYNAMIC"] = "1"
        env["FISHYJOES_TARGET_PLATFORM"] = "\(self)"
        env["EXTRA_LIBPATH"] = try? extraLibPathDir(configuration)
        var dockerContext: DockerContext?

        var scratchPath = configuration.scratchPath
        switch self {
        case .wasm:
            swiftBuild = ["\(wasmToolchain)/usr/bin/swift-build"]
            args.append(contentsOf: ["--triple", "wasm32-unknown-wasi"])
            // custom build paths to avoid different versions of spm destroying each other's caches
            args.append(contentsOf: ["--build-path", ".\(ps).build\(ps)wasm-build"])

            // TODO: see https://blog.swiftwasm.org/posts/5-6-released/
            // args.append(contentsOf: ["-Xswiftc", "-Xclang-linker", "-Xswiftc", "-mexec-model=reactor"])

            env = ["WASM_ONLY": "1"]
        case .node, .kotlinSystem, .dart:
            #if os(macOS)
            swiftBuild = [Platform.nativeMacSwiftBuild]
            args.append(contentsOf: ["-Xlinker", "-rpath", "-Xlinker", "@loader_path"])
            #elseif os(Linux) || os(Windows)
            swiftBuild = ["swift", "build"]
            #else
            fatalError("unknown host OS")
            #endif
        case let .kotlinAndroid(arch):
            swiftBuild = ["swift-build"]
            scratchPath = "\(scratchPath)/android-build"
            args.append(
                contentsOf: [
                    "--scratch-path", ".\(ps).build\(ps)android-build",
                    "--destination", "\(arch.toolchainPath)\(ps)usr\(ps)swiftpm-android-\(arch).json",
                ]
            )
            env["ANDROID_COMPATIBLE_ONLY"] = "1"

            dockerContext = configuration.baseDockerContext.get()
            if dockerContext == nil {
                Log.warn("WARNING: building for android without using a docker context (expecting to already be inside container)")
                break
            }
        case .cSharp:
            #if os(macOS)
            swiftBuild = [Platform.nativeMacSwiftBuild]
            // This seems to be needed because of https://github.com/mono/mono/issues/21049
            args.append(contentsOf: ["-Xlinker", "-rpath", "-Xlinker", "@loader_path"])
            #elseif os(Linux) || os(Windows)
            swiftBuild = ["swift", "build"]
            #else
            fatalError("unknown host OS")
            #endif
        }
        args = ["--scratch-path", scratchPath] + args

        let path = swiftBuild[0]
        args = swiftBuild.dropFirst() + args

        // Inject swift package dependency environment variables
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.withoutEscapingSlashes]
        for (module, dependency) in configuration.injectedSwiftDependencies {
            var dependency = dependency
            if let dockerContext = dockerContext {
                switch dependency {
                case .local(let path):
                    // If we're running in docker, swiftpm's absolute paths need to be converted to docker's file system
                    dependency = .local(path: dockerContext.translateMounted(externalPath: path))
                default: ()
                }
            }
            env["FISHYJOES_DEPENDENCY_\(module)"] = try! encoder.encodeToString(dependency)
        }

        if var dockerContext = dockerContext {
            dockerContext.env.merge(env) { $1 }
            try! dockerContext.cmd("env", arguments: []).run()
            return dockerContext.cmd("swift-build", arguments: args)
        } else {
            Log.info("swiftBuild addEnv = \(env)")
            return cmd(path, arguments: args, addEnv: env)
        }
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
        case .wasm, .node: return "bindings/generated/node/packages/\(platform)"
        case .kotlinSystem:
            #if os(macOS)
            return "bindings/kotlin/generated/src/main/resources/mac"
            #elseif os(Linux)
            return "bindings/kotlin/generated/src/main/resources/linux"
            #elseif os(Windows)
            return "bindings/kotlin/generated/src/main/resources/windows"
            #else
            fatalError("unknown host OS")
            #endif
        case .kotlinAndroid(let arch): return "kotlin/src/main/resources/lib/\(arch.ndkName)"
        case .cSharp:
            #if os(macOS)
            return "bindings/c-sharp/generated/Cricut.\(config.module)/runtimes/osx/native"
            #elseif os(Linux)
            return "bindings/c-sharp/generated/Cricut.\(config.module)/runtimes/linux/native"
            #elseif os(Windows)
            return "bindings/c-sharp/generated/Cricut.\(config.module)/runtimes/win/native"
            #else
            fatalError("unknown host OS")
            #endif
        case .dart:
            #if os(macOS)
            return "bindings/dart/generated/macos/native"
            #elseif os(Linux)
            return "bindings/dart/generated/linux/native"
            #elseif os(Windows)
            return "bindings/dart/generated/windows/native"
            #else
            fatalError("unknown host OS")
            #endif
        }
    }

    func packageDescription(config: FishyJoesConfig) -> String {
        switch self {
        case .wasm: return "\(config.module) packaged as a typescript library using WebAssembly"
        case .node: return "TypeScript bindings for \(config.module) on \(platform)"
        case .kotlinSystem, .kotlinAndroid: return "Kotlin JNI bindings for \(config.module)"
        case .cSharp: return "C# bindings for \(config.module)"
        case .dart: return "Dart bindings for \(config.module)"
        }
    }

    func buildDir(_ configuration: BuildConfiguration) throws -> String {
        let directory: String
        let packagePrefix = configuration.packagePath.map { $0 + "/" } ?? ""
        if isNative, configuration.fat {
            directory = "\(packagePrefix).build/apple/\(configuration.debug ? "debug" : "release")"
        } else if case .kotlinAndroid(let arch) = self {
            directory = "\(packagePrefix).build/android-build/\(arch.triple)/\(configuration.debug ? "debug" : "release")"
        } else {
            directory = try swiftBuild("--show-bin-path", configuration: configuration).runString().trimmingCharacters(in: .whitespacesAndNewlines)
        }
        return directory
    }

    func extraLibPathDir(_ configuration: BuildConfiguration) throws -> String {
        return ".build\(ps)lib"
    }
}

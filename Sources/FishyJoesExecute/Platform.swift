import Foundation
import swsh

#if os(macOS)
let wasmToolchain = "/Library/Developer/Toolchains/swift-wasm-5.10-SNAPSHOT-2024-04-26-a.xctoolchain"
#elseif os(Linux)
let wasmToolchain = "/Library/Developer/Toolchains/swift-wasm-5.10-SNAPSHOT-2024-04-26-a.xctoolchain"
#else
let wasmToolchain: String = { fatalError("wasm compilation is currently only supported on mac and linux") }()
#endif

struct BuildConfiguration: Hashable {
    let packagePath: String
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
        args.append(contentsOf: ["--package-path", configuration.packagePath])
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
        env["EXTRA_LIBPATH"] = relativePath(of: extraLibPathDir(), relativeTo: configuration.packagePath)
        var dockerContext: DockerContext?

        var scratchPath = configuration.scratchPath
        switch self {
        case .wasm:
            swiftBuild = ["\(wasmToolchain)/usr/bin/swift-build"]
            args.append(contentsOf: ["--triple", "wasm32-unknown-wasi"])
            // custom build paths to avoid different versions of spm destroying each other's caches
            scratchPath = "\(scratchPath)/wasm-build"
            args.append(contentsOf: ["-Xswiftc", "-Xclang-linker", "-Xswiftc", "-mexec-model=reactor"])

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
                    "--destination", "/swift-android-\(arch)/usr/swiftpm-android-\(arch).json",
                ]
            )
            env["ANDROID_COMPATIBLE_ONLY"] = "1"

            dockerContext = configuration.baseDockerContext.get()
            if dockerContext == nil {
                Log.warn("WARNING: building for android without using a docker context (expecting to already be inside container)")
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

        #if os(Windows)
        // This warning seems to be related to dynamic libraries importing static libraries.
        // Since it's usually caused by swift code, not C code where the annotations can be changed, just ignore it.
        // Maybe some day the swift-on-windows toolchain won't generate these
        args.append(contentsOf: ["-Xlinker", "/IGNORE:4217"])
        #endif

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

    func dylibName(for lib: String) -> String {
        switch self {
        case .wasm:
            fatalError("dynamic linking is currently unsupported in wasm")
        case .kotlinAndroid:
            return "lib\(lib).so"
        case .node, .kotlinSystem, .cSharp, .dart:
            #if os(macOS)
            return "lib\(lib).dylib"
            #elseif os(Linux)
            return "lib\(lib).so"
            #elseif os(Windows)
            return "\(lib).dll"
            #else
            fatalError("unknown host OS")
            #endif
        }
    }

    func dylibPath(for lib: String, configuration: BuildConfiguration) throws -> String {
        try buildDir(configuration) + "/" + dylibName(for: lib)
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
        case .wasm, .node:
            return "bindings/ts/generated/packages/\(platform)"
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
        case .kotlinAndroid(let arch): return "bindings/kotlin/generated/src/main/resources/lib/\(arch.ndkName)"
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
        if isNative, configuration.fat {
            return "\(configuration.scratchPath)/apple/\(configuration.debug ? "debug" : "release")"
        } else if case .kotlinAndroid(let arch) = self {
            return "\(configuration.scratchPath)/android-build/\(arch.triple)/\(configuration.debug ? "debug" : "release")"
        } else {
            return try swiftBuild("--show-bin-path", configuration: configuration).runString().trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }

    func extraLibPathDir() -> String {
        return ".build/lib"
    }
}

import Foundation
import swsh

let wasmToolchain = "/Library/Developer/Toolchains/swift-wasm-5.9-SNAPSHOT-2023-08-06-a.xctoolchain"

struct BuildConfiguration: Hashable {
    let packagePath: String?
    let scratchPath: String?
    let debug: Bool
    let fat: Bool
    let codeCoverage: Bool
    var baseDockerContext: Lazy<DockerContext?>
    var extraEnvVars: [String: String]
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
            "/swift-android-\(self)"
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

    func build(product: String? = nil, libs: [String] = [], configuration: BuildConfiguration) throws {
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

            try swiftBuild(arguments: buildArguments + ["--triple", "arm64-apple-macosx"], configuration: configuration).run()
            try swiftBuild(arguments: buildArguments + ["--triple", "x86_64-apple-macosx"], configuration: configuration).run()

            for lib in libs {
                let libName = "lib\(lib).dylib"
                try cmd(
                    "lipo", "-create",
                    "-output", "\(buildDir(configuration))/\(libName)",
                    ".build/arm64-apple-macosx/\(confName)/\(libName)",
                    ".build/x86_64-apple-macosx/\(confName)/\(libName)"
                ).run()
            }
        } else {
            try swiftBuild(arguments: buildArguments, configuration: configuration).run()
        }
    }

    func swiftBuild(arguments: [String], configuration: BuildConfiguration) -> Command {
        var args = arguments
        args.append(contentsOf: ["--configuration", configuration.debug ? "debug" : "release"])
        if let packagePath = configuration.packagePath {
            args.append(contentsOf: ["--package-path", packagePath])
        }
        if configuration.codeCoverage {
            args.append(contentsOf: Platform.coverageFlags)
        }
        let swiftBuild: [String]
        var env: [String: String] = [
            "SWIFT_PACKAGE_FORCE_DYNAMIC": "1",
            "FISHYJOES_TARGET_PLATFORM": "\(self)",
        ].merging(configuration.extraEnvVars) { $1 }
        var scratchPath = configuration.scratchPath
        switch self {
        case .wasm:
            swiftBuild = ["\(wasmToolchain)/usr/bin/swift-build"]
            args.append(contentsOf: ["--triple", "wasm32-unknown-wasi"])
            // custom build paths to avoid different versions of spm destroying each other's caches
            args.append(contentsOf: ["--build-path", "./.build/wasm-build"])

            // TODO: see https://blog.swiftwasm.org/posts/5-6-released/
            // args.append(contentsOf: ["-Xswiftc", "-Xclang-linker", "-Xswiftc", "-mexec-model=reactor"])

            env = ["WASM_ONLY": "1"]
        case .node, .kotlinSystem, .dart:
            #if os(macOS)
            swiftBuild = [Platform.nativeMacSwiftBuild]
            args.append(contentsOf: ["-Xlinker", "-rpath", "-Xlinker", "@loader_path"])
            #elseif os(Linux)
            swiftBuild = ["swift", "build"]
            #else
            fatalError("unknown host OS")
            #endif
        case let .kotlinAndroid(arch):
            swiftBuild = ["swift-build"]
            scratchPath = (scratchPath ?? ".build") + "/android-build"
            args.append(
                contentsOf: [
                    "--destination", "\(arch.toolchainPath)/usr/swiftpm-android-\(arch).json",
                ]
            )
            env["ANDROID_COMPATIBLE_ONLY"] = "1"

            guard var dockerContext = configuration.baseDockerContext.get() else {
                Log.warn("WARNING: building for android without using a docker context (expecting to already be inside container)")
                break
            }
            dockerContext.env.merge(env) { $1 }
            return dockerContext.cmd("swift-build", arguments: args)

        case .cSharp:
            #if os(macOS)
            swiftBuild = [Platform.nativeMacSwiftBuild]
            // This seems to be needed because of https://github.com/mono/mono/issues/21049
            args.append(contentsOf: ["-Xlinker", "-rpath", "-Xlinker", "@loader_path"])
            #elseif os(Linux)
            path = "swift"
            args = ["build"] + args
            #endif
        }
        if let scratchPath = scratchPath {
            args = ["--scratch-path", scratchPath] + args
        }

        let path = swiftBuild[0]
        args = swiftBuild.dropFirst() + args
        Log.info("swiftBuild addEnv = \(env)")
        return cmd(path, arguments: args, addEnv: env)
    }

    func swiftBuild(_ arguments: String..., configuration: BuildConfiguration) -> Command {
        swiftBuild(arguments: arguments, configuration: configuration)
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
        case .cSharp:
            #if os(macOS)
            return "c-sharp-macos"
            #elseif os(Windows)
            return "c-sharp-windows"
            #elseif os(Linux)
            return "c-sharp-ubuntu"
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

    private static var buildDirCache: [BuildConfiguration: [Platform: String]] = [:]
    func buildDir(_ configuration: BuildConfiguration) throws -> String {
        if let cached = Platform.buildDirCache[configuration]?[self] {
            return cached
        }
        let directory: String
        let packagePrefix = configuration.packagePath.map { $0 + "/" } ?? ""
        if isNative, configuration.fat {
            directory = "\(packagePrefix).build/apple/\(configuration.debug ? "debug" : "release")"
        } else if case .kotlinAndroid(let arch) = self {
            directory = "\(packagePrefix).build/android-build/\(arch.triple)/\(configuration.debug ? "debug" : "release")"
        } else {
            directory = try swiftBuild("--show-bin-path", configuration: configuration).runString()
        }
        Platform.buildDirCache[configuration, default: [:]][self] = directory
        return directory
    }
}

import Foundation
import swsh

let wasmToolchain = "/Library/Developer/Toolchains/swift-wasm-5.7.1-RELEASE.xctoolchain"

struct BuildConfiguration {
    let debug: Bool
    let fat: Bool
    let codeCoverage: Bool
    var baseDockerContext: Lazy<DockerContext?>
}

enum Platform: Hashable {
    case wasm
    case node
    case cpp
    case kotlinSystem
    case kotlinAndroid(AndroidArchitecture)
    case cSharp

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
        case .node, .cpp, .kotlinSystem, .cSharp:
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
        if isNative, configuration.fat {
            guard let product = product else {
                fatalError("Can't infer products in fat builds")
            }
            try cmd("mkdir", "-p", buildDir(configuration)).run()
            let confName = configuration.debug ? "debug" : "release"

            try swiftBuild("--product", product, "--triple", "arm64-apple-macosx", configuration: configuration).run()
            try swiftBuild("--product", product, "--triple", "x86_64-apple-macosx", configuration: configuration).run()

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
            try swiftBuild(arguments: product.map { ["--product", $0] } ?? [], configuration: configuration).run()
        }
    }

    func swiftBuild(arguments: [String], configuration: BuildConfiguration) -> Command {
        var args = arguments
        args.append(contentsOf: ["--configuration", configuration.debug ? "debug" : "release"])
        if configuration.codeCoverage {
            args.append(contentsOf: Platform.coverageFlags)
        }
        let path: String
        var env: [String: String] = [
            "SWIFT_PACKAGE_FORCE_DYNAMIC": "1",
            "FISHYJOES_TARGET_PLATFORM": "\(self)",
        ]
        switch self {
        case .wasm:
            path = "\(wasmToolchain)/usr/bin/swift-build"
            args.append(contentsOf: ["--triple", "wasm32-unknown-wasi"])
            // custom build paths to avoid different versions of spm destroying each other's caches
            args.append(contentsOf: ["--build-path", "./.build/wasm-build"])

            // TODO: see https://blog.swiftwasm.org/posts/5-6-released/
            // args.append(contentsOf: ["-Xswiftc", "-Xclang-linker", "-Xswiftc", "-mexec-model=reactor"])

            env = ["WASM_ONLY": "1"]
        case .node, .kotlinSystem:
            #if os(macOS)
            path = Platform.nativeMacSwiftBuild
            args.append(contentsOf: ["-Xlinker", "-rpath", "-Xlinker", "@loader_path"])
            #elseif os(Linux)
            path = "swift"
            args = ["build"] + args
            #else
            fatalError("unknown host OS")
            #endif
        case let .kotlinAndroid(arch):
            path = "swift-build"
            args.append(
                contentsOf: [
                    "--scratch-path", "./.build/android-build",
                    "--destination", "\(arch.toolchainPath)/usr/swiftpm-android-\(arch).json",
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
            if configuration.fat {
                args.append(contentsOf: ["--arch", "arm64", "--arch", "x86_64"])
            }
            #elseif os(Linux)
            path = "swift"
            args = ["build"] + args
            #endif
        case .cpp:
            #if os(macOS)
            path = Platform.nativeMacSwiftBuild
            args.append(contentsOf: ["-Xlinker", "-rpath", "-Xlinker", "@loader_path"])
            if configuration.fat {
                args.append(contentsOf: ["--arch", "arm64", "--arch", "x86_64"])
            }
            #elseif os(Linux)
            path = "swift"
            args = ["build", "-Xswiftc", "-static-stdlib"] + args
            #else
            fatalError("unknown host OS")
            #endif
        }
        return cmd(path, arguments: args, addEnv: env)
    }

    func swiftBuild(_ arguments: String..., configuration: BuildConfiguration) -> Command {
        swiftBuild(arguments: arguments, configuration: configuration)
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
        case .cpp: return "cpp"
        }
    }

    func outputDir(_ config: FishyJoesConfig) -> String {
        switch self {
        case .wasm, .node: return "output/\(platform)"
        case .kotlinSystem:
            #if os(macOS)
            return "kotlin/src/generated/resources/mac"
            #elseif os(Linux)
            return "kotlin/src/generated/resources/linux"
            #elseif os(Windows)
            return "kotlin/src/generated/resources/windows"
            #else
            fatalError("unknown host OS")
            #endif
        case .kotlinAndroid(let arch): return "kotlin/src/generated/resources/lib/\(arch.ndkName)"
        case .cSharp:
            #if os(macOS)
            return "c-sharp/Cricut.\(config.module)/runtimes/osx/native"
            #elseif os(Linux)
            return "c-sharp/Cricut.\(config.module)/runtimes/linux/native"
            #elseif os(Windows)
            return "c-sharp/Cricut.\(config.module)/runtimes/win/native"
            #else
            fatalError("unknown host OS")
            #endif
        case .cpp: return "cpp/generated/lib/"
        }
    }

    func packageDescription(config: FishyJoesConfig) -> String {
        switch self {
        case .wasm: return "\(config.module) packaged as a typescript library using WebAssembly"
        case .node: return "\(platform) <-> node/ts bindings for \(config.module)"
        case .cpp: return "\(config.module) C++ bingings"
        case .kotlinSystem, .kotlinAndroid: return "A JNI wrapper for \(config.module)"
        case .cSharp: return "A C# wrapper for \(config.module)"
        }
    }

    func buildDir(_ configuration: BuildConfiguration) throws -> String {
        if isNative, configuration.fat {
            return ".build/apple/\(configuration.debug ? "debug" : "release")"
        } else if case .kotlinAndroid(let arch) = self {
            return ".build/android-build/\(arch.triple)/\(configuration.debug ? "debug" : "release")"
        } else {
            return try swiftBuild("--show-bin-path", configuration: configuration).runString()
        }
    }

    var isTs: Bool {
        self == .wasm || self == .node
    }
}

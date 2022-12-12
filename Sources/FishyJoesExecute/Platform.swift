import Foundation
import swsh

let wasmToolchain = "/Library/Developer/Toolchains/swift-wasm-5.6.0-RELEASE.xctoolchain"
let androidToolchain = "/Library/Developer/Toolchains/swift-android-toolchain"

struct BuildConfiguration {
    let debug: Bool
    let fat: Bool
    let codeCoverage: Bool
}

enum Platform: Hashable {
    case wasm
    case node
    case cpp
    case kotlinSystem
    case kotlinAndroid(AndroidArchitecture)
    case cSharp

    static let nativeMacSwiftBuild = try! cmd("xcrun", "-f", "swift-build").runString()

    // swift 5.7 no longer recognizes "--enable-code-coverage" outside of the "test" command
    static let coverageFlags = [
        "-Xswiftc", "-profile-coverage-mapping",
        "-Xswiftc", "-profile-generate",
    ]

    func build(product: String? = nil, configuration: BuildConfiguration) throws {
        let extraArgs = product.map { ["--product", $0] } ?? []
        if configuration.fat {
            precondition(product != nil, "Can't infer products in fat builds")
            try swiftBuild(arguments: extraArgs + ["--triple", "arm64-apple-macosx"], configuration: configuration).run()
            try swiftBuild(arguments: extraArgs + ["--triple", "x86_64-apple-macosx"], configuration: configuration).run()
            let confName = configuration.debug ? "debug" : "release"
            let libName = "lib\(product!).dylib"
            try cmd("mkdir", "-p", buildDir(configuration)).run()
            try cmd(
                "lipo", "-create",
                "-output", "\(buildDir(configuration))/\(libName)",
                ".build/arm64-apple-macosx/\(confName)/\(libName)",
                ".build/x86_64-apple-macosx/\(confName)/\(libName)"
            ).run()

        } else {
            try swiftBuild(arguments: extraArgs, configuration: configuration).run()
        }
    }

    func swiftBuild(arguments: [String], configuration: BuildConfiguration) -> Command {
        var args = arguments
        args.append(contentsOf: ["--configuration", configuration.debug ? "debug" : "release"])
        if configuration.codeCoverage {
            args.append(contentsOf: Platform.coverageFlags)
        }
        let path: String
        var env: [String: String] = ["SWIFT_PACKAGE_FORCE_DYNAMIC": "1"]
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
        case .kotlinAndroid(.arm):
            path = "\(androidToolchain)/usr/bin/swift-build-arm-linux-androideabi"
            env["ANDROID_COMPATIBLE_ONLY"] = "1"
            args.append(
                contentsOf: [
                    "--build-path", "./.build/android-build",
                ]
            )
        case let .kotlinAndroid(arch):
            path = "\(androidToolchain)/usr/bin/swift-build-\(arch.rawValue)-linux-android"
            env["ANDROID_COMPATIBLE_ONLY"] = "1"
            args.append(
                contentsOf: [
                    "--build-path", "./.build/android-build",
                ]
            )
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
        if configuration.fat {
            return ".build/apple/\(configuration.debug ? "debug" : "release")"
        } else {
            return try swiftBuild("--show-bin-path", configuration: configuration).runString()
        }
    }

    var isTs: Bool {
        self == .wasm || self == .node
    }
}

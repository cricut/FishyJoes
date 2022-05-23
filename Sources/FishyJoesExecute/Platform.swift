import swsh

let wasmToolchain = "/Library/Developer/Toolchains/swift-wasm-5.6.0-RELEASE.xctoolchain"
let androidToolchain = "/Library/Developer/Toolchains/swift-android-toolchain"

enum Platform: Hashable {
    case wasm
    case node
    case cpp
    case kotlinSystem
    case kotlinAndroid(AndroidArchitecture)
    case cSharp

    static let nativeMacSwiftBuild = try! cmd("xcrun", "-f", "swift-build").runString()

    func swiftBuild(arguments: [String], debug: Bool) throws {
        var args = arguments
        args.append(contentsOf: ["--configuration", debug ? "debug" : "release"])
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
            #elseif os(Linux)
            path = "swift"
            args = ["build", "-Xswiftc", "-static-stdlib"] + args
            #endif
        case .cpp:
            #if os(macOS)
            path = Platform.nativeMacSwiftBuild
            #elseif os(Linux)
            path = "swift"
            args = ["build", "-Xswiftc", "-static-stdlib"] + args
            #else
            fatalError("unknown host OS")
            #endif
        }
        try cmd(path, arguments: args, addEnv: env).run()
    }

    func swiftBuild(_ arguments: String..., debug: Bool) throws {
        try swiftBuild(arguments: arguments, debug: debug)
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
    var outputDir: String {
        switch self {
        case .wasm, .node, .cpp, .cSharp: return "output/\(platform)"
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
        case .cpp: return "\(config.module) C++ bingings"
        case .kotlinSystem, .kotlinAndroid: return "A JNI wrapper for \(config.module)"
        case .cSharp: return "A C# wrapper for \(config.module)"
        }
    }
    func buildDir(debug: Bool) -> String {
        let configuration = debug ? "debug" : "release"
        switch self {
        case .wasm: return ".build/wasm-build/wasm32-unknown-wasi/\(configuration)"
        case .node, .kotlinSystem:
            #if os(macOS)
            return ".build/x86_64-apple-macosx/\(configuration)"
            #elseif os(Linux)
            return ".build/x86_64-unknown-linux-gnu/\(configuration)"
            #else
            fatalError("unknown host OS")
            #endif
        case .kotlinAndroid(let arch):
            return ".build/android-build/\(arch.triple)/\(configuration)"
        case .cSharp:
            var cSharpPlatformBuildDirectory: String {
                #if os(macOS)
                return "c-sharp-macos"
                #elseif os(Windows)
                return "c-sharp-windows"
                #elseif os(Linux)
                return "c-sharp-ubuntu"
                #else
                fatalError("unknown host OS")
                #endif
            }
            return ".build/\(cSharpPlatformBuildDirectory)/\(configuration)"
        case .cpp:
            #if os(macOS)
            #if arch(x86_64)
            return ".build/cpp-build/x86_64-apple-macosx/release"
            #elseif arch(arm64)
            return ".build/cpp-build/arm64-apple-macosx/release"
            #else
            fatalError("unknown mac arch")
            #endif
            #elseif os(Linux)
            return ".build/cpp-build/x86_64-unknown-linux-gnu/release"
            #else
            fatalError("unknown host OS")
            #endif
        }
    }
    var isTs: Bool {
        self == .wasm || self == .node
    }
}

import ArgumentParser
import Foundation
import swsh
import ToolchainConfig

struct InstallSystemDependencies: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "install-system-dependencies",
        abstract: "Script to install FishyJoes' system dependencies",
        aliases: ["install-toolchains"]
    )
    struct Error: Swift.Error {}

    enum Component: String, CaseIterable, ExpressibleByArgument {
        case swiftly
        case swiftWasm = "swift-wasm"
        case swiftAndroid = "swift-android"
        case yq
        case mint
        case wasmOpt = "wasm-opt"

        // TODO: Possible future dependencies that could be added. Not sure which are a good idea.
        // case node
        // case cSharp
        // case dart, flutter
        // case java
        // case androidNDK
        // case zsh

        // Compound components
        case forGeneration = "for-generation"
        case forWasm = "for-wasm"
        case forAndroid = "for-android"
        case all

        var coreComponents: Set<CoreComponent> {
            switch self {
            case .swiftly: return [.swiftly]
            case .swiftWasm: return [.swiftWasm]
            case .swiftAndroid: return [.swiftAndroid]
            case .yq: return [.yq]
            case .mint: return [.mint]
            case .wasmOpt: return [.wasmOpt]
            case .forGeneration: return [.yq, .mint]
            case .forWasm: return [.swiftly, .swiftWasm, .wasmOpt]
            case .forAndroid: return [.swiftly, .swiftAndroid]
            case .all: return Set(CoreComponent.allCases)
            }
        }
    }

    /// A description
    enum CoreComponent: String, Comparable, CaseIterable {
        case swiftly, swiftWasm, swiftAndroid, yq, mint, wasmOpt

        static func < (lhs: Self, rhs: Self) -> Bool {
            // Not the most efficient, but fine for this use case
            allCases.firstIndex(of: lhs)! < allCases.firstIndex(of: rhs)!
        }
    }

    @Argument(
        help: """
            Component(s) to install if not present

            Core components:
             - swiftly
             - swift-wasm
             - swift-android
             - yq
             - mint
             - wasm-opt

            Component bundles:
             - for-generation: [yq, mint]
             - for-wasm: [swiftly, swift-wasm, wasm-opt]
             - for-android: [swiftly, swift-android]
             - all

            """
    )
    var components: [Component] = []

    @Flag(name: .long, inversion: .prefixedNo, help: "Attempt to modify the profile file to set environment variables (e.g. PATH) on login.")
    var modifyProfile = false

    @Flag(name: .long, help: "Don't try to check if a tool is already installed, attempt install always")
    var force = false

    func run() throws {
        swsh.ExternalCommand.verbose = true

        let requestedComponents = Set(components.flatMap(\.coreComponents))
        if requestedComponents.isEmpty {
            Log.error("Expected at least one component")
            throw Error()
        }
        let needsInstall = Set(requestedComponents.filter { !$0.checkIfInstalled() || force })

        Log.info("")
        Log.info("=== Components ===")
        for component in CoreComponent.allCases {
            // TODO: make this visually prettier
            if needsInstall.contains(component) {
                Log.info("WILL INSTALL \(component)")
            } else if requestedComponents.contains(component) {
                Log.info("ALREADY INSTALLED \(component)")
            } else {
                Log.info("NOT REQUESTED \(component)")
            }
        }
        Log.info("==================")
        Log.info("")

        for component in needsInstall.sorted() {
            try component.install(modifyProfile: modifyProfile)
        }

        Log.info("All components successfully installed")
    }
}

extension InstallSystemDependencies.CoreComponent {
    func checkIfInstalled() -> Bool {
        Log.info("Checking for \(self)")
        switch self {
        case .swiftly:
            return Swiftly.swiftly("--version").runBool()
        case .swiftWasm:
            let toolchain = ToolVersions.shared.swiftWasm.toolchain
            let sdk = ToolVersions.shared.swiftWasm.sdk
            let triple = ToolVersions.shared.swiftWasm.triple

            return Swiftly.run(
                toolchain: toolchain,
                "swift", "sdk", "configure", "--show-configuration",
                "\(sdk)-\(triple)",
                triple
            )
                .output(overwritingFile: FileManager.nullDevicePath)
                .runBool()
        case .swiftAndroid:
            let toolchain = ToolVersions.shared.swiftAndroid.toolchain
            let sdk = ToolVersions.shared.swiftAndroid.sdk
            let triple = ToolVersions.shared.swiftAndroid.targets[0].triple

            return Swiftly.run(
                toolchain: toolchain,
                "swift", "sdk", "configure", "--show-configuration",
                "swift-\(sdk)",
                triple
            )
                .output(overwritingFile: FileManager.nullDevicePath)
                .runBool()
        case .yq:
            return cmd("yq", "--version").runBool()
        case .mint:
            return cmd("mint", "--version").runBool()
        case .wasmOpt:
            return cmd("wasm-opt", "--version").runBool()
        }
    }

    func install(modifyProfile: Bool) throws {
        Log.info("Installing \(self)")

        switch self {
        case .swiftly:
            Log.info("Installing swiftly for current user")
            let tempDir = try cmd("mktemp", "-d").runString()
            defer { try? cmd("rm", "-rf", tempDir).run() }
            let swiftlyBootstrapPath: String

            #if os(macOS)
            let pkgPath = "\(tempDir)/swiftly.pkg"
            try cmd("curl", "-o", pkgPath, "https://download.swift.org/swiftly/darwin/swiftly.pkg").run()
            try cmd("installer", "-pkg", pkgPath, "-target", "CurrentUserHomeDirectory", "-verbose").run()
            swiftlyBootstrapPath = "\(Swiftly.binPath)/swiftly"

            #elseif os(Linux)
            let tarballPath = "\(tempDir)/swiftly.tgz"
            let uname = try cmd("uname", "-m").runString()
            try cmd("curl", "-o", tarballPath, "https://download.swift.org/swiftly/linux/swiftly-\(uname).tar.gz").run()
            try cmd("tar", "-xzf", tarballPath, "-C", tempDir).run()
            swiftlyBootstrapPath = "\(tempDir)/swiftly"

            #else
            Log.error("Swiftly install is currently only supported on mac and linux")
            throw InstallSystemDependencies.Error()

            #endif
            try cmd(swiftlyBootstrapPath,
                    arguments: [
                        "init",
                        "--assume-yes",
                        "--skip-install",
                    ] + (modifyProfile ? [] : ["--no-modify-profile"])
            ).run()

        case .swiftWasm:
            let toolchain = ToolVersions.shared.swiftWasm.toolchain
            let sdk = ToolVersions.shared.swiftWasm.sdk
            let triple = ToolVersions.shared.swiftWasm.triple

            Log.info("Installing swift-wasm toolchain \(toolchain)")
            try Swiftly.swiftly("install", "--assume-yes", toolchain).run()

            let sdkInstalled = Swiftly.run(
                toolchain: toolchain,
                "swift", "sdk", "configure", "--show-configuration",
                "\(sdk)-\(triple)",
                triple
            )
                .output(overwritingFile: FileManager.nullDevicePath)
                .runBool()

            if sdkInstalled {
                Log.info("swift-wasm \(sdk) already installed")
            } else {
                Log.info("Installing swift-wasm sdk \(sdk)")
                try Swiftly.run(
                    toolchain: toolchain, "swift", "sdk", "install",
                    ToolVersions.shared.swiftWasm.sdkURL,
                    "--checksum", ToolVersions.shared.swiftWasm.sdkChecksum
                ).run()
            }

        case .swiftAndroid:
            let toolchain = ToolVersions.shared.swiftAndroid.toolchain
            let sdk = ToolVersions.shared.swiftAndroid.sdk
            let triple = ToolVersions.shared.swiftAndroid.targets[0].triple

            Log.info("Installing swift-android toolchain \(toolchain)")
            try Swiftly.swiftly("install", "--assume-yes", toolchain).run()

            let sdkInstalled = Swiftly.run(
                toolchain: toolchain,
                "swift", "sdk", "configure", "--show-configuration",
                "swift-\(sdk)",
                triple
            )
                .output(overwritingFile: FileManager.nullDevicePath)
                .runBool()

            if sdkInstalled {
                Log.info("swift-android \(sdk) already installed")
            } else {
                Log.info("Installing swift-android sdk \(sdk)")
                try Swiftly.run(
                    toolchain: toolchain, "swift", "sdk", "install",
                    ToolVersions.shared.swiftAndroid.sdkURL,
                    "--checksum", ToolVersions.shared.swiftAndroid.sdkChecksum
                ).run()
            }

            if ProcessInfo.processInfo.environment["ANDROID_NDK_HOME"] != nil {
                let spmDir: String =
                    ProcessInfo.processInfo.environment["XDG_CONFIG_HOME"].map { "\($0)/swiftpm" } ??
                    ("~/.swiftpm" as NSString).expandingTildeInPath

                Log.info("Linking android NDK to swift SDK")
                try cmd("\(spmDir)/swift-sdks/swift-\(sdk).artifactbundle/swift-android/scripts/setup-android-sdk.sh").run()
            } else {
                Log.warn("ANDROID_NDK_HOME is unset, skipping linking of NDK. Android compilation may not work.")
                Log.warn("running 'sdkmanager --list_installed --verbose' may have the path")
            }

        case .yq:
            #if os(macOS)
            try cmd("brew", "install", "yq").run()

            #elseif os(Linux)
            try cmd("apt-get", "install", "yq").run()

            #else
            Log.error("Don't know how to install yq on this platform")
            throw InstallSystemDependencies.Error()
            #endif

        case .mint:
            #if os(macOS)
            try cmd("brew", "install", "mint").run()

            #elseif os(Linux)
            let tempDir = try cmd("mktemp", "-d").runString()
            defer { try? cmd("rm", "-rf", tempDir).run() }
            try cmd("git", "clone", "--depth=1", "https://github.com/yonaskolb/Mint.git", "\(tempDir)/mint").run()
            try cmd("swift", "run", "--package-path=\(tempDir)/mint", "mint", "install", "yonaskolb/mint").run()

            #else
            Log.error("Installing mint not supported on this platform")
            throw InstallSystemDependencies.Error()
            #endif

        case .wasmOpt:
            #if os(macOS)
            try cmd("brew", "install", "binaryen").run()

            #elseif os(Linux)
            // Use wasm version of wasm-opt because ubuntu version can be very old
            try cmd("npm", "install", "-g", "binaryen").run()

            #else
            Log.error("Don't know how to install wasm-opt on this platform")
            throw InstallSystemDependencies.Error()
            #endif
        }
    }
}

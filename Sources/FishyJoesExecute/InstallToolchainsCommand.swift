import ArgumentParser
import FishyJoesConfig
import Foundation
import swsh

struct InstallToolchainsCommand: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "install-toolchains",
        abstract: "Script to install swiftly, swift, and swift toolchains"
    )
    struct Error: Swift.Error {}

    @Flag(name: .customLong("swiftly"), inversion: .prefixedNo, help: "install https://github.com/swiftlang/swiftly into the default location if not present")
    var installSwiftly = true

    @Flag(name: .customLong("wasm"), inversion: .prefixedNo, help: "install the swift wasm SDK and toolchain")
    var installWasm = true

    @Flag(name: .customLong("android"), inversion: .prefixedNo, help: "install the android SDK and toolchain")
    var installAndroid = true

    @Flag(name: .long, inversion: .prefixedNo, help: "Attempt to modify the profile file to set environment variables (e.g. PATH) on login.")
    var modifyProfile = false

    func run() throws {
        swsh.ExternalCommand.verbose = true

        if !Swiftly.swiftly("--version").runBool() {
            guard installSwiftly else {
                Log.error("swiftly not found, and install was not requested. Can't continue.")
                throw Error()
            }

            #if os(Windows)
            Log.error("wasm compilation is currently only supported on mac and linux")
            throw Error()
            #endif

            Log.info("Installing swiftly for current user")
            let tempDir = try cmd("mktemp", "-d").runString()
            defer { try? cmd("rm", "-rf", tempDir).run() }
            let swiftlyBootstrapPath: String
            #if os(macOS)
            let pkgPath = "\(tempDir)/swiftly.pkg"
            try cmd("curl", "-o", pkgPath, "https://download.swift.org/swiftly/darwin/swiftly.pkg").run()
            try cmd("installer", "-pkg", pkgPath, "-target", "CurrentUserHomeDirectory", "-verbose").run()
            swiftlyBootstrapPath = "\(Swiftly.binPath)/swiftly"
            #else
            let tarballPath = "\(tempDir)/swiftly.tgz"
            let uname = try cmd("uname", "-m").runString()
            try cmd("curl", "-o", tarballPath, "https://download.swift.org/swiftly/linux/swiftly-\(uname).tar.gz").run()
            try cmd("tar", "-xzf", tarballPath, "-C", tempDir).run()
            swiftlyBootstrapPath = "\(tempDir)/swiftly"
            #endif
            try cmd(swiftlyBootstrapPath,
                arguments: [
                    "init",
                    "--assume-yes",
                    "--skip-install",
                ] + (modifyProfile ? [] : ["--no-modify-profile"])
            ).run()
        }

        if installWasm {
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
                    "https://github.com/swiftwasm/swift/releases/download/swift-wasm-\(sdk)/swift-wasm-\(sdk)-\(triple).artifactbundle.zip",
                    "--checksum", ToolVersions.shared.swiftWasm.sdkChecksum
                ).run()
            }
        }

        if installAndroid {
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
                    "https://github.com/swift-android-sdk/swift-android-sdk/releases/download/\(toolchain)/swift-\(sdk).artifactbundle.tar.gz",
                    "--checksum", ToolVersions.shared.swiftAndroid.sdkChecksum
                ).run()
            }

            if ProcessInfo.processInfo.environment["ANDROID_NDK_HOME"] != nil {
                Log.info("Linking android NDK to swift SDK")
                try cmd(
                    "\(NSHomeDirectory())/.swiftpm/swift-sdks/swift-\(sdk).artifactbundle/swift-android/scripts/setup-android-sdk.sh"
                ).run()
            } else {
                Log.warn("ANDROID_NDK_HOME is unset, skipping linking of NDK. Android compilation may not work.")
                Log.warn("running 'sdkmanager --list_installed --verbose' may have the path")
            }
        }
    }
}

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
    static let mikeFarahYQVersion = "v4.53.2"

    struct Error: Swift.Error {}

    enum Component: String, CaseIterable, ExpressibleByArgument {
        case swiftly
        case swiftWasm = "swift-wasm"
        case swiftAndroid = "swift-android"
        case yq
        case mint
        case wasmOpt = "wasm-opt"
        case androidNDK = "android-ndk"

        // TODO: Possible future dependencies that could be added. Not sure which are a good idea.
        // case node
        // case cSharp
        // case dart, flutter
        // case java
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
            case .androidNDK: return [.androidNDK]
            case .forGeneration: return [.yq, .mint]
            case .forWasm: return [.swiftly, .swiftWasm, .wasmOpt]
            case .forAndroid: return [.swiftly, .swiftAndroid, .androidNDK]
            case .all: return Set(CoreComponent.allCases)
            }
        }
    }

    enum CoreComponent: String, Comparable, CaseIterable {
        // Ordered by install order (if it matters)
        case androidNDK, swiftly, swiftWasm, swiftAndroid, yq, mint, wasmOpt

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
             - android-ndk

            Component bundles:
             - for-generation: [yq, mint]
             - for-wasm: [swiftly, swift-wasm, wasm-opt]
             - for-android: [swiftly, swift-android, android-ndk]
             - all

            """
    )
    var components: [Component] = []

    @Flag(name: .long, inversion: .prefixedNo, help: "Attempt to modify the profile file to set environment variables (e.g. PATH) on login.")
    var modifyProfile = false

    @Flag(name: .long, help: "Don't try to check if a tool is already installed, attempt install always")
    var force = false

    @Flag(name: .long, help: "Use sudo when installing android NDK")
    var useSudoForNDK = false

    func run() throws {
        swsh.ExternalCommand.verbose = true

        let requestedComponents = Set(components.flatMap(\.coreComponents))
        if requestedComponents.isEmpty {
            Log.error("Expected at least one component")
            throw Error()
        }
        let needsInstall = Set(requestedComponents.filter { !checkIfInstalled($0) || force })

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
            try install(component)
        }

        Log.info("All components successfully installed")
    }

    func checkIfInstalled(_ component: CoreComponent) -> Bool {
        Log.info("Checking for \(component)")
        switch component {
        case .androidNDK:
            guard let sdkRoot = ProcessInfo.processInfo.environment["ANDROID_SDK_ROOT"] else {
                Log.info("ANDROID_SDK_ROOT not set, unable to determine if NDK is already installed. Assuming not.")
                return false
            }
            return cmd("test", "-d", "\(sdkRoot)/ndk/\(ToolVersions.shared.swiftAndroid.ndkVersion!)").runBool()
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
            return checkIfMikeFarahYQInstalled()
        case .mint:
            return cmd("mint", "--version").runBool()
        case .wasmOpt:
            return cmd("wasm-opt", "--version").runBool()
        }
    }

    func install(_ component: CoreComponent) throws {
        Log.info("Installing \(component)")

        switch component {
        case .androidNDK:
            let packageName = "ndk;\(ToolVersions.shared.swiftAndroid.ndkVersion!)"
            if useSudoForNDK {
                try cmd("sudo", "sdkmanager", "--install", packageName).run()
            } else {
                try cmd("sdkmanager", "--install", packageName).run()
            }

        case .swiftly:
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

            if sdkInstalled && !force {
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
            let ndkVersion = ToolVersions.shared.swiftAndroid.ndkVersion!
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

            if sdkInstalled && !force {
                Log.info("swift-android \(sdk) already installed")
            } else {
                Log.info("Installing swift-android sdk \(sdk)")
                try Swiftly.run(
                    toolchain: toolchain, "swift", "sdk", "install",
                    ToolVersions.shared.swiftAndroid.sdkURL,
                    "--checksum", ToolVersions.shared.swiftAndroid.sdkChecksum
                ).run()
            }

            var androidNDKHome = ProcessInfo.processInfo.environment["ANDROID_NDK_HOME"]
            if androidNDKHome == nil {
                if let sdkRoot = ProcessInfo.processInfo.environment["ANDROID_SDK_ROOT"] {
                    let ndkPath = "\(sdkRoot)/ndk/\(ndkVersion)"
                    let ndkExists = cmd("test", "-d", ndkPath).runBool()
                    if ndkExists {
                        androidNDKHome = ndkPath
                    }
                }
            }
            if let androidNDKHome = androidNDKHome {
                let spmDir: String =
                    ProcessInfo.processInfo.environment["XDG_CONFIG_HOME"].map { "\($0)/swiftpm" } ??
                    ("~/.swiftpm" as NSString).expandingTildeInPath

                Log.info("Linking android NDK to swift SDK")
                try cmd(
                    "\(spmDir)/swift-sdks/swift-\(sdk).artifactbundle/swift-android/scripts/setup-android-sdk.sh",
                    addEnv: ["ANDROID_NDK_HOME": androidNDKHome]
                ).run()
            } else {
                Log.warn("Unable to find NDK \(ndkVersion).")
                Log.warn("Swift toolchain may not work properly.")
                Log.warn("Install ndk and make sure ANDROID_SDK_ROOT and/or ANDROID_NDK_HOME is set.")
            }

        case .yq:
            #if os(macOS)
            try cmd("brew", "install", "yq").run()

            #elseif os(Linux)
            try installMikeFarahYQOnLinux()

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

    func checkIfMikeFarahYQInstalled() -> Bool {
        guard let version = try? cmd("yq", "--version").runString() else {
            return false
        }
        return version.contains("github.com/mikefarah/yq") && version.contains(" version v4.")
    }

    func installMikeFarahYQOnLinux() throws {
        let uname = try cmd("uname", "-m").runString().trimmed()
        let arch: String
        switch uname {
        case "x86_64", "amd64":
            arch = "amd64"
        case "aarch64", "arm64":
            arch = "arm64"
        default:
            Log.error("Don't know which Mike Farah yq Linux binary to install for architecture \(uname)")
            throw InstallSystemDependencies.Error()
        }

        let assetName = "yq_linux_\(arch)"
        let releaseURL = "https://github.com/mikefarah/yq/releases/download/\(Self.mikeFarahYQVersion)"
        let tempDir = try cmd("mktemp", "-d").runString().trimmed()
        defer { try? cmd("rm", "-rf", tempDir).run() }

        let binaryPath = "\(tempDir)/\(assetName)"
        let checksumsPath = "\(tempDir)/checksums"
        try cmd("curl", "-fsSL", "-o", binaryPath, "\(releaseURL)/\(assetName)").run()
        try cmd("curl", "-fsSL", "-o", checksumsPath, "\(releaseURL)/checksums").run()

        let checksums = try String(contentsOfFile: checksumsPath, encoding: .utf8)
        guard let expectedChecksum = Self.expectedChecksum(for: assetName, in: checksums) else {
            Log.error("Could not locate checksum for \(assetName) in Mike Farah yq \(Self.mikeFarahYQVersion) checksums")
            throw InstallSystemDependencies.Error()
        }

        let actualChecksum = try cmd("sha256sum", binaryPath).runString()
            .split { $0 == " " || $0 == "\t" }
            .first
            .map(String.init)
        guard actualChecksum == expectedChecksum else {
            Log.error("Checksum mismatch for \(assetName)")
            Log.error("Expected \(expectedChecksum), got \(actualChecksum ?? "<missing>")")
            throw InstallSystemDependencies.Error()
        }

        try cmd("install", "-m", "0755", binaryPath, "/usr/local/bin/yq").run()
        guard checkIfMikeFarahYQInstalled() else {
            Log.error("Installed yq did not report a Mike Farah yq v4 version")
            throw InstallSystemDependencies.Error()
        }
    }

    static func expectedChecksum(for assetName: String, in checksums: String) -> String? {
        for rawLine in checksums.split(whereSeparator: \.isNewline) {
            let line = String(rawLine).trimmed()
            if let checksum = checksumFromBSDLine(line, assetName: assetName) {
                return checksum
            }

            let fields = line.split { $0 == " " || $0 == "\t" }.map(String.init)
            guard fields.count >= 2, let fileName = fields.last else {
                continue
            }
            guard checksumFileName(fileName, matches: assetName) else {
                continue
            }
            if let checksum = fields.first(where: isSHA256Checksum) {
                return checksum
            }
        }
        return nil
    }

    private static func checksumFromBSDLine(_ line: String, assetName: String) -> String? {
        guard line.hasPrefix("SHA256"),
              let openParen = line.firstIndex(of: "("),
              let closeParen = line.firstIndex(of: ")"),
              openParen < closeParen
        else {
            return nil
        }

        let fileNameStart = line.index(after: openParen)
        let fileName = String(line[fileNameStart..<closeParen])
        guard checksumFileName(fileName, matches: assetName) else {
            return nil
        }

        let suffixStart = line.index(after: closeParen)
        let suffix = String(line[suffixStart...]).trimmed()
        guard suffix.hasPrefix("=") else {
            return nil
        }
        let checksum = String(suffix.dropFirst()).trimmed()
        return isSHA256Checksum(String(checksum)) ? String(checksum) : nil
    }

    private static func checksumFileName(_ fileName: String, matches assetName: String) -> Bool {
        let normalized = fileName.trimmingCharacters(in: CharacterSet(charactersIn: "*"))
        return normalized == assetName || normalized.hasSuffix("/\(assetName)")
    }

    private static func isSHA256Checksum(_ value: String) -> Bool {
        value.count == 64 && value.allSatisfy { character in
            character.isNumber || ("a"..."f").contains(character) || ("A"..."F").contains(character)
        }
    }
}

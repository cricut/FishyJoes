import Foundation

/// A centralized place for versions of build tools. Sourced from tool-versions.json
public struct ToolVersions: Codable {
    public let swiftLinux: LinuxToolchain
    public let swiftWindows: WindowsToolchain
    public let swiftWasm: SDKVersion
    public let swiftAndroid: SDKVersion

    public struct LinuxToolchain: Codable {
        /// A release `name` from https://www.swift.org/api/v1/install/releases.json
        public let toolchain: String
    }

    public struct WindowsToolchain: Codable {
        /// A release `tag` from https://www.swift.org/api/v1/install/releases.json, lowercased
        public let branch: String

        /// A release `tag` from https://www.swift.org/api/v1/install/releases.json, without the `swift-` prefix
        public let build: String
    }

    public struct SDKVersion: Codable {
        /// The native component of the toolchain (from https://swift.org )
        public let toolchain: String

        /// The target-specific component of the swift toolchain
        ///  - For wasm: from https://github.com/swiftwasm/swift/releases
        ///  - For android: from https://www.swift.org/documentation/articles/swift-sdk-for-android-getting-started.html
        public let sdk: String

        public let sdkURL: String

        /// Checksum for SDK's artifactbundle (from same place as `sdk`)
        public let sdkChecksum: String

        // NDK version for android
        public let ndkVersion: String?

        // List of targets that the SDK contains
        public let targets: [Target]
    }

    public struct Target: Codable {
        // Triple name of target, as understood by swift's "--target" argument
        public let triple: String
        // If target is android, the name of the architecture that the NDK uses. Annoyingly different from the triple.
        // Unused for non-android
        public let ndkArchName: String?
    }
    public static let shared: ToolVersions = {
        let data = try! Data(contentsOf: Bundle.module.url(forResource: "tool-versions", withExtension: "json")!)
        return try! JSONDecoder().decode(ToolVersions.self, from: data)
    }()
}

extension ToolVersions.SDKVersion {
    public var triple: String {
        precondition(targets.count == 1, "no unique triple: \(targets.map(\.triple))")
        return targets[0].triple
    }
}

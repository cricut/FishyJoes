import Foundation

/// A centralized place for versions of build tools. Sourced from tool-versions.json
public struct ToolVersions: Codable {
    public let swiftWasm: SDKVersion
    public let swiftAndroid: SDKVersion
    public let linuxContainer: LinuxContainer

    public struct SDKVersion: Codable {
        /// The native component of the toolchain (from https://swift.org )
        public let toolchain: String

        /// The target-specific component of the swift toolchain
        ///  - For wasm: from https://github.com/swiftwasm/swift/releases
        ///  - For android: from https://github.com/swift-android-sdk/swift-android-sdk/releases
        public let sdk: String

        /// Checksum for SDK's artifactbundle (from same place as `sdk`)
        public let sdkChecksum: String

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

    public struct LinuxContainer: Codable {
        // Name of docker container to use when a swift-on-linux environment is needed (currently used in CI scripts)
        public let image: String
        public let version: String
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

extension ToolVersions.LinuxContainer {
    public var imageSpec: String {
        "\(image):\(version)"
    }
}

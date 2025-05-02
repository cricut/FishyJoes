import Foundation

/// A centralized place for versions of build tools. Sourced from tool-versions.json
public struct ToolVersions: Codable {
    public let swiftWasm: SwiftWasm
    public struct SwiftWasm: Codable {
        /// The native component of the swift-wasm toolchain (from https://swift.org )
        public let toolchain: String

        /// The wasm component of the swift-wasm toolchain (from https://github.com/swiftwasm/swift/releases )
        public let sdk: String
        /// Checksum for SDK's artifactbundle (from https://github.com/swiftwasm/swift/releases )
        public let sdkChecksum: String
    }

    public let linuxContainer: LinuxContainer
    public struct LinuxContainer: Codable {
        public let image: String
        public let version: String
    }

    public static let shared: ToolVersions = {
        let data = try! Data(contentsOf: Bundle.module.url(forResource: "tool-versions", withExtension: "json")!)
        return try! JSONDecoder().decode(ToolVersions.self, from: data)
    }()
}

extension ToolVersions.LinuxContainer {
    public var imageSpec: String {
        "\(image):\(version)"
    }
}

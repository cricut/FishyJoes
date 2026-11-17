// swift-tools-version:6.0

import PackageDescription
import Foundation

let forceDynamic = ProcessInfo.processInfo.environment["SWIFT_PACKAGE_FORCE_DYNAMIC"] == "1"

let package = Package(
    name: "EssentialsOnly",
    platforms: [.macOS(.v13), .iOS(.v15)],
    products: [
        .library(
            name: "EssentialsOnly",
            type: forceDynamic ? .dynamic : nil,
            targets: ["EssentialsOnly"]
        ),
    ],
    dependencies : [
        ProcessInfo.processInfo.environment["FISHYJOES"] == "1" ? .package(name: "FishyJoes", path: "../..") : nil,
    ].compactMap { $0 },
    targets: [
        .target(
            name: "EssentialsOnly",
            dependencies: []
        ),
    ],
    swiftLanguageModes: [.v5]
)

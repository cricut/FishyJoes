// swift-tools-version:5.7

import PackageDescription
import Foundation

let forceDynamic = ProcessInfo.processInfo.environment["SWIFT_PACKAGE_FORCE_DYNAMIC"] == "1"

let package = Package(
    name: "TestAPI",
    platforms: [.macOS(.v13), .iOS(.v15)],
    products: [
        .library(
            name: "TestAPI",
            type: forceDynamic ? .dynamic : nil,
            targets: ["TestAPI"]
        ),
    ],
    dependencies : [
        .package(name: "FishyJoes", path: "../.."),
    ],
    targets: [
        .target(
            name: "TestAPI",
            dependencies: []
        ),
    ]
)

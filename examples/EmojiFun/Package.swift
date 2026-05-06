// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let package = Package(
    name: "EmojiFun",
    products: [
        .library(
            name: "EmojiFun",
            type: ProcessInfo.processInfo.environment["SWIFT_PACKAGE_FORCE_DYNAMIC"] == "1" ? .dynamic : .static,
            targets: ["EmojiFun"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/cricut/FishyJoes", .upToNextMajor(from: "7.0.0")),
    ],
    targets: [
        .target(
            name: "EmojiFun"
        ),
        .testTarget(
            name: "EmojiFunTests",
            dependencies: ["EmojiFun"]
        ),
    ]
)

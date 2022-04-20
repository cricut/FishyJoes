// swift-tools-version:5.3

import PackageDescription
import Foundation

let forceDynamic = ProcessInfo.processInfo.environment["SWIFT_PACKAGE_FORCE_DYNAMIC"] == "1"

let package = Package(
    name: "TestAPI",
    products: [
        .library(
            name: "TestAPI",
            type: forceDynamic ? .dynamic : nil,
            targets: ["TestAPI"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TestAPI",
            dependencies: []
        ),
    ]
)

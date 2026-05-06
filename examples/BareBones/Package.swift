// swift-tools-version: 6.2

import PackageDescription
import Foundation

let package = Package(
    name: "BareBones",
    products: [
        .library(
            name: "BareBones",
            type: ProcessInfo.processInfo.environment["SWIFT_PACKAGE_FORCE_DYNAMIC"] == "1" ? .dynamic : .static,
            targets: ["BareBones"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/cricut/FishyJoes", .upToNextMajor(from: "7.0.0")),
    ],
    targets: [
        .target(
            name: "BareBones"
        )
    ]
)

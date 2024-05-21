// swift-tools-version:5.6

import Foundation
import PackageDescription

let package = Package(
    name: "Runtime-node-shim",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(
            name: "NodeNativeShim",
            type: .dynamic,
            targets: ["NodeNativeShim"]
        ),
    ],
    dependencies: [
        .package(
            name: "FishyJoesNodeRuntime",
            path: "../.."
        ),
    ],
    targets: [
        .target(
            name: "NodeNativeShim",
            dependencies: [
                .product(name: "FishyJoesNodeRuntime", package: "FishyJoesNodeRuntime"),
            ],
            path: "."
        ),
    ]
)

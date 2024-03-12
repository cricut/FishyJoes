// swift-tools-version:5.6

import Foundation
import PackageDescription

let package = Package(
    name: "Runtime-node-shim",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(
            name: "FishyJoesNodeRuntime_NodeNativeShim",
            type: .dynamic,
            targets: ["FishyJoesNodeRuntime_NodeNativeShim"]
        ),
    ],
    dependencies: [
        .package(
            name: "FishyJoesNodeRuntime",
            path: "../../.."
        ),
    ],
    targets: [
        .target(
            name: "FishyJoesNodeRuntime_NodeNativeShim",
            dependencies: [
                .product(name: "FishyJoesNodeRuntime", package: "FishyJoesNodeRuntime"),
            ],
            path: "."
        ),
    ]
)

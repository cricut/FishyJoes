// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "TestAPI-node-shim",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(
            name: "TestAPI-node-shim",
            type: .dynamic,
            targets: ["TestAPI_NodeNativeShim"]
        ),
    ],
    dependencies: [
        .package(
            name: "TestAPI-bindings",
            path: "../../.."
        ),
    ],
    targets: [
        .target(
            name: "TestAPI_NodeNativeShim",
            dependencies: [
                .product(name: "TestAPI-node", package: "TestAPI-bindings"),
            ],
            path: ".",
            linkerSettings: [
                .linkedLibrary("FishyJoesNodeRuntime")
            ]
        ),
    ]
)

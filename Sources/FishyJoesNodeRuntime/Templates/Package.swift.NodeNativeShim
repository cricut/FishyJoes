// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "__MODULE_NAME__-node-shim",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(
            name: "__MODULE_NAME__-node-shim",
            type: .dynamic,
            targets: ["__MODULE_NAME___NodeNativeShim"]
        ),
    ],
    dependencies: [
        .package(
            name: "__MODULE_NAME__-bindings",
            path: "../../.."
        ),
    ],
    targets: [
        .target(
            name: "__MODULE_NAME___NodeNativeShim",
            dependencies: [
                .product(name: "__MODULE_NAME__-node", package: "__MODULE_NAME__-bindings"),
            ],
            path: ".",
            linkerSettings: [
                .linkedLibrary("FishyJoesNodeRuntime")
            ]
        ),
    ]
)

// swift-tools-version:5.3

import Foundation
import PackageDescription

let wasmCompatibleOnly = ProcessInfo.processInfo.environment["WASM_ONLY"] == "1"

let package = Package(
    name: "TestAPI-bindings",
    platforms: [.macOS(.v11)],
    products: [
        .library(
            name: "TestAPI-wasm",
            targets: ["TestAPI_NodeInterface"]
        ),
    ] + (
        wasmCompatibleOnly ? [] : [
            .library(
                name: "TestAPI-node",
                type: .dynamic,
                targets: ["TestAPI_NodeInterface"]
            ),
            .library(
                name: "TestAPI-java",
                type: .dynamic,
                targets: ["TestAPI_JavaInterface"]
            ),
            .library(
                name: "TestAPI-iota",
                type: .dynamic,
                targets: ["TestAPI_IotaInterface"]
            ),
            .library(
                name: "TestAPI-dart",
                type: .dynamic,
                targets: ["TestAPI_DartInterface"]
            ),
        ]
    ),
    dependencies: [
        .package(path: "../TestAPI"),
        .package(name: "FishyJoes", path: "../.."),
    ],
    targets: [
        .target(
            name: "TestAPI_NodeInterface",
            dependencies: [
                .product(name: "TestAPI", package: "TestAPI"),
                .product(name: "FishyJoesNodeRuntime", package: "FishyJoes"),
            ],
            path: "Sources/Generated/NodeInterface",
            resources: [
                .copy("TestAPI.d.ts"),
            ]
        ),
    ] + (
        wasmCompatibleOnly ? [
            .target(
                name: "DummyMain",
                dependencies: [
                    "TestAPI_NodeInterface",
                ]
            ),
        ] : [
            .target(
                name: "TestAPI_JavaInterface",
                dependencies: [
                    .product(name: "TestAPI", package: "TestAPI"),
                    .product(name: "FishyJoesJavaRuntime", package: "FishyJoes"),
                ],
                path: "Sources/Generated/JavaInterface"
            ),
            .target(
                name: "TestAPI_IotaInterface",
                dependencies: [
                    .product(name: "TestAPI", package: "TestAPI"),
                    .product(name: "FishyJoesIotaRuntime", package: "FishyJoes"),
                ],
                path: "Sources/Generated/IotaInterface"
            ),
            .target(
                name: "TestAPI_DartInterface",
                dependencies: [
                    .product(name: "TestAPI", package: "TestAPI"),
                    .product(name: "FishyJoesDartRuntime", package: "FishyJoes"),
                ],
                path: "Sources/Generated/DartInterface"
            ),
        ]
    )
)

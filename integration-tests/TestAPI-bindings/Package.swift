// swift-tools-version:5.5

import Foundation
import PackageDescription

let wasmCompatibleOnly = ProcessInfo.processInfo.environment["WASM_ONLY"] == "1"

let package = Package(
    name: "TestAPI-bindings",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products:
        wasmCompatibleOnly ? [
            .library(
                name: "TestAPI-wasm",
                targets: ["TestAPI_WasmMainShim"]
            ),
        ] : [
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
        ],
    dependencies: [
        .package(
            name: "TestAPI", 
            path: "../TestAPI"
        ),
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
                .copy("TestAPI.d.ts.part"),
            ]
        ),
    ] + (
        wasmCompatibleOnly ? [
            .executableTarget(
                name: "TestAPI_WasmMainShim",
                dependencies: [
                    .target(name: "TestAPI_NodeInterface"),
                ],
                path: "Sources/Generated/WasmMainShim",
                swiftSettings: [
                    .unsafeFlags(["-warn-concurrency"])
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
        ]
    )
)

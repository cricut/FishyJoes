// swift-tools-version:5.5

import Foundation
import PackageDescription

let wasmCompatibleOnly = ProcessInfo.processInfo.environment["WASM_ONLY"] == "1"

let package = Package(
    name: "TestAPI-bindings",
    platforms: [.macOS(.v12), .iOS(.v15)],
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
                "CommonInterface",
                .product(name: "TestAPI", package: "TestAPI"),
                .product(name: "FishyJoesNodeRuntime", package: "FishyJoes"),
            ],
            path: "Sources/Generated/NodeInterface",
            resources: [
                .copy("TestAPI.d.ts.part"),
            ],
            swiftSettings: [
                .unsafeFlags(["-warn-concurrency"])
            ]
        ),
        .target(
            name: "CommonInterface",
            path: "Sources/Generated/CommonInterface"
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
                    "CommonInterface",
                    .product(name: "TestAPI", package: "TestAPI"),
                    .product(name: "FishyJoesJavaRuntime", package: "FishyJoes"),
                ],
                path: "Sources/Generated/JavaInterface"
            ),
            .target(
                name: "TestAPI_IotaInterface",
                dependencies: [
                    "CommonInterface",
                    .product(name: "TestAPI", package: "TestAPI"),
                    .product(name: "FishyJoesIotaRuntime", package: "FishyJoes"),
                ],
                path: "Sources/Generated/IotaInterface"
            ),
        ]
    )
)

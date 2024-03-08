// swift-tools-version:5.5

import Foundation
import PackageDescription

let wasmCompatibleOnly = ProcessInfo.processInfo.environment["WASM_ONLY"] == "1"

// Don't change the format of these lines. They're read by gradle in `kotlin/build.gradle.kts`
// when updating, also update:
//   ./c-sharp/Cricut.__MODULE_NAME__/Cricut.__MODULE_NAME__.csproj
//   ./dart/pubspec.yaml
let fishyJoesVersion = "(replace this string with latest fishyjoes version)"
let __LOWERCASE_FIRST_MODULE_NAME__Version = "(replace this string with the latest version of __MODULE_NAME__)"

let package = Package(
    name: "__MODULE_NAME__-bindings",
    platforms: [.macOS(.v12)],
    products: 
        wasmCompatibleOnly ? [
            .library(
                name: "__MODULE_NAME__-wasm",
                targets: ["__MODULE_NAME___WasmMainShim"]
            ),
        ] : [
            .library(
                name: "__MODULE_NAME__-node",
                type: .dynamic,
                targets: ["__MODULE_NAME___NodeInterface"]
            ),
            .library(
                name: "__MODULE_NAME__-java",
                type: .dynamic,
                targets: ["__MODULE_NAME___JavaInterface"]
            ),
            .library(
                name: "__MODULE_NAME__-iota",
                type: .dynamic,
                targets: ["__MODULE_NAME___IotaInterface"]
            ),
        ],
    dependencies: [
        .package(
            url: "https://github.com/cricut/__MODULE_NAME__", .branch(__LOWERCASE_FIRST_MODULE_NAME__Version)
            // path: "../__MODULE_NAME__"
        ),
        .package(
            // NOTE: Must reference releases using "branch" instead of "exact" because of required usage of "unsafeFlags" in FishyJoes
            url: "https://github.com/cricut/FishyJoes", .branch(fishyJoesVersion)
            // path: "../FishyJoes"
        ),__PACKAGE_DEPENDENCY_DECLARATIONS__
    ],
    targets: [
        .target(
            name: "__MODULE_NAME___CommonInterface",
            dependencies: [
                .product(name: "__MODULE_NAME__", package: "__MODULE_NAME__"),
            ],
            path: "Sources/Generated/CommonInterface"
        ),
        .target(
            name: "__MODULE_NAME___NodeInterface",
            dependencies: [
                .target(name: "__MODULE_NAME___CommonInterface"),
                .product(name: "__MODULE_NAME__", package: "__MODULE_NAME__"),
                .product(name: "FishyJoesNodeRuntime", package: "FishyJoes"),__NODE_TARGET_DEPENDENCIES__
            ],
            path: "Sources/Generated/NodeInterface",
            resources: [
                .copy("__MODULE_NAME__.d.ts.part"),
            ]
        ),
    ] + (
        wasmCompatibleOnly ? [
            .executableTarget(
                name: "__MODULE_NAME___WasmMainShim",
                dependencies: [
                    .target(name: "__MODULE_NAME___NodeInterface"),
                ],
                path: "Sources/Generated/WasmMainShim",
                swiftSettings: [
                    .unsafeFlags(["-warn-concurrency"])
                ]
            ),
        ] : [
            .target(
                name: "__MODULE_NAME___JavaInterface",
                dependencies: [
                    .target(name: "__MODULE_NAME___CommonInterface"),
                    .product(name: "__MODULE_NAME__", package: "__MODULE_NAME__"),
                    .product(name: "FishyJoesJavaRuntime", package: "FishyJoes"),__JAVA_TARGET_DEPENDENCIES__
                ],
                path: "Sources/Generated/JavaInterface"
            ),
            .target(
                name: "__MODULE_NAME___IotaInterface",
                dependencies: [
                    .target(name: "__MODULE_NAME___CommonInterface"),
                    .product(name: "__MODULE_NAME__", package: "__MODULE_NAME__"),
                    .product(name: "FishyJoesIotaRuntime", package: "FishyJoes"),__IOTA_TARGET_DEPENDENCIES__
                ],
                path: "Sources/Generated/IotaInterface"
            ),
        ]
    )
)

// swift-tools-version:5.3

import Foundation
import PackageDescription

let wasmCompatibleOnly = ProcessInfo.processInfo.environment["WASM_ONLY"] == "1"

// Don't change the format of this line. It's read by gradle
let fishyJoesVersion = "1.0.0"

let package = Package(
    name: "__MODULE_NAME__-bindings",
    platforms: [.macOS(.v11)],
    products: [
        .library(
            name: "__MODULE_NAME__-wasm",
            targets: ["__MODULE_NAME___NodeInterface"]
        ),
    ] + (
        wasmCompatibleOnly ? [] : [
            .library(
                name: "__MODULE_NAME__-node",
                type: .dynamic,
                targets: ["__MODULE_NAME___NodeInterface"]
            ),
            .library(
                name: "__MODULE_NAME__-java",
                type: .dynamic,
                targets: ["__MODULE_NAME___JavaInterface"]
            )
        ]
    ),
    dependencies: [
        .package(
            // url: "https://github.com/cricut/__MODULE_NAME__", .exact("__MODULE_VERSION__")
            path: "../__MODULE_NAME__"
        ),
        .package(
            // NOTE: Must reference releases using "branch" instead of "exact" because of required usage of "unsafeFlags" in FishyJoes
            url: "https://github.com/cricut/FishyJoes", .branch(fishyJoesVersion)
            // path: "../FishyJoes"
        ),__PACKAGE_DEPENDENCY_DECLARATIONS__
    ],
    targets: [
        .target(
            name: "__MODULE_NAME___NodeInterface",
            dependencies: [
                .product(name: "__MODULE_NAME__", package: "__MODULE_NAME__"),
                .product(name: "FishyJoesNodeRuntime", package: "FishyJoes"),__NODE_TARGET_DEPENDENCIES__
            ],
            path: "Sources/Generated/NodeInterface",
            resources: [
                .copy("__MODULE_NAME__.d.ts"),
            ]
        ),
    ] + (
        wasmCompatibleOnly ? [
            .target(
                name: "DummyMain",
                dependencies: [
                    "__MODULE_NAME___NodeInterface",
                ]
            ),
        ] : [
            .target(
                name: "__MODULE_NAME___JavaInterface",
                dependencies: [
                    .product(name: "__MODULE_NAME__", package: "__MODULE_NAME__"),
                    .product(name: "FishyJoesJavaRuntime", package: "FishyJoes"),__JAVA_TARGET_DEPENDENCIES__
                ],
                path: "Sources/Generated/JavaInterface",
                linkerSettings: [
                    .unsafeFlags(["-Xlinker", "--export=napi_register_module_v1"], .when(platforms: [.wasi])),
                ]
            ),
        ]
    )
)

// swift-tools-version:5.3

import PackageDescription
import Foundation

let wasmCompatibleOnly = ProcessInfo.processInfo.environment["WASM_ONLY"] == "1"

let package = Package(
    name: "TestAPI-bindings",
    platforms: [.macOS(.v11)],
    products: [
        .library(
            name: "TestAPI-wasm",
            targets: ["NodeInterface"]
        ),
    ] + (wasmCompatibleOnly ? [] : [
             .library(
                 name: "TestAPI-node",
                 type: .dynamic,
                 targets: ["NodeInterface"]
             ),
             .library(
                 name: "TestAPI-java",
                 type: .dynamic,
                 targets: ["JavaInterface"]
             )
         ]),
    dependencies: [
        .package(path: "../TestAPI"),
        .package(name: "FishyJoes", path: "../.."),
    ],
    targets: [
        .target(
            name: "NodeInterface",
            dependencies: [
                .product(name: "TestAPI", package: "TestAPI"),
                .product(name: "FishyJoesNodeRuntime", package: "FishyJoes"),
            ],
            path: "Sources/Generated/NodeInterface",
            resources: [
                .copy("TestAPI.d.ts"),
            ]
        ),
    ] + (wasmCompatibleOnly ? [
             .target(
                 name: "DummyMain",
                 dependencies: [
                     "NodeInterface",
                 ]
             ),
         ] : [
             .target(
                 name: "JavaInterface",
                 dependencies: [
                     .product(name: "TestAPI", package: "TestAPI"),
                     .product(name: "FishyJoesJavaRuntime", package: "FishyJoes"),
                 ],
                 path: "Sources/Generated/JavaInterface",
                 resources: [
                     .copy("TestAPI.d.ts"),
                 ],
                 linkerSettings: [
                     .unsafeFlags(["-Xlinker", "--export=napi_register_module_v1"], .when(platforms: [.wasi])),
                 ]
             ),
         ]
    )
)

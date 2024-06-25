// swift-tools-version:5.6
// BEGIN GENERATED CODE

import PackageDescription
import Foundation

let env = ProcessInfo.processInfo.environment
let wasmCompatibleOnly = env["WASM_ONLY"] == "1"

enum Dependency: Codable {
    case local(path: String)
    case remote(url: String, _ refSpec: RefSpec)
    enum RefSpec: Codable {
        case branch(name: String)
        case revision(name: String)
    }
}

func LOG_package(name: String, path: String) -> Package.Dependency {
    // print("DEPENDENCY: .package(name: \(name), path: \(path))")
    return .package(name: name, path: path)
}
func LOG_package(url: String, branch: String) -> Package.Dependency {
    // print("DEPENDENCY: .package(url: \(url), branch: \(branch))")
    return .package(url: url, branch: branch)
}
func LOG_package(url: String, revision: String) -> Package.Dependency {
    // print("DEPENDENCY: .package(url: \(url), revision: \(revision))")
    return .package(url: url, revision: revision)
}

func packageDep(_ name: String, bindings: Bool = false) -> Package.Dependency {
    let subPath = bindings ? "/bindings/swift-interfaces/generated/\(name)-bindings" : ""
    switch env["FISHYJOES_DEPENDENCY_\(name)"] {
    case .none:
        return LOG_package(name: name, path: "../../../../../\(name)\(subPath)")
    case .some(let versionSpec):
        switch try! JSONDecoder().decode(Dependency.self, from: versionSpec.data(using: .utf8)!) {
        case .local(let packagePath):
            return LOG_package(name: name, path: "\(packagePath)")
        case let .remote(url, .branch(branch)):
            if bindings { fatalError("not supported") }
            return LOG_package(url: url, branch: branch)
        case let .remote(url, .revision(revision)):
            if bindings { fatalError("not supported") }
            return LOG_package(url: url, revision: revision)
        }
    }
}

var package = Package(
    name: "TestAPI-bindings",
    platforms: [.macOS(.v12), .iOS(.v15)],
    products: [
        .library(
            name: "TestAPI-wasm",
            targets: ["TestAPI_NodeInterface"]
        ),
    ] + (
        wasmCompatibleOnly ? [] : [
            .library(name: "TestAPI-node", type: .dynamic, targets: ["TestAPI_NodeInterface"]),
            .library(name: "TestAPI-java", type: .dynamic, targets: ["TestAPI_JavaInterface"]),
            .library(name: "TestAPI-iota", type: .dynamic, targets: ["TestAPI_IotaInterface"]),
        ]
    ),
    dependencies: [
        packageDep("TestAPI"),
        packageDep("FishyJoes"),
    ],
    targets: [
        .target(
            name: "TestAPI_CommonInterface",
            dependencies: [
                .product(name: "TestAPI", package: "TestAPI"),
            ],
            path: "Sources/CommonInterface"
        ),
        .target(
            name: "TestAPI_NodeInterface",
            dependencies: [
                .target(name: "TestAPI_CommonInterface"),
                .product(name: "TestAPI", package: "TestAPI"),
                .product(name: "FishyJoesNodeRuntime", package: "FishyJoes"),
            ],
            path: "Sources/NodeInterface",
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
                path: "Sources/WasmMainShim",
                swiftSettings: [
                    .unsafeFlags(["-warn-concurrency"])
                ]
            ),
        ] : [
            .target(
                name: "TestAPI_JavaInterface",
                dependencies: [
                    .target(name: "TestAPI_CommonInterface"),
                    .product(name: "TestAPI", package: "TestAPI"),
                    .product(name: "FishyJoesJavaRuntime", package: "FishyJoes"),
                ],
                path: "Sources/JavaInterface"
            ),
            .target(
            name: "TestAPI_IotaInterface",
            dependencies: [
                    .target(name: "TestAPI_CommonInterface"),
                    .product(name: "TestAPI", package: "TestAPI"),
                    .product(name: "FishyJoesIotaRuntime", package: "FishyJoes"),
                ],
                path: "Sources/IotaInterface"
            ),
        ]
    )
)
// END GENERATED CODE
// Below is copied from bindings/swift-interfaces/Package.part.swift


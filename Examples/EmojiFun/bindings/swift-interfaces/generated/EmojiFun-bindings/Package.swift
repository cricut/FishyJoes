// swift-tools-version:6.2
// BEGIN GENERATED CODE

import PackageDescription
import Foundation

let strictConcurrencyFlags: [SwiftSetting] = [.swiftLanguageMode(.v5)]
// [.enableExperimentalFeature("StrictConcurrency"), .enableUpcomingFeature("InferSendableFromCaptures")]

let env = ProcessInfo.processInfo.environment
let wasmCompatibleOnly = env["WASM_ONLY"] == "1"

enum Dependency: Codable {
    case local(path: String)
    case remote(url: String, _ refSpec: RefSpec)
    enum RefSpec: Codable {
        case branch(name: String)
        case revision(name: String)
        case range(lowerBound: String, upperBound: String)
    }
}

func packageDep(_ name: String, bindings: Bool = false) -> Package.Dependency {
    let subPath = bindings ? "/bindings/swift-interfaces/generated/\(name)-bindings" : ""
    switch env["FISHYJOES_DEPENDENCY_\(name)"] {
    case .none:
        return .package(name: name, path: "../../../../../\(name)\(subPath)")
    case .some(let versionSpec):
        switch try! JSONDecoder().decode(Dependency.self, from: versionSpec.data(using: .utf8)!) {
        case .local(let packagePath):
            return .package(name: name, path: packagePath)
        case let .remote(url, .branch(branch)):
            if bindings { fatalError("not supported") }
            return .package(url: url, branch: branch)
        case let .remote(url, .revision(revision)):
            if bindings { fatalError("not supported") }
            return .package(url: url, revision: revision)
        case let .remote(url, .range(lowerBound, upperBound)):
            if bindings { fatalError("not supported") }
            return .package(url: url, Version(lowerBound)!..<Version(upperBound)!)
        }
    }
}

var package = Package(
    name: "EmojiFun-bindings",
    platforms: [.macOS(.v13), .iOS(.v15)],
    products: [
        .library(name: "EmojiFun-node", type: wasmCompatibleOnly ? nil : .dynamic, targets: ["EmojiFun_NodeInterface"]),
    ] + (
        wasmCompatibleOnly ? [] : [
            .library(name: "EmojiFun-java", type: .dynamic, targets: ["EmojiFun_JavaInterface"]),
            .library(name: "EmojiFun-iota", type: .dynamic, targets: ["EmojiFun_IotaInterface"]),
        ]
    ),
    dependencies: [
        packageDep("EmojiFun"),
        packageDep("FishyJoes"),
    ],
    targets: [
        .target(
            name: "EmojiFun_CommonInterface",
            dependencies: [.product(name: "EmojiFun", package: "EmojiFun")],
            path: "Sources/CommonInterface",
            swiftSettings: strictConcurrencyFlags
        ),
        .target(
            name: "EmojiFun_NodeInterface",
            dependencies: [
                .target(name: "EmojiFun_CommonInterface"),
                .product(name: "EmojiFun", package: "EmojiFun"),
                .product(name: "FishyJoesNodeRuntime", package: "FishyJoes"),
            ],
            path: "Sources/NodeInterface",
            swiftSettings: strictConcurrencyFlags,
            linkerSettings: [
            ]
        ),
    ] + (
        wasmCompatibleOnly ? [
            .executableTarget(
                name: "EmojiFun_WasmMainShim",
                dependencies: [.target(name: "EmojiFun_NodeInterface")],
                path: "Sources/WasmMainShim",
                swiftSettings: strictConcurrencyFlags
            ),
        ] : [
            .target(
                name: "EmojiFun_JavaInterface",
                dependencies: [
                    .target(name: "EmojiFun_CommonInterface"),
                    .product(name: "EmojiFun", package: "EmojiFun"),
                    .product(name: "FishyJoesJavaRuntime", package: "FishyJoes"),
                ],
                path: "Sources/JavaInterface",
                swiftSettings: strictConcurrencyFlags,
                linkerSettings: [
                ]
            ),
            .target(
                name: "EmojiFun_IotaInterface",
                dependencies: [
                    .target(name: "EmojiFun_CommonInterface"),
                    .product(name: "EmojiFun", package: "EmojiFun"),
                    .product(name: "FishyJoesIotaRuntime", package: "FishyJoes"),
                ],
                path: "Sources/IotaInterface",
                swiftSettings: strictConcurrencyFlags,
                linkerSettings: [
                ]
            ),
        ]
    ),
    swiftLanguageModes: [.v5]
)
// END GENERATED CODE
// Below is copied from bindings/swift-interfaces/Package.part.swift

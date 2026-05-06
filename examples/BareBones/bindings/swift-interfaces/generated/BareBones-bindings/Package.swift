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
    name: "BareBones-bindings",
    platforms: [.macOS(.v13), .iOS(.v15)],
    products: [
        .library(name: "BareBones-node", type: wasmCompatibleOnly ? nil : .dynamic, targets: ["BareBones_NodeInterface"]),
    ] + (
        wasmCompatibleOnly ? [] : [
            .library(name: "BareBones-java", type: .dynamic, targets: ["BareBones_JavaInterface"]),
            .library(name: "BareBones-iota", type: .dynamic, targets: ["BareBones_IotaInterface"]),
        ]
    ),
    dependencies: [
        packageDep("BareBones"),
        packageDep("FishyJoes"),
    ],
    targets: [
        .target(
            name: "BareBones_CommonInterface",
            dependencies: [.product(name: "BareBones", package: "BareBones")],
            path: "Sources/CommonInterface",
            swiftSettings: strictConcurrencyFlags
        ),
        .target(
            name: "BareBones_NodeInterface",
            dependencies: [
                .target(name: "BareBones_CommonInterface"),
                .product(name: "BareBones", package: "BareBones"),
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
                name: "BareBones_WasmMainShim",
                dependencies: [.target(name: "BareBones_NodeInterface")],
                path: "Sources/WasmMainShim",
                swiftSettings: strictConcurrencyFlags
            ),
        ] : [
            .target(
                name: "BareBones_JavaInterface",
                dependencies: [
                    .target(name: "BareBones_CommonInterface"),
                    .product(name: "BareBones", package: "BareBones"),
                    .product(name: "FishyJoesJavaRuntime", package: "FishyJoes"),
                ],
                path: "Sources/JavaInterface",
                swiftSettings: strictConcurrencyFlags,
                linkerSettings: [
                ]
            ),
            .target(
                name: "BareBones_IotaInterface",
                dependencies: [
                    .target(name: "BareBones_CommonInterface"),
                    .product(name: "BareBones", package: "BareBones"),
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

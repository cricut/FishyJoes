// swift-tools-version:5.4

import PackageDescription

let swiftVersion = Package.Dependency.Requirement.exact("0.50400.0")

let package = Package(
    name: "FishyJoes",
    platforms: [.macOS(.v11)],
    products: [
        .library(name: "FishyJoesRuntime", targets: ["FishyJoesRuntime"]),
        .executable(name: "fishy-joes", targets: ["FishyJoesExecute"]),
    ],
    dependencies: [
        .package(
            path: "../Sourcery"
            // url: "https://github.com/krzysztofzablocki/Sourcery",
            // .exact("1.4.2")
        ),
    ],
    targets: [
        .target(
            name: "FishyJoesCore",
            dependencies: [
                .product(name: "SourceryRuntime", package: "Sourcery"),
            ]
        ),
        .target(
            name: "FishyJoesRuntime",
            dependencies: [
                .target(name: "NodeAPI"),
            ]
        ),
        .executableTarget(
            name: "FishyJoesExecute",
            dependencies: [
                .target(name: "FishyJoesCore"),
            ]
        ),
        .systemLibrary(
            name: "NodeAPI"
        ),
    ]
)

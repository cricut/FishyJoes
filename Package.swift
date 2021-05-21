// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "CDeclare",
    platforms: [.macOS(.v10_15)],
    products: [
        .executable(name: "execute-template", targets: ["CDeclareExecute"]),
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
            name: "CDeclareLib",
            dependencies: [
                .product(name: "SourceryRuntime", package: "Sourcery"),
            ]
        ),
        .target(
            name: "CDeclareExecute",
            dependencies: [
                .target(name: "CDeclareLib"),
            ]
        ),
    ]
)

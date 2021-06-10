// swift-tools-version:5.4

import PackageDescription

let swiftVersion = Package.Dependency.Requirement.exact("0.50400.0")

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
        .package(
            name: "swift-format",
            url: "https://github.com/apple/swift-format",
            swiftVersion
        ),
        // .package(
        //     name: "SwiftSyntax",
        //     url: "https://github.com/apple/swift-syntax",
        //     swiftVersion
        // ),
        // .package(
        //     url: "https://github.com/jpsim/SourceKitten",
        //     .exact("0.31.0")
        // )
    ],
    targets: [
        .target(
            name: "CDeclareLib",
            dependencies: [
                .product(name: "SourceryRuntime", package: "Sourcery"),
                .product(name: "SwiftFormat", package: "swift-format"),
                // .product(name: "SourceKittenFramework", package: "SourceKitten"),
                // .product(name: "SwiftSyntax", package: "SwiftSyntax"),
            ]
        ),
        .executableTarget(
            name: "CDeclareExecute",
            dependencies: [
                .target(name: "CDeclareLib"),
            ]
        ),
    ]
)

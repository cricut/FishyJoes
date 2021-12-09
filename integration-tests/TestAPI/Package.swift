// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TestAPI",
    products: [
        .library(
            name: "TestAPI",
            targets: ["TestAPI"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "TestAPI",
            dependencies: []
        ),
    ]
)

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
            ],
            linkerSettings: [
                .unsafeFlags(
                    // These symbols must be defined by the node process that loads the N-API addon.
                    // See ld(1) for full details.
                    [
                        "napi_call_function",
                        "napi_create_array_with_length",
                        "napi_create_double",
                        "napi_create_external",
                        "napi_create_function",
                        "napi_create_int64",
                        "napi_create_object",
                        "napi_create_reference",
                        "napi_create_string_utf8",
                        "napi_define_class",
                        "napi_delete_reference",
                        "napi_get_array_length",
                        "napi_get_boolean",
                        "napi_get_cb_info",
                        "napi_get_element",
                        "napi_get_global",
                        "napi_get_instance_data",
                        "napi_get_last_error_info",
                        "napi_get_named_property",
                        "napi_get_null",
                        "napi_get_property",
                        "napi_get_reference_value",
                        "napi_get_undefined",
                        "napi_get_value_bool",
                        "napi_get_value_double",
                        "napi_get_value_external",
                        "napi_get_value_int64",
                        "napi_get_value_string_utf8",
                        "napi_new_instance",
                        "napi_set_element",
                        "napi_set_instance_data",
                        "napi_set_named_property",
                        "napi_throw",
                        "napi_typeof",
                        "napi_unwrap",
                        "napi_wrap",
                    ].flatMap {
                        ["-Xlinker", "-U", "-Xlinker", "_\($0)"]
                    }
                )
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
        .testTarget(
            name: "FishyJoesCoreTests",
            dependencies: [
                .target(name: "FishyJoesCore"),
            ]
        ),
    ]
)

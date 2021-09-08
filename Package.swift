// swift-tools-version:5.3

import PackageDescription
import Foundation

let wasmCompatibleOnly = ProcessInfo.processInfo.environment["WASM_ONLY"] == "1"

let package = Package(
    name: "FishyJoes",
    platforms: [.macOS(.v11)],
    products: [
        .library(name: "FishyJoesNodeRuntime", targets: ["FishyJoesNodeRuntime"]),
    ] + (wasmCompatibleOnly ? [] : [
             .library(name: "FishyJoesJavaRuntime", targets: ["FishyJoesJavaRuntime"]),
             .executable(name: "fishy-joes", targets: ["FishyJoesExecute"]),
         ]),
    dependencies: wasmCompatibleOnly ? [] : [
            .package(
                // path: "../Sourcery"
                url: "https://github.com/cricut/Sourcery", .branch("docstrings")
            ),
    ],
    targets: [
        .systemLibrary(name: "NodeAPI"),
        .systemLibrary(name: "JNI"),
        .target(name: "FishyJoesCommonRuntime"),
        .target(
            name: "FishyJoesJavaRuntime",
            dependencies: [
                .target(name: "JNI"),
                .target(name: "FishyJoesCommonRuntime"),
            ]
        ),
        .target(
            name: "FishyJoesNodeRuntime",
            dependencies: [
                .target(name: "NodeAPI"),
                .target(name: "FishyJoesCommonRuntime"),
            ],
            resources: [
                .copy("js/wasm-napi.js"),
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
                    },
                    .when(
                        platforms: [
                            // all but .wasi
                            .iOS, .macOS, .tvOS, .watchOS,
                            .android, .linux, .windows,
                        ]
                    )
                ),
                .unsafeFlags(
                    [
                        "-Xlinker", "--allow-undefined",
                        "-Xlinker", "--export-table"
                    ],
                    .when(platforms: [.wasi])
                ),
            ]
        ),
    ] + (wasmCompatibleOnly ? [] : [
             .target(
                 name: "FishyJoesCore",
                 dependencies: [
                     .product(name: "SourceryRuntime", package: "Sourcery"),
                 ]
             ),
             .target(
                 name: "FishyJoesExecute",
                 dependencies: [
                     .target(name: "FishyJoesCore"),
                 ]
             ),
             .testTarget(
                 name: "FishyJoesCoreTests",
                 dependencies: [
                     .target(name: "FishyJoesCore"),
                 ]
             ),
         ])
)

// swift-tools-version:5.3

import PackageDescription
import Foundation

let env = ProcessInfo.processInfo.environment

let wasmCompatibleOnly = env["WASM_ONLY"] == "1"
let javaHome = env["JAVA_HOME_11_X64"] ?? env["JAVA_HOME"] ?? "/usr/local/opt/openjdk@11"

func macOnly<T>(_ things: @autoclosure () -> [T]) -> [T] {
    #if os(macOS)
    return wasmCompatibleOnly ? [] : things()
    #else
    return []
    #endif
}
typealias P = Product
typealias D = Package.Dependency
typealias T = Target

func wasmIncompatible<T>(_ things: @autoclosure () -> [T]) -> [T] {
    wasmCompatibleOnly ? [] : things()
}

let package = Package(
    name: "FishyJoes",
    platforms: [.macOS(.v11)],
    products: [
        P.library(
            name: "FishyJoesNodeRuntime",
            type: wasmCompatibleOnly ? nil : .dynamic,
            targets: ["FishyJoesNodeRuntime"]
        ),
    ] + wasmIncompatible(
        [
            P.library(name: "FishyJoesJavaRuntime", type: .dynamic, targets: ["FishyJoesJavaRuntime"]),
            P.library(name: "JavaRuntimeTestHarness", type: .dynamic, targets: ["JavaRuntimeTestHarness"]),
            P.library(name: "FishyJoesCSharpRuntime", targets: ["FishyJoesCSharpRuntime"]),
            P.executable(name: "fishy-joes", targets: ["FishyJoesExecute"]),
        ]
    ) + macOnly(
        [
            P.executable(name: "fishy-joes-execution-helper", targets: ["FishyJoesExecutionHelper"]),
        ]
    ),
    dependencies: macOnly(
        [
            D.package(
                url: "https://github.com/krzysztofzablocki/Sourcery", .branch("master")
//                url: "https://github.com/krzysztofzablocki/Sourcery", .exact("1.8.0")
//                 path: "../Sourcery"
            ),
        ]
    ) + wasmIncompatible(
        [
            D.package(url: "https://github.com/cobbal/swsh", .exact("3.0.0")),
            D.package(url: "https://github.com/apple/swift-argument-parser", from: "0.4.0"),
            D.package(url: "https://github.com/jpsim/Yams", .upToNextMinor(from: "4.0.0")),
        ]
    ),
    targets: [
        T.systemLibrary(name: "NodeAPI"),
        T.systemLibrary(name: "JNI"),
        T.target(name: "FishyJoesCommonRuntime"),
        T.target(
            name: "FishyJoesJavaRuntime",
            dependencies: [
                .target(name: "JNI"),
                .target(name: "FishyJoesCommonRuntime"),
            ],
            swiftSettings: [
                .unsafeFlags(["-I", "\(javaHome)/include"]),
                .unsafeFlags(["-I", "\(javaHome)/include/linux"], .when(platforms: [.linux])),
                .unsafeFlags(["-I", "\(javaHome)/include/darwin"], .when(platforms: [.macOS])),
                .unsafeFlags(["-I", "\(javaHome)/include/win32"], .when(platforms: [.windows])),
            ]
        ),
        T.target(
            name: "JavaRuntimeTestHarness",
            dependencies: [
                .target(name: "FishyJoesJavaRuntime"),
            ]
        ),
        T.target(
            name: "FishyJoesCSharpRuntime",
            dependencies: [
                .target(name: "FishyJoesJavaRuntime"),
            ]
        ),
        T.target(
            name: "FishyJoesNodeRuntime",
            dependencies: [
                .target(name: "NodeAPI"),
                .target(name: "FishyJoesCommonRuntime"),
            ],
            resources: [
                .copy("js"),
            ],
            linkerSettings: [
                .unsafeFlags(
                    // These symbols must be defined by the node process that loads the N-API addon.
                    // See ld(1) for full details.
                    [
                        "napi_add_env_cleanup_hook",
                        "napi_add_finalizer",
                        "napi_adjust_external_memory",
                        "napi_call_function",
                        "napi_check_object_type_tag",
                        "napi_close_escapable_handle_scope",
                        "napi_close_handle_scope",
                        "napi_coerce_to_bool",
                        "napi_coerce_to_number",
                        "napi_coerce_to_object",
                        "napi_coerce_to_string",
                        "napi_create_array",
                        "napi_create_array_with_length",
                        "napi_create_arraybuffer",
                        "napi_create_bigint_int64",
                        "napi_create_bigint_uint64",
                        "napi_create_bigint_words",
                        "napi_create_buffer",
                        "napi_create_buffer_copy",
                        "napi_create_dataview",
                        "napi_create_date",
                        "napi_create_double",
                        "napi_create_error",
                        "napi_create_external",
                        "napi_create_external_arraybuffer",
                        "napi_create_external_buffer",
                        "napi_create_function",
                        "napi_create_int32",
                        "napi_create_int64",
                        "napi_create_object",
                        "napi_create_promise",
                        "napi_create_reference",
                        "napi_create_string_utf8",
                        "napi_create_symbol",
                        "napi_create_typedarray",
                        "napi_create_uint32",
                        "napi_define_class",
                        "napi_define_properties",
                        "napi_delete_element",
                        "napi_delete_property",
                        "napi_delete_reference",
                        "napi_detach_arraybuffer",
                        "napi_escape_handle",
                        "napi_fatal_exception",
                        "napi_get_all_property_names",
                        "napi_get_and_clear_last_exception",
                        "napi_get_array_length",
                        "napi_get_arraybuffer_info",
                        "napi_get_boolean",
                        "napi_get_buffer_info",
                        "napi_get_cb_info",
                        "napi_get_dataview_info",
                        "napi_get_date_value",
                        "napi_get_element",
                        "napi_get_global",
                        "napi_get_instance_data",
                        "napi_get_last_error_info",
                        "napi_get_named_property",
                        "napi_get_new_target",
                        "napi_get_node_version",
                        "napi_get_null",
                        "napi_get_property",
                        "napi_get_property_names",
                        "napi_get_prototype",
                        "napi_get_reference_value",
                        "napi_get_typedarray_info",
                        "napi_get_undefined",
                        "napi_get_value_bigint_int64",
                        "napi_get_value_bigint_uint64",
                        "napi_get_value_bigint_words",
                        "napi_get_value_bool",
                        "napi_get_value_double",
                        "napi_get_value_external",
                        "napi_get_value_int32",
                        "napi_get_value_int64",
                        "napi_get_value_string_utf8",
                        "napi_get_value_uint32",
                        "napi_get_version",
                        "napi_has_element",
                        "napi_has_named_property",
                        "napi_has_own_property",
                        "napi_has_property",
                        "napi_instanceof",
                        "napi_is_array",
                        "napi_is_arraybuffer",
                        "napi_is_buffer",
                        "napi_is_dataview",
                        "napi_is_date",
                        "napi_is_detached_arraybuffer",
                        "napi_is_error",
                        "napi_is_exception_pending",
                        "napi_is_promise",
                        "napi_is_typedarray",
                        "napi_new_instance",
                        "napi_object_freeze",
                        "napi_object_seal",
                        "napi_open_escapable_handle_scope",
                        "napi_open_handle_scope",
                        "napi_reference_ref",
                        "napi_reference_unref",
                        "napi_reject_deferred",
                        "napi_remove_env_cleanup_hook",
                        "napi_remove_wrap",
                        "napi_resolve_deferred",
                        "napi_run_script",
                        "napi_set_element",
                        "napi_set_instance_data",
                        "napi_set_named_property",
                        "napi_set_property",
                        "napi_strict_equals",
                        "napi_throw",
                        "napi_throw_error",
                        "napi_type_tag_object",
                        "napi_typeof",
                        "napi_unwrap",
                        "napi_wrap",
                        "node_api_get_module_file_name",
                        "node_api_symbol_for",
                    ].flatMap {
                        #if os(Linux)
                        return ["-Xlinker", "-u", "-Xlinker", "_\($0)"]
                        #else
                        return ["-Xlinker", "-U", "-Xlinker", "_\($0)"]
                        #endif
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
                        "-Xlinker", "--export-table",
                        "-Xlinker", "--export=napi_register_module_v1",
                        "-Xlinker", "--export=malloc",
                        "-Xlinker", "--export=free",
                    ],
                    .when(platforms: [.wasi])
                ),
            ]
        ),
    ] + macOnly(
        [
            T.target(
                name: "FishyJoesCore",
                dependencies: [
                    .product(name: "SourceryRuntime", package: "Sourcery"),
                ]
            ),
            T.target(
                name: "FishyJoesExecutionHelper",
                dependencies: [
                    .target(name: "FishyJoesCore"),
                ],
                resources: [
                    .copy("FishyJoes.swifttemplate"),
                ]
            ),
            T.testTarget(
                name: "FishyJoesCoreTests",
                dependencies: [
                    .target(name: "FishyJoesCore"),
                ]
            ),
        ]
    ) + wasmIncompatible(
        [
            T.target(
                name: "FishyJoesExecute",
                dependencies: [
                    .product(name: "swsh", package: "swsh"),
                    .product(name: "ArgumentParser", package: "swift-argument-parser"),
                    .product(name: "Yams", package: "Yams"),
                ]
            ),
            T.testTarget(
                name: "NAPITests",
                dependencies: [
                    .product(name: "swsh", package: "swsh"),
                ],
                exclude: ["node-tests"]
            ),
        ]
    )
)

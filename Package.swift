// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

let strictConcurrencyFlags: [SwiftSetting] = [SwiftSetting.enableExperimentalFeature("StrictConcurrency"), .enableUpcomingFeature("InferSendableFromCaptures")]

let env = ProcessInfo.processInfo.environment
let disableGeneration = env["DISABLE_GENERATION"] == "1"
let wasmCompatibleOnly = env["WASM_ONLY"] == "1"
let androidCompatibleOnly = env["ANDROID_COMPATIBLE_ONLY"] == "1"
let javaHome = env["JAVA_HOME_11_X64"] ?? env["JAVA_HOME"]
let extraLibPath = env["EXTRA_LIBPATH"]?.split(separator: ";") ?? []

func generationEnabled<T>(_ things: @autoclosure () -> [T]) -> [T] {
    #if os(macOS)
    return (disableGeneration || wasmCompatibleOnly || androidCompatibleOnly) ? [] : things()
    #else
    return []
    #endif
}

func wasmIncompatible<T>(_ things: @autoclosure () -> [T]) -> [T] {
    wasmCompatibleOnly ? [] : things()
}

typealias P = Product
typealias D = Package.Dependency
typealias T = Target

let package = Package(
    name: "FishyJoes",
    platforms: [.macOS(.v13), .iOS(.v15)],
    products: [
        P.library(
            name: "FishyJoesNodeRuntime",
            type: wasmCompatibleOnly ? nil : .dynamic,
            targets: ["FishyJoesNodeRuntime"]
        ),
    ] + wasmIncompatible(
        [
            P.library(name: "FishyJoesJavaRuntime", type: .dynamic, targets: ["FishyJoesJavaRuntime"]),
            P.library(name: "FishyJoesIotaRuntime", type: .dynamic, targets: ["FishyJoesIotaRuntime"]),
            P.library(name: "JavaRuntimeTestHarness", type: .dynamic, targets: ["JavaRuntimeTestHarness"]),
        ]
    ) + (androidCompatibleOnly || wasmCompatibleOnly ? [] :
        [
            P.executable(name: "fishy-joes", targets: ["FishyJoesExecuteMain"]),
        ]
    ) + generationEnabled(
        [
            P.executable(name: "helper-fishy-joes-core", targets: ["FishyJoesExecutionHelper"]),
        ]
    ),
    dependencies: generationEnabled(
        [
            D.package(
                url: "https://github.com/krzysztofzablocki/Sourcery", revision: "2.2.5"
            ),
        ]
    ) + wasmIncompatible(
        [
            D.package(url: "https://github.com/mstokercricut/swsh", exact: "5.0.0-alpha0"),
            D.package(url: "https://github.com/apple/swift-argument-parser", from: "1.2.2"),
        ]
    ) + (androidCompatibleOnly || wasmCompatibleOnly ? [] : [
        D.package(url: "https://github.com/jpsim/Yams", .upToNextMinor(from: "5.0.3")),
    ]),
    targets: [
        T.target(name: "FishyJoesCommonRuntime"),
        // Kotlin / Java
        T.systemLibrary(name: "JNI"),
        T.target(
            name: "FishyJoesJavaRuntime",
            dependencies: [
                .target(name: "JNI"),
                .target(name: "FishyJoesCommonRuntime"),
            ],
            swiftSettings: strictConcurrencyFlags
        ),
        T.target(
            name: "JavaRuntimeTestHarness",
            dependencies: [
                .target(name: "FishyJoesJavaRuntime"),
            ],
            swiftSettings: strictConcurrencyFlags
        ),
        // C# / Dart
        T.target(
            name: "FishyJoesIotaRuntime",
            dependencies: [
                .target(name: "FishyJoesCommonRuntime"),
            ],
            swiftSettings: strictConcurrencyFlags
        ),
        // TypeScript Node.js / Wasm
        T.target(
            name: "NodeAPI",
            swiftSettings: strictConcurrencyFlags,
            linkerSettings: [
                // On Windows, node.lib must be in the library path list when building FishyJoes, the runtime, or bindings libraries
                // Use the EXTRA_LIBPATH environment variable to cause "swift build" to add paths to the library path list when envoked
                // When invoked via "fishy-joes build", node.lib will be downloaded and put in an accessible directory as part of the build process
                .linkedLibrary("node.lib", .when(platforms: [.windows])),
                .linkedLibrary("delayimp.lib", .when(platforms: [.windows])),
                .unsafeFlags(
                    extraLibPath.flatMap { ["-Xlinker", "/LIBPATH:\($0)"] },
                    .when(platforms: [.windows])
                )
            ]
        ),
        T.target(
            name: "FishyJoesNodeRuntime",
            dependencies: [
                .target(name: "NodeAPI"),
                .target(name: "FishyJoesCommonRuntime"),
            ],
            exclude: [
                "Templates",
            ],
            swiftSettings: strictConcurrencyFlags,
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
                        "napi_create_threadsafe_function",
                        "napi_get_threadsafe_function_context",
                        "napi_call_threadsafe_function",
                        "napi_acquire_threadsafe_function",
                        "napi_release_threadsafe_function",
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
                            // all but .wasi and .windows
                            .iOS, .macOS, .tvOS, .watchOS,
                            .android, .linux,
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
                .unsafeFlags(
                    [
                        "-Xlinker", "/DELAYLOAD:node.exe",
                    ],
                    .when(platforms: [.windows])
                ),
            ]
        ),
    ] + generationEnabled(
        [
            T.target(
                name: "FishyJoesCore",
                dependencies: [
                    .target(name: "GenerationHelpers"),
                    .product(name: "SourceryRuntime", package: "Sourcery"),
                ],
                swiftSettings: strictConcurrencyFlags
            ),
            T.executableTarget(
                name: "FishyJoesExecutionHelper",
                dependencies: [
                    .target(name: "FishyJoesCore"),
                ],
                resources: [
                    .copy("FishyJoes.swifttemplate"),
                ],
                swiftSettings: strictConcurrencyFlags
            ),
            T.testTarget(
                name: "FishyJoesCoreTests",
                dependencies: [
                    .target(name: "FishyJoesCore"),
                ],
                swiftSettings: strictConcurrencyFlags
            ),
            T.testTarget(
                name: "FishyJoesExecuteTests",
                dependencies: [
                    .target(name: "FishyJoesExecute"),
                ],
                resources: [
                    .copy("Resources"),
                ],
                swiftSettings: strictConcurrencyFlags
            ),
        ]
    ) + (androidCompatibleOnly || wasmCompatibleOnly ? [] : [
        T.executableTarget(
            name: "FishyJoesExecuteMain",
            dependencies: ["FishyJoesExecute"],
            swiftSettings: strictConcurrencyFlags,
            linkerSettings: [
                .unsafeFlags(
                    ["-Xlinker", "/IGNORE:4217"],
                    .when(platforms: [.windows])
                )
            ]
        ),
        T.target(
            // TODO: better name for this target
            name: "GenerationHelpers"
        ),
        T.target(
            name: "FishyJoesExecute",
            dependencies: [
                .target(name: "GenerationHelpers"),
                .product(name: "swsh", package: "swsh"),
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Yams", package: "Yams"),
            ],
            resources: [
                .copy("Resources"),
            ],
            swiftSettings: strictConcurrencyFlags
        ),
        T.testTarget(
            name: "NAPITests",
            dependencies: [
                .product(name: "swsh", package: "swsh"),
            ],
            exclude: ["node-tests"],
            swiftSettings: strictConcurrencyFlags
        ),
    ])
)

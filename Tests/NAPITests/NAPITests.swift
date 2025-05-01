import Foundation
import swsh
import XCTest

// The native component of the swift-wasm toolchain
let swiftWasmToolchainVersion = "6.1"
// The wasm component of the swift-wasm toolchain
let swiftWasmSDKVersion = "6.1-RELEASE"

#if os(Linux)
let defaultSwiftlyPath = "~/.local/share/swiftly/bin"
#else
let defaultSwiftlyPath = "~/.swiftly/bin"
#endif

class NAPITests: XCTestCase {
    lazy var testDirectory = "Tests/NAPITests/node-tests/js-native-api"

    lazy var swiftlyBinPath: String =
        ProcessInfo.processInfo.environment["SWIFTLY_BIN_DIR"] ??
        (defaultSwiftlyPath as NSString).expandingTildeInPath

    lazy var wasiSDKPath = ProcessInfo.processInfo.environment["WASI_SDK"] ?? (
        "~/.swiftpm/swift-sdks/swift-wasm-\(swiftWasmSDKVersion)-wasm32-unknown-wasi.artifactbundle/\(swiftWasmSDKVersion)-wasm32-unknown-wasi/wasm32-unknown-wasi/WASI.sdk"
            as NSString
    ).expandingTildeInPath

    lazy var CC = "clang"
    lazy var LD = "clang"
    lazy var CFLAGS: [String] = [
        "--verbose",
        "-target", "wasm32-unknown-wasi",
        "--sysroot", wasiSDKPath,
        "-ISources/NodeAPI/include",
    ]
    lazy var LDFLAGS: [String] = [
        "--verbose",
        "-target", "wasm32-unknown-wasi",
        "-resource-dir", "\(wasiSDKPath)/../swift.xctoolchain/usr/lib/swift_static/clang",
        "--sysroot", wasiSDKPath,

        "-lc++abi",

        "-mexec-model=reactor",
        "-Xlinker", "--export=napi_register_wasm_v1",
        "-Xlinker", "--export=malloc",
        "-Xlinker", "--export=free",
        "-Xlinker", "--allow-undefined",
        "-Xlinker", "--export-table",
    ]

    lazy var commonSources = [
        "\(testDirectory)/common.c",
        "\(testDirectory)/entry_point.c",
    ]

    lazy var testEnv: [String: String] = [
        // This check gets out of date with node
        "NODE_TEST_KNOWN_GLOBALS": "0",
    ]

    override func setUpWithError() throws {
        super.setUp()
        ExternalCommand.verbose = true
        guard FileManager.default.fileExists(atPath: "Package.swift") else {
            XCTFail("These tests expect to run in the root of the FishyJoes package. Use `swift test`.")
            struct BadWorkingDirectory: Error {}
            throw BadWorkingDirectory()
        }
    }

    func swiftly(_ command: String, arguments: [String]) -> Command {
        cmd("\(swiftlyBinPath)/swiftly", arguments: ["run", "+\(swiftWasmToolchainVersion)", "++", command] + arguments)
    }

    func testNative(_ testName: String, js: [String] = ["test.js"], fixups: [String] = []) throws {
        let path = "\(testDirectory)/\(testName)"
        try cmd("mkdir", "-p", "\(path)/build/release").run()

        let sources: [(source: String, object: String)] = try (
            commonSources + FileManager.default.contentsOfDirectory(atPath: path).compactMap {
                guard $0.hasSuffix(".c") || $0.hasSuffix(".cc") else { return nil }
                return "\(path)/\($0)"
            }
        ).map { source in
            (source: source, object: (source as NSString).deletingPathExtension + ".o")
        }
        defer { try? cmd("rm", arguments: ["-f"] + sources.map(\.object)).run() }

        for (source, object) in sources {
            try swiftly(CC, arguments: CFLAGS + ["-o", object, "-c", source]).run()
        }

        try swiftly(LD, arguments: LDFLAGS + sources.map(\.object) + ["-o", "\(path)/build/release/out.wasm"]).run()

        try cmd("cp", "\(testDirectory)/../runner.js", "\(path)/build/release/\(testName).js").run()

        for testSource in js {
            print("testing \(path)/\(testSource)")
            try cmd(
                "sed",
                arguments: [
                    "-E",
                ] + fixups.flatMap { ["-e", $0] } + [
                    "-e", #"1 s/^/(async () => {/"#,
                    "-e", #"s/require\((`.*`)\)/(await require(\1).init())/"#,
                    "-e", #"$ s/$/\n})();/"#,
                    "\(path)/\(testSource)",
                ]
            ).output(overwritingFile: "\(path)/fishyjoes_\(testSource)").run()
            try cmd("node", "--expose-gc", "--unhandled-rejections=strict", "\(path)/fishyjoes_\(testSource)", addEnv: testEnv).run()
        }
    }

    func test_2_function_arguments() throws {
        try testNative("2_function_arguments")
    }

    func test_3_callbacks() throws {
        try testNative("3_callbacks")
    }

    func test_4_object_factory() throws {
        try testNative("4_object_factory")
    }

    func test_5_function_factory() throws {
        try testNative("5_function_factory")
    }

    func test_6_object_wrap() throws {
        try testNative(
            "6_object_wrap",
            fixups: [
                // We don't pretty-print objects like node does
                #"s/#<.*>/\\[.*\\]/"#,
            ]
        )
    }

    func test_7_factory_wrap() throws {
        try testNative("7_factory_wrap")
    }

    func test_8_passing_wrapped() throws {
        try testNative("8_passing_wrapped")
    }

    func test_array() throws {
        try testNative("test_array")
    }

    func test_bigint() throws {
        try testNative("test_bigint")
    }

    func test_constructor() throws {
        try testNative(
            "test_constructor",
            js: [
                "test.js",
                "test2.js",
            ],
            fixups: [
                // We don't pretty-print objects like node does
                #"s/#<.*>/\\[.*\\]/"#,
            ]
        )
    }

    func test_conversions() throws {
        try testNative("test_conversions")
    }

    func test_dataview() throws {
        try testNative("test_dataview")
    }

    func test_date() throws {
        try testNative("test_date")
    }

    func test_error() throws {
        try testNative("test_error")
    }

    func test_exception() throws {
        try testNative(
            "test_exception",
            js: [
                "test.js",
                // "testFinalizerException.js",
            ],
            fixups: [
                #"s/\(function/await \(async function/"#,
            ]
        )
    }

    func test_function() throws {
        try testNative("test_function")
    }

    func test_general() throws {
        try testNative(
            "test_general",
            js: [
                "testFinalizer.js",
                "testNapiStatus.js",
                // "testEnvCleanup.js",
                "testGlobals.js",
                "testInstanceOf.js",
                // "testNapiRun.js",
                "test.js",
            ]
        )
    }

    func test_handle_scope() throws {
        try testNative("test_handle_scope")
    }

    func test_instance_data() throws {
        try XCTSkipIf(true, "uses subprocesses")
        try testNative("test_instance_data")
    }

    func test_new_target() throws {
        try testNative("test_new_target")
    }

    func test_number() throws {
        try testNative("test_number")
    }

    func test_object() throws {
        try testNative(
            "test_object",
            js: [
                "test.js",
                "test_null.js",
            ]
        )
    }

    func test_promise() throws {
        try testNative("test_promise")
    }

    func test_properties() throws {
        try testNative("test_properties")
    }

    func test_reference() throws {
        try testNative(
            "test_reference",
            fixups: [
                #"s/^runTests/await runTests/"#,
            ]
        )
    }

    func test_reference_double_free() throws {
        try testNative("test_reference_double_free")
    }

    func test_string() throws {
        try testNative(
            "test_string",
            js: [
                "test.js",
                "test_null.js",
            ],
            fixups: [
                // Does node expect a stack canary or something?
                #"s!.*TestMemoryCorruption!// \0!"#,
            ]
        )
    }

    func test_symbol() throws {
        try testNative(
            "test_symbol",
            js: [
                "test1.js",
                "test2.js",
                "test3.js",
            ]
        )
    }

    func test_typedarray() throws {
        try XCTSkipIf(true, "Not currently implemented")
        try testNative("test_typedarray")
    }
}

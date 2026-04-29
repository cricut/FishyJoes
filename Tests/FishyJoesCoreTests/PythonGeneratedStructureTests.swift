@testable import FishyJoesCore
import XCTest

final class PythonGeneratedStructureTests: XCTestCase {
    private let generatedRoot = "integration-tests/TestAPI/bindings/python/generated/src/cricut_testapi"

    private func assertPythonParses(_ source: String, file: StaticString = #filePath, line: UInt = #line) throws {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
        process.arguments = ["python3", "-c", "import ast, sys; ast.parse(sys.stdin.read())"]

        let input = Pipe()
        let output = Pipe()
        process.standardInput = input
        process.standardOutput = output
        process.standardError = output

        try process.run()
        input.fileHandleForWriting.write(Data(source.utf8))
        try input.fileHandleForWriting.close()
        process.waitUntilExit()

        if process.terminationStatus != 0 {
            let failure = String(data: output.fileHandleForReading.readDataToEndOfFile(), encoding: .utf8) ?? ""
            XCTFail("Generated Python did not parse:\n\(failure)\nSource:\n\(source)", file: file, line: line)
        }
    }

    private func readGenerated(_ relativePath: String) throws -> String {
        try String(
            contentsOfFile: "\(generatedRoot)/\(relativePath)",
            encoding: .utf8
        )
    }

    func testAssociatedValueEnumImportsPayloadTypes() throws {
        let source = try readGenerated("AssociatedDataEnum.py")

        XCTAssertTrue(source.contains("if typing.TYPE_CHECKING: from .SimpleEnum import SimpleEnum"))
        XCTAssertTrue(source.contains("class AssociatedDataEnum_SimpleEnum(AssociatedDataEnum):"))
        XCTAssertTrue(source.contains("    value: SimpleEnum"))
    }

    func testAsyncMethodsAwaitRuntimeFutureResult() throws {
        let source = try readGenerated("AsyncFunctions.py")

        XCTAssertTrue(source.contains("    async def exercise0("))
        XCTAssertTrue(source.contains(
            "        result = _get_runtime().call_symbol(\"__iota_TestAPI_AsyncFunctions_exercise0\""
        ))
        XCTAssertTrue(source.contains("        return await typing.cast(typing.Awaitable[typing.Any], result)"))
    }

    func testDisambiguatedSetupAliasesAreImportedAndRegistered() throws {
        let source = try readGenerated("_type_setup.py")

        XCTAssertTrue(source.contains("from .ReferenceStruct import _cls_TestAPI_Structs_ReferenceStruct_setup"))
        XCTAssertTrue(source.contains(
            "_runtime.setup_reference_type(\"TestAPI_Structs_ReferenceStruct_setup\", _cls_TestAPI_Structs_ReferenceStruct_setup)"
        ))
        XCTAssertTrue(source.contains("from .TheMethodError import _cls_TestAPI_Methods_TheMethodError_setup"))
        XCTAssertTrue(source.contains(
            "_runtime.setup_reference_type(\"TestAPI_Methods_TheMethodError_setup\", _cls_TestAPI_Methods_TheMethodError_setup)"
        ))
    }

    func testTypeSetupEmitsEveryRuntimeSetupFamily() throws {
        let source = try readGenerated("_type_setup.py")
        let requiredSetupFamilies = [
            "_runtime.setup_function_type(",
            "_runtime.setup_future_type(",
            "_runtime.setup_collection_type(",
            "_runtime.setup_dictionary_type(",
            "_runtime.setup_range_type(",
            "_runtime.setup_result_type(",
            "_runtime.setup_struct_type(",
            "_runtime.setup_reference_type(",
            "_runtime.setup_protocol_type(",
            "_runtime.setup_enum_type(",
            "_runtime.setup_tuple_type(",
        ]

        for family in requiredSetupFamilies {
            XCTAssertTrue(source.contains(family), "Missing generated setup family \(family)")
        }
    }

    func testPythonCollisionFallbackUsesQualifiedSwiftTypePath() {
        XCTAssertEqual(
            PythonClass.disambiguatedIdentifier(forQualifiedName: "Path.Progress"),
            "Path_Progress"
        )
        XCTAssertEqual(
            PythonClass.disambiguatedIdentifier(forQualifiedName: "Contour.Hierarchy"),
            "Contour_Hierarchy"
        )
        XCTAssertEqual(
            PythonClass.disambiguatedIdentifier(forQualifiedName: "Swift.String.PuttingTypesIntoQuestionablePlaces"),
            "Swift_String_PuttingTypesIntoQuestionablePlaces"
        )
    }

    func testPythonSourceIdentifierSanitizesKeywordsAndCollisions() {
        XCTAssertEqual(PythonClass.sourceIdentifier(for: "from"), "from_")
        XCTAssertEqual(PythonClass.sourceIdentifier(for: "class"), "class_")
        XCTAssertEqual(PythonClass.sourceIdentifier(for: "match"), "match_")
        XCTAssertEqual(PythonClass.sourceIdentifier(for: "some-value"), "some_value")
        XCTAssertEqual(PythonClass.sourceIdentifier(for: "1value"), "_1value")

        var used = Set(["self"])
        XCTAssertEqual(PythonClass.uniqueSourceIdentifier(for: "from", used: &used), "from_")
        XCTAssertEqual(PythonClass.uniqueSourceIdentifier(for: "from_", used: &used), "from_2")
    }

    func testPythonMethodKeywordParametersUseSanitizedSourceNames() throws {
        let module = Module(name: "TestAPI", dependencies: [])
        let method = PythonClass.Method(
            documentation: [],
            isStatic: false,
            name: "from",
            sourceName: "from_",
            mangledName: "TestAPI_Keyword_keywordSafe",
            parameters: [
                .init(
                    labelComment: nil,
                    name: "from",
                    sourceName: "from_",
                    type: .primitive("bytes"),
                    ffiType: .object,
                    defaultValue: nil
                ),
                .init(
                    labelComment: nil,
                    name: "from_",
                    sourceName: "from_2",
                    type: .primitive("bytes"),
                    ffiType: .object,
                    defaultValue: nil
                ),
            ],
            returnType: .none,
            ffiReturnType: .void,
            deprecation: nil,
            body: nil,
            isAsync: false
        )
        let pythonClass = PythonProductClass(
            module: module,
            documentation: [],
            name: "Keyword",
            constructor: .reference,
            fields: [],
            methods: [method],
            mangledTypeName: "TestAPI_Keyword"
        )
        let fragment = SourceFragment(destinationPath: nil)

        pythonClass.output(to: fragment)
        let source = "from __future__ import annotations\n\(fragment.contents)"

        XCTAssertTrue(source.contains("def from_(self, from_: builtins.bytes, from_2: builtins.bytes) -> None:"))
        XCTAssertTrue(source.contains("(\"object\", from_)"))
        XCTAssertTrue(source.contains("(\"object\", from_2)"))
        XCTAssertFalse(source.contains("def from(self, from:"))
        try assertPythonParses(source)
    }
}

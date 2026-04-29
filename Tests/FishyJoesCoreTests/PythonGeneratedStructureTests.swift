import XCTest

final class PythonGeneratedStructureTests: XCTestCase {
    private let generatedRoot = "integration-tests/TestAPI/bindings/python/generated/src/cricut_testapi"

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
}

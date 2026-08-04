@testable import FishyJoesCore
import Foundation
import SourceryDataModel
import XCTest

final class PythonRepresentationTests: XCTestCase {
    private func emptyContext() throws -> FishyJoesContext {
        let templateContext = try JSONDecoder().decode(
            SourceryTemplateContext.self,
            from: Data(#"{"types":[],"functions":[]}"#.utf8)
        )
        return FishyJoesContext(
            context: templateContext,
            module: "Fixture",
            requiredModulePaths: [:],
            extraDynamicLibraries: []
        )
    }

    func testSupportedPrimitiveHasRepresentation() throws {
        let context = PythonTranslationContext(context: try emptyContext())
        let int = TranslatedPrimitive(
            swift: "Int",
            c: "intptr_t",
            node: "number",
            jni: .long,
            cSharp: "long",
            dart: "int",
            dartFFI: "IntPtr"
        )

        let representation = int.pythonRepresentation(in: context)

        XCTAssertEqual(representation?.annotation.annotation, "int")
        XCTAssertEqual(representation?.cType, "intptr_t")
        // R5: a primitive's call-site conversion is nil (its C scalar passes
        // through directly); the descriptor is derived from the C type.
        XCTAssertNil(representation?.conversion)
        XCTAssertEqual(representation?.conversionDescriptor, "_native.INT")
    }

    func testUnsupportedPrimitiveFailsLoudInsteadOfDegradingToAny() throws {
        // Regression for the removed `?? .any` fallback (ADR 0015): a primitive
        // with no Python annotation must return nil — so the owning member is
        // dropped with a diagnostic — never silently degrade to `Any`.
        let context = PythonTranslationContext(context: try emptyContext())
        let character = TranslatedPrimitive(
            swift: "Character",
            c: "uint32_t",
            node: "string",
            jni: .int,
            cSharp: "uint",
            dart: "int",
            dartFFI: "Uint32"
        )

        XCTAssertNil(character.pythonRepresentation(in: context))
    }
}

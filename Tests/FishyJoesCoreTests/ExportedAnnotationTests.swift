@testable import FishyJoesCore
import SourceryDataModel
import XCTest

extension ExportAnnotation.SimpleParse: ExpressibleByStringLiteral {
    public init(stringLiteral: String) {
        self = .token(stringLiteral)
    }
}

private struct DocumentedStub: Documented {
    let documentation: [String]
}

class ExportAnnotationTests: XCTestCase {
    func testPythonNameAttributeParsesVerbatim() {
        let annotated = DocumentedStub(documentation: [" <!-- FishyJoes.export(Url, python: title_url) -->"])
        let annotation = annotated.exportAnnotation
        XCTAssertEqual(annotation?.name, "Url")
        XCTAssertEqual(annotation?.pythonName, "title_url")
        // cSharp naming is unaffected by a python: attribute.
        XCTAssertEqual(annotation?.cSharpName, "Url")
    }

    func testPythonNameDefaultsToNilSoDerivedNamingStaysInEffect() {
        let annotated = DocumentedStub(documentation: [" <!-- FishyJoes.export(URL) -->"])
        let annotation = annotated.exportAnnotation
        XCTAssertEqual(annotation?.name, "URL")
        XCTAssertNil(annotation?.pythonName)
    }

    func testPythonNameCombinesWithOtherAttributes() {
        let annotated = DocumentedStub(documentation: [
            " <!-- FishyJoes.export(marker, cSharp: MakeMarker, python: make_marker, noReturn: true) -->"
        ])
        let annotation = annotated.exportAnnotation
        XCTAssertEqual(annotation?.cSharpName, "MakeMarker")
        XCTAssertEqual(annotation?.pythonName, "make_marker")
        XCTAssertEqual(annotation?.noReturn, true)
    }

    func testParse() {
        let str = "export(js: 3, omitParameters: [x, y, z], c: hi)"
        let result = ExportAnnotation.SimpleParse.parse(str)
        XCTAssertEqual(
            result,
            [
                "export",
                .parenthesized(
                    [
                        "js", .colon, "3", .comma,
                        "omitParameters", .colon, .squareBracketed(["x", .comma, "y", .comma, "z"]), .comma,
                        "c", .colon, "hi",
                    ]
                )
            ]
        )
    }
}

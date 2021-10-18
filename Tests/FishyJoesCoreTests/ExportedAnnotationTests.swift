import XCTest
@testable import FishyJoesCore

extension ExportAnnotation.SimpleParse: ExpressibleByStringLiteral {
    public init(stringLiteral: String) {
        self = .token(stringLiteral)
    }
}

class ExportAnnotationTests: XCTestCase {
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

@testable import FishyJoesCore
import XCTest

final class PythonDocstringTests: XCTestCase {
    func testSingleLineDocumentationRendersOneLineDocstring() {
        let lines = PythonDocstring.lines(["Returns the given string unchanged."])

        XCTAssertEqual(lines, ["\"\"\"Returns the given string unchanged.\"\"\""])
    }

    func testMultiLineDocumentationKeepsLinesAndClosesOnOwnLine() {
        let lines = PythonDocstring.lines([
            "Splits the string on each occurrence of the separator.",
            "Returns the pieces in order without the separator.",
        ])

        XCTAssertEqual(lines, [
            "\"\"\"Splits the string on each occurrence of the separator.",
            "Returns the pieces in order without the separator.",
            "\"\"\"",
        ])
    }

    func testAnnotationLinesAreExcluded() {
        let lines = PythonDocstring.lines([
            "A documented method.",
            "<!-- FishyJoes.export(documentedMethod) -->",
        ])

        XCTAssertEqual(lines, ["\"\"\"A documented method.\"\"\""])
    }

    func testAnnotationOnlyDocumentationRendersNothing() {
        let lines = PythonDocstring.lines(["<!-- FishyJoes.export(simple) -->"])

        XCTAssertEqual(lines, [])
    }

    func testEmptyDocumentationRendersNothing() {
        XCTAssertEqual(PythonDocstring.lines([]), [])
        XCTAssertEqual(PythonDocstring.lines(["", "   "]), [])
    }

    func testBackslashesAreEscaped() {
        let lines = PythonDocstring.lines(["Matches the pattern \\d+ exactly."])

        XCTAssertEqual(lines, ["\"\"\"Matches the pattern \\\\d+ exactly.\"\"\""])
    }

    func testTripleQuotesAreEscaped() {
        let lines = PythonDocstring.lines(["Wrap text in \"\"\" markers."])

        XCTAssertEqual(lines, ["\"\"\"Wrap text in \\\"\\\"\\\" markers.\"\"\""])
    }

    func testSingleLineEndingInQuoteEscapesFinalQuote() {
        let lines = PythonDocstring.lines(["Returns the literal \"Hello\""])

        XCTAssertEqual(lines, ["\"\"\"Returns the literal \"Hello\\\"\"\"\""])
    }

    func testSingleLineEndingInTripleQuoteStaysTerminated() {
        // `escape(_:)` turns a trailing `"""` into `\"\"\"`; `closingSafe` must
        // not cut into that `\"` escape sequence, which would leave a dangling
        // backslash and an unterminated string literal in the generated module.
        let lines = PythonDocstring.lines(["Wrap text in \"\"\""])

        XCTAssertEqual(lines, ["\"\"\"Wrap text in \\\"\\\"\\\"\"\"\""])
    }

    func testSurroundingBlankLinesAreTrimmed() {
        let lines = PythonDocstring.lines([
            "",
            "A documented type.",
            "<!-- FishyJoes.export(Thing) -->",
            "",
        ])

        XCTAssertEqual(lines, ["\"\"\"A documented type.\"\"\""])
    }

    func testInteriorBlankLinesArePreserved() {
        let lines = PythonDocstring.lines([
            "Summary line.",
            "",
            "Detail paragraph.",
        ])

        XCTAssertEqual(lines, [
            "\"\"\"Summary line.",
            "",
            "Detail paragraph.",
            "\"\"\"",
        ])
    }
}

@testable import FishyJoesCore
import XCTest

final class SourceFragmentTests: XCTestCase {
    func testUnterminatedOutputPreservesSeparatorWhitespace() {
        let fragment = SourceFragment(destinationPath: nil)

        fragment.output("public ", newLineTerminated: false)
        fragment.output("System.String Name")

        XCTAssertEqual(fragment.contents, "public System.String Name\n")
    }

    func testTerminatedOutputStripsTrailingWhitespace() {
        let fragment = SourceFragment(destinationPath: nil)

        fragment.output("public class Thing {   ")
        fragment.output("}\t")

        XCTAssertEqual(fragment.contents, "public class Thing {\n}\n")
    }

    func testUnterminatedOutputBlockPreservesCloseSeparatorWhitespace() {
        let fragment = SourceFragment(destinationPath: nil)

        fragment.outputBlock("public func thing(", closeWith: ") ", newLineTerminated: false) {
            fragment.output("_ value: String")
        }
        fragment.output("-> Void")

        XCTAssertEqual(fragment.contents, "public func thing(\n    _ value: String\n) -> Void\n")
    }
}

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
}

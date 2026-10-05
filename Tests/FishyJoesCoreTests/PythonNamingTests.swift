@testable import FishyJoesCore
import XCTest

final class PythonNamingTests: XCTestCase {
    func testReceiverNamesAreReservedSoTheyCannotCollideWithTheSynthesizedSelfOrCls() {
        // A Swift parameter or associated value named `self`/`cls` must be
        // renamed, otherwise the generated `def method(self, self)` /
        // `def case(cls, cls)` is invalid Python.
        XCTAssertEqual(PythonNaming.safeIdentifier("self"), "self_")
        XCTAssertEqual(PythonNaming.safeIdentifier("cls"), "cls_")
        XCTAssertTrue(PythonNaming.isReserved("self"))
        XCTAssertTrue(PythonNaming.isReserved("cls"))
    }

    func testKeywordsAreStillReservedAndOrdinaryNamesAreUnchanged() {
        XCTAssertEqual(PythonNaming.safeIdentifier("class"), "class_")
        XCTAssertEqual(PythonNaming.safeIdentifier("value"), "value")
    }

    func testReceiverNamesAreNotTreatedAsSyntaxNames() {
        // `self`/`cls` are reserved as identifiers but are not Python syntax, so
        // a capitalized stub attribute name is still emittable.
        XCTAssertTrue(PythonNaming.canEmitStubAttribute("Self"))
        XCTAssertTrue(PythonNaming.canEmitStubAttribute("Cls"))
    }
}

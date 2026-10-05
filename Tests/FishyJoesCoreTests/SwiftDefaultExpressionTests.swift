@testable import FishyJoesCore
import XCTest

final class SwiftDefaultExpressionTests: XCTestCase {
    func testParseLiterals() {
        XCTAssertEqual(SwiftDefaultExpression.parse("nil"), .nilLiteral)
        XCTAssertEqual(SwiftDefaultExpression.parse("true"), .boolLiteral(true))
        XCTAssertEqual(SwiftDefaultExpression.parse("false"), .boolLiteral(false))
        XCTAssertEqual(SwiftDefaultExpression.parse("-42"), .integerLiteral("-42"))
        XCTAssertEqual(SwiftDefaultExpression.parse("3.14"), .floatingPointLiteral("3.14"))
    }

    func testParseMemberExpressions() {
        XCTAssertEqual(SwiftDefaultExpression.parse(".blue"), .implicitMember("blue"))
        XCTAssertEqual(SwiftDefaultExpression.parse("Int8.min"), .memberAccess(["Int8", "min"]))
        XCTAssertEqual(
            SwiftDefaultExpression.parse("Double.ulpOfOne.squareRoot()"),
            .call(callee: .memberAccess(["Double", "ulpOfOne", "squareRoot"]), arguments: [])
        )
    }

    func testRejectsUnsupportedExpressions() {
        XCTAssertNil(SwiftDefaultExpression.parse("Double.ulpOfOne.squareRoot(2)"))
        XCTAssertNil(SwiftDefaultExpression.parse("some + expression"))
        XCTAssertNil(SwiftDefaultExpression.parse("."))
    }

    func testIntegerLimitValues() {
        XCTAssertEqual(SwiftDefaultExpression.parse("Int8.min")?.swiftIntegerLimitValue, "-128")
        XCTAssertEqual(SwiftDefaultExpression.parse("UInt8.max")?.swiftIntegerLimitValue, "255")
        XCTAssertNil(SwiftDefaultExpression.parse("Double.ulpOfOne")?.swiftIntegerLimitValue)
    }

    func testFloatingPointConstantValues() {
        XCTAssertEqual(
            SwiftDefaultExpression.parse("Double.ulpOfOne")?.swiftFloatingPointConstantLiteral,
            "2.220446049250313E-16"
        )
        XCTAssertEqual(
            SwiftDefaultExpression.parse("Double.ulpOfOne.squareRoot()")?.swiftFloatingPointConstantLiteral,
            "1.4901161193847656E-8"
        )
        XCTAssertNil(SwiftDefaultExpression.parse("Double.ulpOfOne.nextUp()")?.swiftFloatingPointConstantLiteral)
    }
}

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

    func testPlatformWidthIntegerLimits() {
        XCTAssertTrue(SwiftDefaultExpression.isPlatformWidthIntegerLimit("Int.max", parameterTypeName: "Int"))
        XCTAssertTrue(SwiftDefaultExpression.isPlatformWidthIntegerLimit("Int.min", parameterTypeName: "Int"))
        XCTAssertTrue(SwiftDefaultExpression.isPlatformWidthIntegerLimit("UInt.max", parameterTypeName: "UInt"))
        XCTAssertTrue(SwiftDefaultExpression.isPlatformWidthIntegerLimit(".max", parameterTypeName: "Int"))
        XCTAssertTrue(SwiftDefaultExpression.isPlatformWidthIntegerLimit(".min", parameterTypeName: "Int"))
        XCTAssertTrue(SwiftDefaultExpression.isPlatformWidthIntegerLimit(".max", parameterTypeName: "UInt"))

        // `UInt.min` is 0 on every platform, so it stays a portable constant
        XCTAssertFalse(SwiftDefaultExpression.isPlatformWidthIntegerLimit("UInt.min", parameterTypeName: "UInt"))
        // fixed-width limits are portable constants
        XCTAssertFalse(SwiftDefaultExpression.isPlatformWidthIntegerLimit("Int64.max", parameterTypeName: "Int64"))
        XCTAssertFalse(SwiftDefaultExpression.isPlatformWidthIntegerLimit(".max", parameterTypeName: "Int32"))
        XCTAssertFalse(SwiftDefaultExpression.isPlatformWidthIntegerLimit("42", parameterTypeName: "Int"))
        XCTAssertFalse(SwiftDefaultExpression.isPlatformWidthIntegerLimit(".blue", parameterTypeName: "SimpleEnum"))
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

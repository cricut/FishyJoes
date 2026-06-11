@testable import FishyJoesCore
import XCTest

final class TargetIdentifierTests: XCTestCase {
    func testUnescapesSwiftIdentifiersBeforeTargetEscaping() {
        XCTAssertEqual("`class`".unescapedSwiftIdentifier, "class")
        XCTAssertEqual(CSharpClass.deforbidify("`class`"), "_class")
        XCTAssertEqual(DartClass.deforbidify("`class`"), "m_class")
        XCTAssertEqual(KotlinClass.deforbidify("`class`"), "`class`")
        XCTAssertEqual(KotlinClass.jniIdentifier("`class`"), "class")
    }

    func testCSharpMemberNamesAvoidNestedTypeCollisions() {
        let module = Module(name: "TestAPI", dependencies: [])
        let containingType = CSharpProductClass(
            module: module,
            documentation: [],
            name: "ReferenceOnlyTypes",
            constructor: .public(fields: []),
            fields: [],
            methods: [],
            conformances: []
        )
        containingType.innerClasses = [
            CSharpProductClass(
                module: module,
                documentation: [],
                name: "ReferenceOnlyTypes.Marker",
                constructor: .reference,
                fields: [],
                methods: [],
                conformances: []
            )
        ]

        XCTAssertEqual(containingType.memberIdentifier("Marker"), "Marker_")
        XCTAssertEqual(containingType.memberIdentifier("Other"), "Other")
    }

    func testCSharpAsMethodFieldNamesAvoidOnlyEmittedNameCollisions() {
        let module = Module(name: "TestAPI", dependencies: [])
        let containingType = CSharpProductClass(
            module: module,
            documentation: [],
            name: "Transform",
            constructor: .public(fields: []),
            fields: [],
            methods: [],
            conformances: []
        )
        containingType.innerClasses = [
            CSharpProductClass(
                module: module,
                documentation: [],
                name: "Transform.CanonicalDecomposition",
                constructor: .reference,
                fields: [],
                methods: [],
                conformances: []
            )
        ]

        XCTAssertEqual(containingType.memberIdentifier("CanonicalDecomposition"), "CanonicalDecomposition_")
        XCTAssertEqual(containingType.memberIdentifier("GetCanonicalDecomposition"), "GetCanonicalDecomposition")
        XCTAssertEqual(containingType.memberIdentifier("SetCanonicalDecomposition"), "SetCanonicalDecomposition")
    }
}

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

        // A member name that exactly matches a nested type is a generation
        // error (resolved with an explicit cSharp: export name), so only
        // non-colliding names can be asserted here; they must pass through
        // unchanged rather than being suffixed.
        XCTAssertEqual(containingType.memberIdentifier("Other"), "Other")
    }

    func testCSharpAsMethodFieldNamesDoNotCollideWithNestedTypeNames() {
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

        // Get/Set-prefixed as-method names must not be treated as colliding
        // with the bare nested-type name.
        XCTAssertEqual(containingType.memberIdentifier("GetCanonicalDecomposition"), "GetCanonicalDecomposition")
        XCTAssertEqual(containingType.memberIdentifier("SetCanonicalDecomposition"), "SetCanonicalDecomposition")
    }
}

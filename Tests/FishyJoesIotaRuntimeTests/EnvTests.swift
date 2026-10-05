import FishyJoesIotaRuntime
import XCTest

final class EnvTests: XCTestCase {
    private struct AliasProbe {}

    func testRegisterTypePreservesAdditionalNamesForExistingType() {
        let suffix = UUID().uuidString
        let firstName = "AliasProbe.primary.\(suffix)"
        let secondName = "AliasProbe.secondary.\(suffix)"

        Env.registerType(AliasProbe.self, as: firstName)
        Env.registerType(AliasProbe.self, as: secondName)

        let firstTypeID = Env.typeID(name: firstName)
        let secondTypeID = Env.typeID(name: secondName)

        XCTAssertNotNil(firstTypeID)
        XCTAssertEqual(firstTypeID, secondTypeID)
    }
}

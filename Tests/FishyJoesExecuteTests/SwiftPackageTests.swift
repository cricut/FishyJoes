@testable import FishyJoesExecute
import XCTest

class SwiftPackageTests: XCTestCase {
    func testSwift5_5() throws {
        let jsonURL = try XCTUnwrap(Bundle.module.url(forResource: "Resources/package-5.5", withExtension: "json"))

        let parsed = try JSONDecoder().decode(SwiftPackage.self, from: Data(contentsOf: jsonURL))

        XCTAssertEqual(parsed.dependencyMap["fishyjoes"], URL(string: "/Users/acobb/src/FishyJoes"))
        XCTAssertEqual(parsed.dependencyMap["crigeo"], URL(string: "https://github.com/cricut/CriGeo"))
    }

    func testSwift5_6() throws {
        let jsonURL = try XCTUnwrap(Bundle.module.url(forResource: "Resources/package-5.6", withExtension: "json"))

        let parsed = try JSONDecoder().decode(SwiftPackage.self, from: Data(contentsOf: jsonURL))

        XCTAssertEqual(parsed.dependencyMap["fishyjoes"], URL(string: "/Users/mstoker/.cricut/FishyJoes"))
        XCTAssertEqual(parsed.dependencyMap["crigeo"], URL(string: "https://github.com/cricut/CriGeo"))
    }
}

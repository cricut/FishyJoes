@testable import FishyJoesExecute
import XCTest

class SwiftPackageTests: XCTestCase {
    func testSwift5_5() throws {
        let jsonURL = try XCTUnwrap(Bundle.module.url(forResource: "Resources/package-5.5", withExtension: "json"))

        let parsed = try JSONDecoder().decode(SwiftPackage.self, from: Data(contentsOf: jsonURL))

        XCTAssertEqual(parsed.dependencyMap["fishyjoes"]?.url, URL(fileURLWithPath: "/Users/acobb/src/FishyJoes"))
        XCTAssertNil(parsed.dependencyMap["fishyjoes"]?.versionInGradleFormat)
        XCTAssertEqual(parsed.dependencyMap["crigeo"]?.url, URL(string: "https://github.com/cricut/CriGeo"))
        XCTAssertEqual(parsed.dependencyMap["crigeo"]?.versionInGradleFormat, "0.14.2")
    }

    func testSwift5_6() throws {
        let jsonURL = try XCTUnwrap(Bundle.module.url(forResource: "Resources/package-5.6", withExtension: "json"))

        let parsed = try JSONDecoder().decode(SwiftPackage.self, from: Data(contentsOf: jsonURL))

        XCTAssertEqual(parsed.dependencyMap["fishyjoes"]?.url, URL(fileURLWithPath: "/Users/mstoker/.cricut/FishyJoes"))
        XCTAssertNil(parsed.dependencyMap["fishyjoes"]?.versionInGradleFormat)
        XCTAssertEqual(parsed.dependencyMap["crigeo"]?.url, URL(string: "https://github.com/cricut/CriGeo"))
        XCTAssertEqual(parsed.dependencyMap["crigeo"]?.versionInGradleFormat, "fishy-joes-annotations")
    }

    func testSwift5_8() throws {
        let jsonURL = try XCTUnwrap(Bundle.module.url(forResource: "Resources/package-5.8", withExtension: "json"))

        let parsed = try JSONDecoder().decode(SwiftPackage.self, from: Data(contentsOf: jsonURL))

        XCTAssertEqual(parsed.dependencyMap["fishyjoes"]?.url, URL(string: "https://github.com/cricut/FishyJoes"))
        XCTAssertEqual(parsed.dependencyMap["fishyjoes"]?.versionInGradleFormat, "4.0.0-alpha2")
        XCTAssertEqual(parsed.dependencyMap["crigeo"]?.url, URL(string: "https://github.com/cricut/CriGeo"))
        XCTAssertEqual(parsed.dependencyMap["crigeo"]?.versionInGradleFormat, "2.3.0")
    }

    func testSwift5_10() throws {
        let jsonURL = try XCTUnwrap(Bundle.module.url(forResource: "Resources/package-5.10", withExtension: "json"))

        let parsed = try JSONDecoder().decode(SwiftPackage.self, from: Data(contentsOf: jsonURL))

        XCTAssertEqual(parsed.dependencyMap["fishyjoes"]?.url, URL(string: "https://github.com/cricut/FishyJoes"))
        XCTAssertEqual(parsed.dependencyMap["fishyjoes"]?.versionInGradleFormat, "4.7.8-alpha2")
    }
}

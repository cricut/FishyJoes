@testable import FishyJoesExecute
import XCTest

class SwiftPackageTests: XCTestCase {
    func testCodeSwift5_6() throws {
        let package = SwiftPackage(
            dependencies: [
                .init(
                    fileSystem: nil,
                    sourceControl: [
                        .init(
                            identity: "crigeo",
                            location: .init(remote: [URL(string: "https://github.com/cricut/CriGeo")!]),
                            requirement: .init(branch: ["fishy-joes-annotations"], upToNextMajor: nil, upToNextMinor: nil, exact: nil)
                        )
                    ]
                ),
                .init(
                    fileSystem: [
                        .init(
                            identity: "fishyjoes",
                            path: "/Users/mstoker/.cricut/FishyJoes"
                        )
                    ],
                    sourceControl: nil
                )
            ],
            targets: []
        )
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let encoded = try encoder.encode(package)
        print(String(data: encoded, encoding: .utf8)!)
    }

    func testSwift5_6() throws {
        let jsonURL = try XCTUnwrap(Bundle.module.url(forResource: "Resources/package-5.6", withExtension: "json"))

        let untyped = try JSONSerialization.jsonObject(with: Data(contentsOf: jsonURL))
        let parsed = try JSONDecoder().decode(SwiftPackage.self, from: Data(contentsOf: jsonURL))

        XCTAssertEqual(parsed.dependencyMap["fishyjoes"]?.url, URL(string: "/Users/mstoker/.cricut/FishyJoes"))
        XCTAssertNil(parsed.dependencyMap["fishyjoes"]?.version)
        XCTAssertEqual(parsed.dependencyMap["crigeo"]?.url, URL(string: "https://github.com/cricut/CriGeo"))
        XCTAssertEqual(parsed.dependencyMap["crigeo"]?.version, "fishy-joes-annotations")
    }

    func testSwift5_8() throws {
        let jsonURL = try XCTUnwrap(Bundle.module.url(forResource: "Resources/package-5.8", withExtension: "json"))

        let parsed = try JSONDecoder().decode(SwiftPackage.self, from: Data(contentsOf: jsonURL))

        XCTAssertEqual(parsed.dependencyMap["fishyjoes"], URL(string: "https://github.com/cricut/FishyJoes"))
        XCTAssertEqual(parsed.dependencyMap["crigeo"], URL(string: "https://github.com/cricut/CriGeo"))
    }
}

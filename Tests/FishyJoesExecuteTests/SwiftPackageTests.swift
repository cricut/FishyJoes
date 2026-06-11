@testable import FishyJoesExecute
import XCTest

class SwiftPackageTests: XCTestCase {
    func testSwift5_5() throws {
        let jsonURL = try XCTUnwrap(Bundle.module.url(forResource: "Resources/package-5.5", withExtension: "json"))

        let parsed = try JSONDecoder().decode(SwiftPackage.self, from: Data(contentsOf: jsonURL))

        XCTAssertEqual(parsed.dependencyMap["fishyjoes"]?.url, URL(fileURLWithPath: "/Users/acobb/src/FishyJoes"))
        XCTAssertEqual(parsed.dependencyMap["fishyjoes"]?.versionInGradleFormat(), .inline("local"))
        XCTAssertEqual(parsed.dependencyMap["crigeo"]?.url, URL(string: "https://github.com/cricut/CriGeo"))
        XCTAssertEqual(parsed.dependencyMap["crigeo"]?.versionInGradleFormat(), .inline("0.14.2"))
    }

    func testSwift5_6() throws {
        let jsonURL = try XCTUnwrap(Bundle.module.url(forResource: "Resources/package-5.6", withExtension: "json"))

        let parsed = try JSONDecoder().decode(SwiftPackage.self, from: Data(contentsOf: jsonURL))

        XCTAssertEqual(parsed.dependencyMap["fishyjoes"]?.url, URL(fileURLWithPath: "/Users/mstoker/.cricut/FishyJoes"))
        XCTAssertEqual(parsed.dependencyMap["fishyjoes"]?.versionInGradleFormat(), .inline("local"))
        XCTAssertEqual(parsed.dependencyMap["crigeo"]?.url, URL(string: "https://github.com/cricut/CriGeo"))
        XCTAssertEqual(parsed.dependencyMap["crigeo"]?.versionInGradleFormat(), .inline("fishy-joes-annotations"))
    }

    func testSwift5_8() throws {
        let jsonURL = try XCTUnwrap(Bundle.module.url(forResource: "Resources/package-5.8", withExtension: "json"))

        let parsed = try JSONDecoder().decode(SwiftPackage.self, from: Data(contentsOf: jsonURL))

        XCTAssertEqual(parsed.dependencyMap["fishyjoes"]?.url, URL(string: "https://github.com/cricut/FishyJoes"))
        XCTAssertEqual(parsed.dependencyMap["fishyjoes"]?.versionInGradleFormat(), .inline("4.0.0-alpha2"))
        XCTAssertEqual(parsed.dependencyMap["crigeo"]?.url, URL(string: "https://github.com/cricut/CriGeo"))
        XCTAssertEqual(parsed.dependencyMap["crigeo"]?.versionInGradleFormat(), .inline("2.3.0"))
    }

    func testSwift5_10() throws {
        let jsonURL = try XCTUnwrap(Bundle.module.url(forResource: "Resources/package-5.10", withExtension: "json"))

        let parsed = try JSONDecoder().decode(SwiftPackage.self, from: Data(contentsOf: jsonURL))

        XCTAssertEqual(parsed.dependencyMap["fishyjoes"]?.url, URL(string: "https://github.com/cricut/FishyJoes"))
        XCTAssertEqual(parsed.dependencyMap["fishyjoes"]?.versionInGradleFormat(), .inline("4.7.8-alpha2"))
    }

    func testPackageDotSwiftDependencyKeepsRemoteDependencyByDefault() {
        let dependency = SwiftPackage.Dependency.sourceControl(
            identity: "fishyjoes",
            location: URL(string: "https://github.com/cricut/FishyJoes")!,
            requirement: .upToNextMajor(baseVersion: SemanticVersion(major: 7))
        )

        XCTAssertEqual(
            PackageDotSwiftDependency.Dependency(from: dependency),
            .remote(
                url: "https://github.com/cricut/FishyJoes",
                .range(lowerBound: "7.0.0", upperBound: "8.0.0")
            )
        )
    }

    func testPackageDotSwiftDependencyCanPreferResolvedLocalCheckout() throws {
        let temporaryDirectory = URL(fileURLWithPath: NSTemporaryDirectory())
            .appendingPathComponent("fishyjoes-swift-package-tests-\(UUID().uuidString)")
        let checkout = temporaryDirectory.appendingPathComponent(".build/checkouts/FishyJoes")
        try FileManager.default.createDirectory(at: checkout, withIntermediateDirectories: true)
        defer {
            try? FileManager.default.removeItem(at: temporaryDirectory)
        }
        let dependency = SwiftPackage.Dependency.sourceControl(
            identity: "fishyjoes",
            location: URL(string: "https://github.com/cricut/FishyJoes")!,
            requirement: .upToNextMajor(baseVersion: SemanticVersion(major: 7))
        )

        XCTAssertEqual(
            PackageDotSwiftDependency.Dependency(
                from: dependency,
                preferResolvedLocalPath: true,
                currentDirectory: temporaryDirectory.path
            ),
            .local(path: checkout.path)
        )
    }
}

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

    func testRegistryDependency() throws {
        let jsonURL = try XCTUnwrap(Bundle.module.url(forResource: "Resources/package-registry", withExtension: "json"))

        let parsed = try JSONDecoder().decode(SwiftPackage.self, from: Data(contentsOf: jsonURL))

        // Modules are looked up by name, the registry identity keeps the case of the manifest.
        XCTAssertEqual(parsed.dependencyMap["BifrostCore"]?.identity, "cricut.BifrostCore")
        XCTAssertEqual(parsed.dependencyMap["Tesseract"]?.identity, "tesseract")
    }

    func testRegistryDownloadPath() throws {
        let downloads = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString).path
        defer { try? FileManager.default.removeItem(atPath: downloads) }
        func makeRelease(_ path: String) throws {
            try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true)
            FileManager.default.createFile(atPath: "\(path)/Package.swift", contents: Data())
        }

        // Until Swift 6.4.2.
        try makeRelease("\(downloads)/cricut/BifrostCore/0.1.5")
        XCTAssertEqual(
            SwiftPackage.registryDownloadPath(identity: "cricut.BifrostCore", version: "0.1.5", downloads: downloads),
            "\(downloads)/cricut/BifrostCore/0.1.5"
        )

        // Since Swift 6.4.2, in a directory of the registry.
        try makeRelease("\(downloads)/example.jfrog.io-0123abcd/cricut/BifrostCore/0.1.6")
        XCTAssertEqual(
            SwiftPackage.registryDownloadPath(identity: "cricut.BifrostCore", version: "0.1.6", downloads: downloads),
            "\(downloads)/example.jfrog.io-0123abcd/cricut/BifrostCore/0.1.6"
        )

        // Not downloaded.
        XCTAssertEqual(
            SwiftPackage.registryDownloadPath(identity: "cricut.Hydrogen", version: "0.1.0", downloads: downloads),
            "\(downloads)/cricut/Hydrogen/0.1.0"
        )
    }
}

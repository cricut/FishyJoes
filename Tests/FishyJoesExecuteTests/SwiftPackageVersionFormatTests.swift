@testable import FishyJoesExecute
import XCTest

class SwiftPackageVersionFormatTests: XCTestCase {
    let testURL = URL(string: "https://example.com")!

    func testVersionFormatNuget() throws {
        let upToNextMajor = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .upToNextMajor(baseVersion: SemanticVersion(major: 2, minor: 19, patch: 4))
        )
        let upToNextMinor = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .upToNextMinor(baseVersion: SemanticVersion(major: 1, minor: 2, patch: 3))
        )
        let exact = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .exact(version: SemanticVersion(major: 1, minor: 11, patch: 11))
        )
        let revision = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .revision(name: "abc123")
        )
        let range = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .range(
                lowerBound: SemanticVersion(major: 1, minor: 0, patch: 0),
                upperBound: SemanticVersion(major: 2, minor: 0, patch: 0)
            )
        )

        XCTAssertEqual(upToNextMajor.versionInNugetFormat(flexibleVersions: false), "[2.19.4]")
        XCTAssertEqual(upToNextMajor.versionInNugetFormat(flexibleVersions: true), "[2.19.4,3.0.0)")
        XCTAssertEqual(upToNextMinor.versionInNugetFormat(flexibleVersions: false), "[1.2.3]")
        XCTAssertEqual(upToNextMinor.versionInNugetFormat(flexibleVersions: true), "[1.2.3,1.3.0)")
        XCTAssertEqual(exact.versionInNugetFormat(flexibleVersions: false), "[1.11.11]")
        XCTAssertEqual(exact.versionInNugetFormat(flexibleVersions: true), "[1.11.11]")
        XCTAssertEqual(revision.versionInNugetFormat(flexibleVersions: false), "[abc123]")
        XCTAssertEqual(revision.versionInNugetFormat(flexibleVersions: true), "[abc123]")
        XCTAssertEqual(range.versionInNugetFormat(flexibleVersions: false), "[1.0.0]")
        XCTAssertEqual(range.versionInNugetFormat(flexibleVersions: true), "[1.0.0,2.0.0)")
    }

    func testVersionFormatNpm() throws {
        let upToNextMajor = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .upToNextMajor(baseVersion: SemanticVersion(major: 2, minor: 19, patch: 4))
        )
        let upToNextMajorZero = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .upToNextMajor(baseVersion: SemanticVersion(major: 0, minor: 5, patch: 0))
        )
        let upToNextMinor = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .upToNextMinor(baseVersion: SemanticVersion(major: 1, minor: 2, patch: 3))
        )
        let exact = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .exact(version: SemanticVersion(major: 1, minor: 11, patch: 11))
        )
        let revision = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .revision(name: "abc123")
        )
        let range = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .range(
                lowerBound: SemanticVersion(major: 1, minor: 0, patch: 0),
                upperBound: SemanticVersion(major: 2, minor: 0, patch: 0)
            )
        )

        XCTAssertEqual(upToNextMajor.versionInNpmFormat(relativeTo: nil, flexibleVersions: false), "2.19.4")
        XCTAssertEqual(upToNextMajor.versionInNpmFormat(relativeTo: nil, flexibleVersions: true), "^2.19.4")
        XCTAssertEqual(upToNextMajorZero.versionInNpmFormat(relativeTo: nil, flexibleVersions: true), ">=0.5.0 <1.0.0")
        XCTAssertEqual(upToNextMinor.versionInNpmFormat(relativeTo: nil, flexibleVersions: false), "1.2.3")
        XCTAssertEqual(upToNextMinor.versionInNpmFormat(relativeTo: nil, flexibleVersions: true), "~1.2.3")
        XCTAssertEqual(exact.versionInNpmFormat(relativeTo: nil, flexibleVersions: false), "1.11.11")
        XCTAssertEqual(exact.versionInNpmFormat(relativeTo: nil, flexibleVersions: true), "1.11.11")
        XCTAssertEqual(revision.versionInNpmFormat(relativeTo: nil, flexibleVersions: false), "abc123")
        XCTAssertEqual(revision.versionInNpmFormat(relativeTo: nil, flexibleVersions: true), "abc123")
        XCTAssertEqual(range.versionInNpmFormat(relativeTo: nil, flexibleVersions: false), "1.0.0")
        XCTAssertEqual(range.versionInNpmFormat(relativeTo: nil, flexibleVersions: true), ">=1.0.0 <2.0.0")
    }

    func testVersionFormatPubspec() throws {
        let upToNextMajor = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .upToNextMajor(baseVersion: SemanticVersion(major: 2, minor: 19, patch: 4))
        )
        let upToNextMinor = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .upToNextMinor(baseVersion: SemanticVersion(major: 1, minor: 2, patch: 3))
        )
        let exact = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .exact(version: SemanticVersion(major: 1, minor: 11, patch: 11))
        )

        XCTAssertEqual(upToNextMajor.versionInPubspecFormat(flexibleVersions: false), "2.19.4")
        XCTAssertEqual(upToNextMajor.versionInPubspecFormat(flexibleVersions: true), "^2.19.4")
        XCTAssertEqual(upToNextMinor.versionInPubspecFormat(flexibleVersions: false), "1.2.3")
        XCTAssertEqual(upToNextMinor.versionInPubspecFormat(flexibleVersions: true), ">=1.2.3 <1.3.0")
        XCTAssertEqual(exact.versionInPubspecFormat(flexibleVersions: false), "1.11.11")
        XCTAssertEqual(exact.versionInPubspecFormat(flexibleVersions: true), "1.11.11")
    }

    func testTagPatternAndVersionConstraint() throws {
        let upToNextMajor = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .upToNextMajor(baseVersion: SemanticVersion(major: 2, minor: 19, patch: 4))
        )
        let upToNextMajorZero = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .upToNextMajor(baseVersion: SemanticVersion(major: 0, minor: 5, patch: 0))
        )
        let upToNextMinor = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .upToNextMinor(baseVersion: SemanticVersion(major: 1, minor: 2, patch: 3))
        )
        let exact = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .exact(version: SemanticVersion(major: 1, minor: 11, patch: 11))
        )
        let range = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .range(
                lowerBound: SemanticVersion(major: 1, minor: 0, patch: 0),
                upperBound: SemanticVersion(major: 2, minor: 0, patch: 0)
            )
        )
        let branch = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .branch(name: "main")
        )
        let revision = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .revision(name: "abc123")
        )

        XCTAssertEqual(upToNextMajor.tagPatternAndVersionConstraint()?.tagPattern, "{{version}}-dart-publish")
        XCTAssertEqual(upToNextMajor.tagPatternAndVersionConstraint()?.versionConstraint, "^2.19.4")
        XCTAssertEqual(upToNextMajorZero.tagPatternAndVersionConstraint()?.versionConstraint, ">=0.5.0 <1.0.0")
        XCTAssertEqual(upToNextMinor.tagPatternAndVersionConstraint()?.versionConstraint, ">=1.2.3 <1.3.0")
        XCTAssertEqual(exact.tagPatternAndVersionConstraint()?.versionConstraint, "1.11.11")
        XCTAssertEqual(range.tagPatternAndVersionConstraint()?.versionConstraint, ">=1.0.0 <2.0.0")
        XCTAssertNil(branch.tagPatternAndVersionConstraint())
        XCTAssertNil(revision.tagPatternAndVersionConstraint())
    }

    func testVersionFormatGradle() throws {
        let upToNextMajor = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .upToNextMajor(baseVersion: SemanticVersion(major: 2, minor: 19, patch: 4))
        )
        let upToNextMinor = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .upToNextMinor(baseVersion: SemanticVersion(major: 1, minor: 2, patch: 3))
        )
        let exact = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .exact(version: SemanticVersion(major: 1, minor: 11, patch: 11))
        )
        let revision = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .revision(name: "abc123")
        )
        let range = SwiftPackage.Dependency.sourceControl(
            identity: "test",
            location: testURL,
            requirement: .range(
                lowerBound: SemanticVersion(major: 1, minor: 0, patch: 0),
                upperBound: SemanticVersion(major: 2, minor: 0, patch: 0)
            )
        )

        XCTAssertEqual(upToNextMajor.versionInGradleFormat(flexibleVersions: false), .inline("2.19.4"))
        XCTAssertEqual(
            upToNextMajor.versionInGradleFormat(flexibleVersions: true),
            .rich([#"strictly("[2.19.4,3.0.0)")"#, #"prefer("2.19.4")"#])
        )
        XCTAssertEqual(upToNextMinor.versionInGradleFormat(flexibleVersions: false), .inline("1.2.3"))
        XCTAssertEqual(
            upToNextMinor.versionInGradleFormat(flexibleVersions: true),
            .rich([#"strictly("[1.2.3,1.3.0)")"#, #"prefer("1.2.3")"#])
        )
        XCTAssertEqual(exact.versionInGradleFormat(flexibleVersions: false), .inline("1.11.11"))
        XCTAssertEqual(exact.versionInGradleFormat(flexibleVersions: true), .rich([#"strictly("1.11.11")"#]))
        XCTAssertEqual(revision.versionInGradleFormat(flexibleVersions: false), .inline("abc123"))
        XCTAssertEqual(revision.versionInGradleFormat(flexibleVersions: true), .inline("abc123"))
        XCTAssertEqual(range.versionInGradleFormat(flexibleVersions: false), .inline("1.0.0"))
        XCTAssertEqual(
            range.versionInGradleFormat(flexibleVersions: true),
            .rich([#"strictly("[1.0.0,2.0.0)")"#, #"prefer("1.0.0")"#])
        )
    }

    func testGradleVersionFormat() throws {
            let inlineVersion = SwiftPackage.Dependency.GradleVersion.inline("1.2.3")
            XCTAssertEqual(
                inlineVersion.formatLines(forPackage: "com.example:package"),
                [#"api("com.example:package:1.2.3")"#]
            )

            let richVersion = SwiftPackage.Dependency.GradleVersion.rich(
                [
                    #"strictly("[1.0.0,2.0.0)")"#,
                    #"prefer("1.0.0")"#
                ]
            )
            XCTAssertEqual(
                richVersion.formatLines(forPackage: "com.example:package"),
                [
                    #"api("com.example:package") {"#,
                    #"    version {"#,
                    #"        strictly("[1.0.0,2.0.0)")"#,
                    #"        prefer("1.0.0")"#,
                    #"    }"#,
                    #"}"#,
                ]
            )
    }
}

@testable import FishyJoesExecute
import XCTest

final class BakeVersionCommandTests: XCTestCase {
    func testBakeVersionReplacesTopLevelVersionAndNotNestedVersion() throws {
        let input = """
        name: cricut_crigeo
        description: "A Dart wrapper for CriGeo"
        version: "0.0.1-unknown"

        dependencies:
          fishyjoes_dart:
            git:
              url: "https://github.com/cricut/FishyJoes.git"
              tag_pattern: "{{version}}"
              path: "dart-runtime"
            version: "^7.0.0"
        """

        let output = try BakeVersionCommand.bakeVersion(inPubspecContent: input, version: "7.2.0")

        XCTAssertTrue(output.contains(#"version: "7.2.0""#))
        XCTAssertTrue(output.contains(#"tag_pattern: "{{version}}""#))
        XCTAssertTrue(output.contains(#"version: "^7.0.0""#))
        XCTAssertFalse(output.contains(#"version: "0.0.1-unknown""#))
    }

    func testBakeVersionInsertsVersionBeforeEnvironmentWhenMissing() throws {
        let input = """
        name: fishyjoes_dart
        description: The common dart component for fishyjoes-translated swift libraries

        environment:
          sdk: '^3.9.0'
        """

        let output = try BakeVersionCommand.bakeVersion(inPubspecContent: input, version: "7.1.0")
        let expected = """
        name: fishyjoes_dart
        description: The common dart component for fishyjoes-translated swift libraries

        version: "7.1.0"
        environment:
          sdk: '^3.9.0'
        """

        XCTAssertEqual(output, expected)
    }

    func testBakeVersionAppendsWhenNoDescriptionOrEnvironment() throws {
        let input = """
        name: fishyjoes_dart
        """

        let output = try BakeVersionCommand.bakeVersion(inPubspecContent: input, version: "7.1.0")
        let expected = """
        name: fishyjoes_dart
        version: "7.1.0"
        """

        XCTAssertEqual(output, expected)
    }

    func testBakeVersionRejectsInvalidVersionString() throws {
        XCTAssertThrowsError(
            try BakeVersionCommand.bakeVersion(
                inPubspecContent: "name: test",
                version: "7.1.0\noops"
            )
        )
    }
}

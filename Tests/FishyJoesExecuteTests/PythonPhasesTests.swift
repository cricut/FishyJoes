@testable import FishyJoesExecute
import XCTest

final class PythonPhasesTests: XCTestCase {
    func testSwiftRuntimeLibraryPathsParseTargetInfo() throws {
        let targetInfo = """
        {
          "paths": {
            "runtimeLibraryPaths": [
              "/usr/lib/swift/linux",
              "",
              "/opt/swift/usr/lib/swift/linux"
            ]
          }
        }
        """

        XCTAssertEqual(
            try PythonPhases.swiftRuntimeLibraryPaths(fromTargetInfo: targetInfo),
            ["/usr/lib/swift/linux", "/opt/swift/usr/lib/swift/linux"]
        )
    }

    func testDynamicLibraryPathEnvironmentPreservesExistingPaths() {
        let environment = PythonPhases.environmentByAddingDynamicLibraryPaths(
            ["/usr/lib/swift/linux", ""],
            to: [
                "LD_LIBRARY_PATH": "/existing/lib",
                "COVERAGE_FILE": "/tmp/coverage"
            ],
            variable: "LD_LIBRARY_PATH"
        )

        XCTAssertEqual(environment["LD_LIBRARY_PATH"], "/existing/lib:/usr/lib/swift/linux")
        XCTAssertEqual(environment["COVERAGE_FILE"], "/tmp/coverage")
    }
}

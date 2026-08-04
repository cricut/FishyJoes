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

    func testPackPhaseCleanupRemovesStaleDistArtifacts() throws {
        let root = FileManager.default.temporaryDirectory
            .appendingPathComponent("fishyjoes-python-dist-\(UUID().uuidString)")
        let dist = root.appendingPathComponent("bindings/python/dist")
        try FileManager.default.createDirectory(at: dist, withIntermediateDirectories: true)
        try "stale".write(to: dist.appendingPathComponent("testapi-0.0.1-py3-none-linux_x86_64.whl"), atomically: true, encoding: .utf8)
        defer { try? FileManager.default.removeItem(at: root) }

        try PythonPhases.removeExistingPythonDistDirectory(at: dist.path)

        XCTAssertFalse(FileManager.default.fileExists(atPath: dist.path))
    }
}

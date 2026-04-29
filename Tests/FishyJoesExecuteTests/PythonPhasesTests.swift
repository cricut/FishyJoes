@testable import FishyJoesExecute
import XCTest

final class PythonPhasesTests: XCTestCase {
    func testSwiftCoverageEnvIsEmptyWhenCoverageIsDisabled() {
        XCTAssertEqual(
            pythonSwiftCoverageEnv(
                codeCoveragePath: nil,
                platform: .python,
                uuid: UUID(uuidString: "00000000-0000-0000-0000-000000000001")!
            ),
            [:]
        )
    }

    func testSwiftCoverageEnvUsesCoveragePathPlatformAndUUID() {
        let env = pythonSwiftCoverageEnv(
            codeCoveragePath: "/tmp/fishy-coverage",
            platform: .python,
            uuid: UUID(uuidString: "00000000-0000-0000-0000-000000000002")!
        )

        XCTAssertEqual(
            env["LLVM_PROFILE_FILE"],
            "/tmp/fishy-coverage/fishy-joes-test-python-00000000-0000-0000-0000-000000000002.profraw"
        )
    }

    func testPythonTestPhaseMergesSwiftCoverageIntoPythonTestCommands() throws {
        let source = try String(
            contentsOfFile: "Sources/FishyJoesExecute/Phases/PythonPhases.swift",
            encoding: .utf8
        )

        XCTAssertEqual(
            source.components(separatedBy: "addEnv: pythonEnvWithSwiftCoverage(").count - 1,
            2,
            "generated unittest and hand-written unittest should merge LLVM_PROFILE_FILE into PYTHONPATH env"
        )
    }
}

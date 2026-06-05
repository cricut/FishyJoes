@testable import FishyJoesExecute
import XCTest

final class InstallSystemDependenciesTests: XCTestCase {
    func testMikeFarahYQChecksumParserAcceptsGNUFormat() {
        let checksum = String(repeating: "a", count: 64)
        let checksums = """
        \(String(repeating: "b", count: 64))  yq_linux_arm64
        \(checksum)  yq_linux_amd64
        """

        XCTAssertEqual(
            InstallSystemDependencies.expectedChecksum(for: "yq_linux_amd64", in: checksums),
            checksum
        )
    }

    func testMikeFarahYQChecksumParserAcceptsBSDFormat() {
        let checksum = String(repeating: "c", count: 64)
        let checksums = """
        SHA256(yq_linux_arm64)= \(String(repeating: "d", count: 64))
        SHA256(yq_linux_amd64)= \(checksum)
        """

        XCTAssertEqual(
            InstallSystemDependencies.expectedChecksum(for: "yq_linux_amd64", in: checksums),
            checksum
        )
    }

    func testMikeFarahYQChecksumParserAcceptsBSDFormatWithSpaces() {
        let checksum = String(repeating: "1", count: 64)
        let checksums = "SHA256 (yq_linux_amd64) = \(checksum)"

        XCTAssertEqual(
            InstallSystemDependencies.expectedChecksum(for: "yq_linux_amd64", in: checksums),
            checksum
        )
    }

    func testMikeFarahYQChecksumParserRejectsMissingAsset() {
        let checksums = "\(String(repeating: "e", count: 64))  yq_linux_arm64"

        XCTAssertNil(
            InstallSystemDependencies.expectedChecksum(for: "yq_linux_amd64", in: checksums)
        )
    }
}

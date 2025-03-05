import Foundation
import swsh

protocol Phases {
    // Build phases
    func preBuildPhase() throws
    func buildSwiftPhase() throws
    func preInstallPhase() throws
    func installPhase() throws
    func compileHostLanguagePhase() throws

    // Test phases
    func preTestPhase() throws
    func testPhase() throws

    // Pack phases
    func packPhase() throws
}

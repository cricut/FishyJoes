import Foundation
import swsh

class PythonPhases: BasePhases, Phases {
    func generationPhaseTemplateReplacements() throws -> [String: String] {
        return [:]
    }

    override func preBuildPhase() throws {
        try super.preBuildPhase()
    }

    func buildSwiftPhase() throws {
    }

    func installPhase() throws {
    }

    func compileHostLanguagePhase() throws {
    }

    override func preTestPhase() throws {
        try super.preTestPhase()
    }

    func testPhase() throws {
    }

    func packPhase() throws {
    }

    private func npm(_ arguments: String..., addEnv: [String: String] = [:]) -> Command {
        #if os(macOS) || os(Linux)
        return cmd("npm", arguments: arguments, addEnv: addEnv)
        #elseif os(Windows)
        return cmd("cmd.exe", arguments: ["/c", "npm"] + arguments, addEnv: addEnv)
        #else
        fatalError("unknown host OS")
        #endif
    }

    private func clangBuild(
        sources: [String],
        dependencies: [String] = [],
        headerSearchPaths: [String] = [],
        librarySearchPaths: [String] = [],
        omitLocalRPath: Bool = false,
        dynamic: Bool = true,
        outputPath: String? = nil,
        configuration: BuildConfiguration
    ) throws {
    }

    private func clangBuild(
        sources: [String],
        dependencies: [String] = [],
        headerSearchPaths: [String] = [],
        librarySearchPaths: [String] = [],
        omitLocalRPath: Bool = false,
        dynamic: Bool = true,
        optimize: Bool = true,
        targetTriple: String? = nil,
        outputPath: String? = nil
    ) -> Command {
        return cmd("clang", arguments: [])
    }
}

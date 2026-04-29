import Foundation
import swsh
import ToolchainConfig

enum Swiftly {
    // Mirrors logic from
    // - https://github.com/swiftlang/swiftly/blob/bd30c0590e3d575478e2f02d4b364f292a3507dd/Sources/MacOSPlatform/MacOS.swift#L20
    // - https://github.com/swiftlang/swiftly/blob/bd30c0590e3d575478e2f02d4b364f292a3507dd/Sources/LinuxPlatform/Linux.swift#L25
    #if os(macOS)
    static let binPath: String =
        ProcessInfo.processInfo.environment["SWIFTLY_BIN_DIR"] ??
        ("~/.swiftly/bin" as NSString).expandingTildeInPath
    #elseif os(Linux)
    static let binPath: String =
        ProcessInfo.processInfo.environment["SWIFTLY_BIN_DIR"] ??
        ProcessInfo.processInfo.environment["XDG_DATA_HOME"].map { "\($0)/.swifly/bin" } ??
        ("~/.local/share/swiftly/bin" as NSString).expandingTildeInPath
    #else
    static let binPath: String = { fatalError("wasm compilation is currently only supported on mac and linux") }()
    #endif

    static func swiftly(arguments: [String]) -> Command {
        cmd("\(binPath)/swiftly", arguments: arguments)
    }

    static func swiftly(_ arguments: String ...) -> Command {
        swiftly(arguments: arguments)
    }

    static func run(toolchain: String? = nil, _ command: String, arguments: [String]) -> Command {
        swiftly(
            arguments: [
                "run",
            ] + (toolchain.map { ["+\($0)"] } ?? []) + [
                "++",
                command
            ] + arguments
        )
    }

    static func run(toolchain: String? = nil, _ command: String, _ arguments: String ...) -> Command {
        run(toolchain: toolchain, command, arguments: arguments)
    }
}

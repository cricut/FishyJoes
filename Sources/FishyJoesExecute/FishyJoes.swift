import ArgumentParser
import Foundation

public struct FishyJoes: ParsableCommand {
    public static var configuration = CommandConfiguration(
        subcommands: [
            PackageInit.self,
            CodeGen.self,
        ],
        defaultSubcommand: CodeGen.self
    )

    public init() {}
}

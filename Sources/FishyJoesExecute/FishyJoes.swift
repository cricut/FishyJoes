import ArgumentParser
import Foundation

public struct FishyJoes: ParsableCommand {
    public static var configuration = CommandConfiguration(
        abstract: "A sourcery-based swift utility to generate foreign language bindings",
        subcommands: [
            PackageInit.self,
            CodeGen.self,
            BakeVersionCommand.self,
            DownloadNodeLib.self,
            InstallToolchainsCommand.self,
        ],
        defaultSubcommand: CodeGen.self
    )

    public init() {}
}

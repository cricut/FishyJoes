import ArgumentParser
import Foundation
import swsh

public struct DownloadNodeLib: ParsableCommand {
    // CommandConfiguration is from swift-argument-parser and is not marked as Sendable. swift-argument-parser is tied to swift-package-manager exact version in Sourcery dependencies.
    public static var configuration = CommandConfiguration(abstract: "download node.lib for use in compiling the NodeAPI target on Windows")

    @Option(name: .long, help: "location of the node lib to download")
    var url: String?

    @Option(name: .long, help: "file names where the downloaded file should be placed. Defaults to .build/lib/node.lib")
    var destination: [String]

    @Flag(name: .long, help: "download even if already present")
    var force = false

    public init() {}

    public mutating func run() throws {
        ExternalCommand.verbose = true
        try Self.download(url: url, destinations: destination, force: force)
    }

    static public func download(
        url: String? = nil,
        destinations allDestinations: [String],
        force: Bool = false
    ) throws {
        let url = url ?? "https://nodejs.org/dist/latest-v16.x/win-x64/node.lib"
        let firstDestination = allDestinations.first ?? ".build/lib/node.lib"
        let remainingDestinations = allDestinations.dropFirst()

        func makeDirectory(for filePath: String) throws {
            let dir = (filePath as NSString).deletingLastPathComponent
            if !dir.isEmpty {
                try cmd("mkdir", "-p", dir).run()
            }
        }

        if force || !cmd("test", "-f", firstDestination).runBool() {
            try makeDirectory(for: firstDestination)
            try cmd("curl", "--fail", "--location", url, "--output", firstDestination).run()
        }

        for destination in remainingDestinations {
            if force || !cmd("test", "-f", destination).runBool() {
                try makeDirectory(for: destination)
                try cmd("cp", "-f", firstDestination, destination).run()
            }
        }
    }
}

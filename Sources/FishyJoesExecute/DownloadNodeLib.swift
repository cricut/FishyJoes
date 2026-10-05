import ArgumentParser
import Foundation
import swsh

public struct DownloadNodeLib: ParsableCommand {
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
        let url = try url ?? {
            guard cmd("node", "--version").runBool() else {
                throw ValidationError("node is not available in PATH; cannot determine Node version for node.lib download")
            }
            let nodeVersion = try cmd("node", "-p", "process.versions.node").runString()
                .trimmingCharacters(in: .whitespacesAndNewlines)
            // Strip any pre-release suffix (e.g. "18.0.0-rc.1" -> "18.0.0")
                .components(separatedBy: "-").first ?? ""
            guard !nodeVersion.isEmpty else {
                throw ValidationError("Could not determine Node version from `node -p process.versions.node`")
            }
            return "https://nodejs.org/dist/v\(nodeVersion)/win-x64/node.lib"
        }()
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

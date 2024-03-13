import ArgumentParser
import Foundation
import swsh

public struct DownloadNodeLib: ParsableCommand {
    public static var configuration = CommandConfiguration(abstract: "download node.lib for use in compiling the NodeAPI target on Windows")

    @Option(name: .long, help: "location of the node lib to download")
    var url: String? = nil
    
    @Option(name: .long, help: "directory to which the download should be placed")
    var destination: String? = nil

    @Flag(name: .long, help: "download even if already present")
    var force = false

    public init() {}

    public mutating func run() throws {
        ExternalCommand.verbose = true
        try Self.download(url: url, destination: destination, force: force)
    }

    static public func download(
        url: String? = nil,
        destination: String? = nil,
        force: Bool? = nil
    ) throws {
        let url = url ?? "https://nodejs.org/dist/latest-v16.x/win-x64/node.lib"
        let destination = destination ?? ".build/lib/node.lib"
        let force = force ?? false
        if force || !cmd("test", "-f", destination).runBool() {
            try cmd("mkdir", "-p", (destination as NSString).deletingLastPathComponent).run()
            try cmd("curl", url, "--output", destination).run()
        }
    }
}

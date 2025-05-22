import Foundation
import swsh

struct DockerContext {
    var hostDockerBinary: String
    let passGitAuth: Bool

    var image = "ghcr.io/cricut/android-swift-runtime:3.0.2"
    var platform = "linux/amd64"
    var mountMappings: [String: String]
    var startDirectory: String
    var env: [String: String] = [:]

    init?(withAvailablePaths paths: [String], passGitAuth: Bool) {
        // This is somewhat ugly logic... not sure of a better way
        guard let docker = ["nerdctl", "docker"].first(where: { (try? swsh.cmd($0, "info").runString()) != nil }) else {
            return nil
        }
        hostDockerBinary = docker
        self.passGitAuth = passGitAuth

        let paths = [ FileManager.default.currentDirectoryPath ] + paths
        var absolutePathComponents = paths
            .map { (($0 as NSString).standardizingPath as NSString).pathComponents }
            .filter { $0.first == "/" }

        // find longest common prefix
        var commonComponents: [String] = []
        while let component = absolutePathComponents.compactMap(\.first).first,
              absolutePathComponents.allSatisfy({ $0.first == component }) {
            commonComponents.append(component)
            absolutePathComponents = absolutePathComponents.map { Array($0.dropFirst()) }
        }
        if commonComponents.isEmpty {
            print("No common path found! paths:")
            for path in paths {
                print("  \(path)")
            }
            print("Aborting instead of mounting '/' in docker")
            exit(1)
        }
        let basePath = NSString.path(withComponents: commonComponents)

        mountMappings = [basePath: "/work"]
        // specifically use "/" instead of platform-dependent separator, because this is inside docker
        startDirectory = "/work/\(absolutePathComponents.first!.joined(separator: "/"))"
    }

    func translateMounted(externalPath: String) -> String {
        guard externalPath.hasPrefix("/") else { return externalPath }
        for (externalMount, internalMount) in mountMappings {
            if let suffix = externalPath.trimmingIfPrefixed("\(externalMount)/") {
                return "\(internalMount)/\(suffix)"
            } else if externalPath == externalMount {
                // Have to deal with paths that are exact matches, but don't end with "/" specially
                return internalMount
            }
        }
        fatalError("Couldn't find where path `\(externalPath)` mounts to inside docker container")
    }

    func cmd(_ executable: String, arguments: [String]) -> Command {
        var mountMappings = mountMappings
        if passGitAuth {
            try! DockerContext.storeGitCredentials()
            mountMappings["\(FileManager.default.currentDirectoryPath)/.secrets/git-credentials"] = "/root/.git-credentials"
        }

        var dockerArguments: [String] = [
            "run", "--rm",
            "--platform", platform,
            "--ulimit", "core=0",
        ]
        for (key, value) in env {
            dockerArguments.append(contentsOf: ["-e", "\(key)=\(value)"])
        }
        for (key, value) in mountMappings {
            dockerArguments.append(contentsOf: ["-v", "\(key):\(value)"])
        }
        dockerArguments.append(
            contentsOf: [
                "-w", startDirectory,
                image,
                executable
            ]
        )

        let dockerCommand = swsh.cmd(hostDockerBinary, arguments: dockerArguments + arguments)
        if passGitAuth {
            return CommandWithCleanup(command: dockerCommand, cleanup: swsh.cmd("rm", ".secrets/git-credentials"))
        } else {
            return dockerCommand
        }
    }

    // I don't love this, but it's the least bad way to pass credentials I could find
    static func storeGitCredentials(host: String = "github.com", proto: String = "https") throws {
        let responseLines = try swsh.cmd("git", "credential", "fill")
            .input("host=\(host)\nprotocol=\(proto)")
            .runLines()
        let responseMap = [String: String](
            uniqueKeysWithValues: responseLines.compactMap { line in
                let parts = line.split(separator: "=").map(String.init)
                guard parts.count == 2 else { return nil }
                return (parts[0], parts[1])
            }
        )
        guard
            let username = responseMap["username"],
            let password = responseMap["password"]
        else {
            fatalError("Could not parse git credentials")
        }

        try swsh.cmd("rm", "-rf", ".secrets/git-credentials").run()
        try swsh.cmd("mkdir", "-p", ".secrets/").run()
        try swsh.cmd("chmod", "go-rwx", ".secrets").run()
        try swsh.cmd("cat")
            .input("\(proto)://\(username):\(password)@\(host)\n")
            .output(overwritingFile: ".secrets/git-credentials")
            .run()
    }
}

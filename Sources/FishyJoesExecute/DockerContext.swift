import Foundation
import swsh

struct DockerContext {
    var hostDockerBinary: String

    var image = "ghcr.io/cricut/android-swift-runtime:1.0.0"
    var platform = "linux/amd64"
    var mountMappings: [String: String]
    var startDirectory: String
    var env: [String: String] = [:]

    init?(withAvailablePaths paths: [String]) {
        // This is somewhat ugly logic... not sure of a better way

        guard let docker = ["nerdctl", "docker"].first(where: { (try? swsh.cmd($0, "info").runString()) != nil }) else {
            return nil
        }
        hostDockerBinary = docker

        let paths = [ FileManager.default.currentDirectoryPath ] + paths
        var pathComponents = paths.map { (($0 as NSString).standardizingPath as NSString).pathComponents }

        // find longest common prefix
        var commonComponents: [String] = []
        while let component = pathComponents.compactMap(\.first).first,
              pathComponents.allSatisfy({ $0.first == component }) {
            commonComponents.append(component)
            pathComponents = pathComponents.map { Array($0.dropFirst()) }
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
        startDirectory = "/work/\(pathComponents.first!.joined(separator: "/"))"
    }

    func cmd(_ executable: String, arguments: [String]) -> Command {
        var args = [String]()
        args.append(
            contentsOf: [
                "run", "--rm",
                "--platform", platform,
                "--ulimit", "core=0",
            ]
        )
        args.append(
            contentsOf: env.flatMap {
                ["-e", "\($0.key)=\($0.value)"]
            }
        )
        args.append(
            contentsOf:
                mountMappings.flatMap {
                    ["-v", "\($0.key):\($0.value)"]
                }
        )
        args.append(
            contentsOf:
                [
                    "-w", startDirectory,
                    image,
                    executable
                ]
        )
        args.append(contentsOf: arguments)
        return swsh.cmd(
            hostDockerBinary,
            arguments: args
        )
    }
}

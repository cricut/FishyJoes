import Foundation

struct SwiftPMWorkspaceState: Decodable {
    struct Object: Decodable {
        let dependencies: [Dependency]
    }

    struct Dependency: Decodable {
        struct PackageRef: Decodable {
            let identity: String
        }

        struct State: Decodable {
            let name: String
            let path: String?
        }

        let packageRef: PackageRef
        let state: State
    }

    let object: Object

    static var current: SwiftPMWorkspaceState {
        guard
            let data = try? Data(contentsOf: URL(fileURLWithPath: ".build/workspace-state.json")),
            let state = try? JSONDecoder().decode(SwiftPMWorkspaceState.self, from: data)
        else {
            return SwiftPMWorkspaceState(object: Object(dependencies: []))
        }

        return state
    }

    var editedDependencyPaths: [String: String] {
        Dictionary(
            uniqueKeysWithValues: object.dependencies.compactMap { dependency in
                guard dependency.state.name == "edited", let path = dependency.state.path else {
                    return nil
                }

                return (dependency.packageRef.identity.lowercased(), path)
            }
        )
    }
}

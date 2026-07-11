import Foundation

/// A minimal read-only view of SwiftPM's `.build/workspace-state.json`.
///
/// FishyJoes reads this file for exactly one purpose: discovering dependencies
/// the developer has put into `swift package edit` mode, so local-development
/// builds can point generated bindings at the edited checkout instead of the
/// published package. SwiftPM offers no supported command that reports edited
/// dependency paths in a machine-readable way, which is why this private file
/// is read directly.
///
/// The file format is SwiftPM-internal and may change between toolchains.
/// Only the few fields used here are decoded, and any read or decode failure
/// degrades to "no edited dependencies" — the behavior of a workspace with no
/// edits — so a format change can never break a normal build; it can only
/// disable the edited-dependency convenience until this struct is updated.
struct SwiftPMWorkspaceState: Decodable {
    struct Object: Decodable {
        let dependencies: [Dependency]
    }

    struct Dependency: Decodable {
        struct PackageRef: Decodable {
            let identity: String
            let name: String
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
                guard dependency.state.name == "edited" else {
                    return nil
                }

                // `swift package edit <dep> --path <dir>` records the explicit
                // path; a plain `swift package edit <dep>` records no path and
                // places the editable checkout at `Packages/<name>`. Both edit
                // forms delete `.build/checkouts/<name>`, so missing the
                // default-location form here would fall back to a path that no
                // longer exists.
                let path = dependency.state.path ?? "Packages/\(dependency.packageRef.name)"
                return (dependency.packageRef.identity.lowercased(), path)
            }
        )
    }
}

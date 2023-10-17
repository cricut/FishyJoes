import Foundation

struct SwiftPackage: Decodable {
    enum Dependency {
        case sourceControl(identity: String, location: URL)
        case fileSystem(identity: String, path: String)
        struct Remote: Decodable {
            let urlString: URL
        }
    }
    enum Requirement: Decodable {
        case branch(name: String)
        case upToNextMajor(baseVersion: String)
        case upToNextMinor(baseVersion: String)
        case exact(version: String)
    }
    struct Target: Decodable {
        let name: String
        let path: String?
    }
    let dependencies: [Dependency]
    let targets: [Target]
}

extension SwiftPackage.Dependency: Decodable {
    enum CodingKeys: String, CodingKey {
        // Swift 5.5
        case scm, local

        // Swift 5.6, 5.8
        case sourceControl, fileSystem
    }

    // Swift 5.6
    private enum LocationCodingKeys: String, CodingKey {
        case remote
    }

    private enum SCMCodingKeys: String, CodingKey {
        case identity, location, requirement
    }

    private enum LocalCodingKeys: String, CodingKey {
        case identity, path, nameForTargetDependencyResolutionOnly
    }

    var identity: String {
        switch self {
        case .sourceControl(let identity, _): return identity
        case .fileSystem(let identity, _): return identity
        }
    }

    var url: URL {
        switch self {
        case .sourceControl(_, let url): return url
        case .fileSystem(_, let path): return URL(fileURLWithPath: path)
        }
    }

    var localPath: String {
        return url.scheme == nil ? url.path : ".build/checkouts/\(url.lastPathComponent)"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if var scmListContainer = try? container.nestedUnkeyedContainer(forKey: .sourceControl) {
            let scmContainer = try scmListContainer.nestedContainer(keyedBy: SCMCodingKeys.self)
            let identity = try scmContainer.decode(String.self, forKey: .identity)

            let locationContainer = try scmContainer.nestedContainer(keyedBy: LocationCodingKeys.self, forKey: .location)
            var remoteContainer = try locationContainer.nestedUnkeyedContainer(forKey: .remote)
            let location = try (try? remoteContainer.decode(URL.self)) ?? remoteContainer.decode(Remote.self).urlString
            self = .sourceControl(identity: identity, location: location)
        } else if var scmListContainer = try? container.nestedUnkeyedContainer(forKey: .scm) {
            let scmContainer = try scmListContainer.nestedContainer(keyedBy: SCMCodingKeys.self)
            let identity = try scmContainer.decode(String.self, forKey: .identity)
            let location = try scmContainer.decode(URL.self, forKey: .location)
            self = .sourceControl(identity: identity, location: location)
        } else {
            var localListContainer = try (try? container.nestedUnkeyedContainer(forKey: .local)) ?? container.nestedUnkeyedContainer(forKey: .fileSystem)
            let localContainer = try localListContainer.nestedContainer(keyedBy: LocalCodingKeys.self)
            // nameForTargetDependencyResolutionOnly appears to show up when filesystem name doesn't match package name
            let name = try (try? localContainer.decode(String.self, forKey: .nameForTargetDependencyResolutionOnly).lowercased())
                ?? localContainer.decode(String.self, forKey: .identity)
            self = .fileSystem(
                identity: name,
                path: try localContainer.decode(String.self, forKey: .path)
            )
        }
    }
}

extension SwiftPackage {
    struct DependencyMap {
        var entries: [String: Dependency]
        subscript(key: String) -> Dependency? {
            entries[key.lowercased()]
        }
    }

    var dependencyMap: DependencyMap {
        .init(
            entries: Dictionary(
                uniqueKeysWithValues: dependencies.map { dependency in
                    return (dependency.identity, dependency)
                }
            )
        )
    }

    func path(toTarget targetName: String) -> String? {
        guard let target = targets.first(where: { $0.name == targetName }) else {
            return nil
        }
        return target.path ?? "./Sources/\(targetName)"
    }
}

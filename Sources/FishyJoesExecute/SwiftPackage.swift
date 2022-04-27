import Foundation

struct SwiftPackage: Decodable {
    enum Dependency {
        case scm(identity: String, location: URL)
        case local(identity: String, path: String)
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
        case scm, sourceControl, local, fileSystem
    }

    private enum LocationCodingKeys: String, CodingKey {
        case remote
    }

    private enum SCMCodingKeys: String, CodingKey {
        case identity, location
    }

    private enum LocalCodingKeys: String, CodingKey {
        case identity, path
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if var scmListContainer = try? container.nestedUnkeyedContainer(forKey: .sourceControl) { // Swift 5.6
            let scmContainer = try scmListContainer.nestedContainer(keyedBy: SCMCodingKeys.self)
            let identity = try scmContainer.decode(String.self, forKey: .identity)

            let locationContainer = try scmContainer.nestedContainer(keyedBy: LocationCodingKeys.self, forKey: .location)
            var remoteContainer = try locationContainer.nestedUnkeyedContainer(forKey: .remote)
            let location = try remoteContainer.decode(URL.self)
            self = .scm(identity: identity, location: location)
        } else if var scmListContainer = try? container.nestedUnkeyedContainer(forKey: .scm) { // Swift 5.5
            let scmContainer = try scmListContainer.nestedContainer(keyedBy: SCMCodingKeys.self)
            let identity = try scmContainer.decode(String.self, forKey: .identity)
            let location = try scmContainer.decode(URL.self, forKey: .location)
            self = .scm(identity: identity, location: location)
        } else {
            var localListContainer = try (try? container.nestedUnkeyedContainer(forKey: .local)) ?? container.nestedUnkeyedContainer(forKey: .fileSystem)
            let localContainer = try localListContainer.nestedContainer(keyedBy: LocalCodingKeys.self)
            self = .local(
                identity: try localContainer.decode(String.self, forKey: .identity),
                path: try localContainer.decode(String.self, forKey: .path)
            )
        }
    }
}

extension SwiftPackage {
    var dependencyMap: [String: URL] {
        Dictionary(
            uniqueKeysWithValues: dependencies.map { dependency in
                switch dependency {
                case .local(let identity, let path):
                    return (identity, URL(string: path)!)
                case .scm(let identity, let location):
                    return (identity, location)
                }
            }
        )
    }

    func path(toTarget targetName: String) -> String? {
        guard let target = targets.first(where: { $0.name == targetName }) else {
            return nil
        }
        return target.path ?? "./Sources/\(targetName)"
    }
}

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
    var dependencyMap: [String: URL] {
        Dictionary(
            uniqueKeysWithValues: dependencies.map { dependency in
                switch dependency {
                case .fileSystem(let identity, let path):
                    return (identity, URL(string: path)!)
                case .sourceControl(let identity, let location):
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

/*
import Foundation

struct SwiftPackage: Codable {
    struct Dependency: Codable {
        let fileSystem: [FileSystem]?
        let sourceControl: [SourceControl]?
    }

    struct FileSystem: Codable {
        let identity: String
        let path: String
    }

    struct SourceControl: Codable {
        let identity: String
        let location: Location
        let requirement: Requirement
    }

    struct Location: Codable {
        let remote: [URL]?
    }

    struct Requirement: Codable {
        let branch: [String]?
        let upToNextMajor: [String]?
        let upToNextMinor: [String]?
        let exact: [String]?
    }

    struct Target: Codable {
        let name: String
        let path: String?
    }

    let dependencies: [Dependency]
    let targets: [Target]
}

extension SwiftPackage {
    var dependencyMap: [String: (url: URL, version: String?)] {
        Dictionary(
            uniqueKeysWithValues: dependencies.map { dependency in
                switch (dependency.fileSystem, dependency.sourceControl) {
                case (let fileSystems, nil):
                    precondition(fileSystems?.count == 1, "")
                    let fileSystem = fileSystems!.first!
                    let identity = fileSystem.identity
                    let path = fileSystem.path
                    return (identity, (url: URL(string: path)!, version: nil))
                case (nil, let sourceControls):
                    precondition(sourceControls?.count == 1, "Dependency expected one source control entry, got \(sourceControls ?? [])")
                    let sourceControl = sourceControls!.first!
                    let identity = sourceControl.identity
                    let url: URL
                    switch sourceControl.location.remote {
                    case (let remoteURLs):
                        precondition(remoteURLs?.count == 1, "Package \(identity) expected one remote url, got \(remoteURLs ?? [])")
                        url = remoteURLs!.first!
                    }
                    let version: String
                    switch (sourceControl.requirement.branch, sourceControl.requirement.exact) {
                    case (let branchNames, nil):
                        precondition(branchNames?.count == 1, "Package \(identity) expected one branch name, got \(branchNames ?? [])")
                        version = "\(branchNames!.first!)"
                    case (nil, let versions):
                        precondition(versions?.count == 1, "Package \(identity) expected one version, got \(versions ?? [])")
                        version = "\(versions!.first!)"
                    default:
                        fatalError("Package \(identity) at \(url) must use 'branch' or 'exact' requirements, got \(sourceControl.requirement)")
                    }
                    return (identity, (url: url, version: version))
                default:
                    fatalError("Dependency must have 'fileSystem' or 'sourceControl', got \(dependency)")
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
*/

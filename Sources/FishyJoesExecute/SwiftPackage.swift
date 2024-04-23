import Foundation

struct SwiftPackage: Decodable {
    enum Dependency {
        case sourceControl(identity: String, location: URL, requirement: Requirement)
        case fileSystem(identity: String, path: String)
        struct Remote: Decodable {
            let urlString: URL
        }
        enum Requirement {
            case branch(names: [String])
            case revision(names: [String])
            case upToNextMajor(baseVersions: [String])
            case upToNextMinor(baseVersions: [String])
            case exact(versions: [String])
            case range(lowerBound: String, upperBound: String)
        }
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

        // Swift 5.6 -> 5.9
        case sourceControl, fileSystem
    }

    // Swift 5.5 -> 5.9
    private enum SourceControlCodingKeys: String, CodingKey {
        case identity, location, requirement
    }

    // Swift 5.5 -> 5.9
    private enum FileSystemCodingKeys: String, CodingKey {
        case identity, path, nameForTargetDependencyResolutionOnly
    }

    // Swift 5.6 -> 5.9
    private enum LocationCodingKeys: String, CodingKey {
        case remote
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if var sourceControlListContainer = try? container.nestedUnkeyedContainer(forKey: .sourceControl) {
            // Swift 5.6 -> 5.9
            let sourceControlContainer = try sourceControlListContainer.nestedContainer(keyedBy: SourceControlCodingKeys.self)
            let identity = try sourceControlContainer.decode(String.self, forKey: .identity)

            let locationContainer = try sourceControlContainer.nestedContainer(keyedBy: LocationCodingKeys.self, forKey: .location)
            var remoteContainer = try locationContainer.nestedUnkeyedContainer(forKey: .remote)
            // "remote" key went from string list to object list in 5.8
            let location = try (try? remoteContainer.decode(URL.self)) ?? remoteContainer.decode(Remote.self).urlString
            let requirement = try sourceControlContainer.decode(Requirement.self, forKey: .requirement)
            self = .sourceControl(identity: identity, location: location, requirement: requirement)
        } else if var scmListContainer = try? container.nestedUnkeyedContainer(forKey: .scm) {
            // Swift 5.5
            let sourceControlContainer = try scmListContainer.nestedContainer(keyedBy: SourceControlCodingKeys.self)
            let identity = try sourceControlContainer.decode(String.self, forKey: .identity)
            let location = try sourceControlContainer.decode(URL.self, forKey: .location)
            let requirement = try sourceControlContainer.decode(Requirement.self, forKey: .requirement)
            self = .sourceControl(identity: identity, location: location, requirement: requirement)
        } else {
            // Swift 5.6 -> 5.9 ("local" key name changed to "fileSystem" in 5.6)
            var fileSystemListContainer = try (try? container.nestedUnkeyedContainer(forKey: .local)) ?? container.nestedUnkeyedContainer(forKey: .fileSystem)
            let fileSystemContainer = try fileSystemListContainer.nestedContainer(keyedBy: FileSystemCodingKeys.self)
            // nameForTargetDependencyResolutionOnly appears to show up when filesystem name doesn't match package name
            let name = try (try? fileSystemContainer.decode(String.self, forKey: .nameForTargetDependencyResolutionOnly).lowercased())
                ?? fileSystemContainer.decode(String.self, forKey: .identity)
            self = .fileSystem(
                identity: name,
                path: try fileSystemContainer.decode(String.self, forKey: .path)
            )
        }
    }
}

extension SwiftPackage.Dependency {
    var identity: String {
        switch self {
        case .sourceControl(let identity, _, _): return identity
        case .fileSystem(let identity, _): return identity
        }
    }

    var url: URL {
        switch self {
        case .sourceControl(_, let url, _): return url
        case .fileSystem(_, let path): return URL(string: path)!
        }
    }

    var localPath: String {
        return url.scheme == nil ? url.path : ".build/checkouts/\(url.lastPathComponent)"
    }

    var version: String? {
        switch self {
        case .sourceControl(_, _, .branch(names: let names)): return names.count != 1 ? nil : names.first
        case .sourceControl(_, _, .revision(names: let names)): return names.count != 1 ? nil : names.first
        case .sourceControl(_, _, .upToNextMajor): return nil
        case .sourceControl(_, _, .upToNextMinor): return nil
        case .sourceControl(_, _, .range): return nil
        case .sourceControl(_, _, .exact(versions: let versions)): return versions.count != 1 ? nil : versions.first
        case .fileSystem: return nil
        }
    }
}

extension SwiftPackage.Dependency.Requirement: Decodable {
    enum CodingKeys: String, CodingKey {
        case exact, branch, revision, upToNextMajor, upToNextMinor, range
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let exactVersions = try? container.decode([String].self, forKey: .exact) {
            self = .exact(versions: exactVersions)
        } else if let minorVersions = try? container.decode([String].self, forKey: .upToNextMinor) {
            self = .upToNextMinor(baseVersions: minorVersions)
        } else if let majorVersions = try? container.decode([String].self, forKey: .upToNextMajor) {
            self = .upToNextMajor(baseVersions: majorVersions)
        } else if
            let range = try? container.decode([[String: String]].self, forKey: .range),
            range.count == 1,
            let lowerBound = range[0]["lowerBound"],
            let upperBound = range[0]["upperBound"]
        {
            self = .range(lowerBound: lowerBound, upperBound: upperBound)
        } else if let branchNames = try? container.decode([String].self, forKey: .branch) {
            self = .branch(names: branchNames)
        } else if let revisionNames = try? container.decode([String].self, forKey: .revision) {
            self = .revision(names: revisionNames)
        } else {
            let context = DecodingError.Context(
                codingPath: decoder.codingPath,
                debugDescription: "Couldn't parse requirement"
            )
            throw DecodingError.typeMismatch(Self.self, context)
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

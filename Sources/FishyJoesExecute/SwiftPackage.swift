import Foundation

struct SwiftPackage: Decodable {
    enum Dependency {
        case sourceControl(identity: String, location: URL, requirement: Requirement)
        case fileSystem(identity: String, path: String)
        struct Remote: Decodable {
            let urlString: URL
        }
        enum Requirement {
            case branch(name: String)
            case revision(name: String)
            case upToNextMajor(baseVersion: SemanticVersion)
            case upToNextMinor(baseVersion: SemanticVersion)
            case exact(version: SemanticVersion)
            case range(lowerBound: SemanticVersion, upperBound: SemanticVersion)
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

        // Swift 5.6 -> 5.10
        case sourceControl, fileSystem
    }

    // Swift 5.5 -> 5.10
    private enum SourceControlCodingKeys: String, CodingKey {
        case identity, location, requirement
    }

    // Swift 5.5 -> 5.10
    private enum FileSystemCodingKeys: String, CodingKey {
        case identity, path, nameForTargetDependencyResolutionOnly
    }

    // Swift 5.6 -> 5.10
    private enum LocationCodingKeys: String, CodingKey {
        case remote
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        if var sourceControlListContainer = try? container.nestedUnkeyedContainer(forKey: .sourceControl) {
            // Swift 5.6 -> 5.10
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
            // Swift 5.6 -> 5.10 ("local" key name changed to "fileSystem" in 5.6)
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
        case .fileSystem(_, let path): return URL(fileURLWithPath: path)
        }
    }

    var localPath: String {
        return url.scheme == "file" || url.scheme == nil ? url.path : ".build/checkouts/\(url.lastPathComponent)"
    }

    func versionInGradleFormat(flexibleVersions: Bool = false) -> String {
        // Gradle version range format using Maven-style syntax.
        // When flexibleVersions is true, generates inclusive-exclusive ranges: [min,max)
        // Syntax: '[' = inclusive, ')' = exclusive, '(' = exclusive, ']' = inclusive
        let spec: String
        switch self {
        case .sourceControl(_, _, .branch(let name)):
            spec = name
        case .sourceControl(_, _, .revision(let name)):
            spec = name
        case .sourceControl(_, _, .upToNextMajor(let baseVersion)):
            if flexibleVersions {
                spec = "[\(baseVersion),\(baseVersion.nextMajor))"
            } else {
                spec = baseVersion.versionString
            }
        case .sourceControl(_, _, .upToNextMinor(let baseVersion)):
            if flexibleVersions {
                spec = "[\(baseVersion),\(baseVersion.nextMinor))"
            } else {
                spec = baseVersion.versionString
            }
        case .sourceControl(_, _, .range(let lowerBound, let upperBound)):
            if flexibleVersions {
                spec = "[\(lowerBound),\(upperBound))"
            } else {
                spec = lowerBound.versionString
            }
        case .sourceControl(_, _, .exact(let version)):
            spec = version.versionString
        case .fileSystem:
            spec = "local"
        }

        // Convert anything like "user/branch" into things gradle can parse, even if it probably won't find a release by that name
        return spec.replacingOccurrences(of: "/", with: "-")
    }

    func versionInNugetFormat(flexibleVersions: Bool = false) -> String? {
        switch self {
        case .sourceControl(_, _, .branch(let name)):
            return "[\(name)]"
        case .sourceControl(_, _, .revision(let name)):
            return "[\(name)]"
        case .sourceControl(_, _, .upToNextMajor(let baseVersion)):
            if flexibleVersions {
                return "[\(baseVersion),\(baseVersion.nextMajor))"
            } else {
                return "[\(baseVersion)]"
            }
        case .sourceControl(_, _, .upToNextMinor(let baseVersion)):
            if flexibleVersions {
                return "[\(baseVersion),\(baseVersion.nextMinor))"
            } else {
                return "[\(baseVersion)]"
            }
        case .sourceControl(_, _, .range(let lowerBound, let upperBound)):
            if flexibleVersions {
                return "[\(lowerBound),\(upperBound))"
            } else {
                return "[\(lowerBound)]"
            }
        case .sourceControl(_, _, .exact(let version)):
            return "[\(version)]"
        case .fileSystem:
            return nil
        }
    }

    func versionInNpmFormat(relativeTo: String?, addIfLocalPath: String = "", flexibleVersions: Bool = false) -> String {
        switch self {
        case .sourceControl(_, _, .branch(let name)):
            return name
        case .sourceControl(_, _, .revision(let name)):
            return name
        case .sourceControl(_, _, .upToNextMajor(let baseVersion)):
            if flexibleVersions {
                if baseVersion.major > 0 {
                    return "^\(baseVersion)"
                } else {
                    return ">=\(baseVersion) <\(baseVersion.nextMajor)"
                }
            } else {
                return baseVersion.versionString
            }
        case .sourceControl(_, _, .upToNextMinor(let baseVersion)):
            if flexibleVersions {
                return "~\(baseVersion)"
            } else {
                return baseVersion.versionString
            }
        case .sourceControl(_, _, .range(let lowerBound, let upperBound)):
            if flexibleVersions {
                return ">=\(lowerBound) <\(upperBound)"
            } else {
                return lowerBound.versionString
            }
        case .sourceControl(_, _, .exact(let version)):
            return version.versionString
        case .fileSystem(_, let absolutePath):
            let localPath = relativeTo.map { relativePath(of: absolutePath, relativeTo: $0) } ?? absolutePath
            return "file:\(localPath)/\(addIfLocalPath)"
        }
    }

    func versionInPubspecFormat(flexibleVersions: Bool = false) -> String? {
        switch self {
        case .sourceControl(_, _, .branch(let name)):
            return name
        case .sourceControl(_, _, .revision(let name)):
            return name
        case .sourceControl(_, _, .upToNextMajor(let baseVersion)):
            if flexibleVersions {
                if baseVersion.major > 0 {
                    return "^\(baseVersion)"
                } else {
                    return ">=\(baseVersion) <\(baseVersion.nextMajor)"
                }
            } else {
                return baseVersion.versionString
            }
        case .sourceControl(_, _, .upToNextMinor(let baseVersion)):
            if flexibleVersions {
                return "~\(baseVersion)"
            } else {
                return baseVersion.versionString
            }
        case .sourceControl(_, _, .range(let lowerBound, let upperBound)):
            if flexibleVersions {
                return ">=\(lowerBound) <\(upperBound)"
            } else {
                return lowerBound.versionString
            }
        case .sourceControl(_, _, .exact(let version)):
            return version.versionString
        case .fileSystem:
            return nil
        }
    }

    /// Returns the Dart 3.9+ `tag_pattern` + `version:` pair for a git dependency,
    /// or nil when the requirement can't be expressed as a semver constraint
    /// (branch/revision refs and local filesystem paths).
    func tagPatternAndVersionConstraint() -> (tagPattern: String, versionConstraint: String)? {
        switch self {
        case .sourceControl(_, _, .branch), .sourceControl(_, _, .revision), .fileSystem:
            return nil
        case .sourceControl(_, _, .upToNextMajor),
             .sourceControl(_, _, .upToNextMinor),
             .sourceControl(_, _, .range),
             .sourceControl(_, _, .exact):
            guard let constraint = versionInPubspecFormat(flexibleVersions: true) else { return nil }
            return (tagPattern: "{{version}}", versionConstraint: constraint)
        }
    }
}

extension SwiftPackage.Dependency.Requirement: Decodable {
    enum CodingKeys: String, CodingKey {
        case exact, branch, revision, upToNextMajor, upToNextMinor, range
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if
            let exactVersions = try? container.decode([String].self, forKey: .exact),
            exactVersions.count == 1,
            let exactVersion = SemanticVersion(exactVersions[0])
        {
            self = .exact(version: exactVersion)
        } else if
            let minorVersions = try? container.decode([String].self, forKey: .upToNextMinor),
            minorVersions.count == 1,
            let minorVersion = SemanticVersion(minorVersions[0])
        {
            self = .upToNextMinor(baseVersion: minorVersion)
        } else if
            let majorVersions = try? container.decode([String].self, forKey: .upToNextMajor),
            majorVersions.count == 1,
            let majorVersion = SemanticVersion(majorVersions[0])
        {
            self = .upToNextMajor(baseVersion: majorVersion)
        } else if
            let ranges = try? container.decode([[String: String]].self, forKey: .range),
            ranges.count == 1,
            let lowerBound = ranges[0]["lowerBound"].flatMap(SemanticVersion.init),
            let upperBound = ranges[0]["upperBound"].flatMap(SemanticVersion.init)
        {
            // Swift 6.1+ encodes upToNextMajor/upToNextMinor as explicit ranges
            // Try to detect and reconstruct the semantic intent
            if upperBound == lowerBound.nextMinor {
                self = .upToNextMinor(baseVersion: lowerBound)
            } else if upperBound == lowerBound.nextMajor {
                self = .upToNextMajor(baseVersion: lowerBound)
            } else {
                self = .range(lowerBound: lowerBound, upperBound: upperBound)
            }
        } else if let branchNames = try? container.decode([String].self, forKey: .branch), branchNames.count == 1 {
            self = .branch(name: branchNames[0])
        } else if let revisionNames = try? container.decode([String].self, forKey: .revision), revisionNames.count == 1 {
            self = .revision(name: revisionNames[0])
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

struct SemanticVersion: Hashable, CustomStringConvertible {
    let major: Int
    let minor: Int
    let patch: Int
    let prerelease: String?
    let buildMetadata: String?

    init(major: Int, minor: Int = 0, patch: Int = 0, prerelease: String? = nil, buildMetadata: String? = nil) {
        self.major = major
        self.minor = minor
        self.patch = patch
        self.prerelease = prerelease
        self.buildMetadata = buildMetadata
    }

    // From https://semver.org/#is-there-a-suggested-regular-expression-regex-to-check-a-semver-string
    static let regex = try! NSRegularExpression(
        pattern:
            #"^(0|[1-9]\d*)"# +
            #"\.(0|[1-9]\d*)"# +
            #"\.(0|[1-9]\d*)"# + #"(?:-((?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?"# +
            #"(?:\+([0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$"#
    )

    init?(_ string: String) {
        let nsString = string as NSString
        guard
            let match = SemanticVersion.regex.firstMatch(in: string, range: NSRange(location: 0, length: nsString.length)),
            let major = Int(nsString.substring(with: match.range(at: 1))),
            let minor = Int(nsString.substring(with: match.range(at: 2))),
            let patch = Int(nsString.substring(with: match.range(at: 3)))
        else {
            return nil
        }
        self.major = major
        self.minor = minor
        self.patch = patch
        self.prerelease = match.range(at: 4).asOptional.map(nsString.substring(with:))
        self.buildMetadata = match.range(at: 5).asOptional.map(nsString.substring(with:))
    }

    var versionString: String {
        let prereleaseString = prerelease.map { "-\($0)" } ?? ""
        let buildMetadataString = buildMetadata.map { "+\($0)" } ?? ""
        return "\(major).\(minor).\(patch)\(prereleaseString)\(buildMetadataString)"
    }
    var description: String { versionString }

    var nextMajor: SemanticVersion {
        SemanticVersion(major: major + 1)
    }

    var nextMinor: SemanticVersion {
        SemanticVersion(major: major, minor: minor + 1)
    }
}

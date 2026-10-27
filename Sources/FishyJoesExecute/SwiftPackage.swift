import Foundation

struct SwiftPackage: Decodable {
    enum Dependency {
        case sourceControl(identity: String, location: URL, requirement: Requirement)
        case fileSystem(identity: String, path: String)
        // `path` is the downloaded release, known once the package is resolved.
        case registry(identity: String, requirement: Requirement, path: String?)
        // A registry package published from a directory of a repository that publishes several packages.
        case sibling(identity: String, path: String, published: Published)
        struct Published {
            let repository: URL
            let packagePath: String
            let tagPrefix: String
            let requirement: Requirement
        }
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

        // Swift 5.7+
        case registry
    }

    // Swift 5.5 -> 5.10
    private enum SourceControlCodingKeys: String, CodingKey {
        case identity, location, requirement
    }

    private enum RegistryCodingKeys: String, CodingKey {
        case identity, requirement
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

        if var registryListContainer = try? container.nestedUnkeyedContainer(forKey: .registry) {
            let registryContainer = try registryListContainer.nestedContainer(keyedBy: RegistryCodingKeys.self)
            self = .registry(
                identity: try registryContainer.decode(String.self, forKey: .identity),
                requirement: try registryContainer.decode(Requirement.self, forKey: .requirement),
                path: nil
            )
        } else if var sourceControlListContainer = try? container.nestedUnkeyedContainer(forKey: .sourceControl) {
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
        case .registry(let identity, _, _): return identity
        case .sibling(let identity, _, _): return identity
        }
    }

    var url: URL {
        switch self {
        case .sourceControl(_, let url, _): return url
        case .fileSystem(_, let path), .sibling(_, let path, _): return URL(fileURLWithPath: path)
        case .registry(let identity, _, let path):
            return URL(fileURLWithPath: path ?? ".build/registry/downloads/\(identity.replacingOccurrences(of: ".", with: "/"))")
        }
    }

    var localPath: String {
        return url.scheme == "file" || url.scheme == nil ? url.path : ".build/checkouts/\(url.lastPathComponent)"
    }

    // For a registry dependency, the equivalent source control dependency, which determines how generated
    // packages refer to it.
    private var asSourceControl: Self? {
        switch self {
        case let .registry(identity, requirement, _):
            let name = identity.split(separator: ".").last.map(String.init) ?? identity
            return .sourceControl(identity: identity, location: URL(string: "https://github.com/cricut/\(name)")!, requirement: requirement)
        case let .sibling(identity, _, published):
            return .sourceControl(identity: identity, location: published.repository, requirement: published.requirement)
        case .sourceControl, .fileSystem:
            return nil
        }
    }

    enum GradleVersion: Equatable {
        case inline(_ versionString: String) // version expressed as `api("com.example:package:<VERSION_STRING>")`
        case rich(_ versionLines: [String]) // version expressed as `api("com.example:package") { version { <VERSION_LINES> } }

        func formatLines(forPackage packageName: String) -> [String] {
            switch self {
            case .inline(let versionString):
                return ["api(\"\(packageName):\(versionString)\")"]
            case .rich(let versionLines):
                return [
                    "api(\"\(packageName)\") {",
                    "    version {",
                ] + versionLines.map {
                    "        \($0)"
                } + [
                    "    }",
                    "}",
                ]
            }
        }
    }

    func versionInGradleFormat(flexibleVersions: Bool = false) -> GradleVersion {
        // Gradle version range format using Maven-style syntax. See for details:
        // https://docs.gradle.org/current/userguide/dependency_versions.html#sec:rich-version-constraints
        //
        // When flexibleVersions is true, generates strict inclusive-exclusive ranges with preference for the min.
        // Syntax: '[' = inclusive, ')' = exclusive, '(' = exclusive, ']' = inclusive

        func gradleDefault(_ version: String) -> GradleVersion {
            // Convert anything like "user/branch" into things gradle can parse, even if it probably won't find a release by that name
            return .inline(version.replacingOccurrences(of: "/", with: "-"))
        }
        func range(lower: SemanticVersion, upper: SemanticVersion) -> GradleVersion {
            return .rich(
                [
                    "strictly(\"[\(lower),\(upper))\")",
                    "prefer(\"\(lower)\")",
                ]
            )
        }

        switch self {
        case .sourceControl(_, _, .branch(let name)):
            return gradleDefault(name)
        case .sourceControl(_, _, .revision(let name)):
            return gradleDefault(name)
        case .sourceControl(_, _, .upToNextMajor(let baseVersion)):
            if flexibleVersions {
                return range(lower: baseVersion, upper: baseVersion.nextMajor)
            } else {
                return gradleDefault(baseVersion.versionString)
            }
        case .sourceControl(_, _, .upToNextMinor(let baseVersion)):
            if flexibleVersions {
                return range(lower: baseVersion, upper: baseVersion.nextMinor)
            } else {
                return gradleDefault(baseVersion.versionString)
            }
        case .sourceControl(_, _, .range(let lowerBound, let upperBound)):
            if flexibleVersions {
                return range(lower: lowerBound, upper: upperBound)
            } else {
                return gradleDefault(lowerBound.versionString)
            }
        case .sourceControl(_, _, .exact(let version)):
            if flexibleVersions {
                return .rich(["strictly(\"\(version)\")"])
            } else {
                return gradleDefault(version.versionString)
            }
        case .fileSystem:
            return .inline("local")
        case .registry, .sibling:
            return asSourceControl!.versionInGradleFormat(flexibleVersions: flexibleVersions)
        }
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
        case .registry, .sibling:
            return asSourceControl!.versionInNugetFormat(flexibleVersions: flexibleVersions)
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
        case .registry, .sibling:
            return asSourceControl!.versionInNpmFormat(
                relativeTo: relativeTo,
                addIfLocalPath: addIfLocalPath,
                flexibleVersions: flexibleVersions
            )
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
                return ">=\(baseVersion) <\(baseVersion.nextMinor)"
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
        case .registry, .sibling:
            return asSourceControl!.versionInPubspecFormat(flexibleVersions: flexibleVersions)
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
            return (tagPattern: "{{version}}-dart-publish", versionConstraint: constraint)
        case .registry:
            return asSourceControl!.tagPatternAndVersionConstraint()
        case .sibling(_, _, let published):
            guard let constraint = versionInPubspecFormat(flexibleVersions: true) else { return nil }
            return (tagPattern: "\(published.tagPrefix){{version}}-dart-publish", versionConstraint: constraint)
        }
    }
}

extension SwiftPackage.Dependency.Requirement {
    // The half-open version range, for the requirements a registry dependency can have.
    var versionRange: (lowerBound: SemanticVersion, upperBound: SemanticVersion) {
        switch self {
        case .upToNextMajor(let baseVersion): return (baseVersion, baseVersion.nextMajor)
        case .upToNextMinor(let baseVersion): return (baseVersion, baseVersion.nextMinor)
        case .range(let lowerBound, let upperBound): return (lowerBound, upperBound)
        case .exact(let version):
            return (version, SemanticVersion(major: version.major, minor: version.minor, patch: version.patch + 1))
        case .branch, .revision:
            fatalError("A registry dependency can't require a branch or a revision")
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
    /// Locates the downloaded release of each registry dependency, and recognizes the ones published from a directory
    /// of a repository that publishes several packages by the `packagePath` key in their `fishy-joes.yaml`.
    func resolvingRegistryDependencies() throws -> SwiftPackage {
        struct Resolved: Decodable {
            struct Pin: Decodable {
                struct State: Decodable { let version: String? }
                let identity: String
                let kind: String
                let state: State
            }
            let pins: [Pin]
        }
        let pins = FileManager.default.contents(atPath: "Package.resolved")
            .flatMap { try? JSONDecoder().decode(Resolved.self, from: $0) }?.pins ?? []
        return SwiftPackage(
            dependencies: dependencies.map { dependency in
                guard
                    case let .registry(identity, requirement, _) = dependency,
                    let version = pins.first(where: { $0.kind == "registry" && $0.identity == identity })?.state.version
                else {
                    return dependency
                }
                let path = ".build/registry/downloads/\(identity.replacingOccurrences(of: ".", with: "/"))/\(version)"
                guard
                    FileManager.default.fileExists(atPath: "\(path)/bindings/fishy-joes.yaml"),
                    let config = try? ProjectConfig.readFromFile(basePath: path),
                    let packagePath = config.packagePath,
                    let publishRepository = config.publishRepository
                else {
                    return .registry(identity: identity, requirement: requirement, path: path)
                }
                return .sibling(
                    identity: identity,
                    path: path,
                    published: .init(
                        repository: URL(string: "https://\(publishRepository)")!,
                        packagePath: packagePath,
                        tagPrefix: config.tagPrefix,
                        requirement: requirement
                    )
                )
            },
            targets: targets
        )
    }

    struct DependencyMap {
        var entries: [String: Dependency]
        // Registry identities are `scope.name`; a module is looked up by name.
        subscript(key: String) -> Dependency? {
            entries[key.lowercased()] ?? entries.first { $0.key.split(separator: ".").last.map(String.init) == key.lowercased() }?.value
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

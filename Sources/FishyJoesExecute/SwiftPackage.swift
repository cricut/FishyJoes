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
                        version = "branch:\(branchNames!.first!)"
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

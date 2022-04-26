import Foundation

struct SwiftPackage: Codable {
    struct Dependency: Codable {
        struct SCM: Codable {
            struct Location: Codable {
                let remote: [URL]?
            }
            let identity: String
            let location: Location
        }
        struct Local: Codable {
            let identity: String
            let path: String
        }
        let scm: [SCM]?
        let sourceControl: [SCM]?
        let local: [Local]?
        let fileSystem: [Local]?
    }
    struct Target: Codable {
        let name: String
        let path: String?
    }
    let dependencies: [Dependency]
    let targets: [Target]
}

extension SwiftPackage {
    var dependencyMap: [String: URL] {
        let locals = dependencies.flatMap { ($0.local ?? []) + ($0.fileSystem ?? []) }.map { ($0.identity.lowercased(), URL(string: $0.path)!) }
        let scms = dependencies.flatMap { ($0.scm ?? []) + ($0.sourceControl ?? []) }.compactMap { (scm: Dependency.SCM) -> (String, URL)? in
            guard let url = scm.location.remote?.first else { return nil }
            return (scm.identity.lowercased(), url)
        }
        return Dictionary(uniqueKeysWithValues: locals + scms)
    }

    func path(toTarget targetName: String) -> String? {
        guard let target = targets.first(where: { $0.name == targetName }) else {
            return nil
        }
        return target.path ?? "./Sources/\(targetName)"
    }
}

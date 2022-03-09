import Foundation

struct SwiftPackage: Codable {
    struct Dependency: Codable {
        struct SCM: Codable {
            let identity: String
            let location: URL
        }
        struct Local: Codable {
            let identity: String
            let path: String
        }
        let scm: [SCM]?
        let local: [Local]?
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
        let locals = dependencies.flatMap { $0.local ?? [] }.map { ($0.identity.lowercased(), URL(string: $0.path)!) }
        let scms = dependencies.flatMap { $0.scm ?? [] }.map { ($0.identity.lowercased(), $0.location) }
        return Dictionary(uniqueKeysWithValues: locals + scms)
    }

    func path(toTarget targetName: String) -> String? {
        guard let target = targets.first(where: { $0.name == targetName }) else {
            return nil
        }
        return target.path ?? "./Sources/\(targetName)"
    }
}

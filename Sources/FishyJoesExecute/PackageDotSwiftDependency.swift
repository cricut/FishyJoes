import Foundation

enum PackageDotSwiftDependency {
    // This enum should be kept in sync with the one in the string in CodeGen.swift
    enum Dependency: Codable {
        case local(path: String)
        case remote(url: String, _ refSpec: RefSpec)
        enum RefSpec: Codable {
            case branch(name: String)
            case revision(name: String)
        }
    }
}

extension PackageDotSwiftDependency.Dependency {
    init(from spmDependency: SwiftPackage.Dependency) {
        switch spmDependency {
        case let .fileSystem(_, path):
            self = .local(path: path)
        case let .sourceControl(_, url, .branch(names)) where names.count == 1:
            self = .remote(url: url.absoluteString, .branch(name: names[0]))
        case let .sourceControl(_, url, .revision(names)) where names.count == 1:
            self = .remote(url: url.absoluteString, .revision(name: names[0]))
        case let .sourceControl(_, url, .exact(versions)) where versions.count == 1:
            self = .remote(url: url.absoluteString, .revision(name: versions[0]))
        default:
            fatalError("ill-formed dependency (expected local, branch, or exact):\n  \(spmDependency)")
        }
    }
}

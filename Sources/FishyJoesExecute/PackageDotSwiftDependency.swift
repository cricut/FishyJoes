import Foundation

enum PackageDotSwiftDependency {
    // This enum should be kept in sync with the one in the string in CodeGen.swift
    enum Dependency: Hashable, Codable {
        case local(path: String)
        case remote(url: String, _ refSpec: RefSpec)
        enum RefSpec: Hashable, Codable {
            case branch(name: String)
            case revision(name: String)
            case range(lowerBound: String, upperBound: String)
        }
    }
}

extension PackageDotSwiftDependency.Dependency {
    init(from spmDependency: SwiftPackage.Dependency) {
        switch spmDependency {
        case let .sourceControl(_, url, .branch(name)):
            self = .remote(url: url.absoluteString, .branch(name: name))
        case let .sourceControl(_, url, .revision(name)):
            self = .remote(url: url.absoluteString, .revision(name: name))
        case let .sourceControl(_, url, .upToNextMajor(baseVersion)):
            self = .remote(
                url: url.absoluteString,
                .range(
                    lowerBound: baseVersion.versionString,
                    upperBound: baseVersion.nextMajor.versionString
                )
            )
        case let .sourceControl(_, url, .upToNextMinor(baseVersion)):
            self = .remote(
                url: url.absoluteString,
                .range(
                    lowerBound: baseVersion.versionString,
                    upperBound: baseVersion.nextMinor.versionString
                )
            )
        case let .sourceControl(_, url, .exact(version)):
            self = .remote(url: url.absoluteString, .revision(name: version.versionString))
        case let .sourceControl(_, url, .range(lowerBound, upperBound)):
            self = .remote(
                url: url.absoluteString,
                .range(
                    lowerBound: lowerBound.versionString,
                    upperBound: upperBound.versionString
                )
            )
        case let .fileSystem(_, path):
            self = .local(path: path)
        }
    }
}

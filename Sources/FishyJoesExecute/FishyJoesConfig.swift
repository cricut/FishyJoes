import ArgumentParser
import Foundation
import swsh
import Yams

struct FishyJoesConfig: Codable {
    let module: String
    let publishRepository: String?
    let requiredModules: [String]
    let extraDynamicLibraries: [String]
    let excludeSources: [String]
    let ciPreBuildHook: String?

    // Sometimes sourcery has conflicts with a particular macos or xcode
    // version, so while not recommended normally, this can be used to work
    // around temporary problems.
    let sourceryOverride: SourceryOverride?

    enum SourceryOverride {
        case local(String?) // Local sourcery binary. Will search PATH if nil
        case remote(String) // Run a specific version using mint
    }

    static func readFromFile(basePath: String) throws -> FishyJoesConfig {
        guard let configData = try? cmd("cat", "\(basePath)/bindings/fishy-joes.yaml").runString() else {
            throw ValidationError("missing config file \(basePath)/bindings/fishy-joes.yaml")
        }
        guard let configObject = try? Yams.load(yaml: configData),
              let configDictionary = configObject as? [String: Any]
        else {
            Log.error("fishy-joes.yaml root object must be a dictionary. Should be something like:")
            Log.error("---")
            Log.error("module: CriMyModule")
            Log.error("requiredModules:")
            Log.error("  - CriOtherModule")
            Log.error("excludeSources:")
            Log.error("  - SomeFile.swift")
            Log.error("  - Some/Directory/")
            throw ValidationError("invalid YAML")
        }
        guard let moduleObj = configDictionary["module"] else {
            throw ValidationError("fishy-joes.yaml missing key `module`. Should be the name of the library target you're exporting.")
        }
        guard let module = moduleObj as? String else {
            throw ValidationError("fishy-joes.yaml value for key `module` is not a string. Should be the name of the library target you're exporting.")
        }
        let publishRepository = try configDictionary["publishRepository"].map { obj -> String in
            guard let str = obj as? String else {
                throw ValidationError("fishy-joes.yaml value for key `publishRepository` is not a string")
            }
            return str
        }
        let requiredModules = try configDictionary["requiredModules"].map { obj -> [String] in
            guard let list = obj as? [String] else {
                throw ValidationError("fishy-joes.yaml value for key `requiredModules` is not an array of module names")
            }
            return list
        }
        let extraDynamicLibraries = try configDictionary["extraDynamicLibraries"].map { obj -> [String] in
            guard let list = obj as? [String] else {
                throw ValidationError("fishy-joes.yaml value for key `extraDynamicLibraries` is not an array of file names")
            }
            return list
        }
        let excludeSources = try configDictionary["excludeSources"].map { obj -> [String] in
            guard let list = obj as? [String] else {
                throw ValidationError("fishy-joes.yaml value for key `excludeSources` is not an array of file or directory paths")
            }
            return list
        }
        let ciPreBuildHook = try configDictionary["CIPreBuildHook"].map { obj -> String in
            guard let hook = obj as? String else {
                throw ValidationError("fishy-joes.yaml value for key `CIPreBuildHook` is not a (string) bash script")
            }
            return hook
        }
        let sourceryOverride = try configDictionary["sourceryOverride"].map { obj -> SourceryOverride in
            let dict = obj as? [String: Any]
            if let remote = dict?["remote"] as? String {
                return .remote(remote)
            } else if let path = dict?["local"] as? String {
                return .local(path)
            } else if dict?["local"] is NSNull {
                return .local(nil)
            } else {
                throw ValidationError(#"fishy-joes.yaml value for key `sourceryOverride` is \#(obj), not e.g. `{"remote": "krzysztofzablocki/Sourcery@x.y.z"}`, `{"local": "/path/to/sourcery"}`, or `{"local": null}`"#)
            }
        }

        return FishyJoesConfig(
            module: module,
            publishRepository: publishRepository,
            requiredModules: requiredModules ?? [],
            extraDynamicLibraries: extraDynamicLibraries ?? [],
            excludeSources: excludeSources ?? [],
            ciPreBuildHook: ciPreBuildHook,
            sourceryOverride: sourceryOverride
        )
    }
}

extension FishyJoesConfig.SourceryOverride: Codable {
    enum CodingKeys: CodingKey {
        case local, remote
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let path = try container.decodeIfPresent(String?.self, forKey: .local) {
            self = .local(path)
        } else if let remote = try container.decodeIfPresent(String.self, forKey: .remote) {
            self = .remote(remote)
        } else {
            throw DecodingError.dataCorrupted(DecodingError.Context(codingPath: container.codingPath, debugDescription: "Expected key 'local' or 'remote'"))
        }
    }

    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .local(let path):
            try container.encode(path, forKey: .local)
        case .remote(let remote):
            try container.encode(remote, forKey: .remote)
        }
    }
}

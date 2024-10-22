import ArgumentParser
import swsh
import Yams

struct FishyJoesConfig: Codable {
    let module: String
    let publishRepository: String?
    let requiredModules: [String]
    let extraDynamicLibraries: [String]
    let excludeSources: [String]

    static func readFromFile(basePath: String) throws -> FishyJoesConfig {
        guard let configData = try? cmd("cat", "\(basePath)fishy-joes.yaml").runString() else {
            throw ValidationError("missing config file fishy-joes.yaml")
        }
        guard let configObject = try? Yams.load(yaml: configData),
              let configDictionary = configObject as? [String: Any]
        else {
            print("fishy-joes.yaml root object must be a dictionary. Should be something like:")
            print("---")
            print("module: MyModule")
            print("requiredModules:")
            print("  - othermodule.fishyjoesmodule")
            print("excludeSources:")
            print("  - SomeFile.swift")
            print("  - Some/Directory/")
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
        return FishyJoesConfig(
            module: module,
            publishRepository: publishRepository,
            requiredModules: requiredModules ?? [],
            extraDynamicLibraries: extraDynamicLibraries ?? [],
            excludeSources: excludeSources ?? []
        )
    }
}

import ArgumentParser
import swsh
import Yams

struct FishyJoesConfig: Codable {
    let module: String
    let publishRepository: String?
    let requiredModulePaths: [String]

    static func readFromFile() -> FishyJoesConfig {
        guard let configData = try? cmd("cat", "fishy-joes.yaml").runString() else {
            fatalError("missing config file fishy-joes.yaml")
        }
        guard let configObject = try? Yams.load(yaml: configData) else {
            print("fishy-joes.yaml is not valid YAML. Should be something like:")
            print("---")
            print("module: MyModule")
            print("required-modules:")
            print("  - other-module.fishyjoesmodule")
            fatalError("invalid YAML")
        }
        guard let configDictionary = configObject as? [String: Any] else {
            print("fishy-joes.yaml root object must be a dictionary. Should be something like:")
            print("---")
            print("module: MyModule")
            print("requiredModules:")
            print("  - othermodule.fishyjoesmodule")
            fatalError("invalid YAML")
        }
        guard let moduleObj = configDictionary["module"] else {
            fatalError("fishy-joes.yaml missing key `module`. Should be the name of the library target you're exporting.")
        }
        guard let module = moduleObj as? String else {
            fatalError("fishy-joes.yaml value for key `module` is not a string. Should be the name of the library target you're exporting.")
        }
        let publishRepository = configDictionary["publishRepository"].map { obj -> String in
            guard let str = obj as? String else {
                fatalError("fishy-joes.yaml value for key `publishRepository` is not a string")
            }
            return str
        }
        let requiredModulePaths = configDictionary["requiredModules"].map { obj -> [String] in
            guard let list = obj as? [String] else {
                fatalError("fishy-joes.yaml value for key `requiredModules` is not an array of file paths")
            }
            return list
        }
        return FishyJoesConfig(module: module, publishRepository: publishRepository, requiredModulePaths: requiredModulePaths ?? [])
    }
}

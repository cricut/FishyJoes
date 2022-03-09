import ArgumentParser
import swsh
import Yams

struct FishyJoesConfig: Codable {
    let module: String
    let publishRepository: String?

    static func readFromFile() throws -> FishyJoesConfig {
        guard let configData = try? cmd("cat", "fishy-joes.yaml").runString() else {
            throw ValidationError("missing config file fishy-joes.yaml")
        }
        guard let configObject = try? Yams.load(yaml: configData) else {
            print("fishy-joes.yaml is not valid YAML. Should be something like:")
            print("---")
            print("module: MyModule")
            throw ValidationError("invalid YAML")
        }
        guard let configDictionary = configObject as? [String: Any] else {
            print("fishy-joes.yaml root object must be a dictionary. Should be something like:")
            print("---")
            print("module: MyModule")
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
        return FishyJoesConfig(module: module, publishRepository: publishRepository)
    }
}

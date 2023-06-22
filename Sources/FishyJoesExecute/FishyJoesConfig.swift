import ArgumentParser
import Foundation
import swsh
import Yams

struct FishyJoesConfig {
    let module: String
    let publishRepository: String?
    let requiredModules: [String]
    let typeOverrides: [String: Any]?

    static func readFromFile() throws -> FishyJoesConfig {
        let exampleYAML = """
           ---
           module: MyModule
           typeOverrides: [ typeName: ExternalTranslatedType ]
           requiredModules:
             - otherModule.fishyjoesmodule

        """
        guard let configData = try? cmd("cat", "fishy-joes.yaml").runString() else {
            throw ValidationError("missing config file fishy-joes.yaml")
        }
        guard let configObject = try? Yams.load(yaml: configData) else {
            print("fishy-joes.yaml is not valid YAML. Should be something like:")
            print(exampleYAML)
            throw ValidationError("invalid YAML")
        }
        guard let configDictionary = configObject as? [String: Any] else {
            print("fishy-joes.yaml root object must be a dictionary. Should be something like:")
            print(exampleYAML)
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
        let typeOverrides: [String: Any]? = try configDictionary["typeOverrides"].map { obj -> [String: Any] in
            guard let map = obj as? [String: Any] else {
                throw ValidationError("fishy-joes.yaml value for key `typeOverrides` is not a map of String to ExternalTranslatedType")
            }
            return map
        }
        return FishyJoesConfig(module: module, publishRepository: publishRepository, requiredModules: requiredModules ?? [], typeOverrides: typeOverrides)
    }
}

extension FishyJoesConfig: Codable {
    enum CodingKeys: CodingKey {
        case module
        case publishRepository
        case requiredModules
        case typeOverrides
    }

    init(from decoder: Decoder) throws {
        let container: KeyedDecodingContainer<FishyJoesConfig.CodingKeys> = try decoder.container(keyedBy: FishyJoesConfig.CodingKeys.self)

        self.module = try container.decode(String.self, forKey: FishyJoesConfig.CodingKeys.module)
        self.publishRepository = try container.decodeIfPresent(String.self, forKey: FishyJoesConfig.CodingKeys.publishRepository)
        self.requiredModules = try container.decode([String].self, forKey: FishyJoesConfig.CodingKeys.requiredModules)
        self.typeOverrides = try JSONSerialization.jsonObject(with: container.decode(Data.self, forKey: FishyJoesConfig.CodingKeys.typeOverrides)) as? [String: Any]
    }

    func encode(to encoder: Encoder) throws {
        var container: KeyedEncodingContainer<FishyJoesConfig.CodingKeys> = encoder.container(keyedBy: FishyJoesConfig.CodingKeys.self)

        try container.encode(self.module, forKey: FishyJoesConfig.CodingKeys.module)
        try container.encodeIfPresent(self.publishRepository, forKey: FishyJoesConfig.CodingKeys.publishRepository)
        try container.encode(self.requiredModules, forKey: FishyJoesConfig.CodingKeys.requiredModules)
        if let typeOverrides = typeOverrides {
            try container.encode(JSONSerialization.data(withJSONObject: typeOverrides), forKey: FishyJoesConfig.CodingKeys.typeOverrides)
        }
    }
}

import Foundation

struct Module: Hashable, CustomStringConvertible, Codable {
    let name: String
    let dependencies: [String]
    let extraDynamicLibraries: [String]

    init(
        name: String,
        dependencies: [String],
        extraDynamicLibraries: [String] = []
    ) {
        self.name = name
        self.dependencies = dependencies.sorted()
        self.extraDynamicLibraries = extraDynamicLibraries
    }

    var kotlinPackage: String { "com.cricut.\(name.lowercased())" }
    var cSharpNamespace: String { "Cricut.\(name)" }
    var dartNamespace: String { name }
    var description: String { name }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.dependencies = try container.decode([String].self, forKey: .dependencies)
        self.extraDynamicLibraries = try container.decodeIfPresent([String].self, forKey: .extraDynamicLibraries) ?? []
    }
}

extension Module {
    var dllImportMark: String {
        "[DllImport(\"\(iotaLibName)\", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]"
    }

    var iotaLibName: String {
        name == "FishyJoesRuntime" ? "FishyJoesIotaRuntime" : "\(name)-iota"
    }

    static var runtime: Module {
        Module(
            name: "FishyJoesRuntime",
            dependencies: [],
            extraDynamicLibraries: []
        )
    }
}

import Foundation

struct Module: Hashable, CustomStringConvertible, Codable {
    let name: String
    let dependencies: [String]

    var kotlinPackage: String { "com.cricut.\(name.lowercased())" }
    var cSharpNamespace: String { "Cricut.\(name)" }
    var dartNamespace: String { snakify(name) }
    var description: String { name }
}

extension Module {
    var dllImportMark: String {"[DllImport(\"\(iotaLibName)\", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]"
    }

    var iotaLibName: String {
        name == "FishyJoesRuntime" ? "FishyJoesIotaRuntime" : "\(name)-iota"
    }

    static var runtime: Module {
        Module(
            name: "FishyJoesRuntime",
            dependencies: []
        )
    }
}

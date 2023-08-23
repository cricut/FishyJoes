import Foundation

struct Module: Hashable, CustomStringConvertible, Codable {
    let name: String
    let dependencies: [String]

    var kotlinPackage: String { "com.cricut.\(name.lowercased())" }
    var cSharpNamespace: String { "Cricut.\(name)" }
    var description: String { name }
}

extension Module {
    var dllImportMark: String {
        "[DllImport(\"\(cSharpLibName)\", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]"
    }

    var cSharpLibName: String {
        name == "FishyJoesRuntime" ? "FishyJoesCSharpRuntime" : "\(name)-c-sharp"
    }

    static var runtime: Module {
        Module(
            name: "FishyJoesRuntime",
            dependencies: []
        )
    }
}

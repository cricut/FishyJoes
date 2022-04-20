import Foundation

struct Module: CustomStringConvertible {
    let name: String
    let dependencies: [String]

    var kotlinPackage: String { "com.cricut.\(name.lowercased())" }
    var cSharpNamespace: String { "Cricut.\(name)" }
    var description: String { name }
}

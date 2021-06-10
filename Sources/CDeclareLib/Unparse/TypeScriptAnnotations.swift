struct TypeScriptAnnotations {
    indirect enum TSType {
        case unknown(String)
        case optional(TSType)
        case union([TSType])
        case exactString(String)
    }

    struct Variable {
        let readOnly: Bool
        let name: String
        let type: TSType
    }

    struct Method {
        let isStatic: Bool
        let name: String
        let parameters: [(name: String, type: TSType)]
        let returnType: TSType
    }

    struct Typealias {
        let name: String
        let value: TSType
    }

    struct Class {
        let name: String
        let fields: [Variable]
        let methods: [Method]
    }

    let moduleName: String
    var typealiases: [Typealias] = []
    var classes: [Class] = []
}

extension TypeScriptAnnotations.TSType: CustomStringConvertible {
    var description: String {
        switch self {
        case let .unknown(name):
            return name
        case let .optional(wrapped):
            return "undefined | \(wrapped)"
        case let .union(types):
            return types.map(\.description).joined(separator: " | ")
        case let .exactString(string):
            return "\"\(string)\""
        }
    }

    var annotation: String {
        switch self {
        case let .optional(wrapped):
            return "?: \(wrapped)"
        default:
            return ": \(description)"
        }
    }
}

extension TypeScriptAnnotations {
    var fragment: SourceFragment {
        let fragment = SourceFragment(sourceryDestination: "file:../../node/\(moduleName).d.ts")
        fragment.outputBlock("export namespace \(moduleName) {") {
            for alias in typealiases {
                fragment.output("type \(alias.name) = \(alias.value)")
            }
            for tsClass in classes {
                fragment.outputBlock("class \(tsClass.name) {") {
                    for field in tsClass.fields {
                        fragment.output("\(field.readOnly ? "readOnly " : "")\(field.name)\(field.type.annotation)")
                    }
                    for method in tsClass.methods {
                        fragment.outputBlock("\(method.isStatic ? "static " : "")\(method.name)(", newLineTerminated: false) {
                            fragment.outputMap(method.parameters, separator: ",") { parameter in
                                "\(parameter.name)\(parameter.type.annotation)"
                            }
                        }
                        fragment.output("\(method.returnType.annotation);")
                    }
                }
            }
        }
        fragment.output("export default \(moduleName);")
        return fragment
    }
}

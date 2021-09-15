struct TypeScriptAnnotations {
    indirect enum TSType {
        case named(String)
        case optional(TSType)
        case union([TSType])
        case exactString(String)
    }

    struct Variable {
        let documentation: [String]
        let readOnly: Bool
        let name: String
        let type: TSType
    }

    struct Method {
        let documentation: [String]
        let isStatic: Bool
        let name: String
        let parameters: [(labelComment: String?, name: String, type: TSType)]
        let returnType: TSType
    }

    struct Typealias {
        let name: String
        let value: TSType
    }

    struct Class {
        let documentation: [String]
        let name: String
        let constructor: Constructor
        let fields: [Variable]
        let methods: [Method]

        enum Constructor {
            case hidden
            case visible([(name: String, type: TSType)])
        }
    }

    let moduleName: String
    var typealiases: [Typealias] = [
        Typealias(name: "Optional<T>", value: .union([.named("T"), .named("undefined")])),
    ]
    var classes: [Class] = []
}

extension TypeScriptAnnotations.TSType: CustomStringConvertible {
    var description: String {
        switch self {
        case let .named(name):
            return name
        case let .optional(wrapped):
            return "Optional<\(wrapped)>"
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
        let fragment = SourceFragment(sourceryDestination: "file:NodeInterface/\(moduleName).d.ts")

        func document(_ documentation: [String]) {
            guard !documentation.isEmpty else { return }
            fragment.output("/**")
            for line in documentation {
                fragment.output(" " + "* \(line)".trimmingCharacters(in: .whitespaces))
            }
            fragment.output(" */")
        }

        func split(name: String) -> (namespace: [String], name: String) {
            var namespaceParts = name.split(separator: ".").map(String.init)
            let name = namespaceParts.popLast()!
            return (namespaceParts, name)
        }

        func outputNamespace(_ namespace: [String], _ body: () -> Void) {
            guard let name = namespace.first else {
                body()
                return
            }
            fragment.outputBlock("namespace \(name) {") {
                outputNamespace(Array(namespace.dropFirst()), body)
            }
        }

        fragment.outputBlock("export namespace \(moduleName) {") {
            for tsClass in classes {
                let (namespace, name) = split(name: tsClass.name)
                outputNamespace(namespace) {
                    document(tsClass.documentation)
                    fragment.outputBlock("class \(name) {") {
                        switch tsClass.constructor {
                        case .hidden:
                            fragment.output("private constructor()")
                        case .visible(let parameters):
                            fragment.outputBlock("constructor(") {
                                fragment.outputMap(parameters, separator: ",") { parameter in
                                    "\(parameter.name): \(parameter.type)"
                                }
                            }
                        }

                        for field in tsClass.fields {
                            document(field.documentation)
                            fragment.output("\(field.readOnly ? "readonly " : "")\(field.name)\(field.type.annotation);")
                        }
                        for method in tsClass.methods {
                            document(method.documentation)
                            fragment.outputBlock("\(method.isStatic ? "static " : "")\(method.name)(", newLineTerminated: false) {
                                fragment.outputMap(method.parameters, separator: ",") { parameter in
                                    let labelComment = parameter.labelComment.map { "/* \($0) */ " } ?? ""
                                    return "\(labelComment)\(parameter.name): \(parameter.type)"
                                }
                            }
                            fragment.output(": \(method.returnType);")
                        }
                    }
                }
            }
            for alias in typealiases {
                let (namespace, name) = split(name: alias.name)
                outputNamespace(namespace) {
                    fragment.output("type \(name) = \(alias.value);")
                }
            }
        }
        fragment.output("export declare function init(): Promise<typeof \(moduleName)>;")
        fragment.output("export default \(moduleName);")
        return fragment
    }
}

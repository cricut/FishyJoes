struct TypeScriptAnnotations: Codable {
    enum TSType: Codable {
        case named(String)
        indirect case optional(TSType)
        case union([TSType])
        case exactString(String)
    }

    struct Variable: Codable {
        let documentation: [String]
        let readOnly: Bool
        let isStatic: Bool
        let name: String
        let type: TSType
    }

    struct Method: Codable {
        struct Parameter: Codable {
            let labelComment: String?
            let name: String
            let type: TSType
        }
        let documentation: [String]
        let isStatic: Bool
        let name: String
        let parameters: [Parameter]
        let returnType: TSType
    }

    struct Typealias: Codable {
        let documentation: [String]
        var name: String
        let value: TSType
    }

    struct Class: Codable {
        let documentation: [String]
        var name: String
        let superclass: String?
        var exported: Bool
        let constructor: Constructor
        let fields: [Variable]
        let methods: [Method]

        enum Constructor {
            case hidden
            case visible([(name: String, type: TSType)])
        }

        init(
            documentation: [String] = [],
            name: String,
            superclass: String? = nil,
            exported: Bool = true,
            constructor: Constructor,
            fields: [Variable],
            methods: [Method]
        ) {
            self.documentation = documentation
            self.name = name
            self.superclass = superclass
            self.exported = exported
            self.constructor = constructor
            self.fields = fields
            self.methods = methods
        }
    }

    class Namespace: Codable {
        let name: String
        var classes: [Class]
        var typealiases: [Typealias]
        var namespaces: [String: Namespace]

        init(name: String, classes: [Class] = [], typealiases: [Typealias] = [], namespaces: [String: Namespace] = [:]) {
            self.name = name
            self.classes = classes
            self.typealiases = typealiases
            self.namespaces = namespaces
        }
    }

    var rootNamespaces: [Namespace]
    let defaultNamespace: String
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
    private func parseNamespace(for name: String) -> (namespace: Namespace, name: String) {
        func find<S: Collection>(_ base: Namespace, _ parts: S) -> Namespace where S.Element == String {
            guard let name = parts.first else {
                return base
            }
            let subNamespace = base.namespaces[name, default: Namespace(name: name)]
            base.namespaces[name] = subNamespace
            return find(subNamespace, parts.dropFirst())
        }
        var namespaceParts = name.split(separator: ".").map(String.init)
        let name = namespaceParts.popLast()!

        let rootNamespace = rootNamespaces.first { $0.name == defaultNamespace }!

        return (find(rootNamespace, namespaceParts), name)
    }

    func add(`typealias` alias: Typealias) {
        let (namespace, name) = parseNamespace(for: alias.name)
        var newAlias = alias
        newAlias.name = name
        namespace.typealiases.append(newAlias)
    }

    func add(`class` tsClass: Class) {
        let (namespace, name) = parseNamespace(for: tsClass.name)
        var newClass = tsClass
        newClass.name = name
        namespace.classes.append(newClass)
    }

    var fragment: SourceFragment {
        let fragment = SourceFragment(sourceryDestination: "file:NodeInterface/\(defaultNamespace).d.ts")

        fragment.output("export type Optional<T> = T | undefined;")

        func document(_ documentation: [String]) {
            guard !documentation.isEmpty else { return }
            fragment.output("/**")
            for line in documentation {
                fragment.output(" " + "* \(line)".trimmingCharacters(in: .whitespaces))
            }
            fragment.output(" */")
        }

        func output(namespace: Namespace, declare: Bool = false) {
            var processedNamespaces: Set<String> = []
            fragment.outputBlock("export \(declare ? "declare " : "")namespace \(namespace.name) {") {
                for tsClass in namespace.classes {
                    document(tsClass.documentation)
                    if tsClass.exported {
                        fragment.output("export ", newLineTerminated: false)
                    }
                    fragment.outputBlock("class \(tsClass.name) \(tsClass.superclass.map { "extends \($0) " } ?? ""){") {
                        switch tsClass.constructor {
                        case .hidden:
                            fragment.output("private constructor()")
                            fragment.blankLine()
                        case .visible(let parameters):
                            fragment.output("constructor(\(parameters.map { "\($0.name): \($0.type)" }.joined(separator: ", ")))")
                            fragment.blankLine()
                        }

                        for field in tsClass.fields {
                            document(field.documentation)
                            if field.isStatic {
                                fragment.output("static ", newLineTerminated: false)
                            }
                            if field.readOnly {
                                fragment.output("readonly ", newLineTerminated: false)
                            }
                            fragment.output("\(field.name)\(field.type.annotation);")
                            fragment.blankLine()
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
                            fragment.blankLine()
                        }
                    }
                    // Better organized output if extensions are next to definitions
                    if let matchingNamespace = namespace.namespaces[tsClass.name] {
                        output(namespace: matchingNamespace)
                        processedNamespaces.insert(matchingNamespace.name)
                    }
                    fragment.blankLine()
                }
                for alias in namespace.typealiases {
                    fragment.output("export type \(alias.name) = \(alias.value);")
                }
                fragment.blankLine()
                for namespace in namespace.namespaces.sorted(by: { $0.key < $1.key }).map(\.value) {
                    if processedNamespaces.contains(namespace.name) {
                        continue
                    }
                    output(namespace: namespace)
                }
            }
            fragment.blankLine()
        }
        rootNamespaces.forEach { output(namespace: $0, declare: true) }
        fragment.outputBlock("export declare function init(): Promise<{", closeWith: "}>;") {
            for rootNamespace in rootNamespaces {
                fragment.output("\(rootNamespace.name): typeof \(rootNamespace.name),")
            }
        }
        fragment.output("export default \(defaultNamespace);")
        return fragment
    }
}

// Tuples aren't codable :(
extension TypeScriptAnnotations.Class.Constructor: Codable {
    fileprivate struct NameType: Codable {
        let name: String
        let type: TypeScriptAnnotations.TSType
    }

    init(from decoder: Decoder) throws {
        if let args = try [NameType]?.init(from: decoder) {
            self = .visible(args.map { ($0.name, $0.type) })
        } else {
            self = .hidden
        }
    }

    func encode(to encoder: Encoder) throws {
        let codable: [NameType]?
        switch self {
        case .hidden:
            codable = nil
        case .visible(let args):
            codable = args.map { NameType(name: $0.name, type: $0.type) }
        }
        try codable.encode(to: encoder)
    }
}

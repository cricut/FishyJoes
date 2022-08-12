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
            let defaultValue: String?
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

    struct Interface: Codable {
        var name: String
        var forNamespace: String?
        var fields: [Variable]
        var methods: [Method]

        init(
            name: String,
            forNamespace: String? = nil,
            fields: [Variable],
            methods: [Method]
        ) {
            self.name = name
            self.forNamespace = forNamespace
            self.fields = fields
            self.methods = methods
        }
    }

    struct Class: Codable {
        let documentation: [String]
        var name: String
        let extends: [String]
        let constructor: Constructor
        let fields: [Variable]
        let methods: [Method]

        enum Constructor {
            case hidden
            case protectedNever
            case visible([(name: String, type: TSType)])
        }

        init(
            documentation: [String] = [],
            name: String,
            extends: [String] = [],
            constructor: Constructor,
            fields: [Variable],
            methods: [Method]
        ) {
            self.documentation = documentation
            self.name = name
            self.extends = extends
            self.constructor = constructor
            self.fields = fields
            self.methods = methods
        }
    }

    class Namespace: Codable {
        var name: String
        var classes: [Class]
        var interfaces: [Interface]
        var typealiases: [Typealias]
        var fields: [Variable]
        var methods: [Method]
        var namespaces: [String: Namespace]

        init(
            name: String,
            classes: [Class] = [],
            interfaces: [Interface] = [],
            typealiases: [Typealias] = [],
            fields: [Variable] = [],
            methods: [Method] = [],
            namespaces: [String: Namespace] = [:]
        ) {
            self.name = name
            self.classes = classes
            self.interfaces = interfaces
            self.typealiases = typealiases
            self.fields = fields
            self.methods = methods
            self.namespaces = namespaces
        }

        func merge(_ other: Namespace) {
            classes += other.classes
            interfaces += other.interfaces
            typealiases += other.typealiases
            fields += other.fields
            methods += other.methods
            namespaces.merge(other.namespaces) { left, right in
                left.merge(right)
                return left
            }
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
            return types.isEmpty ? "never" : types.map(\.description).joined(separator: " | ")
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

    static var void: Self {
        return .named("void")
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

    func add(interface: Interface) {
        let (namespace, name) = parseNamespace(for: interface.name)
        var newInterface = interface
        newInterface.name = name
        namespace.interfaces.append(newInterface)
    }

    func add(namespace: Namespace) {
        let (containingNamespace, name) = parseNamespace(for: namespace.name)
        namespace.name = name
        if let old = containingNamespace.namespaces[name] {
            old.merge(namespace)
        } else {
            containingNamespace.namespaces[name] = namespace
        }
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

        func output(method: Method, inClass: Bool) {
            document(method.documentation)
            if !inClass {
                fragment.output("function ", newLineTerminated: false)
            } else if method.isStatic {
                fragment.output("static ", newLineTerminated: false)
            }
            fragment.outputBlock("\(method.name)(", newLineTerminated: false) {
                let requiredParams = method.parameters.filter { $0.defaultValue == nil }
                let optionalParams = method.parameters.filter { $0.defaultValue != nil }

                var isFirst = true
                func outputComma() {
                    if !isFirst {
                        fragment.output(",")
                    }
                    isFirst = false
                }

                for parameter in requiredParams {
                    outputComma()
                    let labelComment = parameter.labelComment.map { "/* \($0) */ " } ?? ""
                    fragment.output("\(labelComment)\(parameter.name): \(parameter.type)", newLineTerminated: false)
                }
                if !optionalParams.isEmpty {
                    outputComma()
                    fragment.outputBlock("options?: {", newLineTerminated: false) {
                        for parameter in optionalParams {
                            let labelComment = parameter.labelComment.map { "/* \($0) */ " } ?? ""
                            fragment.output("\(labelComment)\"\(parameter.name)\"?: \(parameter.type) /* defaults to `\(parameter.defaultValue!)` */,")
                        }
                    }
                }
                if !isFirst {
                    fragment.output()
                }
            }
            fragment.output(": \(method.returnType);")
            fragment.blankLine()
        }

        func output(field: Variable, inClass: Bool) {
            document(field.documentation)
            if inClass {
                if field.isStatic {
                    fragment.output("static ", newLineTerminated: false)
                }
                if field.readOnly {
                    fragment.output("readonly ", newLineTerminated: false)
                }
                fragment.output("\(field.name)\(field.type.annotation);")
                fragment.blankLine()
            } else {
                fragment.output("\(field.readOnly ? "const" : "var") \(field.name): \(field.type);")
                fragment.blankLine()
            }
        }

        func output(namespace: Namespace, declare: Bool = false) {
            var processedNamespaces: Set<String> = []
            fragment.outputBlock("export \(declare ? "declare " : "")namespace \(namespace.name) {") {
                for tsClass in namespace.classes {
                    if !tsClass.extends.isEmpty  {
                        fragment.output("interface \(tsClass.name) extends \(tsClass.extends.joined(separator: ", ")) {}")
                    }

                    document(tsClass.documentation)
                    fragment.output("export ", newLineTerminated: false)
                    fragment.outputBlock("class \(tsClass.name) {") {
                        switch tsClass.constructor {
                        case .hidden:
                            fragment.output("private constructor()")
                            fragment.output("private _inhibitStructuralTyping: any")
                            fragment.blankLine()
                        case .protectedNever:
                            fragment.output("protected constructor(dontSubclassMe: never)")
                            fragment.output("private _inhibitStructuralTyping: any")
                            fragment.blankLine()
                        case .visible(let parameters):
                            fragment.output("constructor(\(parameters.map { "\($0.name): \($0.type)" }.joined(separator: ", ")))")
                            fragment.blankLine()
                        }

                        for field in tsClass.fields {
                            output(field: field, inClass: true)
                        }
                        for method in tsClass.methods  {
                            output(method: method, inClass: true)
                        }
                    }
                    fragment.blankLine()
                }

                for interface in namespace.interfaces {
                    fragment.outputBlock("interface \(interface.name) {") {
                        for field in interface.fields {
                            output(field: field, inClass: true)
                        }
                        for method in interface.methods {
                            output(method: method, inClass: true)
                        }
                    }

                    // Better organized output if extensions are next to definitions
                    if let matchingNamespace = interface.forNamespace.flatMap({ namespace.namespaces[$0] }) {
                        output(namespace: matchingNamespace)
                        processedNamespaces.insert(matchingNamespace.name)
                    }
                }

                for field in namespace.fields {
                    output(field: field, inClass: false)
                }
                for method in namespace.methods {
                    output(method: method, inClass: false)
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
    fileprivate enum CodingType: Codable {
        case hidden
        case protectedNever
        case visible(names: [String], types: [TypeScriptAnnotations.TSType])
    }

    init(from decoder: Decoder) throws {
        switch try CodingType.init(from: decoder) {
        case .hidden:
            self = .hidden
        case .protectedNever:
            self = .protectedNever
        case let .visible(names, types):
            self = .visible(Array(zip(names, types)))
        }
    }

    func encode(to encoder: Encoder) throws {
        let codable: CodingType
        switch self {
        case .hidden:
            codable = .hidden
        case .protectedNever:
            codable = .protectedNever
        case .visible(let args):
            codable = .visible(names: args.map(\.name), types: args.map(\.type))
        }
        try codable.encode(to: encoder)
    }
}

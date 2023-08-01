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
            let label: String?
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

        // .d.ts file should be grouped in a logical order.
        // In particular we always want type definitions (typealiases) next to the operations on that type (namespaces)
        enum AlphabeticalMember {
            case `typealias`(Typealias)
            case interface(Interface)
            case `class`(Class)
            case namespace(Namespace)
            case method(Method)
            case field(Variable)

            var name: String {
                switch self {
                case .typealias(let alias):
                    return alias.name
                case .interface(let interface):
                    return interface.name
                case .class(let tsClass):
                    return tsClass.name
                case .namespace(let namespace):
                    return namespace.name
                case .method(let method):
                    return method.name
                case .field(let field):
                    return field.name
                }
            }

            var tiebreaker: Int {
                switch self {
                case .typealias: return 0
                case .interface: return 1
                case .class: return 2
                case .namespace: return 3
                case .method: return 4
                case .field: return 5
                }
            }
        }

        var alphabeticalMembers: [AlphabeticalMember] {
            var members: [AlphabeticalMember] = []
            members.append(contentsOf: classes.map { AlphabeticalMember.class($0) })
            members.append(contentsOf: interfaces.map { AlphabeticalMember.interface($0) })
            members.append(contentsOf: typealiases.map { AlphabeticalMember.typealias($0) })
            members.append(contentsOf: fields.map { AlphabeticalMember.field($0) })
            members.append(contentsOf: methods.map { AlphabeticalMember.method($0) })
            members.append(contentsOf: namespaces.map { AlphabeticalMember.namespace($0.value) })
            members.sort { ($0.name, $0.tiebreaker) < ($1.name, $1.tiebreaker) }
            return members
        }

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

//        fragment.output("export type Optional<T> = T | undefined;")
//        fragment.blankLine()
//
//        fragment.output("/**")
//        fragment.output(" * A half-open interval from a lower bound up to, but not including, an upper bound.")
//        fragment.output(" *")
//        fragment.output(" * @remarks")
//        fragment.output(" * Represents the concept of a half-open range of values using rules identical to those used by Swift.")
//        fragment.output(" * A Swift range requires that its lower bound be less-than-or-equal-to its upper bound.")
//        fragment.output(" *")
//        fragment.output(" * Because a half-open range does not include its upper bound, a half-open range whose lower bound")
//        fragment.output(" * is equal to the upper bound represents an empty range.")
//        fragment.output(" *")
//        fragment.output(" * @param lowerBound - The lower value of the range, inclusive.")
//        fragment.output(" * @param upperBound - The upper value of the range, exclusive.")
//        fragment.output(" */")
//        fragment.output("export type SwiftRange<T> = { lowerBound: T, upperBoundExclusive: T };")
//        fragment.blankLine()
//
//        fragment.output("/**")
//        fragment.output(" * An interval from a lower bound up to, and including, an upper bound.")
//        fragment.output(" *")
//        fragment.output(" * @remarks")
//        fragment.output(" * Represents the concept of a range of values using rules identical to those used by Swift.")
//        fragment.output(" * A Swift range requires that its lower bound be less-than-or-equal-to its upper bound.")
//        fragment.output(" *")
//        fragment.output(" * Because a closed range includes its upper bound, a closed range whose lower bound")
//        fragment.output(" * is equal to the upper bound contains that value. Therefore, a SwiftClosedRange instance")
//        fragment.output(" * cannot represent an empty range.")
//        fragment.output(" *")
//        fragment.output(" * @param lowerBound - The lower value of the range, inclusive.")
//        fragment.output(" * @param upperBound - The upper value of the range, inclusive.")
//        fragment.output(" */")
//        fragment.output("export type SwiftClosedRange<T> = { lowerBound: T, upperBoundInclusive: T };")
//        fragment.blankLine()

        fragment.outputBlock("import {") {
            fragment.output("Optional,")
            fragment.output("SwiftRange,")
            fragment.output("SwiftClosedRange,")
            fragment.output("AttributeContainer,")
            fragment.output("AttributeContainerFoundationAttributes,")
            fragment.output("AttributedString,")
            fragment.output("AttributedSubstring,")
        }
        fragment.output("from '@cricut/fishyjoes-runtime';")
        fragment.output("export * from '@cricut/fishyjoes-runtime';")
        fragment.blankLine()

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
                    let labelComment = parameter.label.map { "/* \($0) */ " } ?? ""
                    fragment.output("\(labelComment)\(parameter.name): \(parameter.type)", newLineTerminated: false)
                }
                if !optionalParams.isEmpty {
                    outputComma()
                    fragment.outputBlock("options?: {", newLineTerminated: false) {
                        for parameter in optionalParams {
                            fragment.output("\"\(parameter.label ?? parameter.name)\"?: \(parameter.type) /* defaults to `\(parameter.defaultValue!)` */,")
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
                fragment.output("\(field.readOnly ? "const" : "let") \(field.name): \(field.type);")
                fragment.blankLine()
            }
        }

        func output(namespace: Namespace, declare: Bool = false) {
            fragment.outputBlock("export \(declare ? "declare " : "")namespace \(namespace.name) {") {
                var previousName: String?
                for thing in namespace.alphabeticalMembers {
                    // blank line between differently named things
                    if let prev = previousName, prev != thing.name {
                        fragment.blankLine()
                    }
                    previousName = thing.name

                    switch thing {
                    case .class(let tsClass):
                        if !tsClass.extends.isEmpty {
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
                            for method in tsClass.methods {
                                output(method: method, inClass: true)
                            }
                        }
                    case .interface(let interface):
                        fragment.outputBlock("interface \(interface.name) {") {
                            for field in interface.fields {
                                output(field: field, inClass: true)
                            }
                            for method in interface.methods {
                                output(method: method, inClass: true)
                            }
                        }
                    case .field(let field):
                        output(field: field, inClass: false)
                    case .method(let method):
                        output(method: method, inClass: false)
                    case .typealias(let alias):
                        fragment.output("export type \(alias.name) = \(alias.value);")
                    case .namespace(let namespace):
                        output(namespace: namespace)
                    }
                }
            }
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
        switch try CodingType(from: decoder) {
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

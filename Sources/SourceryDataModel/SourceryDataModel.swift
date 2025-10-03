// THIS FILE IS SPECIAL!
// It is a normal swift file built as part of the package.
// It is *also* inserted verbatim into the sourcery template.
// This file is kept dependency-free to work well in both contexts.
// Moving things into or out of this file may break generation.

// TODO: documentation, probably moslty copied from or linked to the sourcery docs

public protocol Documented {
    var documentation: [String] { get }
}

// MARK: Top level information

public struct SourceryTemplateContext: Hashable, Codable {
    public let types: [SourceryType]
    public let functions: [SourceryMethod]
}

// MARK: Types

public enum SourceryTypeKind: Hashable, Codable {
    case `struct`, `enum`, `class`, `actor`, `protocol`, `extension`
    case unknown(String)
}

public struct SourceryType: Documented, Hashable, Codable {
    public let kind: SourceryTypeKind

    // For all kinds
    public let name: SourceryTypeName
    public let documentation: [String]
    public let computedVariables: [SourceryVariable]
    public let methods: [SourceryMethod]
    public let implements: [SourceryTypeName]
    public let globalName: String
    public let based: [String]
    public let rawVariables: [SourceryVariable]
    public let rawMethods: [SourceryMethod]

    // For enum
    public let cases: [SourceryEnumCase]

    // For struct, actor, and class
    public let storedVariables: [SourceryVariable]
}

public struct SourceryEnumCase: Documented, Hashable, Codable {
    public let documentation: [String]
    public let name: String
    public let associatedValues: [AssociatedValue]

    public struct AssociatedValue: Hashable, Codable {
        public let localName: String?
        public let externalName: String?
        public let typeName: SourceryTypeName
    }
}

// This type is terrible, but it matches Sourcery
// Immutable class to avoid problems with infinite-sized struct
public final class SourceryTypeName {
    fileprivate struct Contents: Hashable, Codable {
        let actualTypeName: SourceryTypeName?
        let unwrappedTypeName: String
        let isVoid: Bool
        let tuple: Tuple?
        let array: Array?
        let dictionary: Dictionary?
        let closure: Closure?
        let generic: Generic?
        let isOptional: Bool
    }
    private let contents: Contents

    private init(_ contents: Contents) {
        self.contents = contents
    }

    public var actualTypeName: SourceryTypeName? { contents.actualTypeName }
    public var unwrappedTypeName: String { contents.unwrappedTypeName }
    public var isVoid: Bool { contents.isVoid }
    public var tuple: Tuple? { contents.tuple }
    public var array: Array? { contents.array }
    public var dictionary: Dictionary? { contents.dictionary }
    public var closure: Closure? { contents.closure }
    public var generic: Generic? { contents.generic }
    public var isOptional: Bool { contents.isOptional }

    public struct Tuple: Hashable, Codable {
        public let elements: [Element]
        public struct Element: Hashable, Codable {
            public let name: String
            public let typeName: SourceryTypeName
        }
    }

    public struct Array: Hashable, Codable {
        public let elementTypeName: SourceryTypeName
    }

    public struct Dictionary: Hashable, Codable {
        public let keyTypeName: SourceryTypeName
        public let valueTypeName: SourceryTypeName
    }

    public struct Closure: Hashable, Codable {
        public let parameters: [SourceryTypeName]
        public let returnTypeName: SourceryTypeName
        public let isAsync: Bool
        public let isThrowing: Bool
    }

    public struct Generic: Hashable, Codable {
        public let name: String
        public let typeParameters: [SourceryTypeName]
    }
}

extension SourceryTypeName: Hashable, Codable {
    public static func == (lhs: SourceryTypeName, rhs: SourceryTypeName) -> Bool {
        lhs.contents == rhs.contents
    }

    public func hash(into hasher: inout Hasher) {
        contents.hash(into: &hasher)
    }

    public func encode(to encoder: any Encoder) throws {
        try contents.encode(to: encoder)
    }

    public convenience init(from decoder: any Decoder) throws {
        self.init(try Contents(from: decoder))
    }
}

// MARK: Methods and variables

public struct SourceryMethod: Documented, Hashable, Codable {
    public let name: String

    public let callName: String
    public let parameters: [Parameter]
    public let returnTypeName: SourceryTypeName
    public let isInitializer: Bool
    public let isMutating: Bool
    public let isNonisolated: Bool

    public let documentation: [String]
    public let accessLevel: SourceryAccessLevel
    public let modifiers: [SourceryModifier]
    public let definedInExtension: Bool
    public let isStatic: Bool
    public let isThrowing: Bool
    public let isAsync: Bool
    public let attributes: [SourceryAttribute]

    public struct Parameter: Hashable, Codable {
        public let name: String
        public let typeName: SourceryTypeName
        public let argumentLabel: String?
        public let defaultValue: String?
    }
}

public struct SourceryVariable: Documented, Hashable, Codable {
    public let name: String

    public let typeName: SourceryTypeName
    public let isMutable: Bool
    public let isComputed: Bool

    public let documentation: [String]
    public let readAccessLevel: SourceryAccessLevel
    public let writeAccessLevel: SourceryAccessLevel
    public let modifiers: [SourceryModifier]
    public let definedInExtension: Bool
    public let isStatic: Bool
    public let isThrowing: Bool // or rethrows
    public let isAsync: Bool
    public let attributes: [SourceryAttribute]
}

public enum SourceryAccessLevel: String, Hashable, Codable {
    case `package` = "package"
    case `internal` = "internal"
    case `private` = "private"
    case `fileprivate` = "fileprivate"
    case `public` = "public"
    case `open` = "open"
    case none = ""
}

public struct SourceryModifier: Hashable, Codable {
    public let name: String
    public let detail: String?
}

public struct SourceryAttribute: Hashable, Codable {
    public let name: String
    public let arguments: [String: String]
    public let description: String
}

// MARK: convertion from sourcery types to transport types

#if canImport(SourceryRuntime)
import SourceryRuntime

extension SourceryTemplateContext {
    init(_ context: SourceryRuntime.TemplateContext) {
        self.types = context.types.types.map(SourceryType.init)
        self.functions = context.functions.map(SourceryMethod.init)
    }

    func dump() throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .withoutEscapingSlashes]
        print("// sourcery:file:sourcery-dump.json")
        print(String(data: try encoder.encode(self), encoding: .utf8)!)
        print("// sourcery:end")
    }
}

extension SourceryType {
    init(_ type: SourceryRuntime.`Type`) {
        self.kind = SourceryTypeKind(type.kind)
        self.name = SourceryTypeName(SourceryRuntime.TypeName(type.name))
        self.documentation = type.documentation
        self.computedVariables = type.computedVariables.map { SourceryVariable($0) }
        self.methods = type.methods.map { SourceryMethod($0) }
        self.implements = type.implements.values.map { SourceryType($0).name }
        self.globalName = type.globalName
        self.based = Array(type.based.keys)
        self.rawVariables = type.rawVariables.map { SourceryVariable($0) }
        self.rawMethods = type.rawMethods.map { SourceryMethod($0) }
        self.cases = (type as? SourceryRuntime.Enum)?.cases.map { SourceryEnumCase($0) } ?? []
        self.storedVariables = type.storedVariables.map { SourceryVariable($0) }
    }
}

extension SourceryTypeKind {
    init(_ kind: String) {
        switch kind {
        case "struct": self = .struct
        case "enum": self = .enum
        case "class": self = .class
        case "actor": self = .actor
        case "protocol": self = .protocol
        case "extension": self = .extension
        default: self = .unknown(kind)
        }
    }
}

extension SourceryEnumCase {
    init(_ enumCase: SourceryRuntime.EnumCase) {
        self.documentation = enumCase.documentation
        self.name = enumCase.name
        self.associatedValues = enumCase.associatedValues.map {
            SourceryEnumCase.AssociatedValue($0)
        }
    }
}

extension SourceryEnumCase.AssociatedValue {
    init(_ associatedValue: SourceryRuntime.AssociatedValue) {
        self.localName = associatedValue.localName //: String?
        self.externalName = associatedValue.externalName //: String?
        self.typeName = SourceryTypeName(associatedValue.typeName) //: SourceryTypeName
    }
}

extension SourceryTypeName.Contents {
    init(_ typeName: SourceryRuntime.TypeName) {
        self.actualTypeName = typeName.actualTypeName.map { SourceryTypeName($0) }
        self.unwrappedTypeName = typeName.unwrappedTypeName
        self.isVoid = typeName.isVoid
        self.tuple = typeName.tuple.map { SourceryTypeName.Tuple($0) }
        self.array = typeName.array.map { SourceryTypeName.Array($0) }
        self.dictionary = typeName.dictionary.map { SourceryTypeName.Dictionary($0) }
        self.closure = typeName.closure.map { SourceryTypeName.Closure($0) }
        self.generic = typeName.generic.map { SourceryTypeName.Generic($0) }
        self.isOptional = typeName.isOptional || typeName.isImplicitlyUnwrappedOptional
    }
}

extension SourceryTypeName {
    convenience init(_ typeName: SourceryRuntime.TypeName) {
        self.init(Contents(typeName))
    }
}

extension SourceryTypeName.Tuple {
    init(_ tuple: SourceryRuntime.TupleType) {
        self.elements = tuple.elements.map { Element($0) }
    }
}

extension SourceryTypeName.Tuple.Element {
    init(_ element: SourceryRuntime.TupleElement) {
        self.name = element.name!
        self.typeName = SourceryTypeName(element.typeName)
    }
}

extension SourceryTypeName.Array {
    init(_ array: SourceryRuntime.ArrayType) {
        self.elementTypeName = SourceryTypeName(array.elementTypeName)
    }
}

extension SourceryTypeName.Dictionary {
    init(_ dictionary: SourceryRuntime.DictionaryType) {
        self.keyTypeName = SourceryTypeName(dictionary.keyTypeName)
        self.valueTypeName = SourceryTypeName(dictionary.valueTypeName)
    }
}

extension SourceryTypeName.Closure {
    init(_ closure: SourceryRuntime.ClosureType) {
        self.parameters = closure.parameters.map { SourceryTypeName($0.typeName) }
        self.returnTypeName = SourceryTypeName(closure.returnTypeName)
        self.isAsync = closure.isAsync
        self.isThrowing = closure.throws
    }
}

extension SourceryTypeName.Generic {
    init(_ generic: SourceryRuntime.GenericType) {
        self.name = generic.name
        self.typeParameters = generic.typeParameters.map { SourceryTypeName($0.typeName) }
    }
}

extension SourceryMethod {
    init(_ method: SourceryRuntime.Method) {
        self.name = method.name

        self.callName = method.callName
        self.parameters = method.parameters.map { Parameter($0) }
        self.returnTypeName = SourceryTypeName(method.returnTypeName)
        self.isInitializer = method.isInitializer
        self.isMutating = method.isMutating
        self.isNonisolated = method.isNonisolated

        self.documentation = method.documentation
        self.accessLevel = SourceryAccessLevel(rawValue: method.accessLevel)!
        self.modifiers = method.modifiers.map { SourceryModifier($0) }
        self.definedInExtension = method.definedInType?.isExtension == true
        self.isStatic = method.isStatic
        self.isThrowing = method.throws || method.rethrows
        self.isAsync = method.isAsync
        self.attributes = SourceryAttribute.attributes(method.attributes)
    }
}

extension SourceryMethod.Parameter {
    init(_ parameter: SourceryRuntime.MethodParameter) {
        self.name = parameter.name
        self.typeName = SourceryTypeName(parameter.typeName)
        self.argumentLabel = parameter.argumentLabel
        self.defaultValue = parameter.defaultValue
    }
}

extension SourceryVariable {
    init(_ variable: SourceryRuntime.Variable) {
        self.name = variable.name

        self.typeName = SourceryTypeName(variable.typeName)
        self.isMutable = variable.isMutable
        self.isComputed = variable.isComputed

        self.documentation = variable.documentation
        self.readAccessLevel = SourceryAccessLevel(variable.accessLevel.read)
        self.writeAccessLevel = SourceryAccessLevel(variable.accessLevel.write)
        self.modifiers = variable.modifiers.map { SourceryModifier($0) }
        self.definedInExtension = variable.definedInType?.isExtension == true
        self.isStatic = variable.isStatic
        self.isThrowing = variable.throws
        self.isAsync = variable.isAsync
        self.attributes = SourceryAttribute.attributes(variable.attributes)
    }
}

extension SourceryAccessLevel {
    init(_ accessLevel: SourceryRuntime.AccessLevel) {
        switch accessLevel {
        case .package: self = .package
        case .internal: self = .internal
        case .private: self = .private
        case .fileprivate: self = .fileprivate
        case .public: self = .public
        case .open: self = .open
        case .none: self = .none
        }
    }
}

extension SourceryModifier {
    init(_ modifier: SourceryRuntime.Modifier) {
        self.name = modifier.name
        self.detail = modifier.detail
    }
}

extension SourceryAttribute {
    init(_ attribute: SourceryRuntime.Attribute) {
        self.name = attribute.name
        self.arguments = attribute.arguments.mapValues {
            ($0 as? NSString as String?) ?? "\($0)"
        }
        self.description = attribute.description
    }

    static func attributes(_ attributeList: SourceryRuntime.AttributeList) -> [SourceryAttribute] {
        attributeList.values.flatMap { $0.map(SourceryAttribute.init) }
    }
}

#endif

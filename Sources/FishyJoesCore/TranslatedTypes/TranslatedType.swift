import SourceryRuntime

protocol TranslatedType {
    var sourceType: BetterType { get }
    var converterType: BetterType { get }
    var neutralName: String { get }
    var nodeName: String { get }
    var kotlinPackage: String? { get }
    var kotlinName: String { get }
    var jniType: JNIType { get }
    var cSharpType: CSharpClass.CSType { get }
    var dartType: DartClass.DartType { get }
    var definingModule: Module { get }
    var definingTSNamespace: String? { get }
    var isInhabited: Bool { get }
    var containedNamedTypes: [TranslatedType] { get }
    var conformances: Set<BetterType> { get }
    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>]
    func cSharpSetupDelegates(in context: FishyJoesContext) -> [String]
    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>]
    func dartSetupDelegates(in context: FishyJoesContext) -> [String]
    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment]
}

extension TranslatedType {
    var definingTSNamespace: String? { nil }
    var converterType: BetterType {
        sourceType
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] { [] }

    var nodeType: TypeScriptAnnotations.TSType {
        if let opt = self as? TranslatedOptional {
            return .optional(opt.wrapped.nodeType)
        } else {
            return .named("\(definingTSNamespace.map { "\($0)." } ?? "")\(nodeName)")
        }
    }

    var kotlinPackageQualifiedName: String {
        if let package = kotlinPackage {
            return "\(package).\(kotlinName)"
        } else {
            return kotlinName
        }
    }

    var kotlinType: KotlinClass.KType {
        if let opt = self as? TranslatedOptional {
            return .optional(opt.wrapped.kotlinType)
        } else if kotlinName == "Void" {
            return .void
        } else if let unsignedPrimitiveType = self as? TranslatedUnsignedPrimitive {
            return .unsigned(jniType: unsignedPrimitiveType.jniType)
        } else if let functionType = self as? TranslatedFunction {
            return .function(signature: functionType.kotlinName, parmeters: functionType.parameters.map(\.kotlinType), isSuspend: functionType.isAsync)
        } else {
            return .named(package: kotlinPackage, name: kotlinName)
        }
    }

    var jniObjectType: JNIType {
        if let unsigned = self as? TranslatedUnsignedPrimitive {
            return .object("kotlin/\(unsigned.kotlinName)")
        } else {
            switch jniType {
            case .object: return jniType
            case .array: return jniType
            case .int: return .object("java/lang/Integer")
            default: return .object("java/lang/\(jniType.valueType)")
            }
        }
    }

    var mangledName: String {
        sourceType.name.mangled
    }

    func cSharpSetupDelegates(in context: FishyJoesContext) -> [String] { [] }
    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>] { [] }
    func dartSetupDelegates(in context: FishyJoesContext) -> [String] { [] }
    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>] { [] }

    var iotaSetupName: String {
        "\(converterType.genericBaseName.mangledName)_setup"
    }

    var isInhabited: Bool { true }

    var conformances: Set<BetterType> { [] }
}

extension TranslatedType {
    func exportedConformances(in context: FishyJoesContext) -> [TranslatedProtocol] {
        conformances.compactMap { try? context.tryResolve(type: $0) as? TranslatedProtocol }
    }
}

indirect enum JNIType: Codable, Hashable {
    case object(String)
    case array(JNIType)
    case boolean
    case byte
    case char
    case short
    case int
    case long
    case float
    case double
    case void
}

extension JNIType {
    var valueType: String {
        switch self {
        case .object: return "Object"
        case .array: return "Object"
        case .boolean: return "Boolean"
        case .byte: return "Byte"
        case .char: return "Char"
        case .short: return "Short"
        case .int: return "Int"
        case .long: return "Long"
        case .float: return "Float"
        case .double: return "Double"
        case .void: return "Void"
        }
    }

    var asSignature: String {
        switch self {
        case .object(let className): return "L\(className);"
        case .array(let element): return "[" + element.asSignature
        case .boolean: return "Z"
        case .byte: return "B"
        case .char: return "C"
        case .short: return "S"
        case .int: return "I"
        case .long: return "J"
        case .float: return "F"
        case .double: return "D"
        case .void: return "V"
        }
    }
}

enum ForeignSetupParameter<Typ> {
    case type(typeValue: Typ)
    case value(name: String, type: Typ, valueWriter: (SourceFragment) -> Void)

    var name: String? {
        switch self {
        case .type:
            return nil
        case .value(let name, _, _):
            return name
        }
    }

    var type: Typ? {
        switch self {
        case .type:
            return nil
        case .value(_, let type, _):
            return type
        }
    }

    var isTypeParameter: Bool {
        switch self {
        case .type:
            return true
        case .value:
            return false
        }
    }

    var typeValue: Typ? {
        switch self {
        case .type(let value):
            return value
        case .value:
            return nil
        }
    }

    var valueWriter: (SourceFragment) -> Void {
        switch self {
        case .type:
            return { _ in }
        case .value(_, _, let writer):
            return writer
        }
    }
}

extension Type {
    // Used both for efficiency and to break cycles
    fileprivate static var inhabitedCache: [Type: Bool] = [:]
    var isInhabited: Bool {
        if let inhabited = Type.inhabitedCache[self] { return inhabited }

        // Will miss some uninhabited, cyclic types, but that's not super important
        Type.inhabitedCache[self] = true
        let result: Bool
        if let self = self as? Enum {
            result = self.cases.contains { enumCase in
                enumCase.associatedValues.allSatisfy {
                    // TODO: fixpoint?
                    $0.type?.isInhabited ?? true
                }
            }
        } else {
            result = storedVariables.allSatisfy { $0.isStatic || $0.type?.isInhabited ?? true }
        }

        Type.inhabitedCache[self] = result
        return result
    }
}

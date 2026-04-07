import SourceryDataModel

protocol TranslatedType {
    var sourceType: BetterType { get }
    var converterType: BetterType { get }
    var nodeName: String { get }
    var kotlinPackage: String? { get }
    var kotlinName: String { get }
    var jniType: JNIType { get }
    var cSharpType: CSharpClass.CSType { get }
    var dartType: DartClass.DartType { get }
    var pythonType: PythonClass.PyType { get }
    var pythonFFIType: PythonClass.FFIType { get }
    var definingModule: Module { get }
    var definingTSNamespace: String? { get }
    var isInhabited: Bool { get }
    var containedNamedTypes: [TranslatedType] { get }
    var conformances: Set<BetterType> { get }
    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>]
    func cSharpSetupDelegates(in context: FishyJoesContext) -> [String]
    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>]
    func dartSetupDelegates(in context: FishyJoesContext) -> [String]
    func pythonSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<PythonClass.PyType>]
    func pythonSetupDelegates(in context: FishyJoesContext) -> [String]
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
    func pythonSetupDelegates(in context: FishyJoesContext) -> [String] { [] }
    func pythonSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<PythonClass.PyType>] { [] }

    var iotaSetupName: String {
        "\(converterType.genericBaseName.mangledName)_setup"
    }

    var isInhabited: Bool { true }

    var conformances: Set<BetterType> { [] }

    var pythonType: PythonClass.PyType {
        switch self {
        case is TranslatedVoid:
            return .none
        case is TranslatedString, is TranslatedURL:
            return .primitive("str")
        case is TranslatedData:
            return .primitive("bytes")
        case is TranslatedPrimitive:
            switch sourceType.nonNamespacedName {
            case "Bool":
                return .primitive("bool")
            case "Float", "Double":
                return .primitive("float")
            default:
                return .primitive("int")
            }
        case is TranslatedUnsignedPrimitive:
            return .primitive("int")
        case let optional as TranslatedOptional:
            return .optional(optional.wrapped.pythonType)
        case let array as TranslatedArray:
            return .list(array.elementType.pythonType)
        case let set as TranslatedSet:
            return .set(set.elementType.pythonType)
        case let dictionary as TranslatedDictionary:
            return .dict(dictionary.keyType.pythonType, dictionary.valueType.pythonType)
        case let tuple as TranslatedTuple:
            return .tuple(tuple.elements.map(\.type.pythonType))
        case let function as TranslatedFunction:
            return .callable(
                args: function.parameters.map(\.pythonType),
                return: function.isAsync ? .awaitable(function.returnType.pythonType) : function.returnType.pythonType
            )
        case let future as TranslatedFuture:
            return .awaitable(future.output.pythonType)
        case is TranslatedResult:
            return .any
        default:
            return .named(module: nil, name: sourceType.nonNamespacedName)
        }
    }

    var pythonFFIType: PythonClass.FFIType {
        switch self {
        case is TranslatedVoid:
            return .void
        case is TranslatedString,
             is TranslatedData,
             is TranslatedURL,
             is TranslatedOptional,
             is TranslatedArray,
             is TranslatedSet,
             is TranslatedDictionary,
             is TranslatedTuple,
             is TranslatedFunction,
             is TranslatedFuture,
             is TranslatedResult:
            return .object
        case is TranslatedPrimitive:
            switch sourceType.nonNamespacedName {
            case "Bool":
                return .bool
            case "Int8":
                return .int8
            case "Int16":
                return .int16
            case "Int32":
                return .int32
            case "Int64":
                return .int64
            case "Int":
                return .int
            case "Float":
                return .float
            case "Double":
                return .double
            default:
                return .object
            }
        case is TranslatedUnsignedPrimitive:
            switch sourceType.nonNamespacedName {
            case "UInt8":
                return .uint8
            case "UInt16":
                return .uint16
            case "UInt32":
                return .uint32
            case "UInt64":
                return .uint64
            case "UInt":
                return .uint
            default:
                return .object
            }
        default:
            return .object
        }
    }
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

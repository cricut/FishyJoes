import SourceryRuntime

protocol TranslatedType {
    var sourceType: BetterType { get }
    var converterType: BetterType { get }
    var nodeName: String { get }
    var kotlinName: String { get }
    var cppName: String { get }
    var neutralName: String { get }
    var containedNamedTypes: [TranslatedType] { get }
    var kotlinPackage: String? { get }
    var jniType: JNIType { get }
    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment]
}

extension TranslatedType {
    var cForwardDeclaration: String? { nil }
    var asSwiftAccessor: String { fatalErr("asSwiftAccessor not implemented for \(Self.self)") }

    var converterType: BetterType {
        sourceType
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] { [] }

    var nodeType: TypeScriptAnnotations.TSType {
        if let opt = self as? TranslatedOptional {
            return .optional(opt.wrapped.nodeType)
        } else {
            return .named(nodeName)
        }
    }

    var kotlinType: KotlinClass.KType {
        if let opt = self as? TranslatedOptional {
            return .optional(opt.wrapped.kotlinType)
        } else if kotlinName == "Void" {
            return .void
        } else if let unsignedPrimitiveType = self as? TranslatedUnsignedPrimitive {
            return .unsigned(jniType: unsignedPrimitiveType.jniType)
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
}

indirect enum JNIType: Equatable {
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

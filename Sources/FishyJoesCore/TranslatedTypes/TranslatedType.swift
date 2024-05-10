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
    var conformances: Set<String> { get }
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

    var conformances: Set<String> { [] }
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
    // Used both for effeciency and to break cycles
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

extension SourceryProtocol {
    // Default implementation methods replace unimplemented methods for Protocols
    func methodsPreferringDefaultImpl() -> [SourceryMethod] {
        SourceryMethod.methodsPreferring(.defaultImplementation, methods: rawMethods)
    }

    func defaultMethods() -> [SourceryMethod] {
        methodsPreferringDefaultImpl().filter { $0.isExtension }
    }

    // Default implementation variables replace unimplemented variables for Protocols
    func variablesPreferringDefaultImpl() -> [SourceryVariable] {
        var varsByName = [String: [SourceryVariable]]()
        for variable in rawVariables {
            varsByName[variable.name, default: []].append(variable)
        }
        return varsByName.sorted {
            $0.key < $1.key
        }.compactMap {
            let varDefs = $0.value
            return varDefs.first { $0.definedInType?.isExtension == true } ?? varDefs.first
        }
    }
}

extension SourceryMethod {
    enum MethodTypePreference {
        case defaultImplementation
        case normal
    }
    static func methodsPreferring(_ preference: MethodTypePreference, methods: [SourceryMethod]) -> [SourceryMethod] {
        var preferredMethods = [SourceryMethod]()
        for method in methods {
            let mostlyEqualMethods = preferredMethods.filter {
                return $0.isMostlyEqual(other: method)
            }
            if !mostlyEqualMethods.isEmpty {
                for mostlyEqualMethod in mostlyEqualMethods {
                    let isMostlyEqualMethodADefaultImplementation = mostlyEqualMethod.isExtension && (mostlyEqualMethod.definedInType is SourceryProtocol)
                    
                    let useMostlyEqualMethod = preference == .defaultImplementation ? isMostlyEqualMethodADefaultImplementation : !isMostlyEqualMethodADefaultImplementation
                    
                    if useMostlyEqualMethod {
                        guard let index = preferredMethods.firstIndex(of: method) else {
                            assertionFailure("method should exist in preferredMethods")
                            continue
                        }
                        preferredMethods.remove(at: index)
                        preferredMethods.insert(mostlyEqualMethod, at: index)
                    } else { // use method
                        guard let index = preferredMethods.firstIndex(of: mostlyEqualMethod) else {
                            assertionFailure("mostlyEqualMethod should exist in preferredMethods")
                            continue
                        }
                        preferredMethods.remove(at: index)
                        preferredMethods.insert(method, at: index)
                    }
                }
            } else {
                preferredMethods.append(method)
            }
        }
        return preferredMethods
    }

    func isMostlyEqual(other: SourceryMethod) -> Bool {
        let paramsMostlyEqual = zip(parameters, other.parameters).filter {
            $0.isMostlyEqual(other: $1)
        }.count == parameters.count
        let selectorNameMatches = selectorName == other.selectorName
        let parametersCountMatches = parameters.count == other.parameters.count
        let returnTypeNameMatches = returnTypeName == other.returnTypeName
        let returnTypeMatches = returnType == other.returnType
        let isAsyncMatches = isAsync == other.isAsync
        let throwsMatches = `throws` == other.`throws`
        let rethrowsMatches = `rethrows` == other.`rethrows`
        let accessLevelMatches = accessLevel == other.accessLevel
        let isStaticMatches = isStatic == other.isStatic
        let isClassMatches = isClass == other.isClass
        let isFailableInitializerMatches = isFailableInitializer == other.isFailableInitializer
        let documentationMatches = documentation == other.documentation
        let annotationsMatches = annotations == other.annotations
        let attributesMatches = attributes == other.attributes

        return selectorNameMatches &&
        paramsMostlyEqual &&
        parametersCountMatches &&
        returnTypeNameMatches &&
        returnTypeMatches &&
        isAsyncMatches &&
        throwsMatches &&
        rethrowsMatches &&
        accessLevelMatches &&
        isStaticMatches &&
        isClassMatches &&
        isFailableInitializerMatches &&
        documentationMatches &&
        annotationsMatches &&
        attributesMatches
    }

    var isExtension: Bool {
        definedInType?.isExtension ?? false
    }
    
    static func methods(type: Type) -> [SourceryMethod] {
        var defaultMethods = [SourceryMethod]()
        let protocols = type.implements.values.compactMap { $0 as? SourceryProtocol }
        for prot in protocols {
            defaultMethods.append(contentsOf: prot.defaultMethods())
        }

        let normalMethods = type.methods

        let methods = SourceryMethod.methodsPreferring(.defaultImplementation, methods: normalMethods + defaultMethods)
        return methods
    }
}

extension MethodParameter {
    func isMostlyEqual(other: MethodParameter) -> Bool {
        let argumentLabelMatches = argumentLabel == other.argumentLabel
        let typeNameMatches = typeName == other.typeName
        let inoutMatches = `inout` == other.`inout`
        let isVariadicMatches = isVariadic == other.isVariadic
        let typeAttributesMatches = typeAttributes == other.typeAttributes
        let defaultValueMatches = defaultValue == other.defaultValue
        let annotationsMatches = annotations == other.annotations

        return argumentLabelMatches &&
        typeNameMatches &&
        inoutMatches &&
        isVariadicMatches &&
        typeAttributesMatches &&
        defaultValueMatches &&
        annotationsMatches
    }
}

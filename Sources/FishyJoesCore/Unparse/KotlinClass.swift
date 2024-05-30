class KotlinClass: NestedClass {
    indirect enum KType: Hashable {
        case void
        case unsigned(jniType: JNIType)
        case named(package: String?, name: String)
        case function(signature: String, parmeters: [KType], isSuspend: Bool)
        case optional(KType)
    }

    enum MethodOrVariable {
        case method(Method)
        case variable(Variable)
    }

    struct Method {
        var documentation: [String]
        var isStatic: Bool
        var isSuspend: Bool
        var isOverride: Bool
        var isDefaultImplementation: Bool
        var name: String
        var parameters: [(labelComment: String?, name: String, type: KType, defaultValue: String?)]
        var compatibilityOrder: [String]
        var returnType: KType
        var deprecation: Deprecation?
        var body: String?
    }

    struct Variable {
        var documentation: [String]
        var isStatic: Bool
        var isOverride: Bool
        var isMutable: Bool
        var isPubliclyWritable: Bool
        var isDefaultImplementation: Bool
        var name: String
        var type: KType
        var deprecation: Deprecation?
        var body: String?
    }

    let module: Module
    let documentation: [String]
    let name: String
    var innerClasses: [KotlinClass] = []
    var fields: [Variable]
    var methods: [Method]
    var conformances: Set<String> = []

    init(
        module: Module,
        documentation: [String],
        name: String,
        fields: [Variable],
        methods: [Method],
        conformances: Set<String>
    ) {
        self.name = name
        self.documentation = documentation
        self.module = module
        self.fields = fields
        self.methods = methods
        self.conformances = conformances
    }

    func output(to fragment: SourceFragment) {
        fatalErr("This method must be overridden and call `outputInner`")
    }

    func outputInner(to fragment: SourceFragment) {
        innerClasses.forEach { inner in
            fragment.blankLine()
            inner.output(to: fragment)
        }
    }

    func fragment(context: FishyJoesContext) -> SourceFragment {
        let fragment = context.kotlinFragment("\(name).kt")
        output(to: fragment)
        return fragment
    }

    func document(_ documentation: [String], fragment: SourceFragment) {
        guard !documentation.isEmpty else { return }
        fragment.output("/**")
        for line in documentation {
            fragment.output(
                " " + "* \(line)"
                    .trimmingCharacters(in: .whitespaces)
                    .replacingOccurrences(of: "[$", with: "[?")
            )
        }
        fragment.output(" */")
    }

    var unqualifiedName: String {
        String(name.split(separator: ".").last!)
    }

    func output(field: Variable, to fragment: SourceFragment, external: Bool = true) {
        document(field.documentation, fragment: fragment)
        if let deprecation = field.deprecation {
            fragment.output("@Deprecated(\"\(deprecation.quotedMessage)\")")
        }
        fragment.output("\(field.isOverride ? "override " : "")\(field.isPubliclyWritable ? "var" : "val") \(field.name): \(field.type.kotlinType)")
        if let body = field.body {
            fragment.output(body)
        }

        if external {
            fragment.output("  get() = __jni_get_\(field.name)()\(field.type.toKotlinType)")
            if field.isPubliclyWritable {
                fragment.output("  set(value) { __jni_set_\(field.name)(value\(field.type.toJVMType)) } ")
            }

            if field.isStatic {
                fragment.output("@JvmStatic")
            }

            fragment.output("@JvmName(\"__jni_get_\(field.name)\")")
            fragment.output("private external fun __jni_get_\(field.name)(): \(field.type.jvmType)")
            if field.isMutable {
                if field.isStatic {
                    fragment.output("@JvmStatic")
                }
                fragment.output("@JvmName(\"__jni_set_\(field.name)\")")
                fragment.output("private external fun __jni_set_\(field.name)(newValue: \(field.type.jvmType))")
            }
            fragment.blankLine()
        }
    }

    func output(method: Method, to fragment: SourceFragment, external: Bool = true, isDefaultInCompanionObject: Bool = false) {
        document(method.documentation, fragment: fragment)
        if !method.name.hasPrefix("_"),
           !isDefaultInCompanionObject {
            let compatibilityParameters = Set(method.compatibilityOrder)
            for compatibilityIndex in 0...method.compatibilityOrder.count {
                let excludedCompatibilityParameters = Set(method.compatibilityOrder[compatibilityIndex...])

                if let deprecation = method.deprecation {
                    fragment.output("@Deprecated(\"\(deprecation.quotedMessage)\")")
                }
                if method.isOverride {
                    fragment.output("override ", newLineTerminated: false)
                }
                fragment.outputBlock("\(method.isSuspend ? "suspend " : "")fun \(method.name)(", newLineTerminated: false) {
                    let filteredParameters = method.parameters.filter { !excludedCompatibilityParameters.contains($0.name) }
                    fragment.outputMap(filteredParameters, separator: ",") { parameter in
                        let labelComment = parameter.labelComment.map { "/* \($0) */ " } ?? ""
                        let defaultValue = parameter.defaultValue.map { " = \($0)" } ?? ""
                        return "\(labelComment)\(parameter.name): \(parameter.type.kotlinType)\(defaultValue)"
                    }
                }
                if method.returnType != KType.void {
                    fragment.output(": \(method.returnType.kotlinType)", newLineTerminated: false)
                }
                if let body = method.body {
                    precondition(compatibilityParameters.isEmpty, "internal error: compatibilityOrder can't be used with a non-native body")
                    fragment.output(" = \(body)\(method.returnType.toKotlinType)", newLineTerminated: false)
                    if method.isSuspend {
                        fragment.output(".await()")
                    } else {
                        fragment.output(method.returnType.toKotlinType)
                    }
                } else if external {
                    var arguments: [String] = []
                    for parameter in method.parameters {
                        if excludedCompatibilityParameters.contains(parameter.name) {
                            arguments.append("(\(parameter.defaultValue!))\(parameter.type.toJVMType)")
                        } else {
                            arguments.append("\(parameter.name)\(parameter.type.toJVMType)")
                        }
                    }
                    let methodName = method.isDefaultImplementation ? "_default_" + method.name : method.name
                    fragment.output(" = __jni_\(methodName)(\(arguments.joined(separator: ", ")))", newLineTerminated: false)
                    if method.isSuspend {
                        fragment.output(".await()")
                    } else {
                        fragment.output(method.returnType.toKotlinType)
                    }
                } else {
                    fragment.output()
                }
            }
        }
        if external, method.body == nil {
            if method.isStatic,
               !isDefaultInCompanionObject {
                fragment.output("@JvmStatic")
            }
            let methodName = method.isDefaultImplementation ? "_default_" + method.name : method.name
            fragment.output("@JvmName(\"__jni_\(methodName)\")")
            fragment.outputBlock("private external fun __jni_\(methodName)(", newLineTerminated: false) {
                var unnamedParamsCnt = 1
                fragment.outputMap(method.parameters, separator: ",") { parameter in
                    var paramName = parameter.name
                    if paramName.isEmpty {
                        paramName = "_\(unnamedParamsCnt)"
                        unnamedParamsCnt += 1
                    }
                    return "\(paramName): \(parameter.type.jvmType)"
                }
            }
            if method.isSuspend {
                fragment.output(": kotlinx.coroutines.Deferred<\(method.returnType.kotlinType)>", newLineTerminated: false)
            } else if method.returnType != KType.void {
                fragment.output(": \(method.returnType.jvmType)", newLineTerminated: false)
            }
            fragment.output()
        }
        fragment.blankLine()
    }
}

extension KotlinClass.KType: CustomStringConvertible {
    var description: String {
        "FIXME: You should not use this, you should use one of the representations below. \(jvmType)"
    }

    var isFunction: Bool {
        switch self {
        case .function:
            return true
        default:
            return false
        }
    }

    var jvmType: String {
        switch self {
        case let .unsigned(jniType): return jniType.valueType
        default: return kotlinType
        }
    }

    var kotlinType: String {
        switch self {
        case .void: return "Void"
        case let .unsigned(jniType): return "U\(jniType.valueType)"
        case let .named(.none, name): return name
        case let .named(.some(package), name): return "\(package).\(name)"
        case let .function(signature, _, _): return signature
        case let .optional(wrapped): return "\(wrapped.kotlinType)?"
        }
    }

    var toJVMType: String {
        switch self {
        case .unsigned: return ".to\(jvmType)()"
        default: return ""
        }
    }
    var toKotlinType: String {
        switch self {
        case .unsigned: return ".to\(kotlinType)()"
        default: return ""
        }
    }
}

extension KotlinClass.MethodOrVariable {
    var isOverride: Bool {
        get {
            switch self {
            case .method(let method):
                return method.isOverride
            case .variable(let variable):
                return variable.isOverride
            }
        }
        set {
            switch self {
            case .method(var method):
                method.isOverride = newValue
                self = .method(method)
            case .variable(var variable):
                variable.isOverride = newValue
                self = .variable(variable)
            }
        }
    }
}

extension KotlinClass {
    static func separate(fieldsAndMethods: [KotlinClass.MethodOrVariable]) -> ([KotlinClass.Variable], [KotlinClass.Method]) {
        let fields: [Variable] = fieldsAndMethods.compactMap {
            guard case let .variable(field) = $0 else {
                return nil
            }
            return field
        }
        let methods: [Method] = fieldsAndMethods.compactMap {
            guard case let .method(method) = $0 else {
                return nil
            }
            return method
        }
        return (fields, methods)
    }
}

class KotlinClass {
    indirect enum KType: Hashable {
        case void
        case unsigned(jniType: JNIType)
        case named(package: String?, name: String)
        case optional(KType)
    }

    enum MethodOrVariable {
        case method(Method)
        case variable(Variable)
    }

    struct Method {
        var documentation: [String]
        var isStatic: Bool
        var isOverride: Bool
        var name: String
        var parameters: [(labelComment: String?, name: String, type: KType)]
        var returnType: KType
        var body: String?
    }

    struct Variable {
        var documentation: [String]
        var isStatic: Bool
        var isOverride: Bool
        var readOnly: Bool
        var name: String
        var type: KType
    }

    let capitalizedModule: String
    let module: String
    let documentation: [String]
    let name: String
    var innerClasses: [KotlinClass] = []
    var methods: [Method]
    var fields: [Variable]
    var conformances: [String] = []

    init(module: String, documentation: [String], name: String, methods: [Method], fields: [Variable], conformances: [String]) {
        self.name = name
        self.documentation = documentation
        self.capitalizedModule = module
        self.module = module.lowercased()
        self.methods = methods
        self.fields = fields
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

    var fragment: SourceFragment {
        let fragment = SourceFragment(sourceryDestination: "file:../../kotlin/src/generated/kotlin/com/cricut/\(module)/\(name).kt")

        fragment.output("package com.cricut.\(module)")
        fragment.blankLine()
        fragment.output("import com.cricut.fishyjoes.runtime.LibraryLoader")
        fragment.blankLine()
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
        fragment.output("\(field.isOverride ? "override " : "")\(field.readOnly ? "val" : "var") \(field.name): \(field.type.kotlinType)")
        if external {
            fragment.output("  get() = __jni_get_\(field.name)()\(field.type.toKotlinType)")
            if !field.readOnly {
                fragment.output("  set(value) { __jni_set_\(field.name)(value\(field.type.toJVMType)) } ")
            }
        }

        if external {
            if field.isStatic {
                fragment.output("@JvmStatic")
            }

            fragment.output("@JvmName(\"__jni_get_\(field.name)\")")
            fragment.output("private external fun __jni_get_\(field.name)(): \(field.type.jvmType)")
            if !field.readOnly {
                if field.isStatic {
                    fragment.output("@JvmStatic")
                }
                fragment.output("@JvmName(\"__jni_set_\(field.name)\")")
                fragment.output("private external fun __jni_set_\(field.name)(newValue: \(field.type.jvmType))")
            }
            fragment.blankLine()
        }
    }

    func output(method: Method, to fragment: SourceFragment, external: Bool = true) {
        document(method.documentation, fragment: fragment)
        if !method.name.hasPrefix("_") {
            if method.isOverride {
                fragment.output("override ", newLineTerminated: false)
            }
            fragment.outputBlock("fun \(method.name)(", newLineTerminated: false) {
                fragment.outputMap(method.parameters, separator: ",") { parameter in
                    let labelComment = parameter.labelComment.map { "/* \($0) */ " } ?? ""
                    return "\(labelComment)\(parameter.name): \(parameter.type.kotlinType)"
                }
            }
            if method.returnType != KType.void {
                fragment.output(": \(method.returnType.kotlinType)", newLineTerminated: false)
            }
            if let body = method.body {
                fragment.output(" = \(body)\(method.returnType.toKotlinType)")
            } else if external {
                fragment.output(" = __jni_\(method.name)(\(method.parameters.map({ "\($0.name)\($0.type.toJVMType)" }).joined(separator: ", ")))\(method.returnType.toKotlinType)")
            } else {
                fragment.output()
            }
        }
        if external, method.body == nil {
            if method.isStatic {
                fragment.output("@JvmStatic")
            }
            fragment.output("@JvmName(\"__jni_\(method.name)\")")
            fragment.outputBlock("private external fun __jni_\(method.name)(", newLineTerminated: false) {
                fragment.outputMap(method.parameters, separator: ",") { parameter in
                    return "\(parameter.name): \(parameter.type.jvmType)"
                }
            }
            if method.returnType != KType.void {
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

class KotlinProductClass: KotlinClass {
    struct Typealias {
        let name: String
        let value: KType
    }

    struct Constructor {
        let `private`: Bool
        var fields: [Variable]
        let arguments: [(String, KType)]

        init(`private`: Bool = false, fields: [Variable], arguments: [(String, KType)] = []) {
            self.private = `private`
            self.fields = fields
            self.arguments = arguments
        }
    }

    var constructor: Constructor
    let isPrivate: Bool

    init(
        module: String,
        isPrivate: Bool = false,
        documentation: [String],
        name: String,
        constructor: Constructor,
        fieldsAndMethods: [MethodOrVariable],
        conformances: [String] = []
    ) {
        self.isPrivate = isPrivate
        self.constructor = constructor
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
        super.init(
            module: module,
            documentation: documentation,
            name: name,
            methods: methods,
            fields: fields,
            conformances: conformances
        )
    }

    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)
        var classDeclaration: String
        if constructor.private {
            classDeclaration = "class \(unqualifiedName) private constructor"
        } else {
            classDeclaration = "data class \(unqualifiedName)"
        }
        let constructorArgs: [String] = constructor.fields.map { field in
            (constructor.private ? "private " : "") +
                (field.isOverride ? "override " : "") +
                (field.readOnly ? "val " : "var ") +
                "\(field.name): \(field.type.kotlinType)"
        } + constructor.arguments.map {
            let (name, type) = $0
            return "\(name): \(type.kotlinType)"
        }
        fragment.outputBlock("\(isPrivate ? "private " : "")\(classDeclaration)(", newLineTerminated: false) {
            fragment.outputMap(constructorArgs, separator: ",") { $0 }
        }
        if !conformances.isEmpty {
            fragment.output(": \(conformances.joined(separator: ", "))", newLineTerminated: false)
        }
        fragment.outputBlock(" {") {
            fields.filter { !$0.isStatic }.forEach { output(field: $0, to: fragment) }
            methods.filter { !$0.isStatic }.forEach { output(method: $0, to: fragment) }

            fragment.blankLine()

            fragment.outputBlock("companion object {") {
                fields.filter { $0.isStatic }.forEach { output(field: $0, to: fragment) }
                methods.filter { $0.isStatic }.forEach { output(method: $0, to: fragment) }
                fragment.outputBlock("init {") {
                    fragment.output("LibraryLoader.ensureLoaded(\"\(capitalizedModule)\")")
                }
            }
            outputInner(to: fragment)
        }
    }
}

class KotlinEnumClass: KotlinClass {
    let cases: [Case]

    enum Case {
        case object(name: String)
        case dataClass(documentation: [String], name: String, values: [(name: String, type: KType)])
    }

    init(
        module: String,
        documentation: [String],
        name: String,
        cases: [Case],
        fieldsAndMethods: [MethodOrVariable],
        conformances: [String] = []
    ) {
        self.cases = cases
        let fields: [Variable] = fieldsAndMethods.compactMap {
            guard case let .variable(field) = $0 else{
                return nil
            }
            return field
        }
        let methods: [Method] = fieldsAndMethods.compactMap {
            guard case let .method(method) = $0 else{
                return nil
            }
            return method
        }
        super.init(
            module: module,
            documentation: documentation,
            name: name,
            methods: methods,
            fields: fields,
            conformances: conformances
        )
    }

    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)
        fragment.outputBlock("sealed class \(unqualifiedName) {") {
            for enumCase in cases {
                switch enumCase {
                case let .object(name):
                    fragment.output("object \(name) : \(unqualifiedName)()")
                case let .dataClass(documentation, name, values):
                    document(documentation, fragment: fragment)
                    fragment.outputBlock("data class \(name)(", newLineTerminated: false) {
                        fragment.outputMap(values, separator: ",") { value in
                            "var \(value.name): \(value.type.kotlinType)"
                        }
                    }
                    fragment.output(" : \(unqualifiedName)()")
                }
            }
            fields.filter { !$0.isStatic }.forEach { output(field: $0, to: fragment) }
            methods.filter { !$0.isStatic }.forEach { output(method: $0, to: fragment) }

            fragment.blankLine()

            fragment.outputBlock("companion object {") {
                fields.filter { $0.isStatic }.forEach { output(field: $0, to: fragment) }
                methods.filter { $0.isStatic }.forEach { output(method: $0, to: fragment) }
                fragment.outputBlock("init {") {
                    fragment.output("LibraryLoader.ensureLoaded(\"\(capitalizedModule)\")")
                }
            }
            outputInner(to: fragment)
        }
    }
}

class KotlinInterface: KotlinClass {
    init(
        module: String,
        documentation: [String],
        name: String,
        fieldsAndMethods: [MethodOrVariable],
        conformances: [String] = []
    ) {
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
        super.init(
            module: module,
            documentation: documentation,
            name: name,
            methods: methods,
            fields: fields,
            conformances: conformances
        )
    }


    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)
        fragment.outputBlock("interface \(unqualifiedName) {") {
            fields.filter { !$0.isStatic }.forEach { output(field: $0, to: fragment, external: false) }
            methods.filter { !$0.isStatic }.forEach { output(method: $0, to: fragment, external: false) }

            fragment.blankLine()

            fragment.outputBlock("companion object {") {
                fields.filter { $0.isStatic }.forEach { output(field: $0, to: fragment) }
                methods.filter { $0.isStatic }.forEach {
                    // Hack to supress JvmStatic annotations for protocols
                    var unstaticked = $0
                    unstaticked.isStatic = false
                    output(method: unstaticked, to: fragment)
                }
            }
            outputInner(to: fragment)
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

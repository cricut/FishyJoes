class KotlinClass: NestedClass {
    indirect enum KType: Equatable {
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
        let documentation: [String]
        let isStatic: Bool
        let isOverride: Bool
        let name: String
        let parameters: [(labelComment: String?, name: String, type: KType, defaultValue: String?)]
        let returnType: KType
        let body: String?
    }

    struct Variable {
        let documentation: [String]
        let isStatic: Bool
        let isOverride: Bool
        let readOnly: Bool
        let name: String
        let type: KType
    }

    let module: Module
    let documentation: [String]
    let name: String
    var innerClasses: [KotlinClass] = []

    init(module: Module, documentation: [String], name: String) {
        self.name = name
        self.documentation = documentation
        self.module = module
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
        let fragment = SourceFragment(sourceryDestination: "file:../../kotlin/src/generated/kotlin/com/cricut/\(module.name.lowercased())/\(name).kt")

        fragment.output("package \(module.kotlinPackage)")
        fragment.blankLine()
        for dependency in module.dependencies {
            fragment.output("import com.cricut.\(dependency.lowercased()).*")
        }
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

    func output(field: Variable, to fragment: SourceFragment) {
        document(field.documentation, fragment: fragment)
        fragment.output("\(field.isOverride ? "override " : "")\(field.readOnly ? "val" : "var") \(field.name): \(field.type.kotlinType)")
        fragment.output("  get() = __jni_get_\(field.name)()\(field.type.toKotlinType)")
        if !field.readOnly {
            fragment.output("  set(value) { __jni_set_\(field.name)(value\(field.type.toJVMType)) } ")
        }

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

    func output(method: Method, to fragment: SourceFragment) {
        document(method.documentation, fragment: fragment)
        if !method.name.hasPrefix("_") {
            if method.isOverride {
                fragment.output("override ", newLineTerminated: false)
            }
            fragment.outputBlock("fun \(method.name)(", newLineTerminated: false) {
                fragment.outputMap(method.parameters, separator: ",") { parameter in
                    let labelComment = parameter.labelComment.map { "/* \($0) */ " } ?? ""
                    let defaultValue = parameter.defaultValue.map { " = \($0)" } ?? ""
                    return "\(labelComment)\(parameter.name): \(parameter.type.kotlinType)\(defaultValue)"
                }
            }
            if method.returnType != KType.void {
                fragment.output(": \(method.returnType.kotlinType)", newLineTerminated: false)
            }
            if let body = method.body {
                fragment.output(" = \(body)\(method.returnType.toKotlinType)")
            } else {
                fragment.output(" = __jni_\(method.name)(\(method.parameters.map({ "\($0.name)\($0.type.toJVMType)" }).joined(separator: ", ")))\(method.returnType.toKotlinType)")
            }
        }
        if method.body == nil {
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

    enum Constructor {
        case `public`(fields: [Variable])
        case reference
    }

    let constructor: Constructor
    let fields: [Variable]
    let methods: [Method]

    init(
        module: Module,
        documentation: [String],
        name: String,
        constructor: Constructor,
        fieldsAndMethods: [MethodOrVariable]
    ) {
        self.constructor = constructor
        self.fields = fieldsAndMethods.compactMap {
            guard case let .variable(field) = $0 else {
                return nil
            }
            return field
        }
        self.methods = fieldsAndMethods.compactMap {
            guard case let .method(method) = $0 else {
                return nil
            }
            return method
        }
        super.init(module: module, documentation: documentation, name: name)
    }

    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)

        switch constructor {
        case .reference:
            fragment.output("class \(unqualifiedName) private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference)", newLineTerminated: false)
        case .`public`(let fields):
            fragment.outputBlock("data class \(unqualifiedName)(") {
                fragment.outputMap(fields, separator: ",") { field in
                    "\(field.readOnly ? "val" : "var") \(field.name): \(field.type.kotlinType)"
                }
            }
        }
        fragment.outputBlock(" {") {
            fields.filter { !$0.isStatic }.forEach { output(field: $0, to: fragment) }
            methods.filter { !$0.isStatic }.forEach { output(method: $0, to: fragment) }

            fragment.blankLine()

            fragment.outputBlock("companion object {") {
                fields.filter { $0.isStatic }.forEach { output(field: $0, to: fragment) }
                methods.filter { $0.isStatic }.forEach { output(method: $0, to: fragment) }
                fragment.output("init { loadNativeLibs() }")
            }
            outputInner(to: fragment)
        }
    }
}

class KotlinEnumClass: KotlinClass {
    let cases: [Case]
    let fields: [Variable]
    let methods: [Method]

    enum Case {
        case object(name: String)
        case dataClass(documentation: [String], name: String, values: [(name: String, type: KType)])
    }

    init(
        module: Module,
        documentation: [String],
        name: String,
        cases: [Case],
        fieldsAndMethods: [MethodOrVariable]
    ) {
        self.cases = cases
        self.fields = fieldsAndMethods.compactMap {
            guard case let .variable(field) = $0 else {
                return nil
            }
            return field
        }
        self.methods = fieldsAndMethods.compactMap {
            guard case let .method(method) = $0 else {
                return nil
            }
            return method
        }
        super.init(module: module, documentation: documentation, name: name)
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
                fragment.output("init { loadNativeLibs() }")
            }
            outputInner(to: fragment)
        }
    }
}

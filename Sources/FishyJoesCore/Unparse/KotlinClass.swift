class KotlinClass {
    indirect enum KType: Equatable {
        case void
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
        let parameters: [(labelComment: String?, name: String, type: KType)]
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

    let capitalizedModule: String
    let module: String
    let documentation: [String]
    let name: String
    var innerClasses: [KotlinClass] = []

    init(module: String, documentation: [String], name: String) {
        self.name = name
        self.documentation = documentation
        self.capitalizedModule = module
        self.module = module.lowercased()
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

    func output(field: Variable, to fragment: SourceFragment) {
        document(field.documentation, fragment: fragment)
        fragment.output("\(field.isOverride ? "override " : "")\(field.readOnly ? "val" : "var") \(field.name): \(field.type)")
        fragment.output("  get() = __jni_get_\(field.name)()")
        if !field.readOnly {
            fragment.output("  set(value) { __jni_set_\(field.name)(value) } ")
        }

        if field.isStatic {
            fragment.output("@JvmStatic")
        }
        fragment.output("private external fun __jni_get_\(field.name)(): \(field.type)")
        if !field.readOnly {
            if field.isStatic {
                fragment.output("@JvmStatic")
            }
            fragment.output("private external fun __jni_set_\(field.name)(newValue: \(field.type))")
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
                    return "\(labelComment)\(parameter.name): \(parameter.type)"
                }
            }
            if method.returnType != KType.void {
                fragment.output(": \(method.returnType)", newLineTerminated: false)
            }
            if let body = method.body {
                fragment.output(" = \(body)")
            } else {
                fragment.output(" = __jni_\(method.name)(\(method.parameters.map(\.name).joined(separator: ", ")))")
            }
        }
        if method.body == nil {
            if method.isStatic {
                fragment.output("@JvmStatic")
            }
            fragment.outputBlock("private external fun __jni_\(method.name)(", newLineTerminated: false) {
                fragment.outputMap(method.parameters, separator: ",") { parameter in
                    return "\(parameter.name): \(parameter.type)"
                }
            }
            if method.returnType != KType.void {
                fragment.output(": \(method.returnType)", newLineTerminated: false)
            }
            fragment.output()
        }
        fragment.blankLine()
    }
}

extension KotlinClass.KType: CustomStringConvertible {
    var description: String {
        switch self {
        case .void: return "Void"
        case let .named(.none, name): return name
        case let .named(.some(package), name): return "\(package).\(name)"
        case let .optional(wrapped): return "\(wrapped)?"
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
        let fields: [Variable]

        init(`private`: Bool = false, fields: [Variable]) {
            self.private = `private`
            self.fields = fields
        }
    }

    let constructor: Constructor
    let fields: [Variable]
    let methods: [Method]
    let finalizer: Bool

    init(
        module: String,
        documentation: [String],
        name: String,
        constructor: Constructor,
        fieldsAndMethods: [MethodOrVariable],
        finalizer: Bool = false
    ) {
        self.constructor = constructor
        self.fields = fieldsAndMethods.compactMap {
            guard case let .variable(field) = $0 else{
                return nil
            }
            return field
        }
        self.methods = fieldsAndMethods.compactMap {
            guard case let .method(method) = $0 else{
                return nil
            }
            return method
        }
        self.finalizer = finalizer
        super.init(module: module, documentation: documentation, name: name)
    }

    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)
        let classDeclaration: String
        if constructor.private {
            classDeclaration = "class \(unqualifiedName) private constructor"
        } else {
            classDeclaration = "data class \(unqualifiedName)"
        }
        fragment.outputBlock("\(classDeclaration)(") {
            fragment.outputMap(constructor.fields, separator: ",") { field in
                "\(constructor.private ? "private " : "")\(field.readOnly ? "val" : "var") \(field.name): \(field.type)"
            }
        }
        fragment.outputBlock(" {") {
            fields.filter { !$0.isStatic }.forEach { output(field: $0, to: fragment) }
            methods.filter { !$0.isStatic }.forEach { output(method: $0, to: fragment) }

            if finalizer {
                fragment.output("protected fun finalize() = __jni_finalize()")
                fragment.output("private external fun __jni_finalize()")
            }

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
    let fields: [Variable]
    let methods: [Method]

    enum Case {
        case object(name: String)
        case dataClass(documentation: [String], name: String, values: [(name: String, type: KType)])
    }

    init(
        module: String,
        documentation: [String],
        name: String,
        cases: [Case],
        fieldsAndMethods: [MethodOrVariable]
    ) {
        self.cases = cases
        self.fields = fieldsAndMethods.compactMap {
            guard case let .variable(field) = $0 else{
                return nil
            }
            return field
        }
        self.methods = fieldsAndMethods.compactMap {
            guard case let .method(method) = $0 else{
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
                            "var \(value.name): \(value.type)"
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

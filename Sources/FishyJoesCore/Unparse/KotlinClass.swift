class KotlinClass {
    indirect enum KType: Equatable {
        case void
        case named(String)
        case optional(KType)
    }

    struct Method {
        let documentation: [String]
        let isStatic: Bool
        let name: String
        let parameters: [(labelComment: String?, name: String, type: KType)]
        let returnType: KType
    }

    struct Variable {
        let documentation: [String]
        let isStatic: Bool
        let readOnly: Bool
        let name: String
        let type: KType
    }

    let module: String
    let name: String
    var innerClasses: [KotlinClass] = []

    init(module: String, name: String) {
        self.name = name
        self.module = module.lowercased()
    }

    func output(to fragment: SourceFragment) {
        fatalErr("This method must be overridden and call `outputInner`")
    }

    func outputInner(to fragment: SourceFragment) {
        innerClasses.forEach { inner in
            fragment.output()
            inner.output(to: fragment)
        }
    }

    var fragment: SourceFragment {
        let fragment = SourceFragment(sourceryDestination: "file:../../kotlin/src/generated/kotlin/com/cricut/\(module)/\(name).kt")

        fragment.output("package com.cricut.\(module)")
        fragment.output("")
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
}

extension KotlinClass.KType: CustomStringConvertible {
    var description: String {
        switch self {
        case .void: return "Void"
        case let .named(name): return name
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

    let documentation: [String]
    let constructor: Constructor
    let fields: [Variable]
    let methods: [Method]
    let finalizer: Bool

    init(
        module: String,
        name: String,
        documentation: [String],
        constructor: Constructor,
        fields: [Variable],
        methods: [Method],
        finalizer: Bool = false
    ) {
        self.documentation = documentation
        self.constructor = constructor
        self.fields = fields
        self.methods = methods
        self.finalizer = finalizer
        super.init(module: module, name: name)
    }

    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)
        fragment.outputBlock("class \(unqualifiedName)\(constructor.private ? " private constructor" : "")(", newLineTerminated: false) {
            fragment.outputMap(constructor.fields, separator: ",") { field in
                "\(constructor.private ? "private " : "")\(field.readOnly ? "val" : "var") \(field.name): \(field.type)"
            }
        }

        func output(field: Variable) {
            document(field.documentation, fragment: fragment)
            if field.isStatic {
                // let jvmGetName: String
                // let jvmSetName: String
                // if field.name.hasPrefix("is") {
                //     jvmGetName = field.name
                //     jvmSetName = field.name.prefix(3).dropFirst(2).capitalized + field.name.dropFirst(3)
                // } else {
                //     jvmGetName = "get" + field.name.prefix(1).capitalized + field.name.dropFirst()
                //     jvmSetName = "set" + field.name.prefix(1).capitalized + field.name.dropFirst()
                // }
                fragment.output("@get:JvmStatic")
                // fragment.output("@get:JvmName(\"\(jvmGetName)\")")
                if !field.readOnly {
                    fragment.output("@set:JvmStatic")
                    // fragment.output("@set:JvmName(\"\(jvmSetName)\")")
                }
            }
            fragment.output("\(field.readOnly ? "val" : "var") \(field.name): \(field.type)")
            fragment.output("  external get")
            if !field.readOnly {
                fragment.output("  external set")
            }
        }

        func output(method: Method) {
            document(method.documentation, fragment: fragment)
            if method.isStatic {
                fragment.output("@JvmStatic")
            }
            fragment.outputBlock("external fun \(method.name)(", newLineTerminated: false) {
                fragment.outputMap(method.parameters, separator: ",") { parameter in
                    let labelComment = parameter.labelComment.map { "/* \($0) */ " } ?? ""
                    return "\(labelComment)\(parameter.name): \(parameter.type)"
                }
            }
            if method.returnType != KType.void {
                fragment.output(": \(method.returnType)")
            } else {
                fragment.output()
            }
        }

        fragment.outputBlock(" {") {
            fields.filter { !$0.isStatic }.forEach { output(field: $0) }
            methods.filter { !$0.isStatic }.forEach { output(method: $0) }

            if finalizer {
                fragment.output("protected external fun finalize()")
            }

            fragment.output()

            fragment.outputBlock("companion object {") {
                fields.filter { $0.isStatic }.forEach { output(field: $0) }
                methods.filter { $0.isStatic }.forEach { output(method: $0) }
                fragment.outputBlock("init {") {
                    fragment.output("LibraryLoader.ensureLoaded()")
                }
            }
            outputInner(to: fragment)
        }
    }
}

class KotlinEnumClass: KotlinClass {
    let documentation: [String]
    let cases: [String]

    init(
        module: String,
        name: String,
        documentation: [String],
        cases: [String]
    ) {
        self.documentation = documentation
        self.cases = cases
        super.init(module: module, name: name)
    }

    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)
        fragment.outputBlock("enum class \(unqualifiedName) {") {
            fragment.outputMap(cases, separator: ",") { $0 }
            outputInner(to: fragment)
        }
    }
}

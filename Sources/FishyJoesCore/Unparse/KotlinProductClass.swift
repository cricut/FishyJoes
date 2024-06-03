class KotlinProductClass: KotlinClass {
    struct Typealias {
        let name: String
        let value: KType
    }

    enum Constructor {
        case `public`(fields: [Variable], arguments: [(String, KType)])
        case reference
    }

    var constructor: Constructor
    let isPrivate: Bool

    init(
        module: Module,
        isPrivate: Bool = false,
        documentation: [String],
        name: String,
        constructor: Constructor,
        fields: [Variable],
        methods: [Method],
        conformances: Set<KType> = []
    ) {
        self.isPrivate = isPrivate
        self.constructor = constructor

        super.init(
            module: module,
            documentation: documentation,
            name: name,
            fields: fields,
            methods: methods,
            conformances: conformances
        )
    }

    override func output(to fragment: SourceFragment) {
        document(documentation, fragment: fragment)
        
        var generateEqualsEtcMethods = false

        switch constructor {
        case .reference:
            fragment.output("\(isPrivate ? "private " : "")class \(unqualifiedName) private constructor(_swiftReference: Long)", newLineTerminated: false)
        case .`public`(let storedVariables, let arguments):
            var classDeclaration: String

            generateEqualsEtcMethods = storedVariables.isEmpty

            if isPrivate || generateEqualsEtcMethods {
                classDeclaration = "class \(unqualifiedName) private constructor"
            } else {
                classDeclaration = "data class \(unqualifiedName)"
            }
            let constructorArgs: [String] = storedVariables.map { storedVariable in
                (isPrivate ? "private " : "") +
                (storedVariable.isOverride ? "override " : "") +
                (storedVariable.isPubliclyWritable ? "var " : "val ") +
                "\(storedVariable.name): \(storedVariable.type.kotlinType)"
            } + arguments.map {
                let (name, type) = $0
                return "\(name): \(type.kotlinType)"
            }
            fragment.outputBlock("\(isPrivate ? "private " : "")\(classDeclaration)(", newLineTerminated: false) {
                fragment.outputMap(constructorArgs, separator: ",") { $0 }
            }
        }
        if !conformances.isEmpty {
            let conformancesList = conformances.map { kType in
                guard case let .named(package, name) = kType else {
                    fatalErr("kType must be .name case")
                }
                return "\(package ?? "").\(name)"
            }.sorted(by: <).joined(separator: ", ")

            fragment.output(": \(conformancesList)", newLineTerminated: false)
        }
        fragment.outputBlock(" {") {
            fields.filter { !$0.isStatic }.forEach { output(field: $0, to: fragment) }
            methods.filter { !$0.isStatic }.forEach { output(method: $0, to: fragment) }

            fragment.blankLine()
            
            if generateEqualsEtcMethods {
                // generate equals and hashCode functions
                fragment.outputBlock("override fun equals(other: Any?): kotlin.Boolean {") {
                    fragment.outputBlock("if (this === other) {") {
                        fragment.output("return true")
                    }
                    fragment.outputBlock("if (other !is EmptyStruct) {") {
                        fragment.output("return false")
                    }
                    let storedVariablesChecks = fields.map {
                        "this.\($0.name) == other.\($0.name)"
                    }
                    fragment.output("return \(storedVariablesChecks.joined(separator: "&&\n"))")
                }
                fragment.blankLine()

                fragment.outputBlock("override fun hashCode(): Int {") {
                    let storedVariablesHashCodes = fields.map {
                        "(\($0.name).hashCode())"
                    }
                    fragment.output("return \(storedVariablesHashCodes.joined(separator: ".xor"))")
                }
                fragment.blankLine()
            }
            
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

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

        switch constructor {
        case .reference:
            fragment.output("\(isPrivate ? "private " : "")class \(unqualifiedName) private constructor(_swiftReference: Long)", newLineTerminated: false)
        case .`public`(let storedVariables, let arguments):
            var classDeclaration: String

            if isPrivate {
                classDeclaration = "class \(unqualifiedName) private constructor"
            } else if storedVariables.isEmpty {
                classDeclaration = "class \(unqualifiedName)"
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

            fragment.outputBlock("companion object {") {
                fields.filter { $0.isStatic }.forEach { output(field: $0, to: fragment) }
                methods.filter { $0.isStatic }.forEach { output(method: $0, to: fragment) }
                fragment.output("init { loadNativeLibs() }")
            }
            outputInner(to: fragment)
        }
    }
}

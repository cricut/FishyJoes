class KotlinEnumClass: KotlinClass {
    let cases: [Case]

    enum Case {
        case object(documentation: [String], name: String)
        case dataClass(documentation: [String], name: String, values: [(name: String, type: KType)])
    }

    init(
        module: Module,
        documentation: [String],
        name: String,
        cases: [Case],
        fields: [Variable],
        methods: [Method],
        conformances: Set<KType> = []
    ) {
        self.cases = cases
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
        fragment.output("@OptIn(ExperimentalCoroutinesApi::class)")
        fragment.output("sealed class \(unqualifiedName)", newLineTerminated: false)
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
            for enumCase in cases {
                switch enumCase {
                case let .object(documentation, name):
                    document(documentation, fragment: fragment)
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
            fields.filter { !$0.isStatic }.forEach {
                output(field: $0, to: fragment)
            }
            methods.filter { !$0.isStatic }.forEach {
                output(method: $0, to: fragment)
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

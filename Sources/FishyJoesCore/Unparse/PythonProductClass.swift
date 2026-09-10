class PythonProductClass: PythonClass2 {
    struct Typealias {
        let name: String
        let value: PythonType
    }

    enum Constructor: Equatable {
        case `public`(fields: [Variable])
        case reference
    }

    let constructor: Constructor
    let isExternalWitness: Bool

    init(
        module: Module,
        documentation: [String],
        name: String,
        constructor: Constructor,
        fields: [Variable],
        methods: [Method],
        conformances: Set<PythonType>,
        isExternalWitness: Bool = false
    ) {
        self.constructor = constructor
        self.isExternalWitness = isExternalWitness
        super.init(
            module: module,
            documentation: documentation,
            name: name,
            fields: fields,
            methods: methods,
            conformances: conformances
        )
    }

    override func publicFragments(context: FishyJoesContext) -> [SourceFragment] {
        let fragment = context.pythonFragment("\(unqualifiedName).py")
        var conformances = conformances.map { $0.static.name(in: self) }
        if case .reference = constructor {
            conformances = ["SwiftReference"] + conformances
        } else {
            fragment.output("@dataclasses.dataclass")
        }

        fragment.outputBlock("class \(unqualifiedName)\(declareSupers(conformances)):") {
            document(documentation, fragment: fragment)
            if case .public(let fields) = constructor {
                for field in fields {
                    let type = field.type.static.name(in: self)
                    let name = field.name
                    if field.isMutable {
                        fragment.output("\(name): \(type)")
                    } else {
                        fragment.output("\(name): Final[\(type)]")
                    }
                }
            }

            fragment.blankLine()

            fields.forEach { output(field: $0, to: fragment) }
            methods.forEach { output(method: $0, to: fragment) }
            fragment.blankLine()
        }

        return [fragment]
    }

    override func outputCAPIs(to fragment: SourceFragment) {
        outputNativeMethodDeclarations(methods: nativeMethods, fragment: fragment)
        fragment.blankLine()
    }

    override func outputCCallbackImplementations(to fragment: SourceFragment) {
        switch constructor {
        case .public(let fields):
            fragment.output("@fishyjoes_runtime.callback('TODO[ffi_constructor]')")
            fragment.output("@catch_by_out_ref(default=CreatedRef(ffi.NULL))")
            fragment.outputBlock("def _ffi_constructor(", newLineTerminated: false) {
                fragment.outputMap(fields, separator: ",") { field in
                    "\(field.name): \(field.type.static.ffiConsumedName)"
                }
            }
            fragment.outputBlock(" -> CreatedHostRef:") {
                fragment.outputBlock("createRef(\(unqualifiedName)(", closeWith: "))") {
                    for field in fields {
                        if field.type.static.isPrimitive {
                            fragment.output("\(field.name)=\(field.name),")
                        } else {
                            fragment.output("\(field.name)=consumeRef(\(field.name)),")
                        }
                    }
                }
            }

            if !isExternalWitness {
                ffiFor(fields: fields, fragment: fragment)
            }
        case .reference:
            fragment.outputBlock("static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>", closeWith: ");") {
                fragment.output("createRef(\(unqualifiedName)(ref))")
            }
            fragment.blankLine()
        }
    }
}

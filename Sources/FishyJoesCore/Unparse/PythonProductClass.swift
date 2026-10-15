class PythonProductClass: PythonClass {
    struct Typealias {
        let name: String
        let value: PythonType
    }

    enum Constructor: Equatable {
        case `public`(fields: [Variable])
        case reference
    }

    var constructor: Constructor
    let isExternalWitness: Bool

    init(
        module: Module,
        documentation: [String],
        namespaces: [String],
        name: String,
        mangledName: String,
        constructor: Constructor,
        fields: [Variable],
        methods: [Method],
        conformances: Set<PythonType> = [],
        isExternalWitness: Bool = false
    ) {
        self.constructor = constructor
        self.isExternalWitness = isExternalWitness
        super.init(
            module: module,
            documentation: documentation,
            namespaces: namespaces,
            name: name,
            mangledName: mangledName,
            fields: fields,
            methods: methods,
            conformances: conformances
        )
    }

    override func publicFragments(context: FishyJoesContext) -> [SourceFragment] {
        let fragment = context.pythonFragment(
            typeDefinitionModulePath,
            additionalImports: ["from . import \(implementationModuleName) as _impl"]
        )
        var conformances = conformances.map { $0.static.name(in: self) }.sorted()
        if case .reference = constructor {
            conformances = ["fishyjoes_runtime.SwiftReference"] + conformances
        }

        fragment.outputBlock("class \(unqualifiedName)\(declareSupers(conformances)):") {
            document(documentation, fragment: fragment)
            fragment.blankLine()

            if case .public(let fields) = constructor {
                for field in fields {
                    let type = field.type.static.name(in: self)
                    if field.hiddenStorage {
                        fragment.output("\(field.storedName): \(type)")
                        if field.isOverride {
                            fragment.output("@typing.override")
                        }
                        fragment.output("@property")
                        fragment.outputBlock("def \(field.name)(self) -> \(type):") {
                            fragment.output("return self.\(field.storedName)")
                        }
                    } else if field.isMutable {
                        fragment.output("\(field.storedName): \(type)")
                    } else {
                        fragment.output("\(field.storedName): typing.Final[\(type)]")
                    }
                }

                fragment.blankLine()
                fragment.outputBlock("def __init__(", newLineTerminated: false) {
                    fragment.output("self,")
                    for field in fields {
                        fragment.output("\(field.name): \(field.type.static.name(in: self)),")
                    }
                }
                fragment.outputBlock(" -> None:") {
                    if fields.isEmpty {
                        fragment.output("pass")
                    } else {
                        for field in fields {
                            fragment.output("self.\(field.storedName) = \(field.name)")
                        }
                    }
                }

                fragment.blankLine()
                fragment.outputBlock("def __repr__(self) -> str:") {
                    let reprParts = fields.map { field in
                        "\(field.name)={self.\(field.storedName)!r}"
                    }.joined(separator: ", ")
                    fragment.output("return f'\(name)(\(reprParts))'", newLineTerminated: false)
                }
            }

            fragment.blankLine()

            fields.forEach { output(field: $0, to: fragment) }
            methods.forEach { output(method: $0, to: fragment) }
            fragment.blankLine()
        }

        return [fragment]
    }

    // output to _type_name_implementation.py
    override func outputCAPIs(to fragment: SourceFragment, context: FishyJoesContext) {
        outputNativeMethodDeclarations(methods: nativeMethods, fragment: fragment)
        fragment.blankLine()
    }

    // output to _type_name_implementation.py
    override func outputCCallbackImplementations(to fragment: SourceFragment, context: FishyJoesContext) {
        context.addHeader(to: fragment, "from .\(typeDefinitionModuleName) import \(unqualifiedName)")
        switch constructor {
        case .public(let fields):
            fragment.output("@fishyjoes_runtime.callback('TODO[ffi_constructor]')")
            fragment.output("@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)")
            fragment.outputBlock("def ffi_constructor(", newLineTerminated: false) {
                fragment.outputMap(fields, separator: ",") { field in
                    "\(field.name): \(field.type.static.ffiConsumedType.name())"
                }
            }
            fragment.outputBlock(" -> fishyjoes_runtime.CreatedRef:") {
                fragment.outputBlock("return fishyjoes_runtime.create_ref(\(unqualifiedName)(", closeWith: "))") {
                    for field in fields {
                        if field.type.static.isPrimitive {
                            fragment.output("\(field.name) = \(field.name),")
                        } else {
                            fragment.output("\(field.name) = fishyjoes_runtime.consume_ref(\(field.name), \(field.type.dynamicsString)),")
                        }
                    }
                }
            }

            if !isExternalWitness {
                ffiFor(fields: fields, fragment: fragment)
            }
        case .reference:
            fragment.output("@fishyjoes_runtime.callback('TODO[ffi_new]')")
            fragment.output("@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)")
            fragment.outputBlock("def ffi_new(ref: fishyjoes_runtime.ConsumedSwiftRef) -> fishyjoes_runtime.CreatedRef:") {
                fragment.output("return fishyjoes_runtime.create_ref(\(unqualifiedName)(ref))")
            }
            fragment.blankLine()
        }
    }

    // output to _type_name_implementation.py
    override func outputSetup(to fragment: SourceFragment, context: FishyJoesContext) {
        fragment.output("# TODO: setup for \(name)")
    }
}

class PythonEnumClass: PythonClass2 {
    let cases: [Case]

    struct Case {
        let documentation: [String]
        let swiftName: String
        let pythonName: String
        let values: [(name: String, type: PythonType)]

        // var pythonName: String {
        //     PythonClass2.deforbidify(upperCaseFirst(swiftName))
        // }
    }

    init(
        module: Module,
        documentation: [String],
        namespaces: [String],
        name: String,
        cases: [Case],
        fields: [Variable],
        methods: [Method],
        conformances: Set<PythonType>
    ) {
        self.cases = cases
        super.init(
            module: module,
            documentation: documentation,
            namespaces: namespaces,
            name: name,
            fields: fields,
            methods: methods,
            conformances: conformances
        )
    }

    override var associatedNamespace: String {
        PythonNamingConventions.namespaceFor(typeName: unqualifiedName)
    }

    override func publicFragments(context: FishyJoesContext) -> [SourceFragment] {
        let associatedNamespace = associatedNamespace
        let baseFragment = context.pythonFragment(
            typeDefinitionModulePath,
            additionalImports: [
                "from . import \(associatedNamespace)",
                "from . import \(implementationModuleName) as _impl",
            ]
        )
        let namespaceFragment = context.pythonFragment("\(associatedNamespace)/__init__.py")
        var fragments = [baseFragment, namespaceFragment]

        var conformancesPart = ""
        if !conformances.isEmpty {
            conformancesPart = "(\(conformances.map { $0.static.name(in: self) }.joined(separator: ", ")))"
        }

        if !cases.isEmpty {
            baseFragment.outputBlock("class _Base\(unqualifiedName)\(conformancesPart):") {
                document(documentation, fragment: baseFragment)
                baseFragment.blankLine()

                fields.forEach { output(field: $0, to: baseFragment) }
                methods.forEach { output(method: $0, to: baseFragment) }
            }
        }

        baseFragment.output("\(PythonClass2.deforbidify(unqualifiedName, localVar: true)): typing.TypeAlias = ", newLineTerminated: false)
        if cases.isEmpty {
            baseFragment.output("typing.Never")
        } else {
            baseFragment.outputBlock("typing.Union[") {
                for enumCase in cases {
                    baseFragment.output("\(associatedNamespace).\(enumCase.pythonName),")
                }
            }
        }

        for enumCase in cases {
            let fragment = context.pythonFragment(
                "\(associatedNamespace)/\(snakify(enumCase.pythonName)).py",
                additionalImports: [
                    "import dataclasses",
                    "from ..\(typeDefinitionModuleName) import _Base\(unqualifiedName)",
                ]
            )
            fragments.append(fragment)

            fragment.output("@typing.final")
            fragment.output("@dataclasses.dataclass(frozen=True)")
            fragment.outputBlock("class \(enumCase.pythonName)(_Base\(unqualifiedName)):") {
                if enumCase.values.isEmpty {
                    fragment.output("pass")
                } else {
                    for value in enumCase.values {
                        fragment.output("\(PythonClass2.deforbidify(value.name, localVar: true)): \(value.type.static.name(in: self))")
                    }
                }
            }

        }
        namespaceFragment.outputBlock("__all__: list[str] = [") {
            for enumCase in cases {
                context.addHeader(to: namespaceFragment, "from .\(snakify(enumCase.pythonName)) import \(enumCase.pythonName)")
                namespaceFragment.output("\"\(enumCase.pythonName)\",")
            }
        }

        return fragments
    }

    // output to _type_name_implementation.py
    override func outputCCallbackImplementations(to fragment: SourceFragment, context: FishyJoesContext) {
        let namespaceName = PythonNamingConventions.namespaceFor(typeName: unqualifiedName)
        context.addHeader(to: fragment, "from . import \(namespaceName)")

        fragment.output("@fishyjoes_runtime.callback(\"EnumDiscriminator\")")
        fragment.output("@fishyjoes_runtime.catch_by_out_ref(default=0)")
        fragment.outputBlock("def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:") {
            fragment.outputBlock("match fishyjoes_runtime.peek_ref(obj_ref, \(unqualifiedName)):") {
                for (enumIndex, enumCase) in cases.enumerated() {
                    fragment.output("case \(namespaceName).\(enumCase.pythonName): return \(enumIndex)")
                }
                fragment.output("case unknown: raise ValueError(f'Unknown \(unqualifiedName) case \"{unknown})\". Enums are not meant to be extended.')")
            }
        }
        fragment.blankLine()

        for enumCase in cases {
            // case constructor
            fragment.output("@fishyjoes_runtime.callback(\"TODO\")")
            fragment.output("@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)")
            fragment.outputBlock("def new_\(snakify(enumCase.pythonName))(", newLineTerminated: false) {
                for value in enumCase.values {
                    fragment.output("\(value.name): \(value.type.static.ffiConsumedName),")
                }
            }
            fragment.outputBlock(" -> fishyjoes_runtime.CreatedRef:") {
                fragment.outputBlock("return fishyjoes_runtime.create_ref(\(namespaceName).\(enumCase.pythonName)(", closeWith: "))") {
                    for value in enumCase.values {
                        if value.type.static.isPrimitive {
                            fragment.output("_\(value.name),")
                        } else {
                            fragment.output("fishyjoes_runtime.consume_ref(\(value.name), \(value.type.dynamicsString)), # type: ignore[arg-type]")
                        }
                    }
                }
            }
            fragment.blankLine()

            // case unpacker
            fragment.output("@fishyjoes_runtime.callback(\"TODO\")")
            fragment.output("@fishyjoes_runtime.catch_by_out_ref(default=None)")
            fragment.outputBlock("def extract_\(enumCase.pythonName)(", newLineTerminated: false) {
                fragment.output("obj: fishyjoes_runtime.UnownedRef,")
                for value in enumCase.values {
                    fragment.output("out_\(value.name): \(value.type.static.ffiOutCreatedName),")
                }
            }
            fragment.outputBlock(" -> None:") {
                fragment.output("self = fishyjoes_runtime.peek_ref(obj, \(namespaceName).\(enumCase.pythonName))")
                for value in enumCase.values {
                    let memberName = PythonClass2.deforbidify(value.name, localVar: false)
                    if value.type.static.isPrimitive {
                        fragment.output("out_\(value.name)[0] = self.\(memberName)")
                    } else {
                        fragment.output("out_\(value.name)[0] = fishyjoes_runtime.create_ref(self.\(memberName))")
                    }
                }
            }
            fragment.blankLine()
        }
    }

    // output to _type_name_implementation.py
    override func outputCAPIs(to fragment: SourceFragment, context: FishyJoesContext) {
        outputNativeMethodDeclarations(methods: nativeMethods, fragment: fragment)
    }

    // output to _type_name_implementation.py
    override func outputSetup(to fragment: SourceFragment, context: FishyJoesContext) {
        fragment.output("# TODO: setup for \(name)")
    }
}

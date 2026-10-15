class PythonEnumClass: PythonClass {
    let isInhabited: Bool
    let cases: [Case]

    struct Case {
        let documentation: [String]
        let swiftName: String
        let pythonName: String
        let values: [(name: String, type: PythonType)]

        // var pythonName: String {
        //     PythonClass.deforbidify(upperCaseFirst(swiftName))
        // }
    }

    init(
        module: Module,
        documentation: [String],
        namespaces: [String],
        name: String,
        mangledName: String,
        isInhabited: Bool,
        cases: [Case],
        fields: [Variable],
        methods: [Method],
        conformances: Set<PythonType> = []
    ) {
        self.isInhabited = isInhabited
        self.cases = cases
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

    override var associatedNamespace: (name: String, additionalExports: [(unqualifiedName: String, importLocation: String?)]) {
        let name = PythonNamingConventions.namespaceFor(typeName: unqualifiedName)
        var additionalExports: [(unqualifiedName: String, importLocation: String?)] = cases.map {
            (unqualifiedName: $0.pythonName, importLocation: ".\(snakify($0.pythonName))")
        }
        for field in fields where field.isStatic {
            additionalExports.append((unqualifiedName: "get_\(field.name)", importLocation: nil))
            if field.isPubliclyWritable {
                additionalExports.append((unqualifiedName: "set_\(field.name)", importLocation: nil))
            }
        }
        for method in methods where method.isStatic {
            additionalExports.append((unqualifiedName: method.name, importLocation: nil))
        }
        return (name, additionalExports)
    }

    override func publicFragments(context: FishyJoesContext) -> [SourceFragment] {
        let baseFragment = context.pythonFragment(
            typeDefinitionModulePath,
            additionalImports: [
                "from . import \(associatedNamespace.name)",
                "from . import \(implementationModuleName) as _impl",
            ]
        )
        let namespaceFragment = context.pythonFragment(
            "\(associatedNamespace.name)/__init__.py",
            additionalImports: [
                "from .. import \(implementationModuleName) as _impl",
            ]
        )
        var fragments = [baseFragment, namespaceFragment]

        var conformancesPart = ""
        if !conformances.isEmpty {
            let conformances = conformances.map { $0.static.name(in: self) }.sorted()
            conformancesPart = "(\(conformances.joined(separator: ", ")))"
        }

        if !cases.isEmpty {
            baseFragment.outputBlock("class _Base\(unqualifiedName)\(conformancesPart):") {
                document(documentation, fragment: baseFragment)
                baseFragment.blankLine()

                // Static fields/methods are declared in the associated namespace, not the base class for enums
                for field in fields where !field.isStatic {
                    output(field: field, to: baseFragment)
                }
                for method in methods where !method.isStatic {
                    output(method: method, to: baseFragment)
                }
            }
        }

        for field in fields where field.isStatic {
            output(field: field, to: namespaceFragment, inClass: false)
        }
        for method in methods where method.isStatic {
            output(method: method, to: namespaceFragment, inClass: false)
        }

        let name = PythonClass.deforbidify(unqualifiedName, localVar: true)
        if cases.isEmpty {
            baseFragment.output("\(name): typing.TypeAlias = typing.Never")
        } else {
            baseFragment.output("# String type syntax used to avoid circular import problems at runtime")
            baseFragment.outputBlock("\(name): typing.TypeAlias = typing.Union[") {
                for enumCase in cases {
                    baseFragment.output("'\(associatedNamespace.name).\(enumCase.pythonName)',")
                }
            }
        }

        for enumCase in cases {
            let fragment = context.pythonFragment(
                "\(associatedNamespace.name)/\(snakify(enumCase.pythonName)).py",
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
                        fragment.output("\(PythonClass.deforbidify(value.name, localVar: true)): \(value.type.static.name(in: self))")
                    }
                }
            }

        }

        return fragments
    }

    // output to _type_name_implementation.py
    override func outputCCallbackImplementations(to fragment: SourceFragment, context: FishyJoesContext) {
        let namespaceName = PythonNamingConventions.namespaceFor(typeName: unqualifiedName)
        context.addHeader(to: fragment, "from . import \(namespaceName)")
        let baseDynType: String
        if !cases.isEmpty {
            context.addHeader(to: fragment, "from .\(typeDefinitionModuleName) import _Base\(unqualifiedName)")
            baseDynType = "_Base\(unqualifiedName)"
        } else {
            baseDynType = "object"
        }

        if isInhabited {
            fragment.output("@fishyjoes_runtime.callback(\"\(mangledName)_DiscriminatorFn\")")
            fragment.output("@fishyjoes_runtime.catch_by_out_ref(default=0)")
            fragment.outputBlock("def enum_discriminator(obj_ref: fishyjoes_runtime.UnownedRef) -> int:") {
                fragment.outputBlock("match fishyjoes_runtime.peek_ref(obj_ref, \(baseDynType)):") {
                    for (enumIndex, enumCase) in cases.enumerated() {
                        fragment.output("case \(namespaceName).\(enumCase.pythonName): return \(enumIndex)")
                    }
                    fragment.output("case unknown: raise ValueError(f'Unknown \(unqualifiedName) case \"{unknown})\". Enums are not meant to be extended.')")
                }
            }
            fragment.blankLine()
        }

        for enumCase in cases {
            // case constructor
            fragment.output("@fishyjoes_runtime.callback(\"\(mangledName)_\(upperCaseFirst(enumCase.swiftName))ConstructorFn\")")
            fragment.output("@fishyjoes_runtime.catch_by_out_ref(default=fishyjoes_runtime.CREATED_REF_NULL)")
            fragment.outputBlock("def new_\(snakify(enumCase.swiftName))(", newLineTerminated: false) {
                for value in enumCase.values {
                    fragment.output("\(value.name): \(value.type.static.ffiConsumedType.name()),")
                }
            }
            fragment.outputBlock(" -> fishyjoes_runtime.CreatedRef:") {
                fragment.outputBlock("return fishyjoes_runtime.create_ref(\(namespaceName).\(enumCase.pythonName)(", closeWith: "))") {
                    for value in enumCase.values {
                        if value.type.static.isPrimitive {
                            fragment.output("_\(value.name),")
                        } else {
                            fragment.output("fishyjoes_runtime.consume_ref(\(value.name), \(value.type.dynamicsString)),")
                        }
                    }
                }
            }
            fragment.blankLine()

            // case unpacker
            fragment.output("@fishyjoes_runtime.callback(\"\(mangledName)_\(upperCaseFirst(enumCase.swiftName))ExtractorFn\")")
            fragment.output("@fishyjoes_runtime.catch_by_out_ref(default=None)")
            fragment.outputBlock("def extract_\(snakify(enumCase.swiftName))(", newLineTerminated: false) {
                fragment.output("obj: fishyjoes_runtime.UnownedRef,")
                for value in enumCase.values {
                    fragment.output("out_\(value.name): \(value.type.static.ffiOutCreatedType.name()),")
                }
            }
            fragment.outputBlock(" -> None:") {
                fragment.output("self = fishyjoes_runtime.peek_ref(obj, \(namespaceName).\(enumCase.pythonName))")
                for value in enumCase.values {
                    let memberName = PythonClass.deforbidify(value.name, localVar: false)
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

class PythonEnumClass: PythonClass2 {
    let cases: [Case]

    struct Case {
        let documentation: [String]
        let name: String
        let values: [(name: String, type: PythonType)]
    }

    init(
        module: Module,
        documentation: [String],
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
            name: name,
            fields: fields,
            methods: methods,
            conformances: conformances
        )
    }

    override func publicFragments(context: FishyJoesContext) -> [SourceFragment] {
        let namespaceName = PythonNamingConventions.namespaceFor(typeName: unqualifiedName)
        let baseFragment = context.pythonFragment("\(unqualifiedName).py")
        let namespaceFragment = context.pythonFragment("\(namespaceName)/__init__.py")
        var fragments = [baseFragment, namespaceFragment]

        var conformancesPart = ""
        if !conformances.isEmpty {
            conformancesPart = "(\(conformances.map { $0.static.name(in: self) }.joined(separator: ", ")))"
        }

        if !cases.isEmpty {
            baseFragment.output("@final")
            baseFragment.outputBlock("class _Base\(unqualifiedName)\(conformancesPart):") {
                document(documentation, fragment: baseFragment)
                baseFragment.blankLine()

                fields.forEach { output(field: $0, to: baseFragment) }
                methods.forEach { output(method: $0, to: baseFragment) }
            }
        }

        for enumCase in cases {
            document(enumCase.documentation, fragment: baseFragment)
            baseFragment.output("const factory \(unqualifiedName).\(enumCase.name)", newLineTerminated: false)

            baseFragment.outputBlock("(", newLineTerminated: false) {
                baseFragment.outputMap(enumCase.values, separator: ",") { value in
                    return "\(value.type.static.name(in: self)) \(PythonClass2.deforbidify(value.name))"
                }
            }
            baseFragment.output(" = \(unqualifiedName)_\(upperCaseFirst(enumCase.name))")
            baseFragment.blankLine()
        }

        baseFragment.blankLine()

        for enumCase in cases {
            // output subclasses here that extend the sealed class
            let className = "\(upperCaseFirst(enumCase.name))"
            let fragment = context.pythonFragment("\(namespaceName)/\(snakify(enumCase.name).lowercased()).py")
            fragments.append(fragment)

            fragment.output("class \(className) extends \(unqualifiedName)", newLineTerminated: false)

            fragment.outputBlock(" {") {
                fragment.output("const \(className)", newLineTerminated: false)
                if enumCase.values.isEmpty {
                    fragment.output("()", newLineTerminated: false)
                } else {
                    fragment.outputBlock("(", newLineTerminated: false) {
                        fragment.outputMap(enumCase.values, separator: ",") { value in
                            return "this.\(PythonClass2.deforbidify(value.name))"
                        }
                    }
                }

                fragment.blankLine()

                for value in enumCase.values {
                    fragment.output("final \(value.type.static.name(in: self)) \(PythonClass2.deforbidify(value.name))")
                }

                fragment.blankLine()

                fragment.output("@override")
                fragment.outputBlock("bool operator ==(Object other) => identical(other, this) || (", closeWith: ")") {
                    fragment.output("other.runtimeType == runtimeType")
                    fragment.output("&& other is \(className)")
                    for value in enumCase.values {
                        let valueName = "\(PythonClass2.deforbidify(value.name))"
                        fragment.output("&& const DeepCollectionEquality().equals(other.\(valueName), \(valueName))")
                    }
                }

                fragment.blankLine()
                fragment.blankLine()

                fragment.output("@override")
                fragment.output("int get hashCode => ", newLineTerminated: false)
                if enumCase.values.isEmpty {
                    fragment.output("runtimeType.hashCode")
                } else {
                    fragment.outputBlock("Object.hash(", closeWith: ")") {
                        fragment.output("runtimeType,")
                        fragment.outputMap(enumCase.values, separator: ",") { value in
                            "const DeepCollectionEquality().hash(\(PythonClass2.deforbidify(value.name)))"
                        }
                    }
                }

                fragment.blankLine()

                fragment.output("@override")
                fragment.output("String toString() => '\(unqualifiedName).\(enumCase.name)(", newLineTerminated: false)
                let toStringParamsString = enumCase.values.map { "\(PythonClass2.deforbidify($0.name)): $\(PythonClass2.deforbidify($0.name))" }.joined(separator: ", ")
                fragment.output("\(toStringParamsString))'")

                fragment.blankLine()

                fragment.output("\(className) copyWith", newLineTerminated: false)
                if enumCase.values.isEmpty {
                    fragment.output("()", newLineTerminated: false)
                } else {
                    fragment.outputBlock("([", closeWith: "])", newLineTerminated: false) {
                        fragment.outputMap(enumCase.values, separator: ",") {
                            "\($0.type.static.name(in: self).replacingOccurrences(of: "?", with: ""))? \(PythonClass2.deforbidify($0.name))"
                        }
                    }
                }
                fragment.output(" => \(className)", newLineTerminated: false)
                if enumCase.values.isEmpty {
                    fragment.output("()")
                } else {
                    fragment.outputBlock("(", closeWith: ")") {
                        fragment.outputMap(enumCase.values, separator: ",") {
                            let name = "\(PythonClass2.deforbidify($0.name))"
                            return "\(name) ?? this.\(name)"
                        }
                    }
                }
            }

            fragment.blankLine()
        }

        return fragments
    }

    override func outputCCallbackImplementations(to fragment: SourceFragment) {
        fragment.output("@fishyjoes_runtime.callback(\"EnumDiscriminator\")")
        fragment.output("@fishyjoes_runtime.catch_by_out_ref(default=0)")
        fragment.outputBlock("def _enum_discriminator(objRef: UnownedHostRef) -> int:") {
            fragment.outputBlock("match peekRef(obj, \(unqualifiedName)):") {
                for (enumIndex, enumCase) in cases.enumerated() {
                    fragment.output("case \(snakify(unqualifiedName)).\(PythonClass2.deforbidify(upperCaseFirst(enumCase.name))): return \(enumIndex)")
                }
                fragment.output("case unknown: raise ValueError(f'Unknown \(unqualifiedName) case \"{unknown})\". Enums are not meant to be extended.')")
            }
        }
        fragment.blankLine()

        for enumCase in cases {
            let caseName = upperCaseFirst(enumCase.name.mangled)

            // case constructor
            fragment.outputBlock("static CreatedRef new\(caseName)(", newLineTerminated: false) {
                for value in enumCase.values {
                    fragment.output("\(value.type.static.ffiConsumedName) _\(value.name),")
                }
                fragment.output("OutCreatedRef exn")
            }
            fragment.outputBlock(" => catchingRef(exn, () =>", closeWith: ")") {
                fragment.outputBlock("createRef(\(unqualifiedName)_\(caseName)(", closeWith: "))") {
                    for value in enumCase.values {
                        if value.type.static.isPrimitive {
                            fragment.output("_\(value.name),")
                        } else {
                            fragment.output("consumeRef<\(value.type.static.name(in: self))>(_\(value.name)),")
                        }
                    }
                }
            }
            fragment.blankLine()

            // case unpacker
            fragment.outputBlock("static void extract\(caseName)(", newLineTerminated: false) {
                fragment.output("UnownedRef obj,")
                for value in enumCase.values {
                    fragment.output("\(value.type.static.ffiOutCreatedName) _\(value.name),")
                }
                fragment.output("OutCreatedRef exn")
            }
            fragment.outputBlock(" {") {
                fragment.outputBlock("catching(exn, () {", closeWith: "})") {
                    fragment.output("final _self = peekRef<\(unqualifiedName)_\(caseName)>(obj)")
                    for value in enumCase.values {
                        let memberName = PythonClass2.deforbidify(value.name)
                        if value.type.static.isPrimitive {
                            fragment.output("_\(value.name).value = _self.\(memberName)")
                        } else {
                            fragment.output("_\(value.name).value = createRef(_self.\(memberName))")
                        }
                    }
                }
            }
            fragment.blankLine()
        }
    }

    override func outputCAPIs(to fragment: SourceFragment) {
        outputNativeMethodDeclarations(methods: nativeMethods, fragment: fragment)
    }

    override func outputSetup(to fragment: SourceFragment) {
        fragment.output("# TODO: setup for \(name)")
    }
}

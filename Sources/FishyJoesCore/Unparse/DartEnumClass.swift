class DartEnumClass: DartClass {
    let cases: [Case]

    struct Case {
        let documentation: [String]
        let name: String
        let values: [(name: String, type: DartType)]
    }

    init(
        module: Module,
        documentation: [String],
        name: String,
        cases: [Case],
        fields: [Variable],
        methods: [Method],
        conformances: Set<BetterType>
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
        var conformancesPart = ""
        if !conformances.isEmpty {
            conformancesPart.append(" implements ")
            conformancesPart.append(conformances.map { "\(module).\($0.nonNamespacedName)" }.joined(separator: ", "))
        }
        commonIgnoreSpecificWarnings(fragment: fragment)

        document(documentation, fragment: fragment)
        let doSealedClass = !cases.isEmpty
        if doSealedClass {
            fragment.output("sealed ", newLineTerminated: false)
        }
        fragment.output("class \(unqualifiedName)\(conformancesPart)", newLineTerminated: false)

        fragment.outputBlock(" {") {
            for enumCase in cases {
                document(enumCase.documentation, fragment: fragment)
                fragment.output("const factory \(unqualifiedName).\(enumCase.name)", newLineTerminated: false)

                fragment.outputBlock("(", newLineTerminated: false) {
                    fragment.outputMap(enumCase.values, separator: ",") { value in
                        return "\(value.type.name(in: self)) \(DartClass.deforbidify(value.name))"
                    }
                }
                fragment.output(" = \(unqualifiedName)_\(upperCaseFirst(enumCase.name));")
                fragment.blankLine()
            }

            if doSealedClass {
                fragment.output("const \(unqualifiedName)();")
            } else {
                fragment.output("\(unqualifiedName)._();")
            }
            fragment.blankLine()

            fragment.outputBlock("static int enumDiscriminator(UnownedRef obj, OutCreatedRef exn) => check((exn) {", closeWith: "});") {
                if cases.isEmpty {
                    fragment.output("throw UnsupportedError('This class is supposed to be uninhabited');")
                } else {
                    fragment.output("final peekedObj = peekRef<\(unqualifiedName)>(obj);")
                    for (enumIndex, enumCase) in cases.enumerated() {
                        if enumIndex != cases.indices.lowerBound {
                            fragment.output("else ", newLineTerminated: false)
                        }
                        fragment.output("if (peekedObj is \(unqualifiedName)_\(upperCaseFirst(enumCase.name))) { return \(enumIndex); }")
                    }
                    // This should never happen because every enum case should have a subclass extending the abstract base enum sealed class, but just in case...
                    fragment.output("else { throw UnsupportedError('Unknown \(unqualifiedName) subclass'); }")
                }
            }
            fragment.blankLine()

            for enumCase in cases {
                let caseName = upperCaseFirst(enumCase.name.mangled)

                // case constructor
                fragment.outputBlock("static CreatedRef new\(caseName)(", newLineTerminated: false) {
                    for value in enumCase.values {
                        fragment.output("\(value.type.ffiConsumedName) _\(value.name),")
                    }
                    fragment.output("OutCreatedRef exn")
                }
                fragment.outputBlock(" => catchingRef(exn, () =>", closeWith: ");") {
                    fragment.outputBlock("createRef(\(unqualifiedName)_\(caseName)(", closeWith: "))") {
                        for value in enumCase.values {
                            if value.type.isObject {
                                fragment.output("consumeRef<\(value.type.name(in: self))>(_\(value.name)),")
                            } else {
                                fragment.output("_\(value.name),")
                            }
                        }
                    }
                }
                fragment.blankLine()

                // case unpacker
                fragment.outputBlock("static void extract\(caseName)(", newLineTerminated: false) {
                    fragment.output("UnownedRef obj,")
                    for value in enumCase.values {
                        fragment.output("\(value.type.ffiOutCreatedName) _\(value.name),")
                    }
                    fragment.output("OutCreatedRef exn")
                }
                fragment.outputBlock(" {") {
                    fragment.outputBlock("catching(exn, () {", closeWith: "});") {
                        fragment.output("final _self = peekRef<\(unqualifiedName)_\(caseName)>(obj);")
                        for value in enumCase.values {
                            let memberName = DartClass.deforbidify(value.name)
                            if value.type.isObject {
                                fragment.output("_\(value.name).value = createRef(_self.\(memberName));")
                            } else {
                                fragment.output("_\(value.name).value = _self.\(memberName);")
                            }
                        }
                    }
                }
                fragment.blankLine()
            }

            fields.forEach { output(field: $0, to: fragment) }
            methods.forEach { output(method: $0, to: fragment) }

            fragment.blankLine()

            outputNativeMethodDeclarations(methods: nativeMethods, fragment: fragment)

            fragment.blankLine()
        }

        fragment.blankLine()

        for enumCase in cases {
            // output subclasses here that extend the sealed class
            let className = "\(unqualifiedName)_\(upperCaseFirst(enumCase.name))"
            fragment.output("class \(className) extends \(unqualifiedName)", newLineTerminated: false)

            fragment.outputBlock(" {") {
                fragment.output("const \(className)", newLineTerminated: false)
                if enumCase.values.isEmpty {
                    fragment.output("()", newLineTerminated: false)
                } else {
                    fragment.outputBlock("(", newLineTerminated: false) {
                        fragment.outputMap(enumCase.values, separator: ",") { value in
                            return "this.\(DartClass.deforbidify(value.name))"
                        }
                    }
                }
                fragment.output(";")

                fragment.blankLine()

                for value in enumCase.values {
                    fragment.output("final \(value.type.name(in: self)) \(DartClass.deforbidify(value.name));")
                }

                fragment.blankLine()

                fragment.output("@override")
                fragment.output("bool operator ==(Object other)", newLineTerminated: false)
                fragment.outputBlock(" {") {
                    fragment.output("return identical(other, this) ||")
                    fragment.output("(")
                    fragment.currentIndent += 1
                    fragment.output("other.runtimeType == runtimeType &&")
                    fragment.output("other is \(className)", newLineTerminated: false)

                    if enumCase.values.isEmpty {
                        fragment.blankLine()
                    } else {
                        fragment.output(" &&")
                        fragment.outputBlock("(") {
                            fragment.outputMap(enumCase.values, separator: " &&") { value in
                                let valueName = "\(DartClass.deforbidify(value.name))"
                                return "const DeepCollectionEquality().equals(other.\(valueName), \(valueName))"
                            }
                        }
                    }
                    fragment.currentIndent -= 1
                    fragment.output(");")
                }

                fragment.blankLine()
                fragment.blankLine()

                fragment.output("@override")
                fragment.output("int get hashCode => ", newLineTerminated: false)
                if enumCase.values.isEmpty {
                    fragment.output("runtimeType.hashCode;")
                } else {
                    fragment.output("Object.hash", newLineTerminated: false)
                    fragment.outputBlock("(", closeWith: ");") {
                        fragment.output("runtimeType,")
                        fragment.outputMap(enumCase.values, separator: ", ") { value in
                            "const DeepCollectionEquality().hash(\(DartClass.deforbidify(value.name)))"
                        }
                    }
                }

                fragment.blankLine()

                fragment.output("@override")
                fragment.output("String toString() => '\(unqualifiedName).\(enumCase.name)(", newLineTerminated: false)
                let toStringParamsString = enumCase.values.map { "\(DartClass.deforbidify($0.name)): $\(DartClass.deforbidify($0.name))" }.joined(separator: ", ")
                fragment.output("\(toStringParamsString))';")

                fragment.blankLine()

                fragment.output("\(className) copyWith", newLineTerminated: false)
                if enumCase.values.isEmpty {
                    fragment.output("()", newLineTerminated: false)
                } else {
                    fragment.outputBlock("([", closeWith: "])", newLineTerminated: false) {
                        fragment.outputMap(enumCase.values, separator: ",") {
                            "\($0.type.name(in: self).replacingOccurrences(of: "?", with: ""))? \(DartClass.deforbidify($0.name))"
                        }
                    }
                }
                fragment.output(" => \(className)", newLineTerminated: false)
                if enumCase.values.isEmpty {
                    fragment.output("();")
                } else {
                    fragment.outputBlock("(", closeWith: ");") {
                        fragment.outputMap(enumCase.values, separator: ",") {
                            let name = "\(DartClass.deforbidify($0.name))"
                            return "\(name) ?? this.\(name)"
                        }
                    }
                }
            }

            fragment.blankLine()
        }
    }
}

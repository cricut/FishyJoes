extension TranslatedEnum {
    func cSharpSetupDelegates(in context: FishyJoesContext) -> [String] {
        var lines: [String] = []
        for enumCase in cases {
            lines.append("delegate \(cSharpType.pInvokeCreatedName) \(cSharpType.name.mangled)_new_\(enumCase.name.mangled)(")
            for value in enumCase.associatedValues {
                let resolved = context.resolve(type: value.type)
                lines.append("    \(resolved.cSharpType.pInvokeConsumedName) \(value.bindingName),")
            }
            lines.append("    out CreatedRef _exn")
            lines.append(");")
            lines.append("unsafe delegate void \(cSharpType.name.mangled)_extract_\(enumCase.name.mangled)(")
            lines.append("    \(cSharpType.pInvokeUnownedName) obj,")
            for value in enumCase.associatedValues {
                let resolved = context.resolve(type: value.type)
                lines.append("    ref \(resolved.cSharpType.pInvokeCreatedName) \(value.bindingName),")
            }
            lines.append("    out CreatedRef _exn")
            lines.append(");")
        }
        return lines
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>] {
        var parameters: [ForeignSetupParameter<String>] = []
        if isInhabited {
            parameters.append(
                .value(name: "discriminator", type: "FishyJoesRuntime.EnumDiscriminator") { fragment in
                    fragment.outputBlock("bag<FishyJoesRuntime.EnumDiscriminator>((\(cSharpType.pInvokeUnownedName) obj, out CreatedRef exn) => Catching(out exn, () => {", closeWith: "})),") {
                        fragment.output("var enumeration = obj.Peek<\(cSharpType.name)>();")
                        for (index, enumCase) in cases.enumerated() {
                            fragment.output("if (enumeration is \(cSharpType.name).\(upperCaseFirst(enumCase.name))) { return (nint)\(index); }")
                        }
                        fragment.output("throw new Exception($\"Found unexpected subclass of \(cSharpType.name): {enumeration}\");")
                    }
                }
            )
        }
        for enumCase in cases {
            let constructorDelegate = "\(cSharpType.name.mangled)_new_\(enumCase.name.mangled)"
            parameters.append(
                .value(name: "\(enumCase.name)_constructor", type: constructorDelegate) { fragment in
                    fragment.outputBlock("bag<\(constructorDelegate)>(", closeWith: "),") {
                        fragment.outputBlock("(", newLineTerminated: false) {
                            for value in enumCase.associatedValues {
                                let resolved = context.resolve(type: value.type)
                                fragment.output("\(resolved.cSharpType.pInvokeConsumedName) _\(value.bindingName),")
                            }
                            fragment.output("out CreatedRef exn")
                        }
                        fragment.outputBlock(" => Catching(out exn, () => ", closeWith: ")") {
                            fragment.outputBlock("new CreatedRef(new \(cSharpType.name).\(upperCaseFirst(enumCase.name))(", closeWith: "))") {
                                fragment.outputMap(enumCase.associatedValues, separator: ",") { value in
                                    let resolved = context.resolve(type: value.type)
                                    if resolved.cSharpType.isObject {
                                        return "_\(value.bindingName).Consume<\(resolved.cSharpType.name)>()"
                                    } else {
                                        return "_\(value.bindingName)"
                                    }
                                }
                            }
                        }
                    }
                }
            )
            let extractorDelegate = "\(cSharpType.name.mangled)_extract_\(enumCase.name.mangled)"
            parameters.append(
                .value(name: "\(enumCase.name)_extractor", type: extractorDelegate) { fragment in
                    fragment.outputBlock("bag<\(extractorDelegate)>(", closeWith: "),") {
                        fragment.outputBlock("(", newLineTerminated: false) {
                            fragment.output("\(cSharpType.pInvokeUnownedName) obj,")
                            for value in enumCase.associatedValues {
                                let resolved = context.resolve(type: value.type)
                                fragment.output("ref \(resolved.cSharpType.pInvokeCreatedName) _\(value.bindingName),")
                            }
                            fragment.output("out CreatedRef exn")
                        }
                        fragment.outputBlock(" => {") {
                            fragment.outputBlock("try {", newLineTerminated: false) {
                                fragment.output("var enumeration = obj.Peek<\(cSharpType.name).\(upperCaseFirst(enumCase.name))>();")
                                for value in enumCase.associatedValues {
                                    let resolved = context.resolve(type: value.type)
                                    if resolved.cSharpType.isObject {
                                        fragment.output("_\(value.bindingName) = new CreatedRef(enumeration.\(upperCaseFirst(value.bindingName)));")
                                    } else {
                                        fragment.output("_\(value.bindingName) = enumeration.\(upperCaseFirst(value.bindingName));")
                                    }
                                }
                                fragment.output("exn = CreatedRef.Null;")
                            }
                            fragment.outputBlock(" catch (Exception e) {") {
                                fragment.output("exn = new CreatedRef(e);")
                            }
                        }
                    }
                }
            )
        }
        return parameters
    }

    func cSharpClass(context: FishyJoesContext) -> CSharpEnumClass {
        let fieldsAndMethods = fields.flatMap {
            context.cSharp(field: $0, of: self, useNativeName: false)
        } + methods.compactMap {
            context.cSharp(method: $0, of: self)
        }

        let (enumFields, enumMethods) = CSharpClass.separate(fieldsAndMethods: fieldsAndMethods)

        let csTypeConformances = conformances.map {
            CSharpClass.CSType.named(package: $0.module, name: $0.nonNamespacedName)
        }

        return CSharpEnumClass(
            module: context.module,
            documentation: documentation,
            name: cSharpType.name,
            cases: cases.map { enumCase in
                let name = upperCaseFirst(enumCase.name)
                return CSharpEnumClass.Case(
                    documentation: enumCase.documentation,
                    name: name,
                    values: enumCase.associatedValues.map { value in
                        (upperCaseFirst(value.bindingName), context.resolve(type: value.type).cSharpType)
                    }
                )
            },
            fields: enumFields,
            methods: enumMethods,
            conformances: Set(csTypeConformances)
        )
    }
}

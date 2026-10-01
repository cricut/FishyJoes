extension TranslatedEnum {
    func pythonSetupTypeAliases(in context: FishyJoesContext) -> [String] {
        var lines: [String] = []
        for enumCase in cases {
            lines.append("_\(pythonType.static.name().mangled)_new_\(enumCase.name.mangled): typing.TypeAlias = typing.Callable[[")
            for value in enumCase.associatedValues {
                let resolved = context.resolve(type: value.type)
                lines.append("    \(resolved.pythonType.static.ffiConsumedName),")
            }
            lines.append("    fishyjoes_runtime.OutCreatedRef")
            lines.append("], \(pythonType.static.ffiCreatedName)]")
            lines.append("_\(pythonType.static.name().mangled)_extract_\(enumCase.name.mangled): typing.TypeAlias = typing.Callable[[")
            lines.append("    \(pythonType.static.ffiUnownedName),")
            for value in enumCase.associatedValues {
                let resolved = context.resolve(type: value.type)
                lines.append("    \(resolved.pythonType.static.ffiOutCreatedName),")
            }
            lines.append("    fishyjoes_runtime.OutCreatedRef")
            lines.append("], None]")
        }
        return lines
    }

    static let enumDiscriminatorTagType: PythonClass2.PythonType =
        .callable(args: [.unownedHostRef, .outCreatedHostRef], return: .primitive(name: "int"))

    func pythonSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<PythonClass2.PythonType>] {
        var parameters: [ForeignSetupParameter<PythonClass2.PythonType>] = []
        let implModule = "_\(pythonType.static.baseName!)_implementation"
        if isInhabited {
            parameters.append(
                .value(name: "discriminator", type: Self.enumDiscriminatorTagType) { fragment in
                    context.addHeader(to: fragment, "from . import \(implModule)")
                    fragment.output("\(implModule).enum_discriminator,")
                }
            )
        }
        for enumCase in cases {
            parameters.append(
                .value(
                    name: "\(enumCase.name)_constructor",
                    type: .callable(args: [.TODO], return: .TODO)
                ) { fragment in
                    context.addHeader(to: fragment, "from . import \(implModule)")
                    fragment.output("\(implModule).new_\(enumCase.name.mangled),")
                }
            )
            parameters.append(
                .value(
                    name: "\(enumCase.name)_extractor",
                    type: .callable(args: [.TODO], return: .TODO)
                ) { fragment in
                    fragment.output("\(implModule).extract_\(enumCase.name.mangled),")
                }
            )
        }
        return parameters
    }

    func pythonClass(context: FishyJoesContext) -> PythonEnumClass {
        let (fields, methods) = PythonClass2.separate(
            fieldsAndMethods:
                fields.compactMap {
                    context.python(field: $0, of: self, useNativeName: false)
                } + methods.compactMap {
                    context.python(method: $0, of: self)
                }
        )
        return PythonEnumClass(
            module: context.module,
            documentation: documentation,
            namespaces: pythonType.static.namespaces,
            name: pythonType.static.name(),
            cases: cases.map { enumCase in
                return PythonEnumClass.Case(
                    documentation: enumCase.documentation,
                    swiftName: enumCase.name,
                    pythonName: enumCase.pythonUnqualifiedName,
                    values: enumCase.associatedValues.map { value in
                        (value.bindingName, context.resolve(type: value.type).pythonType)
                    }
                )
            },
            fields: fields,
            methods: methods,
            conformances: Set(exportedConformances(in: context).map { $0.pythonType})
        )
    }
}

extension TranslatedEnum.Case {
    var pythonUnqualifiedName: String {
        PythonClass2.deforbidify(upperCaseFirst(name), localVar: false)
    }

    func pythonType(inModule module: String, enumNamespace: [String], enumName: String) -> PythonClass2.PythonType {
        .class(
            module: module,
            namespaces: enumNamespace + [snakify(enumName)],
            name: pythonUnqualifiedName
        )
    }
}

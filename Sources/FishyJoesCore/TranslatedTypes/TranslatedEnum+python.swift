extension TranslatedEnum {
    func pythonSetupTypeAliases(in context: FishyJoesContext) -> [String] {
        var lines: [String] = []
        for enumCase in cases {
            lines.append("_\(pythonType.static.name().mangled)_new_\(enumCase.name.mangled): typing.TypeAlias = typing.Callable[[")
            for value in enumCase.associatedValues {
                let resolved = context.resolve(type: value.type)
                lines.append("    \(resolved.pythonType.static.ffiConsumedType.name()),")
            }
            lines.append("    fishyjoes_runtime.OutCreatedRef")
            lines.append("], \(pythonType.static.ffiCreatedType.name())]")
            lines.append("_\(pythonType.static.name().mangled)_extract_\(enumCase.name.mangled): typing.TypeAlias = typing.Callable[[")
            lines.append("    \(pythonType.static.ffiUnownedType.name()),")
            for value in enumCase.associatedValues {
                let resolved = context.resolve(type: value.type)
                lines.append("    \(resolved.pythonType.static.ffiOutCreatedType.name()),")
            }
            lines.append("    fishyjoes_runtime.OutCreatedRef")
            lines.append("], None]")
        }
        return lines
    }

    static let enumDiscriminatorTagType: PythonType =
        .callable(args: [.unownedHostRef, .outCreatedHostRef], return: .primitive(name: "int"))

    func pythonSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<PythonType>] {
        var parameters: [ForeignSetupParameter<PythonType>] = []

        let (importLine, implLocalName) = PythonNamingConventions.importImplemenationModule(for: pythonType)

        if isInhabited {
            parameters.append(
                .value(name: "discriminator", type: Self.enumDiscriminatorTagType) { fragment in
                    context.addHeader(to: fragment, importLine)
                    fragment.output("\(implLocalName).enum_discriminator,")
                }
            )
        }
        for enumCase in cases {
            let pythonTypes = enumCase.associatedValues.map { value in
                context.resolve(type: value.type).pythonType
            }
            parameters.append(
                .value(
                    name: "\(enumCase.name)_constructor",
                    type: .callable(args: pythonTypes.map(\.static.ffiConsumedType) + [.outCreatedHostRef], return: .createdHostRef)
                ) { fragment in
                    fragment.output("\(implLocalName).new_\(snakify(enumCase.name)),")
                }
            )
            parameters.append(
                .value(
                    name: "\(enumCase.name)_extractor",
                    type: .callable(
                        args: [.unownedHostRef]
                            + pythonTypes.map(\.static.ffiOutCreatedType)
                            + [.outCreatedHostRef],
                        return: .none)
                ) { fragment in
                    fragment.output("\(implLocalName).extract_\(snakify(enumCase.name)),")
                }
            )
        }
        return parameters
    }

    func pythonClass(context: FishyJoesContext) -> PythonClass {
        let (fields, methods) = PythonClass.separate(
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
            mangledName: sourceType.name.mangled,
            isInhabited: isInhabited,
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
            methods: methods
        ).conforming(to: exportedConformances(in: context), context: context)
    }
}

extension TranslatedEnum.Case {
    var pythonUnqualifiedName: String {
        PythonClass.deforbidify(upperCaseFirst(name), localVar: false)
    }

    func pythonType(inModule module: String, enumNamespace: [String], enumName: String) -> PythonType {
        .class(
            module: module,
            namespaces: enumNamespace + [snakify(enumName)],
            name: pythonUnqualifiedName
        )
    }
}

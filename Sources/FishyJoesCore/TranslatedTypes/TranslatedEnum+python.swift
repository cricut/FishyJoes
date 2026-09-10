extension TranslatedEnum {
    func pythonSetupTypeAliases(in context: FishyJoesContext) -> [String] {
        var lines: [String] = []
        for enumCase in cases {
            lines.append("_\(pythonType.static.name().mangled)_new_\(enumCase.name.mangled): TypeAlias = Callable[[")
            for value in enumCase.associatedValues {
                let resolved = context.resolve(type: value.type)
                lines.append("        \(resolved.pythonType.static.ffiConsumedTag),")
            }
            lines.append("        OutCreatedRef")
            lines.append("    ], \(pythonType.static.ffiCreatedTag)]")
            lines.append("_\(pythonType.static.name().mangled)_extract_\(enumCase.name.mangled): TypeAlias = Callable[[")
            lines.append("        \(pythonType.static.ffiUnownedName),")
            for value in enumCase.associatedValues {
                let resolved = context.resolve(type: value.type)
                lines.append("        \(resolved.pythonType.static.ffiOutCreatedTag),")
            }
            lines.append("        OutCreatedRef _exn")
            lines.append("    ], None]")
        }
        return lines
    }

    static let enumDiscriminatorTagType: PythonClass2.PythonType =
        .callable(args: [.unownedHostRef, .outCreatedHostRef], return: .primitive(name: "int"))

    func pythonSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<PythonClass2.PythonType>] {
        var parameters: [ForeignSetupParameter<PythonClass2.PythonType>] = []
        if isInhabited {
            parameters.append(
                .value(name: "discriminator", type: Self.enumDiscriminatorTagType) { fragment in
                    fragment.output("ffi.Pointer.fromFunction(\(pythonType.static.name()).enumDiscriminator, 0),")
                }
            )
        }
        for enumCase in cases {
            let constructorType = "\(pythonType.static.name().mangled)_new_\(enumCase.name.mangled)"
            parameters.append(
                .value(name: "\(enumCase.name)_constructor", type: .none /* .named(package: nil, name: "ffi.Pointer<ffi.NativeFunction<\(constructorType)>>") */) { fragment in
                    fragment.output("ffi.Pointer.fromFunction(\(pythonType.static.name()).new\(upperCaseFirst(enumCase.name.mangled))),")
                }
            )
            let extractorType = "\(pythonType.static.name().mangled)_extract_\(enumCase.name.mangled)"
            parameters.append(
                .value(name: "\(enumCase.name)_extractor", type: .none /* .named(package: nil, name: "ffi.Pointer<ffi.NativeFunction<\(extractorType)>>") */) { fragment in
                    fragment.output("ffi.Pointer.fromFunction(\(pythonType.static.name()).extract\(upperCaseFirst(enumCase.name.mangled))),")
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
            name: pythonType.static.name(),
            cases: cases.map { enumCase in
                let name = enumCase.name
                return PythonEnumClass.Case(
                    documentation: enumCase.documentation,
                    name: name,
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

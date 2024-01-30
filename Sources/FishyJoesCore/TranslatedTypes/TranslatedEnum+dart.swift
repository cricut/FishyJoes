extension TranslatedEnum {
    func dartSetupDelegates(in context: FishyJoesContext) -> [String] {
        var lines: [String] = []
        for enumCase in cases {
            lines.append("typedef \(dartType.name().mangled)_new_\(enumCase.name.mangled) = \(dartType.ffiCreatedTag) Function(")
            for value in enumCase.associatedValues {
                let resolved = context.resolve(type: value.type)
                lines.append("    \(resolved.dartType.ffiConsumedTag) \(value.bindingName),")
            }
            lines.append("    OutCreatedRef _exn")
            lines.append(");")
            lines.append("typedef \(dartType.name().mangled)_extract_\(enumCase.name.mangled) = ffi.Void Function(")
            lines.append("    \(dartType.ffiUnownedName) obj,")
            for value in enumCase.associatedValues {
                let resolved = context.resolve(type: value.type)
                lines.append("    \(resolved.dartType.ffiOutCreatedTag) \(value.bindingName),")
            }
            lines.append("    OutCreatedRef _exn")
            lines.append(");")
        }
        return lines
    }

    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>] {
        var parameters: [ForeignSetupParameter<DartClass.DartType>] = []
        if isInhabited {
            parameters.append(
                .value(name: "discriminator", type: .named(package: nil, name: "ffi.Pointer<ffi.NativeFunction<EnumDiscriminatorTag>>")) { fragment in
                    fragment.output("ffi.Pointer.fromFunction(\(dartType.name()).enumDiscriminator, 0),")
                }
            )
        }
        for enumCase in cases {
            let constructorType = "\(dartType.name().mangled)_new_\(enumCase.name.mangled)"
            parameters.append(
                .value(name: "\(enumCase.name)_constructor", type: .named(package: nil, name: "ffi.Pointer<ffi.NativeFunction<\(constructorType)>>")) { fragment in
                    fragment.output("ffi.Pointer.fromFunction(\(dartType.name()).new\(upperCaseFirst(enumCase.name.mangled))),")
                }
            )
            let extractorType = "\(dartType.name().mangled)_extract_\(enumCase.name.mangled)"
            parameters.append(
                .value(name: "\(enumCase.name)_extractor", type: .named(package: nil, name: "ffi.Pointer<ffi.NativeFunction<\(extractorType)>>")) { fragment in
                    fragment.output("ffi.Pointer.fromFunction(\(dartType.name()).extract\(upperCaseFirst(enumCase.name.mangled))),")
                }
            )
        }
        return parameters
    }

    func dartClass(context: FishyJoesContext) -> DartEnumClass {
        DartEnumClass(
            module: context.module,
            documentation: documentation,
            protocols: protocols,
            name: dartType.name(),
            cases: cases.map { enumCase in
                let name = enumCase.name
                return DartEnumClass.Case(
                    documentation: enumCase.documentation,
                    name: name,
                    values: enumCase.associatedValues.map { value in
                        (value.bindingName, context.resolve(type: value.type).dartType)
                    }
                )
            },
            fieldsAndMethods:
                fields.compactMap { context.dart(field: $0, of: self, useNativeName: false) } +
                methods.compactMap { context.dart(method: $0, of: self) }
        )
    }
}

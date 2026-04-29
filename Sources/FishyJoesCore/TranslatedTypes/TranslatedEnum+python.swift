extension TranslatedEnum {
    func pythonClass(context: FishyJoesContext) -> PythonEnumClass {
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
            name: sourceType.name,
            cases: cases.map { enumCase in
                var usedValueNames = Set<String>()
                let values = enumCase.associatedValues.map { value in
                    (value.bindingName, context.resolve(type: value.type).pythonType)
                }
                return PythonEnumClass.Case(
                    documentation: enumCase.documentation,
                    name: enumCase.name,
                    sourceName: PythonClass.sourceIdentifier(for: enumCase.name),
                    values: values,
                    sourceValues: values.map {
                        (PythonClass.uniqueSourceIdentifier(for: $0.0, used: &usedValueNames), $0.1)
                    }
                )
            },
            fields: fields,
            methods: methods
        )
    }
}

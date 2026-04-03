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
            name: sourceType.nonNamespacedName,
            cases: cases.map { enumCase in
                .init(
                    documentation: enumCase.documentation,
                    name: enumCase.name,
                    values: enumCase.associatedValues.map { value in
                        (value.bindingName, context.resolve(type: value.type).pythonType)
                    }
                )
            },
            fields: fields,
            methods: methods
        )
    }
}

extension TranslatedProtocol {
    func pythonSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<PythonType>] {
        var setupParams = [ForeignSetupParameter<PythonType>]()

        let externalWitnessType = PythonType.class(
            module: pythonType.static.package,
            namespaces: pythonType.static.namespaces,
            name: "ExternalWitness_" + pythonType.static.baseName
        )

        let (importLine, implLocalName) = PythonNamingConventions.importImplemenationModule(for: pythonType)
        let (externalWitnessImportLine, externalWitnessImplLocalName) = PythonNamingConventions.importImplemenationModule(for: externalWitnessType)

        setupParams.append(
            .value(
                name: "constructor",
                type: .callable(
                    args: [.consumedSwiftRef, .outCreatedHostRef],
                    return: .createdHostRef
                )
            ) { fragment in
                context.addHeader(to: fragment, externalWitnessImportLine)
                fragment.output("\(externalWitnessImplLocalName).ffi_new,")
            }
        )

        for field in fields {
            let staticType = context.resolve(type: field.type).pythonType.static
            let ffiName = "ffi_get_" + (field.exportAnnotation?.pythonName ?? PythonClass.deforbidify(snakify(field.exportAnnotation?.name ?? field.name), localVar: false))
            setupParams.append(
                .value(
                    name: ffiName,
                    type: .callable(args: [.unownedHostRef, .outCreatedHostRef], return: staticType.ffiCreatedType)
                ) { fragment in
                    context.addHeader(to: fragment, importLine)
                    fragment.output("\(implLocalName).\(ffiName),")
                }
            )
        }

        for method in methods {
            let ffiName = "ffi_method_" + snakify(method.callName)

            let parameterTypes = method.parameters.map { context.resolve(type: $0.type).pythonType.static.ffiUnownedType }
            let returnType = context.resolve(type: method.returnType).pythonType.static.ffiCreatedType

            setupParams.append(
                .value(
                    name: ffiName,
                    type: .callable(
                        args: [.unownedHostRef] + parameterTypes + [.outCreatedHostRef],
                        return: returnType
                    )
                ) { fragment in
                    context.addHeader(to: fragment, importLine)
                    fragment.output("\(implLocalName).\(ffiName),")
                }
            )
        }

        return setupParams
    }

    func registerPythonClass(context: FishyJoesContext) {
        let (protocolFields, protocolMethods) = PythonClass.separate(
            fieldsAndMethods:
                fields.compactMap {
                    context.python(field: $0, of: self, useNativeName: false)
                } + methods.compactMap {
                    context.python(method: $0, of: self)
                }
        )

        context.add(
            pythonClass: PythonProtocolClass(
                module: context.module,
                documentation: documentation,
                namespaces: pythonType.static.namespaces,
                name: pythonType.static.name(),
                mangledName: sourceType.name.mangled,
                fields: protocolFields,
                methods: protocolMethods
            ).conforming(to: exportedConformances(in: context), context: context)
        )

        let (externalWitnessFields, externalWitnessMethods) = PythonClass.separate(
            fieldsAndMethods:
                fields.compactMap {
                    context.python(field: $0, of: self, useNativeName: false)
                } + methods.filter { !$0.isDefaultImplementation }.compactMap {
                    context.python(method: $0, of: self)
                }
        )
        context.add(
            pythonClass: PythonProductClass(
                module: context.module,
                documentation: documentation,
                namespaces: pythonType.static.namespaces,
                name: "\(definingModule.pythonPackageName).\(iotaExternalWitnessClassName)",
                mangledName: iotaExternalWitnessClassName.mangled,
                constructor: .reference,
                fields: externalWitnessFields,
                methods: externalWitnessMethods,
            ).conforming(to: [self] + exportedConformances(in: context), context: context)
        )
    }
}

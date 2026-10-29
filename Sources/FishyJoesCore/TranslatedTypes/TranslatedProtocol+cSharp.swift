extension TranslatedProtocol {
    func cSharpSetupTypeAliases(in context: FishyJoesContext) -> [String] {
        var lines: [String] = []
        let created = cSharpType.pInvokeCreatedName
        lines += created.returnMark
        lines.append("delegate \(created.name) _\(converterType.genericBaseName.mangledName)Constructor(")
        lines.append("    ConsumedRef ptr,")
        lines.append("    out CreatedRef exn")
        lines.append(");")
        // All fields in protocols treated as methods with "Get" prefix because of C# tradition; and we can only do `get throws` for computed properties in Swift because there's no `set throws`.
        for field in fields {
            let resolved = context.resolve(type: field.type)
            let commonName = "_\(converterType.genericBaseName.mangledName)_Get\(field.name)"
            let created = resolved.cSharpType.pInvokeCreatedName
            lines += created.returnMark
            lines.append("delegate \(created.name) \(commonName)(\(cSharpType.pInvokeUnownedName) obj, out CreatedRef exn);")
        }
        for method in methods {
            let resolvedReturnType = context.resolve(type: method.returnType)
            let commonName = "_\(converterType.genericBaseName.mangledName)_\(method.callName)"
            let created = resolvedReturnType.cSharpType.pInvokeCreatedName
            lines += created.returnMark
            var line = "delegate \(created.name) \(commonName)(\(cSharpType.pInvokeUnownedName) obj, "
            for parameter in method.parameters {
                let resolved = context.resolve(type: parameter.type)
                line.append("\(resolved.cSharpType.name) \(parameter.name), ")
            }
            line.append("out CreatedRef exn);")
            lines.append(line)
        }
        return lines
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>] {
        let constructorType = "_\(converterType.genericBaseName.mangledName)Constructor"
        var foreignSetupParameters = [ForeignSetupParameter<String>]()

        foreignSetupParameters.append(
            .value(
                name: "constructor",
                type: constructorType
            ) { fragment in
                fragment.outputBlock("bag<\(constructorType)>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {", closeWith: "})),") {
                    fragment.output("return new CreatedRef(new \(cSharpType.package ?? context.module.name).ExternalWitness_\(cSharpType.unqualifiedName)(ptr));")
                }
            }
        )

        let fieldsParameters = fields.map { field -> ForeignSetupParameter in
            let resolved = context.resolve(type: field.type)
            let commonName = "_\(converterType.genericBaseName.mangledName)_Get\(field.name)"
            return
                .value(
                    name: "Get\(field.name)",
                    type: commonName
                ) { fragment in
                    // All fields in protocols are asMethod Get only
                    fragment.outputBlock("bag<\(commonName)>((\(cSharpType.pInvokeUnownedName) obj, out CreatedRef exn) => Catching(out exn, () =>", closeWith: ")),") {
                        let grab = "obj.Peek<\(cSharpType.name)>().Get\(CSharpClass.deforbidify(upperCaseFirst(field.exportAnnotation?.name ?? field.name)))()"
                        if resolved.cSharpType.isObject {
                            fragment.output("new CreatedRef(\(grab))")
                        } else {
                            fragment.output("\(grab)")
                        }
                    }
                }
        }
        foreignSetupParameters.append(contentsOf: fieldsParameters)

        let methodsParameters = methods.map { method -> ForeignSetupParameter in
            let commonName = "_\(converterType.genericBaseName.mangledName)_\(method.callName)"
            return .value(
                name: method.callName,
                type: commonName
            ) { fragment in
                let resolvedReturnType = context.resolve(type: method.returnType)
                var line = "bag<\(commonName)>((\(cSharpType.pInvokeUnownedName) obj, "
                for parameter in method.parameters {
                    let resolved = context.resolve(type: parameter.type)
                    line.append("\(resolved.cSharpType.name) \(parameter.name), ")
                }
                line.append("out CreatedRef exn) => Catching(out exn, () => ")
                fragment.outputBlock(line, closeWith: ")),") {
                    let grab = "obj.Peek<\(cSharpType.name)>().\(CSharpClass.deforbidify(upperCaseFirst(method.callName)))(\(method.parameters.map { $0.name }.joined(separator: ", ")))"
                    if resolvedReturnType.cSharpType.isObject {
                        fragment.output("new CreatedRef(\(grab))")
                    } else {
                        fragment.output("\(grab)")
                    }
                    fragment.blankLine()
                }
            }
        }
        foreignSetupParameters.append(contentsOf: methodsParameters)

        return foreignSetupParameters
    }

    func registerCSharpClass(context: FishyJoesContext) {
        let (protocolFields, protocolMethods) = CSharpClass.separate(
            fieldsAndMethods:
                fields.flatMap {
                    context.cSharp(field: $0, of: self, useNativeName: false)
                } + methods.compactMap {
                    context.cSharp(method: $0, of: self)
                }
        )

        context.add(
            cSharpClass: CSharpProtocolClass(
                module: context.module,
                documentation: documentation,
                name: cSharpType.name,
                fields: protocolFields,
                methods: protocolMethods,
                conformances: Set(exportedConformances(in: context).map { $0.cSharpType})
            )
        )

        let (externalWitnessFields, externalWitnessMethods) = CSharpClass.separate(
            fieldsAndMethods:
                fields.flatMap {
                    context.cSharp(field: $0, of: self, useNativeName: false)
                } + methods.filter { !$0.isDefaultImplementation }.compactMap {
                    context.cSharp(method: $0, of: self)
                }
        )

        context.add(
            cSharpClass: CSharpProductClass(
                module: context.module,
                documentation: documentation,
                name: "\(cSharpType.package ?? "Cricut.\(context.module.name)").\(iotaExternalWitnessClassName)",
                constructor: .reference,
                fields: externalWitnessFields,
                methods: externalWitnessMethods,
                conformances: [context.resolve(type: sourceType).cSharpType]
                // [CSharpClass.CSType.named(package: sourceType.module, name: sourceType.unqualifiedName)]
            )
        )
    }

}

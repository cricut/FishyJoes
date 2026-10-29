extension TranslatedProtocol {
    func dartSetupTypeAliases(in context: FishyJoesContext) -> [String] {
        var lines: [String] = []
        lines.append("typedef _\(sourceType.genericBaseName.mangledName)Constructor = \(dartType.ffiCreatedName) Function(")
        lines.append("    ffi.Pointer ref,")
        lines.append("    OutCreatedRef exn")
        lines.append(");")
        for field in fields {
            let resolved = context.resolve(type: field.type)
            let commonName = "_\(sourceType.genericBaseName.mangledName)_\(field.name)"
            lines.append("typedef \(commonName)Getter = \(resolved.dartType.ffiCreatedTag) Function(\(dartType.ffiUnownedTag) obj, OutCreatedRef exn);")
            if field.isMutable {
                lines.append("typedef \(commonName)Setter = ffi.Void Function(\(dartType.ffiUnownedTag) obj, \(resolved.dartType.ffiConsumedTag) newValue, OutCreatedRef exn);")
            }
        }
        for method in methods {
            let returnType = context.resolve(type: method.returnType)
            let commonName = "_\(sourceType.genericBaseName.mangledName)_\(method.callName)"
            let params = method.parameters.map {
                let resolved = context.resolve(type: $0.type)
                return "\(resolved.dartType.ffiUnownedTag) \($0.name)"
            }
            let paramsStr = params.isEmpty ? "" : "\(params.joined(separator: ", ")),"
            lines.append("typedef \(commonName) = \(returnType.dartType.ffiCreatedTag) Function(\(dartType.ffiUnownedTag) obj, \(paramsStr) OutCreatedRef exn);")
        }
        return lines
    }

    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>] {
        var setupParams = [ForeignSetupParameter<DartClass.DartType>]()

        let constructorType = "_\(sourceType.genericBaseName.mangledName)Constructor"

        setupParams.append(
            .value(
                name: "constructor",
                type: .named(package: nil, name: "ffi.Pointer<ffi.NativeFunction<\(constructorType)>>")
            ) { fragment in
                // only the ffi_new is in the ExternalWitness. The rest of the ffis are in the AProtocol_FfiHooks extension to AProtocol
                fragment.output("ffi.Pointer.fromFunction(\(context.module.name).\(iotaExternalWitnessClassName).ffi_new),")
            }
        )

        for field in fields {
            let resolved = context.resolve(type: field.type)
            let commonName = "_\(sourceType.genericBaseName.mangledName)_\(field.name)"
            let getType = "\(commonName)Getter"

            setupParams.append(
                .value(
                    name: "get_\(field.name)",
                    type: .named(package: nil, name: "ffi.Pointer<ffi.NativeFunction<\(getType)>>")
                ) { fragment in
                    let defaultValue = resolved.dartType.defaultReturnValue.map { ", \($0)" } ?? ""
                    fragment.output("ffi.Pointer.fromFunction(\(dartType.name())_FfiHooks.ffi_get_\(field.exportAnnotation?.name ?? field.name)\(defaultValue)),")
                }
            )
        }

        for method in methods {
            let resolvedReturn = context.resolve(type: method.returnType)
            let commonName = "_\(sourceType.genericBaseName.mangledName)_\(method.callName)"

            setupParams.append(
                .value(
                    name: method.callName,
                    type: .named(package: nil, name: "ffi.Pointer<ffi.NativeFunction<\(commonName)>>")
                ) { fragment in
                    let defaultValue = resolvedReturn.dartType.defaultReturnValue.map { ", \($0)" } ?? ""
                    if method.isDefaultImplementation {
                        fragment.output("ffi.Pointer.fromFunction(\(dartType.name())_DefaultImplementations.ffi_\(method.callName)\(resolvedReturn.dartType.defaultReturnValue.map { ", \($0)" } ?? "")),")
                    } else {
                        fragment.output("ffi.Pointer.fromFunction(\(dartType.name())_FfiHooks.ffi_\(method.callName)\(defaultValue)),")
                    }
                }
            )
        }

        return setupParams
    }

    func registerDartClass(context: FishyJoesContext) {
        let (protocolFields, protocolMethods) = DartClass.separate(
            fieldsAndMethods:
                fields.compactMap {
                    context.dart(field: $0, of: self, useNativeName: false)
                } + methods.compactMap {
                    context.dart(method: $0, of: self)
                }
        )

        context.add(
            dartClass: DartProtocolClass(
                module: context.module,
                documentation: documentation,
                name: dartType.name(),
                fields: protocolFields,
                methods: protocolMethods,
                conformances: Set(exportedConformances(in: context).map { $0.dartType})
            )
        )

        let (externalWitnessFields, externalWitnessMethods) = DartClass.separate(
            fieldsAndMethods:
                fields.compactMap {
                    context.dart(field: $0, of: self, useNativeName: false)
                } + methods.filter { !$0.isDefaultImplementation }.compactMap {
                    context.dart(method: $0, of: self)
                }
        )
        context.add(
            dartClass: DartProductClass(
                module: context.module,
                documentation: documentation,
                name: "\(context.module.name).\(iotaExternalWitnessClassName)",
                constructor: .reference,
                fields: externalWitnessFields,
                methods: externalWitnessMethods,
                conformances: [dartType]
            )
        )
    }
}

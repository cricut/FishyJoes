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
        CSharpEnumClass(
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
            fieldsAndMethods:
                fields.compactMap { context.cSharp(field: $0, of: self, useNativeName: false) } +
                methods.compactMap { context.cSharp(method: $0, of: self) }
        )
    }

    func iotaDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "IotaInterface/\(sourceType.name)+iota-type.swift",
            additionalImports: ["Foundation", "FishyJoesIotaRuntime"]
        )

        var setupMethods = isInhabited ? [(name: "discriminator", args: ["foreignObject", "foreignOutExn"], returns: "Int")] : []

        for enumCase in cases {
            let args = enumCase.associatedValues.map { value in
                "\(context.resolve(type: value.type).converterType.name).CType"
            }
            setupMethods.append((name: "\(enumCase.name)_constructor", args: args + ["foreignOutExn"], returns: "foreignObject"))
            setupMethods.append((name: "\(enumCase.name)_extractor", args: ["foreignObject"] + args.map { "UnsafePointer<\($0)>" } + ["foreignOutExn"], returns: "Void"))
        }

        fragment.output("@_cdecl(\"\(iotaSetupName)\")")
        fragment.outputBlock("public func \(iotaSetupName)(", newLineTerminated: false) {
            fragment.outputMap(setupMethods, separator: ",") { method in
                "\(method.name): @escaping \(sourceType.name).\(upperCaseFirst(method.name))"
            }
        }
        fragment.outputBlock(" {") {
            for method in setupMethods {
                fragment.output("\(sourceType.name).\(method.name) = \(method.name)")
            }
        }
        fragment.blankLine()

        fragment.outputBlock("extension \(sourceType.name): IotaConverter {") {
            for method in setupMethods {
                fragment.outputBlock("public typealias \(upperCaseFirst(method.name)) = @convention(c) (", closeWith: ") -> \(method.returns)") {
                    fragment.outputMap(method.args, separator: ",") { $0 }
                }
                fragment.output("fileprivate static var \(method.name): \(upperCaseFirst(method.name))!")
            }
            if !setupMethods.isEmpty {
                fragment.blankLine()
            }

            fragment.outputBlock("public static func peekIota(_ value: foreignObject) throws -> Self {") {
                if isInhabited {
                    fragment.output("switch try Env.check({ exn in discriminator(value, exn) }) {")
                    for (index, enumCase) in cases.enumerated() {
                        fragment.outputBlock("case \(index):", closeWith: "", newLineTerminated: false) {
                            var args = "value, "
                            var cleanup: [String] = []
                            for value in enumCase.associatedValues {
                                let resolved = context.resolve(type: value.type)
                                fragment.output("var _\(value.bindingName) = \(resolved.converterType.name).CType.default")
                                args += "&_\(value.bindingName), "
                                if resolved.cSharpType.isObject {
                                    cleanup.append("Env.deleteRef(_\(value.bindingName))")
                                }
                            }
                            fragment.output("try Env.check { exn in \(enumCase.name)_extractor(\(args)exn) }")
                            if enumCase.associatedValues.isEmpty {
                                fragment.output("return Self.\(enumCase.name)")
                            } else {
                                if !cleanup.isEmpty {
                                    fragment.outputBlock("defer {") {
                                        cleanup.forEach { fragment.output($0) }
                                    }
                                }
                                fragment.outputBlock("return Self.\(enumCase.name)(") {
                                    fragment.outputMap(enumCase.associatedValues, separator: ",") { value in
                                        let resolved = context.resolve(type: value.type)
                                        return "\(value.name.map { "\($0): " } ?? "")try \(resolved.converterType.name).peekIota(_\(value.bindingName))"
                                    }
                                }
                            }
                        }
                    }
                    fragment.outputBlock("case let disc:", closeWith: "", newLineTerminated: false) {
                        fragment.output("fatalError(\"bad discriminator value \\(disc) encountered for type \\(self)\")")
                    }
                    fragment.output("}")
                } else {
                    fragment.output("throw UninhabitedTypeCreationError(self)")
                }
            }
            fragment.blankLine()

            fragment.outputBlock("public static func toIota(_ value: Self) throws -> foreignObject {") {
                if isInhabited {
                    fragment.output("switch value {")
                    for enumCase in cases {
                        let joinedValues = enumCase.associatedValues.map(\.bindingName).joined(separator: ", ")
                        if enumCase.associatedValues.isEmpty {
                            fragment.output("case \(enumCase.name)", newLineTerminated: false)
                        } else {
                            fragment.output("case let \(enumCase.name)(\(joinedValues))", newLineTerminated: false)
                        }
                        fragment.outputBlock(":", closeWith: "", newLineTerminated: false) {
                            fragment.outputBlock("return try Env.check { exn in", closeWith: "}") {
                                fragment.outputBlock("return \(enumCase.name)_constructor(") {
                                    for value in enumCase.associatedValues {
                                        let resolved = context.resolve(type: value.type)
                                        fragment.output("try \(resolved.converterType.name).toIota(\(value.bindingName)),")
                                    }
                                    fragment.output("exn")
                                }
                            }
                        }
                    }
                    fragment.output("}")
                }
            }
            fragment.blankLine()
        }

        context.add(cSharpClass: cSharpClass(context: context))

        return fragment
    }
}

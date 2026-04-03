extension TranslatedEnum {
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
            fragment.output("envRef: EnvRef" + (setupMethods.isEmpty ? "" : ","))
            fragment.outputMap(setupMethods, separator: ",") { method in
                "\(method.name): @escaping \(sourceType.name).\(upperCaseFirst(method.name))"
            }
        }
        fragment.outputBlock(" {") {
            if !setupMethods.isEmpty {
                fragment.output("let env = Env(envRef)")
            }
            for method in setupMethods {
                fragment.output("\(sourceType.name).\(method.name)[env] = \(method.name)")
            }
        }
        fragment.blankLine()

        fragment.outputBlock("extension \(sourceType.name): FishyJoesIotaRuntime.IotaConverter {") {
            for method in setupMethods {
                fragment.outputBlock("public typealias \(upperCaseFirst(method.name)) = @convention(c) (", closeWith: ") -> \(method.returns)") {
                    fragment.outputMap(method.args, separator: ",") { $0 }
                }
                fragment.output("fileprivate static let \(method.name) = Env.CallbackMap<\(upperCaseFirst(method.name))>()")
            }
            if !setupMethods.isEmpty {
                fragment.blankLine()
            }

            fragment.outputBlock("public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {") {
                if isInhabited {
                    fragment.output("switch try env.check({ exn in discriminator[env](value, exn) }) {")
                    for (index, enumCase) in cases.enumerated() {
                        fragment.outputBlock("case \(index):", closeWith: "", newLineTerminated: false) {
                            var args = "value, "
                            var cleanup: [String] = []
                            for value in enumCase.associatedValues {
                                let resolved = context.resolve(type: value.type)
                                fragment.output("var _\(value.bindingName) = \(resolved.converterType.name).CType.default")
                                args += "&_\(value.bindingName), "
                                if resolved.cSharpType.isObject {
                                    cleanup.append("env.deleteRef(_\(value.bindingName))")
                                }
                            }
                            fragment.output("try env.check { exn in \(enumCase.name)_extractor[env](\(args)exn) }")
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
                                        return "\(value.name.map { "\($0): " } ?? "")try \(resolved.converterType.name).peekIota(_\(value.bindingName), env: env)"
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

            fragment.outputBlock("public static func toIota(_ value: Self, env: Env) throws -> foreignObject {") {
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
                            fragment.outputBlock("return try env.check { exn in", closeWith: "}") {
                                fragment.outputBlock("return \(enumCase.name)_constructor[env](") {
                                    for value in enumCase.associatedValues {
                                        let resolved = context.resolve(type: value.type)
                                        fragment.output("try \(resolved.converterType.name).toIota(\(value.bindingName), env: env),")
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

        context.add(dartClass: dartClass(context: context))
        context.add(cSharpClass: cSharpClass(context: context))
        context.add(pythonClass: pythonClass(context: context))

        return fragment
    }
}

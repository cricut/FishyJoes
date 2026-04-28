class PythonEnumClass: PythonClass {
    struct Case {
        let documentation: [String]
        let name: String
        let values: [(String, PyType)]
    }

    let cases: [Case]

    init(
        module: Module,
        documentation: [String],
        name: String,
        cases: [Case],
        fields: [Variable],
        methods: [Method]
    ) {
        self.cases = cases
        super.init(
            module: module,
            documentation: documentation,
            name: name,
            fields: fields,
            methods: methods
        )
    }

    override func output(to fragment: SourceFragment) {
        if cases.isEmpty {
            fragment.outputBlock("class \(disambiguatedName):", closeWith: "") {
                document(documentation, fragment: fragment, extra: ["Generated FishyJoes Python namespace type."])
                outputMembers(to: fragment)
            }
            return
        }

        if cases.allSatisfy({ $0.values.isEmpty }) {
            fragment.outputBlock("class \(disambiguatedName)(enum.Enum):", closeWith: "") {
                document(documentation, fragment: fragment, extra: ["Generated FishyJoes Python enum."])
                for enumCase in cases {
                    fragment.output("\(enumCase.name) = \"\(enumCase.name)\"")
                }
                if !(fields.isEmpty && methods.isEmpty) {
                    fragment.blankLine()
                    outputMembers(to: fragment)
                }
            }
            return
        }

        fragment.outputBlock("class \(disambiguatedName):", closeWith: "") {
            document(documentation, fragment: fragment, extra: ["Generated FishyJoes Python sum type base class."])
            if fields.isEmpty && methods.isEmpty {
                fragment.output("pass")
            } else {
                outputMembers(to: fragment)
            }
        }

        for enumCase in cases {
            fragment.blankLine()
            fragment.output("@dataclass(slots=True, frozen=True)")
            fragment.outputBlock("class \(disambiguatedName)_\(upperCaseFirst(enumCase.name))(\(unqualifiedName)):", closeWith: "") {
                document(enumCase.documentation, fragment: fragment)
                if enumCase.values.isEmpty {
                    fragment.output("pass")
                } else {
                    for value in enumCase.values {
                        fragment.output("\(value.0): \(value.1.name)")
                    }
                }
            }
        }
    }

    private func outputMembers(to fragment: SourceFragment) {
        if fields.isEmpty && methods.isEmpty {
            fragment.output("pass")
            return
        }

        for field in fields {
            output(field: field, to: fragment)
            fragment.blankLine()
        }
        for method in methods {
            output(method: method, to: fragment)
            fragment.blankLine()
        }
    }

    private func output(field: Variable, to fragment: SourceFragment) {
        if field.asMethod {
            if field.isStatic {
                fragment.output("@staticmethod")
            }
            let parameters = field.isStatic ? "" : "self"
            fragment.outputBlock("def get_\(field.name)(\(parameters)) -> \(field.type.name):", closeWith: "") {
                document(field.documentation, fragment: fragment, extra: field.deprecation.map { ["Deprecated: \($0.quotedMessage)"] } ?? [])
                outputRuntimeCall(
                    fragment: fragment,
                    symbol: field.getterSymbol,
                    returnType: field.ffiType,
                    arguments: field.isStatic ? [] : [(expression: "self", type: .object)]
                )
            }
            return
        }

        if field.isStatic {
            fragment.output("@staticmethod")
            fragment.outputBlock("def \(field.name)() -> \(field.type.name):", closeWith: "") {
                document(field.documentation, fragment: fragment, extra: field.deprecation.map { ["Deprecated: \($0.quotedMessage)"] } ?? [])
                outputRuntimeCall(fragment: fragment, symbol: field.getterSymbol, returnType: field.ffiType, arguments: [])
            }
        } else {
            fragment.output("@property")
            fragment.outputBlock("def \(field.name)(self) -> \(field.type.name):", closeWith: "") {
                document(field.documentation, fragment: fragment, extra: field.deprecation.map { ["Deprecated: \($0.quotedMessage)"] } ?? [])
                outputRuntimeCall(
                    fragment: fragment,
                    symbol: field.getterSymbol,
                    returnType: field.ffiType,
                    arguments: [(expression: "self", type: .object)]
                )
            }
        }
    }

    private func output(method: Method, to fragment: SourceFragment) {
        if method.isStatic {
            fragment.output("@staticmethod")
        }
        let asyncMark = method.isAsync ? "async " : ""
        let explicitSelf = method.isStatic ? [] : ["self"]
        fragment.outputBlock("\(asyncMark)def \(method.name)(\(parameterList(explicit: explicitSelf, parameters: method.parameters))) -> \(method.returnType.name):", closeWith: "") {
            document(method.documentation, fragment: fragment, extra: method.deprecation.map { ["Deprecated: \($0.quotedMessage)"] } ?? [])
            if method.isAsync {
                let args = (method.isStatic ? [] : [(expression: "self", type: PythonClass.FFIType.object)]) + method.parameters.map {
                    (expression: $0.name, type: $0.ffiType)
                }
                let argString = args.map { "(\"\($0.type.rawValue)\", \($0.expression))" }.joined(separator: ", ")
                let invocation = "_get_runtime().call_symbol(\"__iota_\(method.mangledName)\", \"\(method.ffiReturnType.rawValue)\"\(argString.isEmpty ? "" : ", \(argString)"))"
                fragment.output("_ensure_runtime_loaded()")
                fragment.output("import asyncio")
                fragment.output("return await asyncio.to_thread(lambda: \(invocation))")
            } else {
                outputRuntimeCall(
                    fragment: fragment,
                    symbol: "__iota_\(method.mangledName)",
                    returnType: method.ffiReturnType,
                    arguments: (method.isStatic ? [] : [(expression: "self", type: .object)]) + method.parameters.map {
                        (expression: $0.name, type: $0.ffiType)
                    }
                )
            }
        }
    }
}

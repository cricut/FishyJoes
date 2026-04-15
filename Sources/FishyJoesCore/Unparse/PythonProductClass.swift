class PythonProductClass: PythonClass {
    enum Constructor {
        case reference
        case `public`(fields: [Variable])
    }

    let constructor: Constructor
    /// The iota setup function name (e.g. "TestAPI_Structs_Foo_setup").
    /// Only meaningful for `.reference` constructor; nil for value types.
    let iotaSetupName: String?
    /// Whether the Swift type conforms to Equatable (reference types only).
    let equatable: Bool
    /// Whether the Swift type conforms to Hashable (reference types only).
    let hashable: Bool
    /// The Swift type's mangled name, used to build iota symbol names.
    let mangledTypeName: String

    init(
        module: Module,
        documentation: [String],
        name: String,
        constructor: Constructor,
        fields: [Variable],
        methods: [Method],
        iotaSetupName: String? = nil,
        equatable: Bool = false,
        hashable: Bool = false,
        mangledTypeName: String = ""
    ) {
        self.constructor = constructor
        self.iotaSetupName = iotaSetupName
        self.equatable = equatable
        self.hashable = hashable
        self.mangledTypeName = mangledTypeName
        super.init(
            module: module,
            documentation: documentation,
            name: name,
            fields: fields,
            methods: methods
        )
    }

    override func output(to fragment: SourceFragment) {
        switch constructor {
        case .public(let initFields):
            fragment.output("@dataclass(slots=True)")
            fragment.outputBlock("class \(unqualifiedName):", closeWith: "") {
                let extraDoc = ["Generated FishyJoes Python value type."]
                document(documentation, fragment: fragment, extra: extraDoc)
                if initFields.isEmpty && fields.isEmpty && methods.isEmpty {
                    fragment.output("pass")
                    return
                }

                for field in initFields {
                    fragment.output("\(field.name): \(field.type.name)")
                }
                if !initFields.isEmpty, !(fields.isEmpty && methods.isEmpty) {
                    fragment.blankLine()
                }

                outputComputedMembers(fragment: fragment)
            }
        case .reference:
            fragment.outputBlock("class \(unqualifiedName)(NativeReference):", closeWith: "") {
                let extraDoc = ["Generated FishyJoes Python reference wrapper."]
                document(documentation, fragment: fragment, extra: extraDoc)

                fragment.outputBlock("def __init__(self, native_ref: int | None = None) -> None:", closeWith: "") {
                    fragment.output("super().__init__(native_ref=native_ref)")
                    fragment.outputBlock("if native_ref is not None:", closeWith: "") {
                        fragment.output("import weakref")
                        fragment.output("weakref.finalize(self, _get_runtime().release_native_ref, native_ref)")
                    }
                }

                if equatable {
                    fragment.blankLine()
                    fragment.outputBlock("def __eq__(self, other: object) -> bool:", closeWith: "") {
                        outputRuntimeCall(
                            fragment: fragment,
                            symbol: "__iota_\(mangledTypeName)_equals",
                            returnType: .bool,
                            arguments: [
                                (expression: "self", type: .object),
                                (expression: "other", type: .object)
                            ]
                        )
                    }
                }

                if hashable {
                    fragment.blankLine()
                    fragment.outputBlock("def __hash__(self) -> int:", closeWith: "") {
                        outputRuntimeCall(
                            fragment: fragment,
                            symbol: "__iota_get_\(mangledTypeName)_hash",
                            returnType: .int32,
                            arguments: [(expression: "self", type: .object)]
                        )
                    }
                }

                if !(fields.isEmpty && methods.isEmpty) {
                    fragment.blankLine()
                }
                outputComputedMembers(fragment: fragment)
            }
            // Emit a unique alias to avoid name-shadowing when multiple types share
            // the same unqualified Python name (e.g. PuttingTypesIntoQuestionablePlaces).
            if let setupName = iotaSetupName {
                fragment.output("_cls_\(setupName) = \(unqualifiedName)")
            }
        }
    }

    private func outputComputedMembers(fragment: SourceFragment) {
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
            if field.isPubliclyWritable {
                fragment.blankLine()
                fragment.output("@staticmethod")
                fragment.outputBlock("def set_\(field.name)(value: \(field.type.name)) -> None:", closeWith: "") {
                    outputRuntimeCall(
                        fragment: fragment,
                        symbol: "__iota_set_\(field.mangledName)",
                        returnType: .void,
                        arguments: [(expression: "value", type: field.ffiType)]
                    )
                }
            }
            return
        }
        fragment.output("@property")
        fragment.outputBlock("def \(field.name)(self) -> \(field.type.name):", closeWith: "") {
            document(field.documentation, fragment: fragment, extra: field.deprecation.map { ["Deprecated: \($0.quotedMessage)"] } ?? [])
            outputRuntimeCall(
                fragment: fragment,
                symbol: field.getterSymbol,
                returnType: field.ffiType,
                arguments: field.isStatic ? [] : [(expression: "self", type: .object)]
            )
        }
        if field.isPubliclyWritable {
            fragment.blankLine()
            fragment.output("@\(field.name).setter")
            fragment.outputBlock("def \(field.name)(self, value: \(field.type.name)) -> None:", closeWith: "") {
                outputRuntimeCall(
                    fragment: fragment,
                    symbol: "__iota_set_\(field.mangledName)",
                    returnType: .void,
                    arguments: (field.isStatic ? [] : [(expression: "self", type: .object)]) + [(expression: "value", type: field.ffiType)]
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
            if let body = method.body {
                body.forEach { fragment.output($0) }
            } else if method.isAsync {
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

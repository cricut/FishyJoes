import SourceryDataModel

struct TranslatedProtocol: TranslatedType {
    let sourceType: BetterType
    let converterType: BetterType
    let nodeName: String
    let kotlinPackage: String?
    let kotlinName: String
    let jniType: JNIType
    let iotaCTypes = IotaCTypes.hostRef
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let pythonType: PythonType
    let definingModule: Module
    let definingTSNamespace: String?
    let isInhabited: Bool
    var containedNamedTypes: [TranslatedType] { [self] }
    let conformances: Set<BetterType>
    let methods: [Method]
    let fields: [Field]
    let documentation: [String]
    let className: String
    let javaExternalWitnessClassName: String
    let iotaExternalWitnessClassName: String
    let nodeExternalWitnessClassName: String

    init(context: FishyJoesContext, type: SourceryType) {
        guard let exportAnnotation = type.exportAnnotation else {
            fatalErr("type not annotated for export")
        }
        guard type.kind == .protocol else { fatalErr("not a protocol") }
        let typeName = exportAnnotation.name

        self.sourceType = BetterType(named: type, context: context)
        let module = "\(context.module)_CommonInterface"
        self.converterType = .named(.init(name: "_\(sourceType.unqualifiedName)Converter", module: module))
        self.nodeName = typeName
        self.kotlinPackage = context.module.kotlinPackage
        self.kotlinName = typeName

        self.jniType = .object(context.kotlinTranslator.javaClassName(nodeName, in: context))
        self.cSharpType = .named(package: context.module.cSharpNamespace, name: exportAnnotation.cSharpName)
        self.dartType = .named(package: context.module.dartNamespace, name: context.dartTranslator.fakeNamespace(exportAnnotation.name))
        self.pythonType = .class(module: context.module.pythonPackageName, qualifiedName: exportAnnotation.pythonName ?? exportAnnotation.name)

        self.definingModule = context.module
        self.definingTSNamespace = context.module.name
        self.isInhabited = true

        self.conformances = Set(type.implements.map(\.better))

        self.methods = Method.methods(type: type, context: context)
        self.fields = Field.fields(type: type, context: context)

        self.documentation = type.documentation
        self.className = context.kotlinTranslator.javaClassName(kotlinName, in: context)
        self.javaExternalWitnessClassName = context.kotlinTranslator.javaClassName("_ExternalWitness_\(kotlinName)", in: context)
        self.iotaExternalWitnessClassName = "ExternalWitness_\(typeName)"
        self.nodeExternalWitnessClassName = "ExternalWitness_\(nodeName)"

        enforceProtocolThrows()
        enforceNoProtocolSetters()
        enforceNoProtocolStatics()
        enforceNoProtocolMutatingFunctions()
    }

    func enforceProtocolThrows() {
        if let method = methods.first(where: { !$0.isThrowing }) {
            fatalErr("Error on \(sourceType.name).\(method.name): All Protocol methods exported through FishyJoes must be throwing.")
        }

        if let field = fields.first(where: { !$0.isThrowing }) {
            fatalErr("Error on \(sourceType.name).\(field.name): All Protocol properties exported through FishyJoes must be throwing.")
        }
    }

    func enforceNoProtocolSetters() {
        if let field = fields.first(where: { $0.isMutable }) {
            fatalErr("Error on \(sourceType.name).\(field.name): No setters allowed in protocols because the Swift language does not allow them to throw. Use a function instead.")
        }
    }

    func enforceNoProtocolStatics() {
        if let field = fields.first(where: { $0.isStatic }) {
            fatalErr("Error on \(sourceType.name).\(field.name): No static properties allowed in protocols because other languages do not generally support them.")
        }
        if let method = methods.first(where: { $0.isStatic }) {
            fatalErr("Error on \(sourceType.name).\(method.name): No static methods allowed in protocols because other languages do not generally support them.")
        }
    }

    func enforceNoProtocolMutatingFunctions() {
        if let method = methods.first(where: { $0.isMutating }) {
            fatalErr("Error on \(sourceType).\(method.name): No mutating functions on protocols because there are some edge cases that we don't want to support.")
        }
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        return [
            commonDefinitionFragment(in: context),
            nodeDefinitionFragment(in: context),
            iotaDefinitionFragment(in: context),
        ] + jniDefinitionFragments(in: context)
    }

    func commonDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "CommonInterface/\(converterType.name).swift",
            additionalImports: ["Foundation"]
        )

        fragment.outputBlock("public enum \(converterType.unqualifiedName) {") {
            fragment.output("public typealias SwiftType = \(sourceType.name)")
        }

        fragment.blankLine()

        let defaultFields = fields.filter { $0.isDefaultImplementation }
        let defaultMethods = methods.filter { $0.isDefaultImplementation }
        generateSansForDefaultImplementations(fragment: fragment, defaultFields: defaultFields, defaultMethods: defaultMethods)

        return fragment
    }

    func generateSansForDefaultImplementations(fragment: SourceFragment, defaultFields: [Field], defaultMethods: [Method]) {
        func outputSansFor(defaultField: Field? = nil, defaultMethod: Method? = nil) {
            guard defaultField != nil && defaultMethod == nil ||
                    defaultField == nil && defaultMethod != nil else {
                fatalErr("Exactly one of defaultField or defaultMethod must be non nil, the other must be nil")
            }
            guard let name = (defaultField?.name ?? defaultMethod?.callName) else {
                fatalErr("Need a name")
            }
            fragment.outputBlock("public struct \(sourceType.unqualifiedName)_sans_\(name): \(sourceType.name) {", closeWith: "}") {
                fragment.output("public let wrapped: \(sourceType.name)")

                fragment.blankLine()

                fragment.outputBlock("public init(wrapped: \(sourceType.name)) {") {
                    fragment.output("self.wrapped = wrapped")
                }

                for field in fields {
                    if let defaultField = defaultField {
                        guard field.name != defaultField.name else {
                            continue
                        }
                    }
                    fragment.blankLine()
                    let name = field.name
                    let type = field.type.name
                    fragment.outputBlock("public var \(name): \(type) {") {
                        fragment.outputBlock("get throws {") {
                            fragment.output("try wrapped.\(name)")
                        }
                    }
                }

                for method in methods {
                    if let defaultMethod = defaultMethod {
                        guard method.name != defaultMethod.name else {
                            continue
                        }
                    }
                    fragment.blankLine()
                    let returnSignature = "\(method.isAsync ? " async": "")\(method.isThrowing ? " throws" : "") -> \(method.returnType.name)"
                    fragment.outputBlock("public func \(method.name)\(returnSignature) {", closeWith: "}") {
                        var methodParamsStr = [String]()
                        for param in method.parameters {
                            if let paramLabel = param.label {
                                methodParamsStr.append("\(paramLabel): \(param.name)")
                            } else {
                                methodParamsStr.append("\(param.name)")
                            }
                        }
                        fragment.output("\(method.isThrowing ? "try " : "")\(method.isAsync ? "await ": "")wrapped.\(method.callName)(\(methodParamsStr.joined(separator: ", ")))")
                    }
                }
            }
        }
        for defaultField in defaultFields {
            outputSansFor(defaultField: defaultField)
            fragment.blankLine()
        }

        for defaultMethod in defaultMethods {
            outputSansFor(defaultMethod: defaultMethod)
            fragment.blankLine()
        }
    }

    func nodeDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "NodeInterface/\(sourceType.name)+node.swift",
            additionalImports: [
                "Foundation",
                "FishyJoesNodeRuntime",
                "\(context.module.name)_CommonInterface",
                "NodeAPI"
            ]
        )

        fragment.outputBlock("struct _Node\(sourceType.unqualifiedName): \(sourceType.name) {") {
            fragment.output("let _nodeWitness: NodeReference")
            fragment.blankLine()

            for field in fields {
                fragment.outputBlock("var \(field.name): \(field.type.name) {") {
                    fragment.outputBlock("get throws {") {
                        fragment.outputBlock("try syncOnMainThread { env in", closeWith: "}") {
                            fragment.output("let napiValue = try _nodeWitness.value(env: env)")
                            fragment.output("let \(field.name) = try env.getNamedProperty(napiValue, \"\(field.exportAnnotation?.name ?? field.name)\")")
                            let resolved = context.resolve(type: field.type)
                            fragment.output("return try \(resolved.converterType.name).fromNode(\(field.name), env: env)")
                        }
                    }
                }
            }
            for method in methods {
                var returnSignature = "\(method.isThrowing ? " throws" : "")"
                if method.returnType.name != "Void" {
                    returnSignature.append(" -> \(method.returnType.name)")
                }
                var paramSigs = [String]()
                for param in method.parameters {
                    paramSigs.append("\(param.labelAndName): \(param.type.escapingName)")
                }

                fragment.outputBlock("\(method.isStatic ? "static " : "")public func \(method.callName)(\(paramSigs.joined(separator: ", ")))\(returnSignature) {") {
                    fragment.outputBlock("try syncOnMainThread { env in", closeWith: "}") {
                        fragment.output("let napiValue = try _nodeWitness.value(env: env)")
                        fragment.output("let \(method.callName) = try env.getNamedProperty(napiValue, \"\(method.callName)\")")
                        fragment.output("\(method.returnType != .void ? "let result": "_") = try env.callFunction(napiValue, \(method.callName), ", newLineTerminated: false)

                        var toNodeParams = [String]()
                        for param in method.parameters {
                            let resolved = context.resolve(type: param.type)
                            toNodeParams.append("try \(resolved.converterType.name).toNode(\(param.name), env: env)")
                        }
                        fragment.output("[\(toNodeParams.joined(separator: ", "))])")

                        if method.returnType != .void {
                            let resolved = context.resolve(type: method.returnType)
                            fragment.output("return try \(resolved.converterType.name).fromNode(result, env: env)")
                        }
                    }
                }
            }
        }

        fragment.blankLine()

        fragment.outputBlock("extension \(converterType.name): NodeConverter {") {
            fragment.outputBlock("public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {") {
                fragment.outputBlock("do {", newLineTerminated: false) {
                    fragment.output(#"let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "\#(nodeExternalWitnessClassName)", module: "\#(context.module)", env: env)"#)
                    fragment.outputBlock("if try env.instanceof(value, constructor) {", newLineTerminated: false) {
                        fragment.outputBlock("guard let nonNilPointer = try env.unwrap(value) else {") {
                            fragment.output("throw JSException(message: \"expected \(sourceType.name), got nil\")")
                        }
                        fragment.output("return try Box<\(sourceType.name)>.takeUnretainedOpaque(nonNilPointer).value")
                    }
                    fragment.outputBlock(" else {") {
                        fragment.outputBlock("return _Node\(sourceType.unqualifiedName)(") {
                            fragment.output("_nodeWitness: try NodeReference(env: env, value: value)")
                        }
                    }
                }
            }

            fragment.outputBlock("public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {") {
                fragment.output(#"let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "\#(nodeExternalWitnessClassName)", module: "\#(context.module)", env: env)"#)
                fragment.output("let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)")
                fragment.output("return try env.newInstance(constructor, [arg])")
            }

            fragment.blankLine()

            fragment.output("@available(*, deprecated, message: \"Not actually deprecated, but this silences warnings because it may refer to deprecated methods\")")
            fragment.outputBlock("public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {") {
                // fragment.output("print(\"setting up \(sourceType.name)\")")

                fragment.output("let coreObject = try env.createObject()")

                fragment.outputBlock("let fromCoreFunctionCallback: NAPI.Callback = { env, info in", closeWith: "}") {
                    fragment.outputBlock("FishyJoesNodeRuntime.callbackBody(env, info, name: \"fromCore\", expectedArgumentCount: 1, hasNamedOptions: false) { env in", closeWith: "}") {
                        fragment.output("let coreArg = try env.argument(at: 0)")
                        fragment.blankLine()
                        fragment.output("let env = env.env")
                        fragment.output("let global = try env.getGlobal()")
                        fragment.output("let object = try env.getNamedProperty(global, \"Object\")")
                        fragment.output("let create = try env.getNamedProperty(object, \"create\")")
                        fragment.blankLine()
                        fragment.output("let result = try env.callFunction(object, create, [coreArg])")
                        fragment.blankLine()

                        let defaultFields = fields.filter { $0.isDefaultImplementation }
                        for field in defaultFields {
                            let fieldName = field.exportAnnotation?.name ?? field.name
                            fragment.output("let \(fieldName)GetterCallback: NAPI.Callback = ", newLineTerminated: false)
                            context.nodeTranslator.output(getter: field, explicitThis: false, context: context, fragment: fragment, converterName: converterType.name, shouldWrapDefaultImpl: true)

                            fragment.blankLine()

                            fragment.output("let \(fieldName)NodeName = try String.toNode(\"\(fieldName)\", env: env)")
                            fragment.outputBlock("let \(fieldName)PropertyDesc = napi_property_descriptor(") {
                                fragment.output("utf8name: nil,")
                                fragment.output("name: \(fieldName)NodeName.ptr,")
                                fragment.output("method: nil,")
                                fragment.output("getter: \(fieldName)GetterCallback,")
                                fragment.output("setter: nil,")
                                fragment.output("value: nil,")
                                fragment.output("attributes: napi_default,")
                                fragment.output("data: nil")
                            }

                            fragment.blankLine()

                            fragment.outputBlock("if !(try env.hasNamedProperty(result, \"\(fieldName)\")) {") {
                                fragment.output("try env.defineProperties(result, properties: [\(fieldName)PropertyDesc])")
                            }
                            fragment.blankLine()
                        }

                        let defaultMethods = methods.filter { $0.isDefaultImplementation }
                        for method in defaultMethods {
                            fragment.output("let \(method.callName)FunctionCallback: NAPI.Callback = ", newLineTerminated: false)
                            context.nodeTranslator.output(method: method, explicitThis: false, context: context, fragment: fragment, newLineTerminated: true, converterName: converterType.name, shouldWrapDefaultImpl: true)
                            fragment.outputBlock("let \(method.callName)Function = try env.createFunction(") {
                                fragment.output("\"\(method.callName)\",")
                                fragment.output("\(method.callName)FunctionCallback,")
                                fragment.output("nil")
                            }
                            fragment.outputBlock("if !(try env.hasNamedProperty(result, \"\(method.callName)\")) {") {
                                fragment.output("try env.setNamedProperty(result, \"\(method.callName)\", \(method.callName)Function)")
                            }
                            fragment.blankLine()
                        }

                        fragment.blankLine()
                        fragment.output("return result")
                    }
                }

                fragment.output("let fromCoreFunction = try env.createFunction(\"fromCore\", fromCoreFunctionCallback, nil)")
                fragment.output("try env.setNamedProperty(fromCoreFunction, \"static\", env.getBoolean(true))")
                fragment.output("try env.setNamedProperty(coreObject, \"fromCore\", fromCoreFunction)")

                fragment.outputBlock("try mergeDefinitionInto(") {
                    fragment.output("env: env,")
                    fragment.output("module: module,")
                    fragment.output("path: \"\(sourceType.unqualifiedName)\",")
                    fragment.output("nodeClass: coreObject")
                }
                fragment.blankLine()

                fragment.outputBlock("let nodeClass = try NodeClass(") {
                    fragment.output("env: env,")
                    fragment.output(#"module: "\#(context.module)","#)
                    fragment.output(#"name: "\#(nodeExternalWitnessClassName)","#)
                    fragment.outputBlock("properties: [", closeWith: "],") {
                        context.nodeTranslator.outputProperties(methods: methods, context: context, fragment: fragment, converterName: converterType.name, shouldWrapDefaultImpl: true)
                        context.nodeTranslator.outputProperties(computedVariables: fields, context: context, fragment: fragment, converterName: converterType.name, shouldWrapDefaultImpl: true)
                    }
                    fragment.outputBlock("constructor: { env, info in", closeWith: "}") {
                        fragment.outputBlock("callbackBody(env, info, name: \"\(nodeExternalWitnessClassName)_constructor\", expectedArgumentCount: 1) { env in", closeWith: "}") {
                            fragment.output("try FishyJoesNodeRuntime.Box<\(sourceType.name)>.construct(env: env)")
                        }
                    }
                }
                fragment.outputBlock("try mergeDefinitionInto(") {
                    fragment.output("env: env,")
                    fragment.output("module: module,")
                    fragment.output("path: \"\(nodeExternalWitnessClassName)\",")
                    fragment.output("nodeClass: nodeClass.constructor.value(env: env)")
                }
            }
        }

        context.tsAnnotations.add(interface:
                .init(
                    documentation: documentation,
                    name: nodeName,
                    forNamespace: context.module.name,
                    fields: fields.compactMap {context.ts(field: $0, useNativeName: false) },
                    methods: methods.compactMap { context.ts(method: $0) }
                )
        )

        fragment.blankLine()

        let nodeConformances = Set(exportedConformances(in: context).map { $0.nodeType})
        context.tsAnnotations.add(class:
            .init(
                name: nodeExternalWitnessClassName,
                implements: nodeConformances,
                constructor: .hidden,
                fields: fields.compactMap { context.ts(field: $0, useNativeName: false) },
                methods: methods.compactMap { context.ts(method: $0) }
            )
        )

        return fragment
    }

    func iotaDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "IotaInterface/\(sourceType.name)+iota-type.swift",
            additionalImports: ["Foundation", "FishyJoesIotaRuntime", "\(context.module.name)_CommonInterface"]
        )

        let foreignProtocolType = "_Iota\(sourceType.unqualifiedName)"

        fragment.outputBlock("struct \(foreignProtocolType): \(sourceType.name) {") {
            fragment.output("let _iotaWitness: IotaReference")
            for variable in fields {
                fragment.output()
                let resolvedVar = context.resolve(type: variable.type)

                fragment.outputBlock("\(variable.isStatic ? "static " : "")public var \(variable.name): \(variable.type.name) {") {
                    fragment.outputBlock("get\(variable.isThrowing ? " throws" : "") {") {
                        fragment.outputBlock("try \(resolvedVar.converterType.name).consumeIota(") {
                            fragment.outputBlock("try _iotaWitness.env.check { exn in", closeWith: "},") {
                                fragment.output("\(converterType.name)._\(variable.name)Getter[_iotaWitness.env](_iotaWitness.object, exn)")
                            }
                            fragment.output("env: _iotaWitness.env")
                        }
                    }
                }
            }

            for method in methods {
                fragment.output()
                let resolvedReturn = context.resolve(type: method.returnType)
                var returnSignature = "\(method.isAsync ? " async" : "")\(method.isThrowing ? " throws" : "")"
                if method.returnType.name != "Void" {
                    returnSignature.append(" -> \(method.returnType.name)")
                }

                var paramSigs = [String]()
                do {
                    for param in method.parameters {
                        paramSigs.append("\(param.labelAndName): \(param.type.escapingName)")
                    }
                }
                fragment.outputBlock("\(method.isStatic ? "static " : "")public func \(method.callName)(\(paramSigs.joined(separator: ", ")))\(returnSignature) {") {
                    fragment.outputBlock("try \(resolvedReturn.converterType.name).consumeIota(") {
                        fragment.outputBlock("try _iotaWitness.env.check { exn in", closeWith: "},") {
                            fragment.outputBlock("\(converterType.name)._\(method.callName)[_iotaWitness.env](") {
                                fragment.output("_iotaWitness.object,")
                                for param in method.parameters {
                                    let resolvedParam = context.resolve(type: param.type)
                                    fragment.output("try \(resolvedParam.converterType.name).toIota(\(param.name), env: _iotaWitness.env),")
                                }
                                fragment.output("exn")
                            }
                        }
                        fragment.output("env: _iotaWitness.env")
                    }
                }
            }
        }

        fragment.blankLine()

        let constructorTypedefName = "\(sourceType.name)_ConstructorFn".mangled
        var typedefs = [
            "typedef created_host_ref (*\(constructorTypedefName))(consumed_swift_ref ref, created_host_ref* out_exn);"
        ]
        var setupArgs = [
            (name: "envRef", swiftType: "EnvRef", cType: "fishyjoes_env"),
            (
                name: "constructorMethod",
                swiftType: "\(converterType.name)._ConstructorMethod",
                cType: constructorTypedefName
            ),
        ]
        for field in fields {
            let resolved = context.resolve(type: field.type)
            let getterTypedefName = "\(sourceType.name)_\(field.exportAnnotation?.name ?? field.name)_getFn".mangled
            let setterTypedefName = "\(sourceType.name)_\(field.exportAnnotation?.name ?? field.name)_setFn".mangled
            typedefs.append(
                "typedef \(resolved.iotaCTypes.created) (*\(getterTypedefName))(unowned_host_ref obj, created_host_ref *out_exn);"
            )
            setupArgs.append(
                (
                    name: "\(field.name)Getter",
                    swiftType: "@escaping @convention(c) (HostObject, _ exn: OutHostException) -> \(resolved.converterType.name).CType",
                    cType: getterTypedefName
                )
            )
            if field.isMutable {
                typedefs.append(
                    "typedef void (*\(setterTypedefName))(unowned_host_ref obj, \(resolved.iotaCTypes.unowned) new_value, created_host_ref *out_exn);"
                )
                setupArgs.append(
                    (
                        name: "\(field.name)Setter",
                        swiftType: "@escaping @convention(c) (HostObject, \(resolved.converterType.name).CType, _ exn: OutHostException) -> Void",
                        cType: setterTypedefName
                    )
                )
            }
        }
        for method in methods {
            let resolvedReturnType = context.resolve(type: method.returnType)
            let paramParts = [
                (swift: "HostObject", c: "unowned_host_ref")
            ] + method.parameters.map { param in
                    let resolvedParam = context.resolve(type: param.type)
                    return (swift: "\(resolvedParam.converterType.name).CType", c: resolvedParam.iotaCTypes.consumed)
            } + [
                (swift: "OutHostException", c: "created_host_ref *")
            ]
            let methodTypedefName = "\(sourceType.name)_\(method.exportAnnotation.name)_methodFn".mangled
            typedefs.append(
                "typedef \(resolvedReturnType.iotaCTypes.created) (*\(methodTypedefName))" +
                    "(\(paramParts.map(\.c).joined(separator: ", ")));"
            )
            setupArgs.append(
                (
                    name: method.callName,
                    swiftType: "@escaping @convention(c) (\(paramParts.map(\.swift).joined(separator: ", "))) -> \(resolvedReturnType.converterType.name).CType",
                    cType: methodTypedefName
                )
            )
        }
        setupArgs.append((name: "exn", swiftType: "OutHostException", cType: "created_host_ref *"))

        context.iotaTranslator.declareCInterface(
            preludeLines: typedefs,
            name: iotaSetupName,
            args: setupArgs.map { ($0.name, $0.cType) },
            returnType: "void"
        )

        fragment.output("@_cdecl(\"\(iotaSetupName)\")")
        fragment.outputBlock("public func \(iotaSetupName)(", newLineTerminated: false) {
            fragment.outputMap(setupArgs, separator: ",") { "\($0.name): \($0.swiftType)" }
        }
        fragment.outputBlock(" {") {
            fragment.output("let env = Env(envRef)")
            fragment.output("if \(converterType.name)._constructorMethod.isInitialized(env) { return }")
            fragment.output("\(converterType.name)._constructorMethod[env] = constructorMethod")
            for field in fields {
                fragment.output("\(converterType.name)._\(field.name)Getter[env] = \(field.name)Getter")
                if field.isMutable {
                    fragment.output("\(converterType.name)._\(field.name)Setter[env] = \(field.name)Setter")
                }
            }
            for method in methods {
                fragment.output("\(converterType.name)._\(method.callName)[env] = \(method.callName)")
            }
        }
        fragment.blankLine()

        fragment.outputBlock("extension \(converterType.name): FishyJoesIotaRuntime.IotaConverter {") {
            fragment.output("public typealias CType = HostObject")

            fragment.outputBlock("public typealias _ConstructorMethod = @convention(c) (", closeWith: ") -> HostObject") {
                fragment.output("_ ref: UnsafeMutableRawPointer,")
                fragment.output("_ exn: OutHostException")
            }
            fragment.output("fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()")
            for field in fields {
                let resolved = context.resolve(type: field.type)
                fragment.output("fileprivate static let _\(field.name)Getter = Env.CallbackMap<@convention(c) (HostObject, _ exn: OutHostException) -> \(resolved.converterType.name).CType>()")
                if field.isMutable {
                    fragment.output("fileprivate static let _\(field.name)Setter = Env.CallbackMap<@convention(c) (HostObject, \(resolved.converterType.name).CType, _ exn: OutHostException) -> Void>()")
                }
            }
            for method in methods {
                let resolvedReturnType = context.resolve(type: method.returnType)
                fragment.outputBlock("fileprivate static let _\(method.callName) = Env.CallbackMap<@convention(c) (", closeWith: ") -> \(resolvedReturnType.converterType.name).CType>()") {
                    fragment.output("HostObject,")
                    for param in method.parameters {
                        let resolvedParam = context.resolve(type: param.type)
                        fragment.output("\(resolvedParam.converterType.name).CType,")
                    }
                    fragment.output("_ exn: OutHostException")
                }
            }
            fragment.blankLine()

            fragment.outputBlock("public static func peekIota(_ value: HostObject, env: Env) throws -> SwiftType {") {
                fragment.outputBlock("do {", newLineTerminated: false) {
                    fragment.output("let box = try Box<SwiftType>.peekIota(value, env: env)")
                    fragment.output("return box.value")
                }
                fragment.outputBlock(" catch {") {
                    fragment.output("let iotaWitness = try IotaReference(value, env: env)")
                    fragment.output("return _Iota\(sourceType.unqualifiedName)(_iotaWitness: iotaWitness)")
                }
            }
            fragment.blankLine()

            fragment.outputBlock("public static func toIota(_ value: SwiftType, env: Env) throws -> HostObject {") {
                fragment.outputBlock("try env.check { exn in", closeWith: "}") {
                    fragment.outputBlock("_constructorMethod[env](") {
                        fragment.output("Box(value).retainedOpaque(),")
                        fragment.output("exn")
                    }
                }
            }
        }

        registerDartClass(context: context)
        registerCSharpClass(context: context)
        registerPythonClass(context: context)

        return fragment
    }

    func jniDefinitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        let fragment = context.swiftFragment(
            "JavaInterface/\(sourceType.name)+java-type.swift",
            additionalImports: ["Foundation", "FishyJoesJavaRuntime", "\(context.module.name)_CommonInterface"]
        )

        let foreignProtocolType = "_Java\(sourceType.unqualifiedName)"

        var methodIDs: [(idHandle: String, name: String, signature: String)] = []
        let defaultMethods = methods.filter { !$0.isAsync && $0.isDefaultImplementation }
        let asyncDefaultMethods = methods.filter { $0.isAsync && $0.isDefaultImplementation}
        let normalMethods = methods.filter { !$0.isAsync && !$0.isDefaultImplementation }
        let asyncNormalMethods = methods.filter { $0.isAsync && !$0.isDefaultImplementation}

        fragment.outputBlock("struct \(foreignProtocolType): \(sourceType.name) {") {
            fragment.output("let _javaWitness: JavaReference")

            for variable in fields {
                fragment.output()
                let name = variable.name
                let type = variable.type.name
                let resolved = context.resolve(type: variable.type)
                let getID = "_\(name)GetMethodID"
                let setID = variable.isMutable ? "_\(name)SetMethodID" : nil
                methodIDs.append((idHandle: getID, name: "get_\(name)", signature: "()\(resolved.jniType.asSignature)"))
                fragment.output("static var \(getID): jmethodID?")

                if let setID = setID {
                    methodIDs.append((idHandle: setID, name: "set_\(name)", signature: "(\(resolved.jniType.asSignature))V"))
                    fragment.output("static var \(setID): jmethodID?")
                }
                fragment.outputBlock("\(variable.isStatic ? "static " : "")public var \(name): \(type) {") {
                    fragment.outputBlock("get\(variable.isThrowing ? " throws" : "") {") {
                        let perhapsExclaim = variable.isMutable ? "!" : ""
                        fragment.output("let env = try\(perhapsExclaim) Env.acquireJVMThread(on: _javaWitness.vm)")
                        fragment.outputBlock("defer {") {
                            fragment.output("try? Env.relinquishJVMThread(on: _javaWitness.vm)")
                        }
                        fragment.outputBlock("return try\(perhapsExclaim) \(resolved.converterType.name).fromJava(") {
                            fragment.output("env.Call\(resolved.jniType.valueType)Method(_javaWitness.object, Self.\(getID)),")
                            fragment.output("env: env")
                        }
                    }
                    precondition(!variable.isMutable)
                }
            }
            for method in methods {
                fragment.output()

                let resolvedReturn = context.resolve(type: method.returnType)
                var returnSignature = "\(method.isAsync ? " async" : "")\(method.isThrowing ? " throws" : "")"
                if method.returnType.name != "Void" {
                    returnSignature.append(" -> \(method.returnType.name)")
                }
                fragment.output("static var _\(method.callName)MethodID: jmethodID?")
                var paramSigs = [String]()
                do {
                    for param in method.parameters {
                        paramSigs.append("\(param.labelAndName): \(param.type.escapingName)")
                    }
                }
                fragment.outputBlock("\(method.isStatic ? "static " : "")public func \(method.callName)(\(paramSigs.joined(separator: ", ")))\(returnSignature) {") {
                    fragment.output("let env = try Env.acquireJVMThread(on: _javaWitness.vm)")
                    fragment.outputBlock("defer {") {
                        fragment.output("try? Env.relinquishJVMThread(on: _javaWitness.vm)")
                    }
                    fragment.outputBlock("return try \(resolvedReturn.converterType.name).fromJava(") {
                        fragment.outputBlock("env.Call\(resolvedReturn.jniType.valueType)Method(", closeWith: "),") {
                            fragment.output("_javaWitness.object,")
                            fragment.output("Self._\(method.callName)MethodID", newLineTerminated: false)
                            for param in method.parameters {
                                fragment.output(",")
                                let resolved = context.resolve(type: param.type)
                                fragment.output("JVALUE.from(try \(resolved.converterType.name).toJava(\(param.name), env: env))", newLineTerminated: false)
                            }
                            fragment.output()
                        }
                        fragment.output("env: env")
                    }
                }
            }
        }

        fragment.blankLine()

        fragment.outputBlock("extension \(converterType.name): JavaConverter {") {
            fragment.output("public typealias CType = jobject?")

            fragment.output("public static var javaClass: jclass?")
            fragment.output("public static var externalWitnessClass: jclass?")
            fragment.output("public static var externalWitnessConstructor: jmethodID?")
            fragment.output("public static var externalCompanionClass: jclass?")

            fragment.outputBlock("public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {") {
                fragment.outputBlock("if env.IsInstanceOf(value, AnyBox.javaClass) {") {
                    fragment.output("return try Box<SwiftType>.fromJava(value, env: env).value")
                }
                fragment.output("return \(foreignProtocolType)(_javaWitness: try JavaReference(local: value, env: env))")
            }

            fragment.outputBlock("public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {") {
                fragment.outputBlock("try env.NewObject(") {
                    fragment.output("externalWitnessClass,")
                    fragment.output("externalWitnessConstructor,")
                    fragment.output("JVALUE.from(pointer: Box(value).retainedOpaque())")
                }
            }

            fragment.outputBlock("public static func javaSetup(env: Env) throws {") {
                fragment.output("javaClass = try env.globalRef(env.FindClass(\"\(className)\"))")
                fragment.output("externalWitnessClass = try env.globalRef(env.FindClass(\"\(javaExternalWitnessClassName)\"))")
                fragment.output("externalWitnessConstructor = try env.GetMethodID(externalWitnessClass, \"<init>\", \"(J)V\")")
                for field in fields {
                    let resolved = context.resolve(type: field.type)
                    let jniSignature = resolved.jniType.asSignature
                    fragment.output("\(foreignProtocolType)._\(field.name)GetMethodID = try env.GetMethodID(javaClass, \"get\(upperCaseFirst(field.exportAnnotation?.name ?? field.name))\", \"()\(jniSignature)\")")
                    if field.isMutable {
                        fragment.output("\(foreignProtocolType)._\(field.name)SetMethodID = try env.GetMethodID(javaClass, \"set\(upperCaseFirst(field.exportAnnotation?.name ?? field.name))\", \"(\(jniSignature))V\")")
                    }
                }
                fragment.output("externalCompanionClass = try env.globalRef(env.FindClass(\"\(className)$Companion\"))")
                for normalMethod in normalMethods {
                    let jniSignature = normalMethod.jniSignature(context: context)
                    fragment.output("\(foreignProtocolType)._\(normalMethod.callName)MethodID = try env.GetMethodID(javaClass, \"\(normalMethod.callName)\", \"\(jniSignature)\")")
                }
                for asyncNormalMethod in asyncNormalMethods {
                    var jniSignature = asyncNormalMethod.jniSignature(context: context)
                    jniSignature = "(L\(className);" + String(jniSignature.dropFirst())
                    fragment.output("\(foreignProtocolType)._\(asyncNormalMethod.callName)MethodID = try env.GetMethodID(externalCompanionClass, \"_deferred_\(asyncNormalMethod.callName)\", \"\(jniSignature)\")")
                }
                for defaultMethod in defaultMethods {
                    let jniSignature = defaultMethod.jniSignature(context: context)
                    fragment.output("\(foreignProtocolType)._\(defaultMethod.callName)MethodID = try env.GetMethodID(javaClass, \"\(defaultMethod.callName)\", \"\(jniSignature)\")")
                }
                for asyncDefaultMethod in asyncDefaultMethods {
                    var jniSignature = asyncDefaultMethod.jniSignature(context: context)
                    jniSignature = "(L\(className);" + String(jniSignature.dropFirst())
                    fragment.output("\(foreignProtocolType)._\(asyncDefaultMethod.callName)MethodID = try env.GetMethodID(externalCompanionClass, \"__jni__default_\(asyncDefaultMethod.callName)\", \"\(jniSignature)\")")
                }
            }
        }

        let (interfaceFields, interfaceMethods) = KotlinClass.separate(
            fieldsAndMethods:
                fields.flatMap { field -> [KotlinClass.MethodOrVariable] in
                    guard let kotlinMethodOrVariable = context.kotlin(field: field, useNativeName: false) else { return [] }

                    guard !field.isStatic,
                          field.isDefaultImplementation,
                          case .variable(var kotlinVariable) = kotlinMethodOrVariable else {
                        return [kotlinMethodOrVariable]
                    }

                    let defaultMethodForVariable = KotlinClass.Method(
                        documentation: [],
                        isStatic: true,
                        isSuspend: false,
                        isOverride: false,
                        isDefaultImplementation: true,
                        name: kotlinVariable.name,
                        parameters: [(nil, name: "self", type: .named(package: nil, name: kotlinName), nil)],
                        compatibilityOrder: [],
                        returnType: kotlinVariable.type
                    )
                    kotlinVariable.body = "    get() = __jni__default_\(defaultMethodForVariable.name)(this)"

                    return [.variable(kotlinVariable), .method(defaultMethodForVariable)]
                } + methods.flatMap { method -> [KotlinClass.MethodOrVariable] in
                    guard let kotlinMethodOrVariable = context.kotlin(method: method) else { return [] }

                    guard !method.isStatic,
                            method.isDefaultImplementation,
                          case .method(var kotlinMethod) = kotlinMethodOrVariable else {
                        return [kotlinMethodOrVariable]
                    }

                    var defaultMethod = kotlinMethod
                    defaultMethod.parameters.insert((nil, "self", .named(package: nil, name: kotlinName), nil), at: 0)
                    defaultMethod.isStatic = true

                    var parameters = ["this"]
                    parameters.append(contentsOf: kotlinMethod.parameters.map(\.name))
                    kotlinMethod.body = "__jni__default_\(defaultMethod.name)(\(parameters.joined(separator: ", ")))"

                    return [.method(kotlinMethod), .method(defaultMethod)]
                }
        )

        context.add(
            kotlinClass: KotlinInterface(
                module: context.module,
                documentation: documentation,
                name: kotlinName,
                fields: interfaceFields,
                methods: interfaceMethods
            ).conforming(to: exportedConformances(in: context), context: context)
        )

        let externalWitnessFieldsAndMethods = {
            let nonDefaultMethods = methods.filter { !$0.isDefaultImplementation }
            var fAndM = fields.compactMap { context.kotlin(field: $0, useNativeName: false)}
            fAndM.append(contentsOf: nonDefaultMethods.compactMap { context.kotlin(method: $0) })
            return fAndM
        }()
        let (externalWitnessFields, externalWitnessMethods) = KotlinClass.separate(fieldsAndMethods: externalWitnessFieldsAndMethods)
        // We know the sourceType is a TranslatedProtocol because we're in the TranslatedProtocol struct so the force cast is okay.
        let resolvedSource = context.resolve(type: sourceType) as! TranslatedProtocol
        context.add(
            kotlinClass: KotlinProductClass(
                module: context.module,
                isPrivate: true,
                documentation: [],
                name: "_ExternalWitness_\(kotlinName)",
                constructor: .reference,
                fields: externalWitnessFields,
                methods: externalWitnessMethods,
                conformances: [KotlinClass.KType.named(package: "com.cricut.fishyjoes.runtime", name: "SwiftReference(_swiftReference)")]
            ).conforming(to: [resolvedSource], context: context)
        )

        return [fragment]
    }
}

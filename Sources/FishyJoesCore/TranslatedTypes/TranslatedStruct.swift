import SourceryRuntime

struct TranslatedStruct: TranslatedType {
    let sourceType: BetterType
    let cName: String
    let nodeName: String
    let kotlinName: String
    let globalName: String
    let storedVariables: [Variable]
    let computedVariables: [Variable]
    let methods: [Method]
    let documentation: [String]
    let jniType: JNIType

    init(context: FishyJoesContext, type: Type) {
        guard let exportAnnotation = type.exportAnnotation,
              let cTypeName = exportAnnotation.c else {
            fatalErr("c symbol not specified")
        }
        let nodeTypeName = exportAnnotation.js ?? cTypeName
        guard type.kind == "struct" else { fatalErr("not a struct") }

        self.sourceType = BetterType(named: type)
        self.cName = cTypeName
        self.nodeName = nodeTypeName
        self.kotlinName = nodeTypeName
        self.globalName = "\(context.module).\(type.globalName)"
        self.jniType = .object(context.kotlinTranslator.javaClassName(nodeName, in: context))

        self.storedVariables = type.storedVariables
        self.computedVariables =
            (type.computedVariables + type.staticVariables).filter { $0.exportAnnotation != nil }

        self.methods = type.methods.filter { $0.exportAnnotation != nil }
        self.documentation = type.documentation
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        [nodeDefinitionFragment(in: context), jniDefinitionFragment(in: context)]
    }

    func nodeDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let nodeFragment = context.swiftFragment(
            "NodeInterface/\(globalName)+node.swift",
            additionalImports: ["FishyJoesNodeRuntime"]
        )

        nodeFragment.outputBlock("extension \(globalName): FishyJoesNodeRuntime.NodeMutable {") {

            nodeFragment.outputBlock("public init(fromNode value: napi_value?, env: napi_env) throws {") {
                // TODO: type check
                nodeFragment.outputBlock("self.init(") {
                    for (index, storedVar) in storedVariables.enumerated() {
                        let resolved = context.resolve(type: storedVar.typeName.better)
                        let last = index == storedVariables.count - 1
                        nodeFragment.outputBlock("\(storedVar.name): try { () -> \(resolved.sourceType.name) in", closeWith: last ? "}()" : "}(),") {
                            nodeFragment.output("var fieldValue: napi_value?")
                            nodeFragment.output("try check(napi_get_named_property(env, value, \"\(storedVar.name)\", &fieldValue))")
                            nodeFragment.output("return try \(resolved.sourceType.name)(fromNode: fieldValue, env: env)")
                        }
                    }
                }
            }

            nodeFragment.outputBlock("public func toNode(env: napi_env) throws -> napi_value? {") {
                nodeFragment.output("let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: \"\(nodeName)\", env: env)")
                nodeFragment.outputBlock("let args: [napi_value?] = [") {
                    for storedVar in storedVariables {
                        nodeFragment.output("try \(storedVar.name).toNode(env: env),")
                    }
                }
                nodeFragment.output("var result: napi_value?")
                nodeFragment.output("try check(napi_new_instance(env, constructor, args.count, args, &result))")
                nodeFragment.output("return result")
            }

            nodeFragment.outputBlock("public func mutateNode(this: napi_value?, env: napi_env) throws {") {
                for storedVar in storedVariables {
                    guard storedVar.isMutable else { continue }
                    nodeFragment.output("try check(napi_set_named_property(env, this, \"\(storedVar.name)\", \(storedVar.name).toNode(env: env)))")
                }
            }

            nodeFragment.outputBlock("public static func nodeSetup(env: napi_env, module: napi_value) throws {") {
                // nodeFragment.output("print(\"setting up \(globalName)\")")

                nodeFragment.outputBlock("let nodeClass = try NodeClass(") {
                    nodeFragment.output("env: env,")
                    nodeFragment.output("name: \"\(nodeName)\",")
                    var properties: [String] =
                        context.nodeTranslator.properties(for: methods) +
                        context.nodeTranslator.properties(for: computedVariables)
                    for storedVar in storedVariables {
                        properties.append("\"\(storedVar.name)\": (.stored(mutable: \(storedVar.isMutable)), isStatic: \(storedVar.isStatic)),")
                    }
                    if properties.isEmpty {
                        nodeFragment.output("properties: [:],")
                    } else {
                        nodeFragment.outputBlock("properties: [", closeWith: "],") {
                            for prop in properties {
                                nodeFragment.output(prop)
                            }
                        }
                    }
                    nodeFragment.outputBlock("constructor: { env, info in", closeWith: "}") {
                        nodeFragment.outputBlock("FishyJoesNodeRuntime.callbackBody(env, info, name: \"\(nodeName)_constructor\", expectedArgumentCount: \(storedVariables.count)) { env in", closeWith: "}") {
                            nodeFragment.output("// TODO: typecheck?")
                            nodeFragment.output("let this = try env.this()")
                            for (index, storedVar) in storedVariables.enumerated() {
                                nodeFragment.output("try check(napi_set_named_property(env.env, this, \"\(storedVar.name)\", env.argument(at: \(index))))")
                            }
                            nodeFragment.output("return this")
                        }
                    }
                }
                nodeFragment.output("try check(napi_set_named_property(env, module, \"\(nodeName)\", nodeClass.constructor.value(env: env)))")
            }
        }

        context.tsFragment.classes.append(
            .init(
                documentation: documentation,
                name: nodeName,
                constructor: .visible(
                    storedVariables.map {
                        (
                            name: $0.name,
                            type: context.resolve(type: $0.typeName.better).nodeType
                        )
                    }
                ),
                fields:
                    storedVariables.compactMap { context.ts(field: $0, useNativeName: true) } +
                    computedVariables.compactMap {context.ts(field: $0, useNativeName: false) },
                methods: methods.compactMap { context.ts(method: $0) }
            )
        )

        return nodeFragment
    }

    func jniDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let jniFragment = context.swiftFragment(
            "JavaInterface/\(sourceType.name)+java.swift",
            additionalImports: ["FishyJoesJavaRuntime"]
        )
        let className = context.kotlinTranslator.javaClassName(nodeName, in: context)
        jniFragment.outputBlock("extension \(sourceType.name): JavaConvertible {") {
            jniFragment.output("public static var javaClass: jclass?")
            jniFragment.output("public static var javaDescriptor: String { \"L\(className);\" }")
            for storedVar in storedVariables {
                jniFragment.output("private static var _java_\(storedVar.name)_id: jfieldID!")
            }
            jniFragment.output("private static var _constructorMethodID: jmethodID!")

            jniFragment.outputBlock("public init(fromJava value: jobject?, env: Env) throws {") {
                jniFragment.outputBlock("self.init(") {
                    for (index, storedVar) in storedVariables.enumerated() {
                        let resolved = context.resolve(type: storedVar.typeName.better)
                        let last = index == storedVariables.count - 1
                        let fieldCType = resolved.jniType.valueType
                        jniFragment.outputBlock("\(storedVar.name): try \(resolved.sourceType.name)(", closeWith: last ? ")" : "),") {
                            jniFragment.output("fromJava: env.fns.Get\(fieldCType)Field(env.env, value, Self._java_\(storedVar.name)_id),")
                            jniFragment.output("env: env")
                        }
                    }
                }
            }

            jniFragment.outputBlock("public func toJava(env: Env) throws -> jobject? {") {
                jniFragment.output("var args: [jvalue] = []")
                for storedVar in storedVariables {
                    jniFragment.output("try args.append(jvalue(self.\(storedVar.name).toJava(env: env)))")
                }
                jniFragment.output("return try javaNonNull(env.fns.NewObjectA(env.env, Self.javaClass, Self._constructorMethodID, args))")
            }

            jniFragment.outputBlock("public static func javaSetup(env: Env) throws {") {
                jniFragment.output("javaClass = try env.globalRef(env.fns.FindClass(env.env, \"\(className)\"))")
                jniFragment.output("var constructorDescriptor = \"\"")
                for storedVar in storedVariables {
                    let resolved = context.resolve(type: storedVar.typeName.better)
                    let proxyType = resolved.sourceProxyType ?? resolved.sourceType
                    jniFragment.output("_java_\(storedVar.name)_id = try javaNonNull(env.fns.GetFieldID(env.env, javaClass, \"\(storedVar.name)\", \(proxyType.name).javaDescriptor))")
                    jniFragment.output("constructorDescriptor += \(proxyType.name).javaDescriptor")
                }
                jniFragment.output("_constructorMethodID = try javaNonNull(env.fns.GetMethodID(env.env, javaClass, \"<init>\", \"(\\(constructorDescriptor))V\"))")
            }

            jniFragment.outputBlock("public func mutateJava(this: jobject?, env: Env) throws {") {
                for storedVar in storedVariables {
                    let resolved = context.resolve(type: storedVar.typeName.better)
                    let fieldCType = resolved.jniType.valueType
                    jniFragment.output("try env.fns.Set\(fieldCType)Field(env.env, this, Self._java_\(storedVar.name)_id, self.\(storedVar.name).toJava(env: env))")
                }
            }
        }

        context.kotlinFragments.append(
            KotlinProductClass(
                module: context.module,
                name: nodeName,
                documentation: documentation,
                constructor: .init(
                    fields: storedVariables.compactMap { context.kotlin(field: $0, useNativeName: true) }
                ),
                fields: computedVariables.compactMap { context.kotlin(field: $0, useNativeName: false) },
                methods: methods.compactMap { context.kotlin(method: $0) }
            )
        )

        return jniFragment
    }
}

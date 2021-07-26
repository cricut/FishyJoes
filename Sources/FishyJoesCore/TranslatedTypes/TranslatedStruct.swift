import SourceryRuntime

struct TranslatedStruct: TranslatedType {
    let sourceType: BetterType
    let cName: String
    let nodeName: String
    let globalName: String
    let storedVariables: [Variable]
    let computedVariables: [Variable]
    let methods: [Method]
    let documentation: [String]

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
        self.globalName = "\(context.module).\(type.globalName)"

        self.storedVariables = type.storedVariables
        self.computedVariables = type.computedVariables.filter { $0.exportAnnotation != nil }

        self.methods = type.methods.filter { $0.exportAnnotation != nil }
        self.documentation = type.documentation
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        let nodeFragment = context.swiftFragment(
            "NodeInterface/\(globalName)+node.swift",
            additionalImports: ["FishyJoesRuntime"]
        )

        nodeFragment.outputBlock("extension \(globalName): FishyJoesRuntime.NodeMutable {") {

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
                nodeFragment.output("let constructor = try FishyJoesRuntime.InstanceData.data(for: env).constructor(for: \"\(nodeName)\", env: env)")
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
                        nodeFragment.outputBlock("FishyJoesRuntime.callbackBody(env, info, name: \"\(nodeName)_constructor\", expectedArgumentCount: \(storedVariables.count)) { env in", closeWith: "}") {
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

        return [nodeFragment]
    }
}

import SourceryRuntime

struct TranslatedReference: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let methods: [Method]
    let computedVariables: [Variable]
    let documentation: [String]

    init(context: FishyJoesContext, type: Type) {
        guard let exportAnnotation = type.exportAnnotation,
              let cTypeName = exportAnnotation.c else {
            fatalErr("c symbol not specified")
        }
        let nodeName = exportAnnotation.js ?? cTypeName

        self.sourceType = BetterType(named: type)
        self.nodeName = nodeName
        self.methods = type.methods.filter { $0.exportAnnotation != nil }
        self.computedVariables = type.variables.filter { $0.exportAnnotation != nil }
        self.documentation = type.documentation
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        let nodeFragment = context.swiftFragment(
            "NodeInterface/\(sourceType.name)+node.swift",
            additionalImports: ["FishyJoesRuntime"]
        )
        nodeFragment.outputBlock("extension \(sourceType.name): FishyJoesRuntime.NodeConvertible {") {
            nodeFragment.outputBlock("public init(fromNode value: napi_value?, env: napi_env) throws {") {
                nodeFragment.output("var pointer: UnsafeMutableRawPointer?")
                nodeFragment.output("try check(napi_unwrap(env, value, &pointer))")
                nodeFragment.outputBlock("guard let nonNilPointer = pointer else {") {
                    nodeFragment.output("throw JSException(message: \"expected \(sourceType.name), got nil\")")
                }
                nodeFragment.output("self = try Box<\(sourceType.name)>.takeUnretainedOpaque(nonNilPointer).value")
            }
            nodeFragment.outputBlock("public func toNode(env: napi_env) throws -> napi_value? {") {
                nodeFragment.output("let constructor = try FishyJoesRuntime.InstanceData.data(for: env).constructor(for: \"\(nodeName)\", env: env)")
                nodeFragment.output("var args: napi_value? = try FishyJoesRuntime.Box(self).retainedExternal(env: env)")
                nodeFragment.output("var result: napi_value?")
                nodeFragment.output("try check(napi_new_instance(env, constructor, 1, &args, &result))")
                nodeFragment.output("return result")
            }
            nodeFragment.outputBlock("public static func nodeSetup(env: napi_env, module: napi_value) throws {") {
                // nodeFragment.output("print(\"setting up \(sourceType.name)\")")

                nodeFragment.outputBlock("let nodeClass = try NodeClass(") {
                    nodeFragment.output("env: env,")
                    nodeFragment.output("name: \"\(nodeName)\",")
                    let properties: [String] =
                        context.nodeTranslator.properties(for: methods) +
                        context.nodeTranslator.properties(for: computedVariables)
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
                        nodeFragment.outputBlock("FishyJoesRuntime.callbackBody(env, info, name: \"\(nodeName)_constructor\", expectedArgumentCount: 1) { env in", closeWith: "}") {
                            nodeFragment.output("// TODO: typecheck?")
                            nodeFragment.output("let this = try env.this()")
                            nodeFragment.output("let selfValue = try env.argument(at: 0)")
                            nodeFragment.output("let boxed = try FishyJoesRuntime.Box<\(sourceType.name)>.takeUnretained(selfValue, env: env.env)")
                            nodeFragment.outputBlock("let finalizer: napi_finalize = { env, data, _ in", closeWith: "}") {
                                nodeFragment.output("FishyJoesRuntime.Box<\(sourceType.name)>.releaseOpaque(data)")
                            }
                            nodeFragment.output("try check(env: env.env, napi_wrap(env.env, this, boxed.retainedOpaque(), finalizer, nil, nil))")
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
                constructor: .hidden,
                fields: computedVariables.compactMap { context.ts(field: $0) },
                methods: methods.compactMap { context.ts(method: $0) }
            )
        )

        return [nodeFragment]
    }
}

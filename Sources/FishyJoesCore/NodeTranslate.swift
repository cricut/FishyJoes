import Foundation
import SourceryRuntime
import Darwin

func debug(file: StaticString = #file, line: UInt = #line, _ msgs: Any? ...) {
    let message = "\(file):\(line): " + msgs.map { "\($0 ?? "<null>")" }.joined(separator: " ") + "\n"
    _ = message.withCString { fputs($0, stderr) }
}

struct NodeTranslate {
    func output(getter variable: Variable, context: FishyJoesContext, fragment: SourceFragment)  {
        guard let exportAnnotation = variable.exportAnnotation else {
            fatalErr("Variable not annotated for export: \(variable)")
        }
        let nodeName = exportAnnotation.name

        let selfExpression: String
        let containingNamespace: String

        if let selfType = variable.definedInTypeName?.better {
            containingNamespace = context.resolve(type: selfType).sourceType.name

            if variable.isStatic {
                selfExpression = containingNamespace
            } else {
                selfExpression = "env.this(as: \(containingNamespace).self)"
            }
        } else {
            containingNamespace = context.module
            selfExpression = context.module
        }

        fragment.outputBlock("{ env, info in", closeWith: "}", newLineTerminated: false) {
            fragment.outputBlock("FishyJoesNodeRuntime.callbackBody(env, info, name: \"\(nodeName)\", expectedArgumentCount: 0) { env in", closeWith: "}") {
                fragment.output("try \(selfExpression).\(variable.name).toNode(env: env.env)")
            }
        }
    }

    func output(setter variable: Variable, context: FishyJoesContext, fragment: SourceFragment)  {
        guard let exportAnnotation = variable.exportAnnotation else {
            fatalErr("Variable not annotated for export: \(variable)")
        }
        guard variable.isMutable, variable.accessLevel.write == .public else {
            fragment.output("nil")
            return
        }
        let nodeName = exportAnnotation.name

        let selfExpression: String
        let containingNamespace: String

        if let selfType = variable.definedInTypeName?.better {
            containingNamespace = context.resolve(type: selfType).sourceType.name

            if variable.isStatic {
                selfExpression = containingNamespace
            } else {
                selfExpression = "env.this(as: \(containingNamespace).self)"
            }
        } else {
            containingNamespace = context.module
            selfExpression = context.module
        }

        fragment.outputBlock("{ env, info in", closeWith: "}", newLineTerminated: false) {
            fragment.outputBlock("FishyJoesNodeRuntime.callbackBody(env, info, name: \"\(nodeName)\", expectedArgumentCount: 1) { env in", closeWith: "}") {
                if variable.isStatic {
                    fragment.output("\(selfExpression).\(variable.name) = try env.argument(at: 0, as: \(variable.typeName.better.name).self)")
                } else {
                    fragment.output("var mutatingSelf = try \(selfExpression)")
                    fragment.output("mutatingSelf.\(variable.name) = try env.argument(at: 0, as: \(variable.typeName.better.name).self)")
                    fragment.output("try mutatingSelf.mutateNode(this: env.this(), env: env.env)")
                }
                fragment.output("return nil")
            }
        }
    }

    func output(method: Method, context: FishyJoesContext, fragment: SourceFragment) {
        let exportAnnotation = method.exportAnnotation
        let nodeName = exportAnnotation.name

        var selfExpression: String
        let containingNamespace: String

        if let selfType = method.definedIn {
            containingNamespace = context.resolve(type: selfType).sourceType.name

            if method.isStatic {
                selfExpression = containingNamespace
            } else {
                selfExpression = "env.this(as: \(containingNamespace).self)"
            }
        } else {
            containingNamespace = context.module
            selfExpression = context.module
        }

        let resultBlock: (() -> Void) -> Void
        switch method.returnType {
        case .void:
            resultBlock = { body in
                body()
                fragment.blankLine()
                fragment.output("let result: napi_value? = nil")
            }
        case let type:
            let resolved = context.resolve(type: type, generics: exportAnnotation.genericOverrides)
            if let returnProxy = resolved.sourceProxyType?.name {
                resultBlock = { body in
                    fragment.outputBlock("let result = try \(returnProxy).proxyToNode(") {
                        fragment.output("for: ", newLineTerminated: false)
                        body()
                        fragment.blankLine()
                        fragment.output(", env: env.env")
                    }
                }
            } else {
                resultBlock = { body in
                    fragment.output("let result = try ", newLineTerminated: false)
                    body()
                    fragment.output(".toNode(env: env.env)")
                }
            }
        }

        fragment.outputBlock("{ env, info in", closeWith: "}") {
            fragment.outputBlock("FishyJoesNodeRuntime.callbackBody(env, info, name: \"\(nodeName)\", expectedArgumentCount: \(method.parameters.count)) { env in", closeWith: "}") {
                let callName = method.isInitializer ? "" : ".\(method.callName)"

                if method.isMutating {
                    fragment.output("var mutatingSelf = try \(selfExpression)")
                    selfExpression = "mutatingSelf"
                }

                resultBlock {
                    fragment.outputBlock("\(selfExpression)\(callName)(", newLineTerminated: false) {
                        fragment.outputMap(method.parameters.enumerated(), separator: ",") {
                            let (index, formal) = $0
                            let resolved = context.resolve(type: formal.type, generics: exportAnnotation.genericOverrides)
                            let result = (formal.label.map { "\($0): " } ?? "") + "try env.argument(at: \(index), "
                            if let proxy = resolved.sourceProxyType {
                                return result + "asProxyType: \(proxy.name).self)"
                            } else {
                                return result + "as: \(resolved.sourceType.name).self)"
                            }
                        }
                    }
                }
                if method.isMutating {
                    fragment.output("try mutatingSelf.mutateNode(this: env.this(), env: env.env)")
                }
                fragment.output("return result")
            }
        }
    }

    func outputProperties(methods: [Method], context: FishyJoesContext, fragment: SourceFragment) {
        for method in methods {
            fragment.outputBlock("\"\(method.exportAnnotation.name)\": (", closeWith: "),") {
                fragment.outputBlock(".method(", closeWith: "),") {
                    output(method: method, context: context, fragment: fragment)
                }
                fragment.output("isStatic: \(method.isStatic)")
            }
        }
    }

    func outputProperties(computedVariables: [Variable], context: FishyJoesContext, fragment: SourceFragment) {
        for variable in computedVariables {
            guard let exportAnnotation = variable.exportAnnotation else {
                continue
            }
            let nodeName = exportAnnotation.name
            fragment.outputBlock("\"\(nodeName)\": (", closeWith: "),") {
                fragment.outputBlock(".accessor(", closeWith: "),") {
                    fragment.output("getter: ", newLineTerminated: false)
                    output(getter: variable, context: context, fragment: fragment)
                    fragment.output(",")
                    fragment.output("setter: ", newLineTerminated: false)
                    output(setter: variable, context: context, fragment: fragment)
                }
                fragment.output("isStatic: \(variable.isStatic)")
            }
        }
    }

    func setupFragment(context: FishyJoesContext, generatedTypes: Set<BetterType>) -> SourceFragment {
        let nodeTypeListFragment = context.swiftFragment(
            "NodeInterface/TypeSetup.swift",
            additionalImports: ["FishyJoesNodeRuntime"]
        )

        nodeTypeListFragment.output("@_cdecl(\"napi_register_module_v1\")")
        nodeTypeListFragment.outputBlock("public func napi_register_module_v1(env: napi_env, exports: napi_value) -> napi_value? {") {
            nodeTypeListFragment.outputBlock("FishyJoesNodeRuntime.rethrowToNode(env: env) {") {
                nodeTypeListFragment.output("var module: napi_value!")
                nodeTypeListFragment.output("try check(napi_create_object(env, &module))")
                nodeTypeListFragment.output("napi_set_named_property(env, exports, \"\(context.module)\", module)")
                nodeTypeListFragment.output("napi_set_named_property(env, exports, \"default\", module)")
                nodeTypeListFragment.blankLine()
                for type in generatedTypes.sorted(by: { "\($0)" < "\($1)" }) {
                    // TODO: better
                    guard case .named = type else {
                        continue
                    }
                    nodeTypeListFragment.output("try \(type.name).nodeSetup(env: env, module: module)")
                }
                nodeTypeListFragment.output("return exports")
            }
        }
        return nodeTypeListFragment
    }
}

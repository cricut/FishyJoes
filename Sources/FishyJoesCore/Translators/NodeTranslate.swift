import Darwin
import Foundation
import SourceryRuntime

func debug(file: StaticString = #file, line: UInt = #line, _ msgs: Any? ...) {
    let message = "\(file):\(line): " + msgs.map { "\($0 ?? "<null>")" }.joined(separator: " ") + "\n"
    _ = message.withCString { fputs($0, stderr) }
}

struct NodeTranslator: Translator {
    init() {}

    func output(getter variable: Variable, context: FishyJoesContext, fragment: SourceFragment) {
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
                selfExpression = "env.this(converter: \(containingNamespace).self)"
            }
        } else {
            containingNamespace = context.module.name
            selfExpression = context.module.name
        }

        fragment.outputBlock("{ env, info in", closeWith: "}", newLineTerminated: false) {
            fragment.outputBlock("FishyJoesNodeRuntime.callbackBody(env, info, name: \"\(nodeName)\", expectedArgumentCount: 0) { env in", closeWith: "}") {
                let resolved = context.resolve(type: variable.typeName.better)
                fragment.output("try \(resolved.converterType.name).toNode(\(selfExpression).\(variable.name), env: env.env)")
            }
        }
    }

    func output(setter variable: Variable, context: FishyJoesContext, fragment: SourceFragment) {
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
                selfExpression = "env.this(converter: \(containingNamespace).self)"
            }
        } else {
            containingNamespace = context.module.name
            selfExpression = context.module.name
        }

        fragment.outputBlock("{ env, info in", closeWith: "}", newLineTerminated: false) {
            fragment.outputBlock("FishyJoesNodeRuntime.callbackBody(env, info, name: \"\(nodeName)\", expectedArgumentCount: 1) { env in", closeWith: "}") {
                let resolved = context.resolve(type: variable.typeName.better)
                if variable.isStatic {
                    fragment.output("\(selfExpression).\(variable.name) = try env.argument(at: 0, converter: \(resolved.converterType.name).self)")
                } else {
                    fragment.output("var mutatingSelf = try \(selfExpression)")
                    fragment.output("mutatingSelf.\(variable.name) = try env.argument(at: 0, converter: \(resolved.converterType.name).self)")
                    fragment.output("try \(containingNamespace).mutateNode(mutatingSelf, this: env.this(), env: env.env)")
                }
                fragment.output("return nil")
            }
        }
    }

    func output(method: Method, context: FishyJoesContext, fragment: SourceFragment, newLineTerminated: Bool = true) {
        let exportAnnotation = method.exportAnnotation
        let nodeName = exportAnnotation.name

        var selfExpression: String
        let containingNamespace: String

        if let selfType = method.definedIn {
            containingNamespace = context.resolve(type: selfType).sourceType.name

            if method.isStatic {
                selfExpression = containingNamespace
            } else {
                selfExpression = "env.this(converter: \(containingNamespace).self)"
            }
        } else {
            containingNamespace = context.module.name
            selfExpression = context.module.name
        }

        let returnType = context.resolve(type: method.returnType, generics: exportAnnotation.genericOverrides)

        fragment.outputBlock("{ env, info in", closeWith: "}", newLineTerminated: newLineTerminated) {
            fragment.outputBlock("FishyJoesNodeRuntime.callbackBody(env, info, name: \"\(nodeName)\", expectedArgumentCount: \(method.parameters.count)) { env in", closeWith: "}") {
                let callName = method.isInitializer ? "" : ".\(method.callName)"

                if method.isMutating {
                    fragment.output("var mutatingSelf = try \(selfExpression)")
                    selfExpression = "mutatingSelf"
                }

                fragment.outputBlock("let result = try \(returnType.converterType.name).toNode(") {
                    fragment.outputBlock("\(selfExpression)\(callName)(", closeWith: "),") {
                        fragment.outputMap(method.parameters.enumerated(), separator: ",") {
                            let (index, formal) = $0
                            let resolved = context.resolve(type: formal.type, generics: exportAnnotation.genericOverrides)
                            let result = (formal.label.map { "\($0): " } ?? "") + "try env.argument(at: \(index), "
                            return result + "converter: \(resolved.converterType.name).self)"
                        }
                    }
                    fragment.output("env: env.env")
                }
                if method.isMutating {
                    fragment.output("try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)")
                }
                fragment.output("return result")
            }
        }
    }

    func outputProperties(methods: [Method], context: FishyJoesContext, fragment: SourceFragment) -> Bool {
        for method in methods {
            fragment.outputBlock("\"\(method.exportAnnotation.name)\": (", closeWith: "),") {
                fragment.output(".method ", newLineTerminated: false)
                output(method: method, context: context, fragment: fragment, newLineTerminated: false)
                fragment.output(",")
                fragment.output("isStatic: \(method.isStatic)")
            }
        }
        return !methods.isEmpty
    }

    func outputProperties(computedVariables: [Variable], context: FishyJoesContext, fragment: SourceFragment) -> Bool {
        var didOutput = false
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
            didOutput = true
        }
        return didOutput
    }

    func setupFragments(context: FishyJoesContext, generatedTypes: Set<BetterType>) -> [SourceFragment] {
        let nodeTypeListFragment = context.swiftFragment(
            "NodeInterface/TypeSetup.swift",
            additionalImports: ["Foundation", "FishyJoesNodeRuntime", "NodeAPI"]
        )

        nodeTypeListFragment.output("@_cdecl(\"napi_register_module_v1\")")
        nodeTypeListFragment.outputBlock("public func napi_register_module_v1(env: napi_env, exports: napi_value) -> napi_value? {") {
            nodeTypeListFragment.output("let env = NAPI.Env(ptr: env)")
            nodeTypeListFragment.output("let exports = NAPI.Value(ptr: exports)")
            nodeTypeListFragment.outputBlock("return FishyJoesNodeRuntime.rethrowToNode(env: env) {") {
                nodeTypeListFragment.output("let module = try env.createObject()")
                nodeTypeListFragment.output("try env.setNamedProperty(exports, \"\(context.module)\", module)")
                nodeTypeListFragment.output("try env.setNamedProperty(exports, \"default\", module)")
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

        let exportFragment = SourceFragment(sourceryDestination: "file:NodeInterface/@_exported.swift")
        exportFragment.output("@_exported import \(context.module.name)")
        for dependency in context.module.dependencies {
            exportFragment.output("@_exported import \(dependency)_NodeInterface")
        }

        return [nodeTypeListFragment, exportFragment]
    }
}

import Darwin
import Foundation
import SourceryRuntime

struct NodeTranslator: Translator {
    init() {}

    func output(getter variable: Variable, explicitThis: Bool = false, context: FishyJoesContext, fragment: SourceFragment) {
        guard let exportAnnotation = variable.exportAnnotation else {
            fatalErr("Variable not annotated for export: \(variable)")
        }
        let nodeName = exportAnnotation.name

        let selfExpression: String
        let containingNamespace: String

        var argIndex = 0

        if let selfType = variable.definedInTypeName?.better {
            containingNamespace = context.resolve(type: selfType).sourceType.name

            if variable.isStatic {
                selfExpression = containingNamespace
            } else if explicitThis {
                selfExpression = "env.argument(at: 0, converter: \(containingNamespace).self)"
                argIndex += 1
            } else {
                selfExpression = "env.this(converter: \(containingNamespace).self)"
            }
        } else {
            containingNamespace = context.module.name
            selfExpression = context.module.name
        }

        fragment.outputBlock("{ env, info in", closeWith: "}", newLineTerminated: false) {
            fragment.outputBlock("FishyJoesNodeRuntime.callbackBody(env, info, name: \"\(nodeName)\", expectedArgumentCount: \(argIndex)) { env in", closeWith: "}") {
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

    func output(method: Method, explicitThis: Bool, context: FishyJoesContext, fragment: SourceFragment, newLineTerminated: Bool = true) {
        let exportAnnotation = method.exportAnnotation
        let nodeName = exportAnnotation.name

        var selfExpression: String
        let containingNamespace: String

        var argIndex = 0

        if let selfType = method.definedIn {
            containingNamespace = context.resolve(type: selfType).sourceType.name

            if method.isStatic {
                selfExpression = containingNamespace
            } else if explicitThis {
                selfExpression = "env.argument(at: 0, converter: \(containingNamespace).self)"
                argIndex += 1
            } else {
                selfExpression = "env.this(converter: \(containingNamespace).self)"
            }
        } else {
            containingNamespace = context.module.name
            selfExpression = context.module.name
        }

        let returnType = context.resolve(type: method.returnType, generics: exportAnnotation.genericOverrides)

        fragment.outputBlock("{ env, info in", closeWith: "}", newLineTerminated: newLineTerminated) {
            let hasNamedOptions = method.parameters.contains { $0.defaultValue != nil }
            let positionalArguments = method.parameters.filter { $0.defaultValue == nil }
            fragment.outputBlock("FishyJoesNodeRuntime.callbackBody(env, info, name: \"\(nodeName)\", expectedArgumentCount: \(argIndex + positionalArguments.count), hasNamedOptions: \(hasNamedOptions)) { env in", closeWith: "}") {
                let callName = method.sourceKind == .initializer ? "" : ".\(method.callName)"

                if method.isMutating {
                    fragment.output("var mutatingSelf = try \(selfExpression)")
                    selfExpression = "mutatingSelf"
                }

                if exportAnnotation.noReturn {
                    fragment.output("try ", newLineTerminated: false)
                } else {
                    fragment.output("let result = try \(returnType.converterType.name).toNode", newLineTerminated: false)
                }

                fragment.outputBlock("(") {
                    fragment.outputBlock("\(selfExpression)\(callName)(", newLineTerminated: false) {
                        fragment.outputMap(method.parameters, separator: ",") { formal in
                            let resolved = context.resolve(type: formal.type, generics: exportAnnotation.genericOverrides)

                            var result = formal.label.map { "\($0): " } ?? ""
                            if let defaultValue = formal.defaultValue {
                                result += "try env.argument(named: \"\(formal.label ?? formal.name)\", default: \(defaultValue), "
                            } else {
                                result += "try env.argument(at: \(argIndex), "
                                argIndex += 1
                            }
                            return result + "converter: \(resolved.converterType.name).self)"
                        }
                    }
                    if exportAnnotation.noReturn {
                        fragment.output()
                    } else {
                        fragment.output(",")
                        fragment.output("env: env.env")
                    }
                }
                if !exportAnnotation.noReturn {
                    if method.isMutating {
                        fragment.output("try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)")
                    }
                    fragment.output("return result")
                }
            }
        }
    }

    func outputProperties(methods: [Method], explicitThis: Bool = false, context: FishyJoesContext, fragment: SourceFragment) -> Bool {
        for method in methods {
            let isStatic = explicitThis || method.isStatic
            let explicitThis = explicitThis && !method.isStatic

            fragment.outputBlock("\"\(method.exportAnnotation.name)\": (", closeWith: "),") {
                fragment.output(".method ", newLineTerminated: false)
                output(method: method, explicitThis: explicitThis, context: context, fragment: fragment, newLineTerminated: false)
                fragment.output(",")
                fragment.output("isStatic: \(isStatic)")
            }
        }
        return !methods.isEmpty
    }

    func outputProperties(computedVariables: [Variable], explicitThis: Bool = false, context: FishyJoesContext, fragment: SourceFragment) -> Bool {
        var didOutput = false
        for variable in computedVariables {
            guard let exportAnnotation = variable.exportAnnotation else {
                continue
            }
            let nodeName = exportAnnotation.name
            if explicitThis, !variable.isStatic {
                fragment.outputBlock("\"get\(upperCaseFirst(nodeName))\": (", closeWith: "),") {
                    fragment.output(".method ", newLineTerminated: false)
                    output(getter: variable, explicitThis: true, context: context, fragment: fragment)
                    fragment.output(",")
                    fragment.output("isStatic: true")
                }
                assert(!variable.isMutable, "mutating enum variables not supported, which I think is the only way to get here")
                // if variable.isMutable {
                //     fragment.outputBlock("\"set\(upperCaseFirst(nodeName))\": (", closeWith: "),") {
                //         fragment.output(".method ", newLineTerminated: false)
                //         output(setter: variable, explicitThis: true, context: context, fragment: fragment)
                //         fragment.output(",")
                //         fragment.output("isStatic: true")
                //     }
                // }
            } else {
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
            didOutput = true
        }
        return didOutput
    }

    func setupFragments(context: FishyJoesContext, generatedTypes: [BetterType]) -> [SourceFragment] {
        let nodeTypeListFragment = context.swiftFragment(
            "NodeInterface/TypeSetup.swift",
            additionalImports: ["Foundation", "FishyJoesNodeRuntime", "NodeAPI"]
        )

        // This function is defined under 2 names: the standard "napi_register_module_v1", and a unique, module-qualified name.
        // To conform to the interface defined by NAPI, the standard name is needed.
        // To statically link 2 or more FishyJoes modules together (WASM currently does this) the unique name is needed.
        // Then, the standard name must be redefined to call each of the unique names of the linked modules.
        nodeTypeListFragment.output("#if !os(WASI)")
        nodeTypeListFragment.output("@available(*, deprecated, message: \"Not actually deprecated, but this silences warnings because it may refer to deprecated methods\")")
        nodeTypeListFragment.output("@_cdecl(\"napi_register_module_v1\")")
        nodeTypeListFragment.outputBlock("public func napi_register_module_v1(env: napi_env, exports: napi_value) -> napi_value? {") {
            nodeTypeListFragment.output("let env = NAPI.Env(ptr: env)")
            nodeTypeListFragment.output("let exports = NAPI.Value(ptr: exports)")
            nodeTypeListFragment.outputBlock("return FishyJoesNodeRuntime.rethrowToNode(env: env) {") {
                nodeTypeListFragment.output("try registerModule\(context.module)(env: env, exports: exports)")
            }
        }
        nodeTypeListFragment.output("#endif")
        nodeTypeListFragment.blankLine()

        nodeTypeListFragment.output("@available(*, deprecated, message: \"Not actually deprecated, but this silences warnings because it may refer to deprecated methods\")")
        nodeTypeListFragment.outputBlock("public func registerModule\(context.module)(env: NAPI.Env, exports: NAPI.Value) throws -> NAPI.Value {") {
            nodeTypeListFragment.output("let module = try env.createObject()")
            nodeTypeListFragment.output("try env.setNamedProperty(exports, \"\(context.module)\", module)")
            nodeTypeListFragment.output("try env.setNamedProperty(exports, \"default\", module)")
            nodeTypeListFragment.blankLine()
            for type in generatedTypes {
                // TODO: better
                guard case .named = type,
                      !(context.resolve(type: type) is ExternalTranslatedType) else {
                    continue
                }
                nodeTypeListFragment.output("try \(type.name).nodeSetup(env: env, module: module)")
            }
            nodeTypeListFragment.output("return exports")
        }

        let exportFragment = SourceFragment(sourceryDestination: "file:NodeInterface/@_exported.swift")
        exportFragment.output("@_exported import \(context.module.name)")
        for dependency in context.module.dependencies {
            exportFragment.output("@_exported import \(dependency)_NodeInterface")
        }

        return [nodeTypeListFragment, exportFragment]
    }

    func ts(method: Method, explicitThis: Bool, context: FishyJoesContext) -> TypeScriptAnnotations.Method? {
        let exportAnnotation = method.exportAnnotation
        var omitParameters = Set(exportAnnotation.omitParameters)
        var parameters: [TypeScriptAnnotations.Method.Parameter] = []

        let isStatic = explicitThis || method.isStatic
        let explicitThis = explicitThis && !method.isStatic

        if explicitThis {
            guard let selfType = method.definedIn else {
                fatalErr("can't use explicitThis on a global")
            }
            let selfResolved = context.resolve(type: selfType)
            parameters.append(
                .init(
                    labelComment: nil,
                    name: "self",
                    type: selfResolved.nodeType,
                    defaultValue: nil
                )
            )
        }

        for parameter in method.parameters {
            if omitParameters.contains(parameter.name) {
                precondition(parameter.defaultValue != nil, "Can't omit non-default parameter")
                omitParameters.remove(parameter.name)
                continue
            }
            let resolved = context.resolve(type: parameter.type, generics: exportAnnotation.genericOverrides)
            var label: String?
            if let swiftLabel = parameter.label, swiftLabel != parameter.name {
                label = swiftLabel
            }
            parameters.append(
                .init(
                    labelComment: label,
                    name: parameter.name,
                    type: resolved.nodeType,
                    defaultValue: parameter.defaultValue
                )
            )
        }

        return TypeScriptAnnotations.Method(
            documentation: method.documentation + (method.deprecation.map { ["@deprecated \($0.message)"] } ?? []),
            isStatic: isStatic,
            name: exportAnnotation.name,
            parameters: parameters,
            returnType: context.resolve(type: method.returnType, generics: exportAnnotation.genericOverrides).nodeType
        )
    }

    func ts(field: Variable, context: FishyJoesContext, useNativeName: Bool) -> TypeScriptAnnotations.Variable? {
        let name: String
        if useNativeName {
            guard field.exportAnnotation == nil else {
                fatalErr("field \(field.name) should not be annotated, as it's in a type being exported memberwise")
            }
            name = field.name
        } else {
            guard let exportAnnotation = field.exportAnnotation else {
                return nil
            }
            name = exportAnnotation.name
        }

        return TypeScriptAnnotations.Variable(
            documentation: field.documentation + (field.deprecation.map { ["@deprecated \($0.message)"] } ?? []),
            readOnly: !field.isMutable,
            isStatic: field.isStatic,
            name: name,
            type: context.resolve(type: field.typeName.better).nodeType
        )
    }

    func ts(fieldAsMethods field: Variable, explicitThis: Bool, context: FishyJoesContext) -> [TypeScriptAnnotations.Method] {
        guard let exportAnnotation = field.exportAnnotation,
              let selfType = field.definedInTypeName?.better
        else {
            return []
        }

        let isStatic = explicitThis || field.isStatic
        let explicitThis = explicitThis && !field.isStatic

        let name = upperCaseFirst(exportAnnotation.name)
        let selfResolved = context.resolve(type: selfType)
        let parameters = explicitThis ? [
            TypeScriptAnnotations.Method.Parameter(
                labelComment: nil,
                name: "self",
                type: selfResolved.nodeType,
                defaultValue: nil
            )
        ] : []

        let resolved = context.resolve(type: field.typeName.better)
        return [
            TypeScriptAnnotations.Method(
                documentation: field.documentation + (field.deprecation.map { ["@deprecated \($0.message)"] } ?? []),
                isStatic: isStatic,
                name: "get\(name)",
                parameters: parameters,
                returnType: resolved.nodeType
            )
        ] + (
            field.isMutable ? [
                TypeScriptAnnotations.Method(
                    documentation: ["See `get\(name)`"] + (field.deprecation.map { ["@deprecated \($0.message)"] } ?? []),
                    isStatic: isStatic,
                    name: "set\(name)",
                    parameters: parameters + [
                        .init(
                            labelComment: nil,
                            name: "newValue",
                            type: resolved.nodeType,
                            defaultValue: nil
                        )
                    ],
                    returnType: .void
                )
            ] : []
        )
    }
}

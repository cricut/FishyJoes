import Darwin
import Foundation
import SourceryRuntime

struct NodeTranslator: Translator {
    func output(getter variable: Field, explicitThis: Bool = false, context: FishyJoesContext, fragment: SourceFragment) {
        guard let exportAnnotation = variable.exportAnnotation else {
            fatalErr("Variable not annotated for export: \(variable)")
        }
        let nodeName = exportAnnotation.name

        let selfExpression: String
        let containingNamespace: String

        var argIndex = 0

        if let selfType = variable.definedIn {
            containingNamespace = context.resolve(type: selfType).converterType.name

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
                let resolved = context.resolve(type: variable.type)
                fragment.output("try \(resolved.converterType.name).toNode(\(selfExpression).\(variable.name), env: env.env)")
            }
        }
    }

    func output(setter variable: Field, context: FishyJoesContext, fragment: SourceFragment) {
        guard let exportAnnotation = variable.exportAnnotation else {
            fatalErr("Variable not annotated for export: \(variable)")
        }
        guard variable.isPubliclyWritable else {
            fragment.output("nil")
            return
        }
        let nodeName = exportAnnotation.name

        let selfExpression: String
        let containingNamespace: String

        if let selfType = variable.definedIn {
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
                let resolved = context.resolve(type: variable.type)
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
            containingNamespace = context.resolve(type: selfType).converterType.name

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

        func convertMethodParameter(formal: SwiftFormal, argIndex: inout Int, includeFormalLabel: Bool = true) -> String {
            let resolved = context.resolve(type: formal.type, generics: exportAnnotation.genericOverrides)

            var result = includeFormalLabel ? (formal.label.map { "\($0): " } ?? "") : ""
            if let defaultValue = formal.defaultValue {
                result += "try env.argument(named: \"\(formal.label ?? formal.name)\", default: \(defaultValue), "
            } else {
                result += "try env.argument(at: \(argIndex), "
                argIndex += 1
            }
            return result + "converter: \(resolved.converterType.name).self)"
        }

        fragment.outputBlock("{ env, info in", closeWith: "}", newLineTerminated: newLineTerminated) {
            let hasNamedOptions = method.parameters.contains { $0.defaultValue != nil }
            let positionalArguments = method.parameters.filter { $0.defaultValue == nil }
            fragment.outputBlock("FishyJoesNodeRuntime.callbackBody(env, info, name: \"\(nodeName)\", expectedArgumentCount: \(argIndex + positionalArguments.count), hasNamedOptions: \(hasNamedOptions)) { env in", closeWith: "}") {
                if method.isAsync {
                    let callName = method.sourceKind == .initializer ? "" : ".\(method.callName)"

                    fragment.output("let (deferred, promise) = try env.env.createPromise()")

                    var argIndex = 0
                    fragment.outputMap(method.parameters, separator: "") { formal in
                        return "let arg\(argIndex) = UncheckedSendableBox(\(convertMethodParameter(formal: formal, argIndex: &argIndex, includeFormalLabel: false)))"
                    }

                    if method.isMutating {
                        fragment.output("let mutatingSelf = UncheckedSendableBox(try env.this(converter: \(containingNamespace).self))")
                        fragment.output("let jsThis = try env.env.reference(env.this())")
                        selfExpression = "mutatingSelf.value"
                    } else if !method.isStatic {
                        fragment.output("let swiftSelf = UncheckedSendableBox(try env.this(converter: \(containingNamespace).self))")
                        selfExpression = "swiftSelf.value"
                    }

                    func writeMutation() {
                        if method.isMutating {
                            fragment.output("try Self.mutateNode(mutatingSelf.value, this: jsThis.value(env: env), env: env)")
                        }
                    }

                    fragment.outputBlock("Task {") {
                        fragment.outputBlock("do {", newLineTerminated: false) {
                            fragment.outputBlock("let taskResult: \(method.returnType.name) = \(method.isThrowing ? "try " : "")await \(selfExpression)\(callName)(") {
                                var argIndex = 0
                                fragment.outputMap(method.parameters, separator: ",") { formal in
                                    defer { argIndex += 1 }
                                    var argument = ""
                                    if let label = formal.label {
                                        argument += "\(label): "
                                    }
                                    argument += "arg\(argIndex).value"
                                    return argument
                                }
                            }
                            fragment.outputBlock("try onMainThread { env in", closeWith: "}") {
                                fragment.output("let convertedTaskResult: NAPI.Value")
                                fragment.outputBlock("do {", newLineTerminated: false) {
                                    fragment.output("convertedTaskResult = try \(returnType.converterType.name).toNode(taskResult, env: env)")
                                }
                                fragment.outputBlock(" catch {") {
                                    writeMutation()
                                    fragment.output("try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))")
                                    fragment.output("return")
                                }
                                writeMutation()
                                fragment.output("try env.resolveDeferred(deferred, convertedTaskResult)")
                            }
                        }
                        fragment.outputBlock(" catch {") {
                            fragment.outputBlock("try onMainThread { env in", closeWith: "}") {
                                writeMutation()
                                fragment.output("try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))")
                            }
                        }
                    }
                    fragment.output("return promise")
                } else {
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
                                guard !method.isAsync else {
                                    defer { argIndex += 1 }
                                    return "arg\(argIndex).value"
                                }
                                return convertMethodParameter(formal: formal, argIndex: &argIndex)
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

    func outputProperties(computedVariables: [Field], explicitThis: Bool = false, context: FishyJoesContext, fragment: SourceFragment) -> Bool {
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
            additionalImports: ["Foundation", "FishyJoesNodeRuntime", "NodeAPI", "\(context.module.name)_CommonInterface"]
        )
        nodeTypeListFragment.output("@available(*, deprecated, message: \"Not actually deprecated, but this silences warnings because it may refer to deprecated methods\")")
        nodeTypeListFragment.outputBlock("public func registerModule\(context.module.name)(env: NAPI.Env, exports: NAPI.Value) throws -> NAPI.Value {") {
            nodeTypeListFragment.output("#if os(WASI)")
            nodeTypeListFragment.output("try JavaScriptEventLoop.installGlobalExecutor(env: env)")
            nodeTypeListFragment.output("#endif")
            nodeTypeListFragment.output("try setupOnMainThreadEntryPoint(env: env)")
            nodeTypeListFragment.output("let module = try env.createObject()")
            nodeTypeListFragment.output("try env.setNamedProperty(exports, \"\(context.module.name)\", module)")
            nodeTypeListFragment.output("try env.setNamedProperty(exports, \"default\", module)")
            nodeTypeListFragment.blankLine()
            for type in generatedTypes {
                let resolved = context.resolve(type: type)
                nodeTypeListFragment.output("try \(resolved.converterType.name).nodeSetup(env: env, module: module)")
            }
            nodeTypeListFragment.output("return exports")
        }
        nodeTypeListFragment.blankLine()
        nodeTypeListFragment.output("@available(*, deprecated, message: \"Not actually deprecated, but this silences warnings because it may refer to deprecated methods\")")
        nodeTypeListFragment.output("@_cdecl(\"registerModule\(context.module.name)\")")
        nodeTypeListFragment.outputBlock("public func cRegisterModule\(context.module.name)(env: napi_env, exports: napi_value) -> napi_value? {") {
            nodeTypeListFragment.output("let env = NAPI.Env(ptr: env)")
            nodeTypeListFragment.output("let exports = NAPI.Value(ptr: exports)")
            nodeTypeListFragment.outputBlock("return FishyJoesNodeRuntime.rethrowToNode(env: env) {") {
                nodeTypeListFragment.output("try registerModule\(context.module.name)(env: env, exports: exports)")
            }
        }

        let exportFragment = SourceFragment(sourceryDestination: "file:NodeInterface/@_exported.swift")
        exportFragment.output("@_exported import \(context.module.name)")
        for dependency in context.module.dependencies {
            exportFragment.output("@_exported import \(dependency)_NodeInterface")
        }

        let nodeNativeShimFragment = SourceFragment(sourceryDestination: "file:NodeNativeShim/NAPIRegisterModule.c")
        nodeNativeShimFragment.output("#include <node_api.h>")
        nodeNativeShimFragment.blankLine()
        nodeNativeShimFragment.output("extern napi_value registerModule\(context.module.name)(napi_env env, napi_value exports);")
        nodeNativeShimFragment.blankLine()
        nodeNativeShimFragment.output("#pragma comment(linker, \"/export:napi_register_module_v1\")")
        nodeNativeShimFragment.outputBlock("napi_value napi_register_module_v1(napi_env env, napi_value exports) {") {
            nodeNativeShimFragment.output("return registerModule\(context.module.name)(env, exports);")
        }

        let wasmShimFragment = context.swiftFragment(
            "WasmMainShim/NAPIRegisterModule.swift",
            additionalImports: ["FishyJoesNodeRuntime", "NodeAPI", "\(context.module.name)_NodeInterface"] + context.module.dependencies.map { "\($0)_NodeInterface" }
        )
        wasmShimFragment.output("@available(*, deprecated, message: \"Not actually deprecated, but this silences warnings because it may refer to deprecated methods\")")
        wasmShimFragment.output("@_cdecl(\"napi_register_module_v1\")")
        wasmShimFragment.outputBlock("public func napi_register_module_v1(env: napi_env, exports: napi_value) -> napi_value? {") {
            wasmShimFragment.output("let env = NAPI.Env(ptr: env)")
            wasmShimFragment.output("var exports = NAPI.Value(ptr: exports)")
            wasmShimFragment.outputBlock("return FishyJoesNodeRuntime.rethrowToNode(env: env) {") {
                wasmShimFragment.output("exports = try registerModuleRuntime(env: env, exports: exports)")
                for dependency in context.module.dependencies {
                    wasmShimFragment.output("exports = try registerModule\(dependency)(env: env, exports: exports)")
                }
                wasmShimFragment.output("exports = try registerModule\(context.module.name)(env: env, exports: exports)")
                wasmShimFragment.output("return exports")
            }
        }

        let wasmShimMainFragment = SourceFragment(sourceryDestination: "file:WasmMainShim/main.swift")
        wasmShimMainFragment.output("// Executable main requires no statements, as module registration is done by napi.init() calling napi_register_module_v1()")

        return [nodeTypeListFragment, exportFragment, nodeNativeShimFragment, wasmShimFragment, wasmShimMainFragment]
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
                    label: nil,
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
                    label: label,
                    name: parameter.name,
                    type: resolved.nodeType,
                    defaultValue: parameter.defaultValue
                )
            )
        }

        let returnType = context.resolve(type: method.returnType, generics: exportAnnotation.genericOverrides).nodeType

        return TypeScriptAnnotations.Method(
            documentation: method.documentation + (method.deprecation.map { ["@deprecated \($0.message)"] } ?? []),
            isStatic: isStatic,
            isAsync: method.isAsync,
            name: exportAnnotation.name,
            parameters: parameters,
            returnType: method.isAsync ? .promise(returnType) : returnType
        )
    }

    func ts(field: Field, context: FishyJoesContext, useNativeName: Bool) -> TypeScriptAnnotations.Variable? {
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
            readOnly: !field.isPubliclyWritable,
            isStatic: field.isStatic,
            name: name,
            type: context.resolve(type: field.type).nodeType
        )
    }

    func ts(fieldAsMethods field: Field, explicitThis: Bool, context: FishyJoesContext) -> [TypeScriptAnnotations.Method] {
        guard let exportAnnotation = field.exportAnnotation,
              let selfType = field.definedIn
        else {
            return []
        }

        let isStatic = explicitThis || field.isStatic
        let explicitThis = explicitThis && !field.isStatic

        let name = upperCaseFirst(exportAnnotation.name)
        let selfResolved = context.resolve(type: selfType)
        let parameters = explicitThis ? [
            TypeScriptAnnotations.Method.Parameter(
                label: nil,
                name: "self",
                type: selfResolved.nodeType,
                defaultValue: nil
            )
        ] : []

        let resolved = context.resolve(type: field.type)
        return [
            TypeScriptAnnotations.Method(
                documentation: field.documentation + (field.deprecation.map { ["@deprecated \($0.message)"] } ?? []),
                isStatic: isStatic,
                isAsync: false,
                name: "get\(name)",
                parameters: parameters,
                returnType: resolved.nodeType
            )
        ] + (
            field.isPubliclyWritable ? [
                TypeScriptAnnotations.Method(
                    documentation: ["See `get\(name)`"] + (field.deprecation.map { ["@deprecated \($0.message)"] } ?? []),
                    isStatic: isStatic,
                    isAsync: false,
                    name: "set\(name)",
                    parameters: parameters + [
                        .init(
                            label: nil,
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

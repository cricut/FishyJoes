import Foundation
import SourceryRuntime

public class CDeclareContext {
    let module: String
    let templateContext: TemplateContext
    var cTypeCache: [BetterType: TranslatedType] = [:]
    var fileHeaders: [String: Set<String>] = [:]
    var fileFooters: [String: Set<String>] = [:]

    var tsFragment: TypeScriptAnnotations

    public init(context: TemplateContext) {
        let argument = context.argument
        guard let module = argument["module"] as? String else {
            fatalErr("must provide module name as `module` argument to sourcery")
        }
        self.templateContext = context
        self.module = module
        self.tsFragment = TypeScriptAnnotations(moduleName: module)
    }

    func swiftFragment(_ name: String, additionalImports: [String] = []) -> SourceFragment {
        let imports = ["import CTypes", "import \(module)"] + additionalImports.map { "import \($0)" }
        fileHeaders[name, default: []].formUnion(imports)
        return SourceFragment(sourceryDestination: "file:\(name)")
    }

    func cHeaderFragment(_ name: String) -> SourceFragment {
        let includeGuard = "__" + name.components(separatedBy: CharacterSet.alphanumerics.inverted).joined(separator: "_")
        let header = """
            #ifndef \(includeGuard)
            #define \(includeGuard)
            #include <stdint.h>
            """
        let footer = """
            #endif // \(includeGuard)
            """
        fileHeaders[name, default: []].insert(header)
        fileFooters[name, default: []].insert(footer)
        return SourceFragment(sourceryDestination: "file:\(name)")
    }

    public func translateAll() -> String {
        var collectedFragments: [SourceFragment] = []

        // Collect type information before starting translation
        for translatedType in templateContext.types.all.compactMap(translate(typeDefinition:)) {
            let name = translatedType.sourceType
            precondition(cTypeCache[name] == nil, "duplicate definitions found for \(name)")
            cTypeCache[name] = translatedType
        }

        // Translate
        for type in templateContext.types.all + templateContext.types.extensions {
            for method in type.allMethods {
                collectedFragments.append(contentsOf: cTranslate(method: method))
                collectedFragments.append(contentsOf: nodeTranslate(method: method))
            }
            for variable in type.allVariables {
                if "\(variable.name)".contains("svgPathData") {
                    debug("\(type.name).\(variable.name): \(variable.annotations)")
                }
                collectedFragments.append(contentsOf: translate(variable: variable))
            }
        }
        // Translate any top level functions
        for topLevelFunction in templateContext.functions {
            collectedFragments.append(contentsOf: cTranslate(method: topLevelFunction))
            collectedFragments.append(contentsOf: nodeTranslate(method: topLevelFunction))
        }

        var generatedTypes = Set<BetterType>()
        while generatedTypes != Set(cTypeCache.keys) {
            for type in cTypeCache.sorted(by: { "\($0.key)" < "\($1.key)" }) {
                guard !generatedTypes.contains(type.key) else { continue }
                collectedFragments.append(contentsOf: type.value.definitionFragments(in: self))
                generatedTypes.insert(type.key)
            }
        }

        let nodeTypeListFragment = swiftFragment(
            "NodeInterface/TypeSetup.swift",
            additionalImports: ["NodeUtils"]
        )
        nodeTypeListFragment.outputBlock("public func initialize(env: napi_env, module: napi_value) throws {") {
            for type in generatedTypes.sorted(by: { "\($0)" < "\($1)" }) {
                // TODO: better
                guard case let .unknown(name) = type else {
                    continue
                }
                nodeTypeListFragment.output("try \(name).nodeSetup(env: env, module: module)")
            }
        }
        collectedFragments.append(nodeTypeListFragment)

        let headerFragments = fileHeaders.keys.map { fileName -> SourceFragment in
            let fragment = SourceFragment(sourceryDestination: "file:\(fileName)")
            for headerLine in fileHeaders[fileName, default: []] {
                fragment.output(headerLine)
            }
            return fragment
        }
        let footerFragments = fileFooters.keys.map { fileName -> SourceFragment in
            let fragment = SourceFragment(sourceryDestination: "file:\(fileName)")
            for footerLine in fileFooters[fileName, default: []] {
                fragment.output(footerLine)
            }
            return fragment
        }

        return (headerFragments + collectedFragments + footerFragments + [tsFragment.fragment]).map(\.contents).joined()
    }

    func translate(typeDefinition type: Type) -> TranslatedType? {
        if type.annotations["cdecl"] != nil {
            if type.kind == "struct" {
                return TranslatedStruct(context: self, type: type)
            } else if let type = type as? Enum {
                return TranslatedEnum(context: self, type: type)
            } else {
                fatalErr("TODO: cdecl on unknown kind \"\(type.kind)\" on type `\(type.globalName)`")
            }
        } else if type.annotations["cdecl.referenceType"] != nil {
            return TranslatedReference(context: self, type: type)
        } else {
            // Not annotated for export
            return nil
        }
    }

    func resolve(type: BetterType) -> TranslatedType {
        if let resolved = cTypeCache[type] {
            return resolved
        }
        debug("resolve: \(type)")

        let primitiveTypeMap = [
            "Double": ("double", "number"),
            "Bool": ("_Bool", "bool"),
        ]

        let resolved = { () -> TranslatedType in
            switch type {
            case let .unknown(name):
                if let (cName, nodeName) = primitiveTypeMap[name] {
                    return TranslatedPrimitive(swift: name, c: cName, node: nodeName)
                } else if name == "String" {
                    return TranslatedString()
                } else {
                    fatalErr("Don't know how to translate type `\(name)`. Maybe annotate it with a cdecl?")
                }
            case let .optional(wrapped):
                return TranslatedOptional(wrapped: resolve(type: wrapped))
            case let .unsafeMutablePointer(pointee):
                return TranslatedPointer(pointee: resolve(type: pointee))
            case .void:
                return TranslatedPrimitive(swift: "Void", c: "void", node: "void")
            case .tuple(let elements):
                return TranslatedTuple(elements: elements.map { .init(label: $0.label, type: resolve(type: $0.type)) })
            case .array(let element):
                return TranslatedArray(element: resolve(type: element))
            default:
                fatalErr("TODO: resolve(type: \(type))")
            }
        }()
        cTypeCache[type] = resolved
        return resolved
    }

    func nodeTranslate(method: SourceryMethod) -> [SourceFragment] {
        guard method.annotations["cdecl.get"] == nil,
              method.annotations["cdecl.set"] == nil else {
            let context = method.definedInTypeName?.description ?? module
            fatalErr("""
                found annotation `sourcery: cdecl.{get,set} = ...` on method \(method.name) in \(context)
                use `sourcery: cdecl = ...` for methods instead.
                """)
        }
        guard let cName = method.annotations["cdecl"] as? String else { return [] }
        let nodeName = method.annotations["nodedecl"] as? String ?? cName

        let selfExpression: String
        let containingNamespace: String

        if let selfType = method.definedInTypeName?.better {
            containingNamespace = resolve(type: selfType).globalName
            // Method.isMutating seems to be a bit buggy...
            let isMutating = method.isMutating || method.modifiers.contains(where: { $0.name == "mutating" })

            if isMutating {
                // TODO: do
                return []
            }

            if method.isStatic {
                selfExpression = containingNamespace
            } else {
                selfExpression = "env.this(as: \(containingNamespace).self)"
            }
        } else {
            containingNamespace = module
            selfExpression = module
        }

        debug("generating \(containingNamespace).\(method.name)`")
        var omitParameters = Set((method.annotations["cdecl.omitParameters"] as? String).asArray.flatMap { $0.components(separatedBy: " ") })
        var parameters: [SwiftFormal] = []
        for parameter in method.parameters {
            if omitParameters.contains(parameter.name) {
                precondition(parameter.defaultValue != nil, "Can't omit non-default parameter")
                omitParameters.remove(parameter.name)
                continue
            }
            parameters.append(
                SwiftFormal(
                    label: parameter.argumentLabel,
                    name: parameter.name,
                    type: resolve(type: parameter.typeName.better)
                )
            )
        }
        precondition(omitParameters.isEmpty, "Can't find parameters \(omitParameters) to omit")

        // let translatedReturn = resolveNode(type: method.returnTypeName.better)
        // formals.append(contentsOf: translatedReturn.outFormals)

        let formals = parameters.flatMap(\.asSwiftFormals)
        let nodeBridgeFragment = swiftFragment(
            "NodeInterface/\(containingNamespace)+nodedecl.swift",
            additionalImports: ["NodeUtils"]
        )
        nodeBridgeFragment.output("// Generated by sourcery:cdecl for `\(containingNamespace).\(method.name)`")
        nodeBridgeFragment.outputBlock("let node_\(cName): napi_callback = { env, info in", closeWith: "}") {
            nodeBridgeFragment.outputBlock("NodeUtils.callbackBody(env, info, name: \"\(nodeName)\", expectedArgumentCount: \(formals.count)) { env in", closeWith: "}") {
                let callName = method.isInitializer ? "" : ".\(method.callName)"
                nodeBridgeFragment.outputBlock("try \(selfExpression)\(callName)(", newLineTerminated: false) {
                    nodeBridgeFragment.outputMap(parameters.enumerated(), separator: ",") {
                        let (index, formal) = $0
                        return (formal.label.map { "\($0): " } ?? "") + "try env.argument(at: \(index), as: \(formal.type.globalName).self)"
                    }
                }
                nodeBridgeFragment.output(".toNode(env: env.env)")
            }
        }

        return [nodeBridgeFragment]
    }

    func cTranslate(method: SourceryMethod) -> [SourceFragment] {
        guard method.annotations["cdecl.get"] == nil,
              method.annotations["cdecl.set"] == nil else {
            let context = method.definedInTypeName?.description ?? module
            fatalErr("""
                found annotation `sourcery: cdecl.{get,set} = ...` on method \(method.name) in \(context)
                use `sourcery: cdecl = ...` for methods instead.
                """)
        }
        guard let cName = method.annotations["cdecl"] as? String else { return [] }

        var selfParameter: SwiftFormal?
        let selfExpression: String
        let containingNamespace: String

        if let selfType = method.definedInTypeName?.better {
            containingNamespace = resolve(type: selfType).globalName
            // Method.isMutating seems to be a bit buggy...
            let isMutating = method.isMutating || method.modifiers.contains(where: { $0.name == "mutating" })

            if method.isStatic {
                selfExpression = containingNamespace
            } else {
                selfParameter = SwiftFormal(
                    label: "self",
                    name: "self",
                    type: resolve(type: isMutating ? .unsafeMutablePointer(selfType) : selfType)
                )
                selfExpression = selfParameter!.asSwiftExpression
            }
        } else {
            containingNamespace = module
            selfExpression = module
        }

        debug("generating \(containingNamespace).\(method.name)`")
        var omitParameters = Set((method.annotations["cdecl.omitParameters"] as? String).asArray.flatMap { $0.components(separatedBy: " ") })
        var nonSelfParameters: [SwiftFormal] = []
        for parameter in method.parameters {
            if omitParameters.contains(parameter.name) {
                precondition(parameter.defaultValue != nil, "Can't omit non-default parameter")
                omitParameters.remove(parameter.name)
                continue
            }
            nonSelfParameters.append(
                SwiftFormal(
                    label: parameter.argumentLabel,
                    name: parameter.name,
                    type: resolve(type: parameter.typeName.better)
                )
            )
        }
        precondition(omitParameters.isEmpty, "Can't find parameters \(omitParameters) to omit")

        let translatedReturn = resolve(type: method.returnTypeName.better)
        // formals.append(contentsOf: translatedReturn.outFormals)

        let cBridgeFragment = swiftFragment("CInterface/\(containingNamespace)+cdecl.swift")
        cBridgeFragment.output("// Generated by sourcery:cdecl for `\(containingNamespace).\(method.name)`")
        cBridgeFragment.output("@_cdecl(\"\(cName)\")")
        let allParameters = selfParameter.asArray + nonSelfParameters
        let formals = allParameters.flatMap(\.asSwiftFormals)
        cBridgeFragment.outputBlock("public func \(cName)(", newLineTerminated: false) {
            cBridgeFragment.outputMap(formals, separator: ",") { $0 }
        }
        cBridgeFragment.outputBlock("\(translatedReturn.globalCName == "Swift.Void" ? "" : " -> \(translatedReturn.globalCName)") {") {
            // supress the name "init" and, more importantly, "init?"; one is bad style to call, the other is a type error
            let callName = method.isInitializer ? "" : ".\(method.callName)"
            cBridgeFragment.outputBlock("\(selfExpression)\(callName)(", newLineTerminated: false) {
                cBridgeFragment.outputMap(nonSelfParameters, separator: ",", \.asSwiftLabeledArgument)
            }
            cBridgeFragment.output(translatedReturn.asCAccessor)
        }

        return [cBridgeFragment]
    }

    func translate(variable: Variable) -> [SourceFragment] {
        if variable.annotations["cdecl"] != nil {
            fatalErr("""
                found annotation `sourcery: cdecl = ...` on variable \(variable.name) in \(variable.definedInTypeName?.description ?? module)
                use `sourcery: cdecl.get = ...` and/or `sourcery: cdecl.set = ...` for variables instead.
                """)
        }
        return cTranslateGetter(for: variable) + cTranslateSetter(for: variable) + nodeTranslateGetter(for: variable)
    }

    func cTranslateGetter(for variable: Variable) -> [SourceFragment] {
        guard let cName = variable.annotations["cdecl.get"] as? String else { return [] }

        var formals: [String] = []
        let selfExpression: String
        let containingNamespace: String

        if let selfType = variable.definedInTypeName?.better {
            containingNamespace = resolve(type: selfType).globalName

            if variable.isStatic {
                selfExpression = containingNamespace
            } else {
                let translated = resolve(type: selfType).asFormals(label: "self", name: "self")
                formals.append(contentsOf: translated.formals.map(\.asSwiftFormal))
                selfExpression = translated.expression
            }
        } else {
            containingNamespace = module
            selfExpression = module
        }

        let translatedReturn = resolve(type: variable.typeName.better)
        // formals.append(contentsOf: translatedReturn.outFormals)

        debug("generating getter: CInterface/\(containingNamespace)+cdecl.swift for `\(containingNamespace).\(variable.name)`")
        let fragment = swiftFragment("CInterface/\(containingNamespace)+cdecl.swift")
        fragment.output("// Generated by sourcery:cdecl.get for `\(containingNamespace).\(variable.name)`")
        fragment.output("@_cdecl(\"\(cName)\")")
        fragment.outputBlock("public func \(cName)(", newLineTerminated: false) {
            fragment.outputMap(formals, separator: ",") { $0 }
        }
        fragment.outputBlock("\(translatedReturn.globalCName == "Swift.Void" ? "" : " -> \(translatedReturn.globalCName)") {") {
            fragment.output("\(selfExpression).\(variable.name)\(translatedReturn.asCAccessor)")
        }
        debug(fragment)
        return [fragment]
    }

    func nodeTranslateGetter(for variable: Variable) -> [SourceFragment] {
        guard let cName = variable.annotations["cdecl.get"] as? String else { return [] }
        let nodeName = variable.annotations["nodedecl.get"] as? String ?? variable.annotations["nodedecl"] as? String ?? cName

        let selfExpression: String
        let containingNamespace: String

        if let selfType = variable.definedInTypeName?.better {
            containingNamespace = resolve(type: selfType).globalName

            if variable.isStatic {
                selfExpression = containingNamespace
            } else {
                selfExpression = "env.this(as: \(containingNamespace).self)"
            }
        } else {
            containingNamespace = module
            selfExpression = module
        }

        debug("generating getter for \(containingNamespace).\(variable.name)`")
        let fragment = swiftFragment(
            "NodeInterface/\(containingNamespace)+nodedecl.swift",
            additionalImports: ["NodeUtils"]
        )
        fragment.output("// Generated by sourcery:cdecl.get for `\(containingNamespace).\(variable.name)`")
        fragment.outputBlock("let node_\(cName): napi_callback = { env, info in", closeWith: "}") {
            fragment.outputBlock("NodeUtils.callbackBody(env, info, name: \"\(nodeName)\", expectedArgumentCount: 0) { env in", closeWith: "}") {
                fragment.output("try \(selfExpression).\(variable.name).toNode(env: env.env)")
            }
        }

        return [fragment]
    }

    func ts(method: SourceryMethod) -> TypeScriptAnnotations.Method? {
        guard let nodeName = method.annotations["nodedecl"] as? String ?? method.annotations["cdecl"] as? String else { return nil }
        let isMutating = method.isMutating || method.modifiers.contains(where: { $0.name == "mutating" })
        if isMutating {
            // TODO: do
            return nil
        }

        var omitParameters = Set((method.annotations["cdecl.omitParameters"] as? String).asArray.flatMap { $0.components(separatedBy: " ") })
        var parameters: [(String, TypeScriptAnnotations.TSType)] = []
        for parameter in method.parameters {
            if omitParameters.contains(parameter.name) {
                precondition(parameter.defaultValue != nil, "Can't omit non-default parameter")
                omitParameters.remove(parameter.name)
                continue
            }
            let resolved = resolve(type: parameter.typeName.better)
            parameters.append((parameter.argumentLabel ?? parameter.name, resolved.nodeType))
        }

        return TypeScriptAnnotations.Method(
            isStatic: method.isStatic,
            name: nodeName,
            parameters: parameters,
            returnType: resolve(type: method.returnTypeName.better).nodeType
        )
        // tsFragment.outputBlock("\( ? "static " : "")\(nodeName)(", newLineTerminated: false) {
        //     tsFragment.outputMap(parameters, separator: ",") { $0 }
        // }
        // tsFragment.output("\(resolve(type: method.returnTypeName.better).topLevelNodeName)")
    }

    func cTranslateSetter(for variable: Variable) -> [SourceFragment] {
        guard let cName = variable.annotations["cdecl.set"] as? String else { return [] }
        fatalErr("TODO: translateSetter for \(cName)")
    }
}

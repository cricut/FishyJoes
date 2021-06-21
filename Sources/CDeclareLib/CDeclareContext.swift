import Foundation
import SourceryRuntime

public class CDeclareContext {
    let module: String
    let templateContext: TemplateContext
    var cTypeCache: [BetterType: TranslatedType] = [:]
    var fileHeaders: [String: Set<String>] = [:]
    var fileFooters: [String: Set<String>] = [:]

    var tsFragment: TypeScriptAnnotations

    let nodeTranslator = NodeTranslate()
    let cTranslator = CTranslate()

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
                collectedFragments.append(contentsOf: cTranslator.translate(method: method, context: self))
                collectedFragments.append(contentsOf: nodeTranslator.translate(method: method, context: self))
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
            collectedFragments.append(contentsOf: cTranslator.translate(method: topLevelFunction, context: self))
            collectedFragments.append(contentsOf: nodeTranslator.translate(method: topLevelFunction, context: self))
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
            additionalImports: ["CDeclareRuntime"]
        )

        nodeTypeListFragment.output("@_cdecl(\"napi_register_module_v1\")")
        nodeTypeListFragment.outputBlock("public func napi_register_module_v1(env: napi_env, exports: napi_value) -> napi_value? {") {

            nodeTypeListFragment.outputBlock("CDeclareRuntime.rethrowToNode(env: env) {") {
                nodeTypeListFragment.output("var module: napi_value!")
                nodeTypeListFragment.output("try check(napi_create_object(env, &module))")
                nodeTypeListFragment.output("napi_set_named_property(env, exports, \"\(module)\", module)")
                nodeTypeListFragment.output("napi_set_named_property(env, exports, \"default\", module)")
                nodeTypeListFragment.output()
                for type in generatedTypes.sorted(by: { "\($0)" < "\($1)" }) {
                    // TODO: better
                    guard case let .unknown(name) = type else {
                        continue
                    }
                    nodeTypeListFragment.output("try \(name).nodeSetup(env: env, module: module)")
                }
                nodeTypeListFragment.output("return exports")
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


    func translate(variable: Variable) -> [SourceFragment] {
        if variable.annotations["cdecl"] != nil {
            fatalErr("""
                found annotation `sourcery: cdecl = ...` on variable \(variable.name) in \(variable.definedInTypeName?.description ?? module)
                use `sourcery: cdecl.get = ...` and/or `sourcery: cdecl.set = ...` for variables instead.
                """)
        }
        return cTranslator.translateGetter(for: variable, context: self)
            + cTranslator.translateSetter(for: variable, context: self)
            + nodeTranslator.translateGetter(for: variable, context: self)
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

}

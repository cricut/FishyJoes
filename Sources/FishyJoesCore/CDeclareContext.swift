import Foundation
import SourceryRuntime

public class FishyJoesContext {
    let module: String
    let templateContext: TemplateContext
    var typeCache: [BetterType: TranslatedType] = [:]
    var fileHeaders: [String: Set<String>] = [:]
    var fileFooters: [String: Set<String>] = [:]

    var tsFragment: TypeScriptAnnotations

    let nodeTranslator = NodeTranslate()

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
        let imports = ["import \(module)"] + additionalImports.map { "import \($0)" }
        fileHeaders[name, default: []].formUnion(imports)
        return SourceFragment(sourceryDestination: "file:\(name)")
    }

    public func translateAll() -> String {
        var collectedFragments: [SourceFragment] = []

        // Collect type information before starting translation
        for translatedType in templateContext.types.all.compactMap(translate(typeDefinition:)) {
            let name = translatedType.sourceType
            precondition(typeCache[name] == nil, "duplicate definitions found for \(name)")
            typeCache[name] = translatedType
        }

        // Translate
        for type in templateContext.types.all + templateContext.types.extensions {
            for method in type.allMethods {
                collectedFragments.append(contentsOf: nodeTranslator.translate(method: method, context: self))
            }
            for variable in type.rawVariables {
                collectedFragments.append(contentsOf: translate(variable: variable))
            }
        }
        // Translate any top level functions
        for topLevelFunction in templateContext.functions {
            collectedFragments.append(contentsOf: nodeTranslator.translate(method: topLevelFunction, context: self))
        }

        var generatedTypes = Set<BetterType>()
        while generatedTypes != Set(typeCache.keys) {
            for type in typeCache.sorted(by: { "\($0.key)" < "\($1.key)" }) {
                guard !generatedTypes.contains(type.key) else { continue }
                collectedFragments.append(contentsOf: type.value.definitionFragments(in: self))
                generatedTypes.insert(type.key)
            }
        }

        let nodeTypeListFragment = swiftFragment(
            "NodeInterface/TypeSetup.swift",
            additionalImports: ["FishyJoesRuntime"]
        )

        nodeTypeListFragment.output("@_cdecl(\"napi_register_module_v1\")")
        nodeTypeListFragment.outputBlock("public func napi_register_module_v1(env: napi_env, exports: napi_value) -> napi_value? {") {
            nodeTypeListFragment.outputBlock("FishyJoesRuntime.rethrowToNode(env: env) {") {
                nodeTypeListFragment.output("var module: napi_value!")
                nodeTypeListFragment.output("try check(napi_create_object(env, &module))")
                nodeTypeListFragment.output("napi_set_named_property(env, exports, \"\(module)\", module)")
                nodeTypeListFragment.output("napi_set_named_property(env, exports, \"default\", module)")
                nodeTypeListFragment.output()
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
        guard let annotation = type.exportAnnotation else {
            // Not annotated for export
            return nil
        }

        if annotation.exportAsReference {
            return TranslatedReference(context: self, type: type)
        } else if type.kind == "struct" {
            return TranslatedStruct(context: self, type: type)
        } else if let type = type as? Enum {
            return TranslatedEnum(context: self, type: type)
        } else {
            fatalErr("TODO: annotation on unknown kind \"\(type.kind)\" on type `\(type.globalName)`")
        }
    }

    func resolve(type: BetterType) -> TranslatedType {
        if let resolved = typeCache[type] {
            return resolved
        }

        let primitiveTypeMap = [
            "Double": ("double", "number"),
            "Int": ("int", "number"),
            "Bool": ("_Bool", "bool"),
        ]

        let resolved = { () -> TranslatedType in
            switch type {
            case let .named(name):
                if let (cName, nodeName) = primitiveTypeMap[name.globalName] {
                    return TranslatedPrimitive(swift: name, c: cName, node: nodeName)
                } else if name.name == "String" {
                    return TranslatedString()
                } else if name.name == "Index", name.namespace.last?.hasPrefix("Array<") == true {
                    // It's a hack.
                    return TranslatedPrimitive(swift: "Int", c: "int", node: "number")
                } else {
                    fatalErr("Don't know how to translate type `\(name)`. Maybe annotate it with `sourcery:export(...)`?")
                }
            case .void:
                return TranslatedPrimitive(swift: .init(name: "Void"), c: "void", node: "void")
            case .tuple(let elements):
                return TranslatedTuple(elements: elements.map { .init(label: $0.label, type: resolve(type: $0.type)) })
            case .generic(let base, let args):
                switch (base.globalName, args.count) {
                case ("Optional", 1):
                    return TranslatedOptional(wrapped: resolve(type: args[0]))
                case ("Array", 1):
                    return TranslatedArray(element: resolve(type: args[0]))
                // case ("Swift.Dictionary", 2):
                //     return TranslatedDictionary(key: resolve(type: args[0]), value: resolve(type: args[1]))
                case ("Set", 1):
                    return TranslatedSet(element: resolve(type: args[0]))
                case ("Dictionary", 2):
                    return TranslatedDictionary(key: resolve(type: args[0]), value: resolve(type: args[1]))
                default:
                    fatalErr("TODO: resolve(type: \(type))")
                }
            default:
                fatalErr("TODO: resolve(type: \(type))")
            }
        }()
        typeCache[type] = resolved
        return resolved
    }

    func translate(variable: Variable) -> [SourceFragment] {
        nodeTranslator.translateGetter(for: variable, context: self)
    }

    func ts(method: SourceryMethod) -> TypeScriptAnnotations.Method? {
        guard let exportAnnotation = method.exportAnnotation,
              let nodeName = exportAnnotation.js ?? exportAnnotation.c else {
            return nil
        }
        var omitParameters = Set(exportAnnotation.omitParameters)
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
            documentation: method.documentation,
            isStatic: method.isStatic,
            name: nodeName,
            parameters: parameters,
            returnType: resolve(type: method.returnTypeName.better).nodeType
        )
    }

    func ts(field: Variable, useNativeName: Bool = false) -> TypeScriptAnnotations.Variable? {
        let nodeName: String

        if useNativeName {
            guard field.exportAnnotation == nil else {
                fatalErr("field \(field.name) should not be annotated, as it's in a type being exported memberwise")
            }
            nodeName = field.name
        } else {
            guard let exportAnnotation = field.exportAnnotation,
                  let annotatedName = exportAnnotation.js ?? exportAnnotation.c else {
                return nil
            }
            nodeName = annotatedName
        }
        let resolved = resolve(type: field.typeName.better)
        return TypeScriptAnnotations.Variable(
            documentation: field.documentation,
            readOnly: !field.isMutable,
            name: nodeName,
            type: resolved.nodeType
        )
    }
}

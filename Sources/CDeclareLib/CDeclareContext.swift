import Foundation
import SourceryRuntime

public class CDeclareContext {
    let module: String
    let templateContext: TemplateContext
    var typeCache: [BetterType: TranslatedType] = [:]
    var fileHeaders: [String: Set<String>] = [:]
    var fileFooters: [String: Set<String>] = [:]

    public init(context: TemplateContext) {
        let argument = context.argument
        guard let module = argument["module"] as? String else {
            fatalErr("must provide module name as `module` argument to sourcery")
        }
        self.templateContext = context
        self.module = module
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
            precondition(typeCache[name] == nil, "duplicate definitions found for \(name)")
            typeCache[name] = translatedType
        }

        // Translate
        for type in templateContext.types.all + templateContext.types.extensions {
            for method in type.allMethods {
                collectedFragments.append(contentsOf: translate(method: method))
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
            collectedFragments.append(contentsOf: translate(method: topLevelFunction))
        }

        var generatedTypes = Set<BetterType>()
        while generatedTypes != Set(typeCache.keys) {
            for type in typeCache.sorted(by: { "\($0.key)" < "\($1.key)" }) {
                guard !generatedTypes.contains(type.key) else { continue }
                collectedFragments.append(contentsOf: type.value.definitionFragments(in: self))
                generatedTypes.insert(type.key)
            }
        }

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
        return (headerFragments + collectedFragments + footerFragments).map(\.contents).joined()
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
        if let resolved = typeCache[type] {
            return resolved
        }
        debug("resolve: \(type)")

        let primitiveTypeMap = [
            "Double": "double",
            "Bool": "_Bool",
        ]

        let resolved = { () -> TranslatedType in
            switch type {
            case let .unknown(name):
                if let cName = primitiveTypeMap[name] {
                    return TranslatedPrimitive(swift: name, c: cName)
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
                return TranslatedPrimitive(swift: "Void", c: "void")
            case .tuple(let elements):
                return TranslatedTuple(elements: elements.map { .init(label: $0.label, type: resolve(type: $0.type)) })
            case .array(let element):
                return TranslatedArray(element: resolve(type: element))
            default:
                fatalErr("TODO: resolve(type: \(type))")
            }
        }()
        typeCache[type] = resolved
        return resolved
    }

    func translate(method: SourceryMethod) -> [SourceFragment] {
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

        let jsBridgeFragment = swiftFragment(
            "NodeInterface/\(containingNamespace)+jsdecl.swift",
            additionalImports: ["CInterface", "NodeUtils"]
        )
        jsBridgeFragment.output("// Generated by sourcery:cdecl for `\(containingNamespace).\(method.name)`")
        jsBridgeFragment.outputBlock("let node_\(cName): napi_callback = { env, info in", closeWith: "}") {
            jsBridgeFragment.outputBlock("NodeUtils.callbackBody(env, info, name: \"\(cName)\", expectedArgumentCount: \(formals.count)) { env in", closeWith: "}") {
                let formals = allParameters.flatMap(\.cFacingFormals)
                // for (index, formal) in formals.enumerate() {
                // }
                jsBridgeFragment.outputBlock("CInterface.\(cName)(") {
                    jsBridgeFragment.outputMap(formals.enumerated(), separator: ",") {
                        let (index, formal) = $0
                        return (formal.label.map { "\($0): " } ?? "") + "try env.argument(at: \(index), type: \(formal.cType).self)"
                    }
                }
                jsBridgeFragment.output("return nil")
            }
        }

        return [cBridgeFragment, jsBridgeFragment]
    }

    func translate(variable: Variable) -> [SourceFragment] {
        if variable.annotations["cdecl"] != nil {
            fatalErr("""
                found annotation `sourcery: cdecl = ...` on variable \(variable.name) in \(variable.definedInTypeName?.description ?? module)
                use `sourcery: cdecl.get = ...` and/or `sourcery: cdecl.set = ...` for variables instead.
                """)
        }
        return translateGetter(for: variable) + translateSetter(for: variable)
    }

    func translateGetter(for variable: Variable) -> [SourceFragment] {
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

    func translateSetter(for variable: Variable) -> [SourceFragment] {
        guard let cName = variable.annotations["cdecl.set"] as? String else { return [] }
        fatalErr("TODO: translateSetter for \(cName)")
    }
}

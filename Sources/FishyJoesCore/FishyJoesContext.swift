import Foundation
import SourceryRuntime

public class FishyJoesContext {
    let module: String
    let templateContext: TemplateContext
    var typeCache: [BetterType: TranslatedType] = [:]
    var fileHeaders: [String: Set<String>] = [:]
    var fileFooters: [String: Set<String>] = [:]

    var tsAnnotations: TypeScriptAnnotations
    var kotlinClasses: [KotlinClass] = []

    let nodeTranslator = NodeTranslate()
    let kotlinTranslator = KotlinTranslate()

    var kotlinPackage: String { "com.cricut.\(module.lowercased())" }
    
    public init(context: TemplateContext) {
        let argument = context.argument
        guard let module = argument["module"] as? String else {
            fatalErr("must provide module name as `module` argument to sourcery")
        }
        self.templateContext = context
        self.module = module
        self.tsAnnotations = TypeScriptAnnotations(
            rootNamespace: .init(
                name: module,
                typealiases: [
                    .init(documentation: [], name: "Optional<T>", value: .union([.named("T"), .named("undefined")])),
                ]
            )
        )
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
            for method in type.allMethods.compactMap(Method.init) {
                collectedFragments.append(contentsOf: kotlinTranslator.translate(method: method, context: self))
            }
            for variable in type.rawVariables {
                collectedFragments.append(contentsOf: kotlinTranslator.translate(variable: variable, context: self))
            }
        }
        // Translate any top level functions
        for _ in templateContext.functions.compactMap(Method.init) {
            fatalErr("Support for exporting top level functions has been removed for now")
            // collectedFragments.append(contentsOf: nodeTranslator.translate(method: topLevelFunction, context: self))
            // collectedFragments.append(contentsOf: kotlinTranslator.translate(method: topLevelFunction, context: self))
        }

        var generatedTypes = Set<BetterType>()
        while generatedTypes != Set(typeCache.keys) {
            for type in typeCache.sorted(by: { "\($0.key)" < "\($1.key)" }) {
                guard !generatedTypes.contains(type.key) else { continue }
                collectedFragments.append(contentsOf: type.value.definitionFragments(in: self))
                generatedTypes.insert(type.key)
            }
        }
        collectedFragments.append(nodeTranslator.setupFragment(context: self, generatedTypes: generatedTypes))
        collectedFragments.append(kotlinTranslator.setupFragment(context: self, generatedTypes: generatedTypes))

        let headerFragments = fileHeaders.keys.map { fileName -> SourceFragment in
            let fragment = SourceFragment(sourceryDestination: "file:\(fileName)")
            for headerLine in fileHeaders[fileName, default: []].sorted() {
                fragment.output(headerLine)
            }
            return fragment
        }
        let footerFragments = fileFooters.keys.map { fileName -> SourceFragment in
            let fragment = SourceFragment(sourceryDestination: "file:\(fileName)")
            for footerLine in fileFooters[fileName, default: []].sorted() {
                fragment.output(footerLine)
            }
            return fragment
        }

        var allFragments = headerFragments + collectedFragments + footerFragments

        allFragments.append(tsAnnotations.fragment)

        // process all the fragments so that inner classes are inside outer classes
        let rootClass = KotlinClass(module: "", documentation: [], name: "__root__")
        // sort by length of qualified name so that outer classes are processed before inner ones
        for ktClass in kotlinClasses.sorted(by: { $0.name.utf8.count < $1.name.utf8.count }) {
            var namespace = Array(ktClass.name.split(separator: ".").map(String.init).dropLast().reversed())

            var containingClass = rootClass
            while let outer = namespace.popLast() {
                guard let next = containingClass.innerClasses.first(where: { $0.unqualifiedName == outer }) else {
                    fatalErr("""
                        while processing \(ktClass.name):
                        Unable to find class \(outer) in class \(containingClass.name):
                        \(containingClass.innerClasses.map(\.name))
                        """)
                }
                containingClass = next
            }
            containingClass.innerClasses.append(ktClass)
        }
        allFragments.append(contentsOf: rootClass.innerClasses.map(\.fragment))

        return allFragments.map(\.contents).joined()
    }

    func translate(typeDefinition type: Type) -> TranslatedType? {
        guard let annotation = type.exportAnnotation else {
            // Not annotated for export
            return nil
        }

        if annotation.kind == .asReference {
            return TranslatedReference(context: self, type: type)
        } else if type.kind == "struct" {
            return TranslatedStruct(context: self, type: type)
        } else if let type = type as? Enum {
            return TranslatedEnum(context: self, type: type)
        } else {
            fatalErr("TODO: annotation on unknown kind \"\(type.kind)\" on type `\(type.globalName)`")
        }
    }

    func resolve(type: BetterType, generics: [String: BetterType] = [:]) -> TranslatedType {
        if let resolved = typeCache[type] {
            return resolved
        }

        let primitiveTypeMap = [
            "Bool": (c: "_Bool", ts: "boolean", jni: JNIType.boolean),
            "Int8": (c: "uint8_t", ts: "number", jni: JNIType.byte),
            "Int16": (c: "uint16_t", ts: "number", jni: JNIType.short),
            "Int32": (c: "uint32_t", ts: "number", jni: JNIType.int),
            // TODO: JavaScript would sadly be using 64-bit double for 64-bit int, loosing precision, so need BigInt
//            "Int64": (c: "uint64_t", ts: "number", jni: JNIType.long),
            "Int": (c: "int", ts: "number", jni: JNIType.long),
            "Float": (c: "float", ts: "number", jni: JNIType.float),
            "Double": (c: "double", ts: "number", jni: JNIType.double),
        ]
        
        let primitiveUnsignedTypeMap = [
            "UInt8": (c: "uint8_t", ts: "number", jni: JNIType.byte),
            "UInt16": (c: "uint16_t", ts: "number", jni: JNIType.short),
            "UInt32": (c: "uint32_t", ts: "number", jni: JNIType.int),
            // TODO: JavaScript would sadly be using 64-bit double for 64-bit int, losing precision, so need BigInt, and java is sad here too
//            "UInt64": (c: "uint64_t", ts: "number", jni: JNIType.long),
        ]

        var dontCache = false
        let resolved = { () -> TranslatedType in
            func recur(_ type: BetterType) -> TranslatedType {
                resolve(type: type, generics: generics)
            }
            switch type {
            case let .named(name):
                if let names = primitiveTypeMap[name.globalName] {
                    return TranslatedPrimitive(
                        swift: name,
                        c: names.c,
                        node: names.ts,
                        jni: names.jni
                    )
                } else if let names = primitiveUnsignedTypeMap[name.globalName] {
                    return TranslatedUnsignedPrimitive(
                        swift: name,
                        c: names.c,
                        node: names.ts,
                        jni: names.jni
                    )
                } else if let typeOverride = generics[name.name] {
                    dontCache = true
                    return recur(typeOverride)
                } else if name.name == "String" {
                    return TranslatedString()
                } else if name.name == "Data" {
                    return TranslatedData()
                } else if name.name == "Index", name.namespace.last?.hasPrefix("Array<") == true {
                    // It's a hack.
                    return TranslatedPrimitive(swift: "Int", c: "int", node: "number", jni: .long)
                } else {
                    fatalErr("Don't know how to translate type `\(name)`. Maybe annotate it with `sourcery:export(...)`?")
                }
            case .void:
                return TranslatedVoid()
            case .tuple(let elements):
                return TranslatedTuple(elements: elements.map { .init(label: $0.label, type: recur($0.type)) })
            case .generic(let base, let args):
                switch (base.globalName, args.count) {
                case ("Optional", 1):
                    return TranslatedOptional(wrapped: recur(args[0]))
                case ("Array", 1):
                    return TranslatedArray(element: recur(args[0]))
                case ("Set", 1):
                    return TranslatedSet(element: recur(args[0]))
                case ("Dictionary", 2):
                    return TranslatedDictionary(key: recur(args[0]), value: recur(args[1]))
                default:
                    fatalErr("TODO: resolve(type: \(type))")
                }
            case .function(let parameters, let returnType):
                return TranslatedFunction(parameters: parameters.map(recur), returnType: recur(returnType))
            default:
                fatalErr("TODO: resolve(type: \(type))")
            }
        }()
        if !dontCache {
            typeCache[type] = resolved
        }
        return resolved
    }

    func ts(method: Method) -> TypeScriptAnnotations.Method? {
        let exportAnnotation = method.exportAnnotation
        var omitParameters = Set(exportAnnotation.omitParameters)
        var parameters: [(labelComment: String?, name: String, TypeScriptAnnotations.TSType)] = []
        for parameter in method.parameters {
            if omitParameters.contains(parameter.name) {
                precondition(parameter.defaultValue != nil, "Can't omit non-default parameter")
                omitParameters.remove(parameter.name)
                continue
            }
            let resolved = resolve(type: parameter.type, generics: exportAnnotation.genericOverrides)
            var label: String?
            if let swiftLabel = parameter.label, swiftLabel != parameter.name {
                label = swiftLabel
            }
            parameters.append((label, parameter.name, resolved.nodeType))
        }

        return TypeScriptAnnotations.Method(
            documentation: method.documentation,
            isStatic: method.isStatic,
            name: exportAnnotation.name,
            parameters: parameters,
            returnType: resolve(type: method.returnType, generics: exportAnnotation.genericOverrides).nodeType
        )
    }

    func ts(field: Variable, useNativeName: Bool = false) -> TypeScriptAnnotations.Variable? {
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
            documentation: field.documentation,
            readOnly: !field.isMutable,
            isStatic: field.isStatic,
            name: name,
            type: resolve(type: field.typeName.better).nodeType
        )
    }

    func kotlin(method: Method) -> KotlinClass.MethodOrVariable? {
        kotlinTranslator.kotlin(method: method, context: self)
    }

    func kotlin(field: Variable, useNativeName: Bool = false) -> KotlinClass.MethodOrVariable? {
        kotlinTranslator.kotlin(field: field, context: self, useNativeName: useNativeName)
    }
}

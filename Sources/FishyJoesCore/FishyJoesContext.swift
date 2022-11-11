import Foundation
import SourceryRuntime
import System

public class FishyJoesContext {
    let module: Module
    let requiredModulePaths: [String]
    let templateContext: TemplateContext
    var typeCache: [BetterType: TranslatedType] = [:]
    var fileHeaders: [String: Set<String>] = [:]
    var fileFooters: [String: Set<String>] = [:]
    var resolveDebugContext = ""

    let dumpDebugRepresentation: Bool

    var tsAnnotations: TypeScriptAnnotations
    var kotlinClasses: [KotlinClass] = []
    var cSharpClasses: [CSharpClass] = []
    // qualified name (ie "ContainingClass::ClassName") -> CPPClass
    var cppClasses: [String: CPPClass] = [:]
    var sortedCppClasses: [CPPClass] {
        cppClasses.sorted { $0.key < $1.key }.map(\.value)
    }
    // [qualifiedName/cppName]
    var classesNeedingHashSpecialization: [CPPClass] = []

    let nodeTranslator = NodeTranslator()
    let kotlinTranslator = KotlinTranslator()
    let cppTranslator = CPPTranslate()
    let neutralTranslator = NeutralTranslate()

    let iotaTranslator = IotaTranslator()
    let cSharpTranslator = CSharpTranslator()
    let dartTranslator = DartTranslator()

    lazy var translators: [Translator] = [
        nodeTranslator,
        kotlinTranslator,
        cppTranslator,
        // neutralTranslator,

        iotaTranslator,
        dartTranslator,
        cSharpTranslator,
    ]

    public init(context: TemplateContext) {
        let argument = context.argument
        guard let module = argument["module"] as? String else {
            fatalErr("must provide module name as `module` argument to sourcery")
        }
        guard let requiredModulesBase64 = argument["requiredModules"] as? String,
              let requiredModulesJSON = Data(base64Encoded: requiredModulesBase64),
              let requiredModulePaths = try? JSONDecoder().decode([String].self, from: requiredModulesJSON)
        else {
            fatalErr("must provide `requiredModules` as argument to sourcery")
        }
        self.templateContext = context
        self.module = Module(
            name: module,
            dependencies: requiredModulePaths.map { (($0 as NSString).lastPathComponent as NSString).deletingPathExtension }
        )
        self.requiredModulePaths = requiredModulePaths
        self.tsAnnotations = TypeScriptAnnotations(
            rootNamespaces: [.init(name: module, typealiases: [])],
            defaultNamespace: module
        )
        self.dumpDebugRepresentation = argument["debugRepresentation"] as? String == "true"
        if let stderrFifo = argument["stderrFifo"] as? String {
            // Re-open the real stderr, and bypass sourcery
            let errDescriptor = try! FileDescriptor.open(stderrFifo, .writeOnly)
            precondition(dup2(errDescriptor.rawValue, 2) >= 0)
            try! errDescriptor.close()
        }
    }

    func swiftFragment(_ name: String, additionalImports: [String] = []) -> SourceFragment {
        var headerLines = (module.dependencies + [module] + additionalImports).map { "import \($0)" }
        headerLines.append("// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes")
        fileHeaders[name, default: []].formUnion(headerLines)
        return SourceFragment(sourceryDestination: "file:\(name)")
    }

    func cSharpFragment(_ name: String) -> SourceFragment {
        let fileName = "../../c-sharp/Cricut.\(module.name)/generated/\(name)"
        fileHeaders[fileName, default: []].formUnion(
            [
                "using System;",
                "using System.Runtime.InteropServices;",
                "using System.Collections.Generic;",
                "using Cricut.FishyJoesRuntime;",
                "using static Cricut.FishyJoesRuntime.Utilities;",
            ] + module.dependencies.map { dependency in
                "using \(dependency.lowercased());"
            }
        )
        return SourceFragment(sourceryDestination: "file:\(fileName)")
    }

    func dartFragment(_ name: String) -> SourceFragment {
        let fileName = "../../dart/lib/src/generated/\(name)"
        fileHeaders[fileName, default: []].formUnion([])
        return SourceFragment(sourceryDestination: "file:\(fileName)")
    }

    public func translateAll() -> String {
        var collectedFragments: [SourceFragment] = []
        var moduleDefinedTypes: [ExternalTranslatedType] = []

        // Import any required FishyJoes modules
        for path in requiredModulePaths {
            let moduleInfo = Result {
                try JSONDecoder().decode(ModuleInfo.self, from: Data(contentsOf: URL(fileURLWithPath: path)))
            }.mapError { error in
                fatalErr("error reading fishy joes module file at \(path):\n\(error)")
            }.neverFails

            for translatedType in moduleInfo.types {
                typeCache[translatedType.sourceType] = translatedType
            }
            tsAnnotations.rootNamespaces.append(contentsOf: moduleInfo.typeScriptAnnotations.rootNamespaces)
        }

        // Collect type information before starting translation
        // This collects the named types possible for use later in resolve().
        let translatedTypes = templateContext.types.all.compactMap { type -> TranslatedType? in
            resolveDebugContext = "Translating type \(type.name)"
            return translate(typeDefinition: type)
        }
        for translatedType in translatedTypes {
            let name = translatedType.sourceType
            precondition(typeCache[name] == nil, "duplicate definitions found for \(name)")
            typeCache[name] = translatedType
            moduleDefinedTypes.append(translatedType.asExternal)
        }

        // Translate
        var seenMethods: Set<Method> = []
        for type in templateContext.types.all + templateContext.types.extensions {
            for method in type.allMethods.compactMap(Method.init) {
                if seenMethods.contains(method) {
                    continue
                }
                resolveDebugContext = "Translating method \(type.name).\(method.name)"
                seenMethods.insert(method)
                collectedFragments.append(contentsOf: kotlinTranslator.translate(method: method, context: self))
                collectedFragments.append(contentsOf: cSharpTranslator.translate(method: method, context: self))
            }
            for variable in type.rawVariables {
                resolveDebugContext = "Translating variable \(type.name).\(variable.name)"
                guard variable.exportAnnotation != nil else { continue }
                collectedFragments.append(contentsOf: kotlinTranslator.translate(variable: variable, context: self))
                collectedFragments.append(contentsOf: cSharpTranslator.translate(variable: variable, context: self))
            }
        }
        // Translate any top level functions
        for _ in templateContext.functions.compactMap(Method.init) {
            fatalErr("Support for exporting top level functions has been removed for now")
        }

        var generatedTypes = Set<BetterType>()
        while generatedTypes != Set(typeCache.keys) {
            for type in typeCache.sorted(by: { "\($0.key)" < "\($1.key)" }) {
                resolveDebugContext = "generating definition code for \(type.key.name)"
                guard !generatedTypes.contains(type.key) else { continue }
                collectedFragments.append(contentsOf: type.value.definitionFragments(in: self))
                generatedTypes.insert(type.key)
            }
        }

        for classObj in sortedCppClasses {
            if let parent = classObj.parentQualifiedName {
                guard let parentClass = cppClasses[parent] else {
                    // TODO: this actually happens in CriText. Should be dealt with properly
                    continue
                }
                parentClass.innerClasses.append(classObj)
            }
        }

        for cppClass in sortedCppClasses {
            if cppClass.parentQualifiedName == nil {
                collectedFragments.append(cppClass.headerFragment())
            }
            collectedFragments.append(cppClass.sourceFragment(in: self))
        }

        collectedFragments.append(
            contentsOf: translators.flatMap { translator -> [SourceFragment] in
                resolveDebugContext = "generating setup code for \(type(of: translator))"
                return translator.setupFragments(context: self, generatedTypes: generatedTypes)
            }
        )

        collectedFragments.append(tsAnnotations.fragment)

        // process all the fragments so that inner classes are inside outer classes
        collectedFragments.append(
            contentsOf:
                processInnerClasses(
                    rootClass: KotlinClass(module: module, documentation: [], name: "__root__"),
                    in: &kotlinClasses
                ) +
                processInnerClasses(
                    rootClass: CSharpClass(module: module, documentation: [], name: "__root__"),
                    in: &cSharpClasses,
                    ignorePrefix: "\(module.cSharpNamespace)."
                )
        )

        // Output moduleInfo for FishyJoes packages that depend on this one
        let moduleInfoFragment = SourceFragment(sourceryDestination: "file:\(module).fishyjoesmodule")
        let moduleInfo = ModuleInfo(
            types: moduleDefinedTypes,
            typeScriptAnnotations: tsAnnotations
        )
        collectedFragments.append(moduleInfoFragment)
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
        moduleInfoFragment.output(String(data: try! encoder.encode(moduleInfo), encoding: .utf8)!)

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

        return (headerFragments + collectedFragments + footerFragments).map(\.contents).joined()
    }

    /// Process a set of classes to nest their innner classes properly for generation.
    ///
    /// - Important: The provided `rootClass` is assumed to transfer all ownership to this function.
    ///     It should genrally not be used elsewhere as it will be heavily mutated.
    ///     This is why an auto closure is used for this parameter.
    ///
    /// - Parameters:
    ///   - rootClass: The root to put all nested classes inside.
    ///   - classes: The classes to process.
    ///   - seperator: The separator in the name to split on for namespaces.
    /// - Returns: The resulting fragments with their inner classes properly processed.
    func processInnerClasses<C: NestedClass>(
        rootClass: @autoclosure () -> C,
        in classes: inout [C],
        separator: Character = ".",
        ignorePrefix: String = ""
    ) -> [SourceFragment] where C.InnerClass == C {
        let rootClass = rootClass()
        // sort by length of qualified name so that outer classes are processed before inner ones
        for cClass in classes.sorted(by: { $0.name.utf8.count < $1.name.utf8.count }) {
            var name = cClass.name
            if name.hasPrefix(ignorePrefix) {
                name = String(name.dropFirst(ignorePrefix.count))
            }
            var namespace = Array(name.split(separator: separator).map(String.init).dropLast().reversed())

            var containingClass = rootClass
            while let outer = namespace.popLast() {
                guard let next = containingClass.innerClasses.first(where: { $0.unqualifiedName == outer }) else {
                    fatalErr("""
                        while processing \(name):
                        Unable to find class \(outer) in class \(containingClass.name):
                        \(containingClass.innerClasses.map(\.name))
                        """)
                }
                containingClass = next
            }
            containingClass.innerClasses.append(cClass)
        }
        return rootClass.innerClasses.map { $0.fragment(context: self) }
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

    typealias TypeNames = (c: String, ts: String, jni: JNIType, cSharp: String, dart: String)

    func resolve(type: BetterType, generics: [String: BetterType] = [:]) -> TranslatedType {
        if let resolved = typeCache[type] {
            return resolved
        }

        let primitiveTypeMap: [String: TypeNames] = [
            "Bool": (c: "bool", ts: "boolean", jni: JNIType.boolean, cSharp: "bool", dart: "bool"),
            "Int8": (c: "int8_t", ts: "number", jni: JNIType.byte, cSharp: "sbyte", dart: "int"),
            "Int16": (c: "int16_t", ts: "number", jni: JNIType.short, cSharp: "short", dart: "int"),
            "Int32": (c: "int32_t", ts: "number", jni: JNIType.int, cSharp: "int", dart: "int"),
            "Int64": (c: "int64_t", ts: "bigint", jni: JNIType.long, cSharp: "long", dart: "int"),
            "Int": (c: "int", ts: "number", jni: JNIType.long, cSharp: "nint", dart: "int"),
            "Float": (c: "float", ts: "number", jni: JNIType.float, cSharp: "float", dart: "float"),
            "Double": (c: "double", ts: "number", jni: JNIType.double, cSharp: "double", dart: "double"),
        ]

        let primitiveUnsignedTypeMap: [String: TypeNames] = [
            "UInt8": (c: "uint8_t", ts: "number", jni: JNIType.byte, cSharp: "byte", dart: "int"),
            "UInt16": (c: "uint16_t", ts: "number", jni: JNIType.short, cSharp: "ushort", dart: "int"),
            "UInt32": (c: "uint32_t", ts: "number", jni: JNIType.int, cSharp: "uint", dart: "int"),
            "UInt64": (c: "uint64_t", ts: "bigint", jni: JNIType.long, cSharp: "ulong", dart: "int"),
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
                        typeNames: names
                    )
                } else if let names = primitiveUnsignedTypeMap[name.globalName] {
                    return TranslatedUnsignedPrimitive(
                        swift: name,
                        typeNames: names
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
                    return TranslatedPrimitive(swift: "Int", typeNames: primitiveTypeMap["Int"]!)
                } else {
                    fatalErr(
                        """
                            Don't know how to translate type `\(name)`.
                            Maybe annotate it with `sourcery:export(...)`?
                            context: \(resolveDebugContext)
                            """
                    )
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
                case ("Result", 2):
                    return TranslatedResult(success: recur(args[0]), failure: recur(args[1]))
                default:
                    fatalErr(
                        """
                            TODO: resolve(type: \(type))
                            context: \(resolveDebugContext)
                            """
                    )
                }
            case .function(let parameters, let returnType):
                return TranslatedFunction(parameters: parameters.map(recur), returnType: recur(returnType))
            default:
                fatalErr(
                    """
                        TODO: resolve(type: \(type))
                        context: \(resolveDebugContext)
                        """
                )
            }
        }()
        if !dontCache {
            typeCache[type] = resolved
        }
        return resolved
    }

    func ts(method: Method, explicitThis: Bool = false) -> TypeScriptAnnotations.Method? {
        nodeTranslator.ts(method: method, explicitThis: explicitThis, context: self)
    }

    func ts(field: Variable, useNativeName: Bool = false) -> TypeScriptAnnotations.Variable? {
        nodeTranslator.ts(field: field, context: self, useNativeName: useNativeName)
    }

    func ts(fieldAsMethods field: Variable, explicitThis: Bool) -> [TypeScriptAnnotations.Method] {
        nodeTranslator.ts(fieldAsMethods: field, explicitThis: explicitThis, context: self)
    }

    func kotlin(method: Method) -> KotlinClass.MethodOrVariable? {
        kotlinTranslator.kotlin(method: method, context: self)
    }

    func kotlin(field: Variable, useNativeName: Bool = false) -> KotlinClass.MethodOrVariable? {
        kotlinTranslator.kotlin(field: field, context: self, useNativeName: useNativeName)
    }

    func cSharp(method: Method, of type: TranslatedType) -> CSharpClass.MethodOrVariable? {
        cSharpTranslator.cSharp(method: method, of: type, context: self)
    }

    func cSharp(field: Variable, of type: TranslatedType, useNativeName: Bool = false) -> CSharpClass.MethodOrVariable? {
        cSharpTranslator.cSharp(field: field, of: type, context: self, useNativeName: useNativeName)
    }

    // MARK: warnings

    var warningsPrintedOnce: Set<String> = []

    func warn(_ warning: String) {
        guard !warningsPrintedOnce.contains(warning) else { return }
        warningsPrintedOnce.insert(warning)

        var errorHandle = FileHandle.standardError
        print("WARNING: \(warning)", to: &errorHandle)
    }

    func warnMissingDefault(parameter: SwiftFormal, in method: Method) {
        warn("can't translate default parameter value `\(parameter.name) = \(parameter.defaultValue!)` in method \(method)")
    }
}

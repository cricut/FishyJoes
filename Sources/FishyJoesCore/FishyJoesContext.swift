import Foundation
import SourceryRuntime
import System

public class FishyJoesContext {
    let module: Module
    let requiredModulePaths: [String]
    let templateContext: TemplateContext
    var typeCache: [BetterType: TranslatedTypeOrAlias] = [:]
    var fileHeaders: [String: Set<String>] = [:]
    var fileFooters: [String: Set<String>] = [:]
    var debugContext = ""

    let dumpDebugRepresentation: Bool

    var tsAnnotations: TypeScriptAnnotations
    private(set) var kotlinClasses: [KotlinClass] = []
    private(set) var cSharpClasses: [CSharpClass] = []
    private(set) var dartClasses: [DartClass] = []

    let nodeTranslator = NodeTranslator()
    let kotlinTranslator = KotlinTranslator()
    let neutralTranslator = NeutralTranslate()

    let iotaTranslator = IotaTranslator()
    let cSharpTranslator = CSharpTranslator()
    let dartTranslator = DartTranslator()

    lazy var translators: [Translator] = [
        nodeTranslator,
        kotlinTranslator,
        // neutralTranslator,

        iotaTranslator,
        cSharpTranslator,
        dartTranslator,
    ]

    enum TranslatedTypeOrAlias {
        case type(TranslatedType)
        case alias(BetterType)
    }

    struct ResolveError: Error {
        let message: String
    }

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
        var headerLines = (module.dependencies + [module.name] + additionalImports).map { "import \($0)" }
        headerLines.append(
            // These need to be in order, so add them as 1 "line"
            """
            // swiftlint:disable:next blanket_disable_command superfluous_disable_command
            // swiftlint:disable unused_closure_parameter syntactic_sugar attributes
            """
        )
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
                "using Cricut.\(dependency);"
            }
        )
        return SourceFragment(sourceryDestination: "file:\(fileName)")
    }

    func dartFragment(_ name: String, additionalImports: [String] = []) -> SourceFragment {
        let fileName = "../../dart/lib/src/generated/\(name)"
        fileHeaders[fileName, default: []].formUnion(
            [
                "import 'dart:ffi' as ffi;",
                "import 'package:ffi/ffi.dart' as ffi;",
                "import 'dart:typed_data' as typed_data;",
                "import 'package:tuple/tuple.dart' as tuple;",
                "import 'package:collection/collection.dart';",
                "import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;",
                "import 'package:fishyjoes_dart/runtime.dart';",
                "import 'package:fishyjoes_dart/utilities.dart' as utils;",
            ] + module.dependencies.flatMap { dependency in
                [
                    "import 'package:cricut_\(dependency.lowercased())/\(dependency.lowercased()).dart' as \(dependency);",
                    "import 'package:cricut_\(dependency.lowercased())/\(dependency.lowercased()).dart';",
                ]
            } + dartClasses.flatMap { cls in
                [
                    "import './\(cls.unqualifiedName).dart' as \(module);",
                ]
            } + additionalImports
        )
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
                let name = translatedType.sourceType
                typeCache[name] = .type(translatedType)
                // Allow referring to it both as `SomeType` and `SomeDependency.SomeType`
                typeCache[name.withoutModule] = .alias(name)
            }
        }

        // Collect type information before starting translation
        // This collects the named types possible for use later in resolve().
        let translatedTypes = templateContext.types.all.compactMap { type -> TranslatedType? in
            debugContext = "Translating type \(type.name)"
            return translate(typeDefinition: type)
        }
        for translatedType in translatedTypes {
            let name = translatedType.sourceType
            precondition(typeCache[name] == nil, "duplicate definitions found for \(name)")
            typeCache[name] = .type(translatedType)
            typeCache[name.withoutModule] = .alias(name)
            moduleDefinedTypes.append(translatedType.asExternal)
        }

        // Translate
        var seenMethods: Set<Method> = []
        for type in templateContext.types.all + templateContext.types.extensions {
            for method in type.rawMethods.compactMap(Method.init) {
                if seenMethods.contains(method) {
                    continue
                }
                debugContext = "Translating method \(type.name).\(method.name)"
                seenMethods.insert(method)
                collectedFragments.append(contentsOf: kotlinTranslator.translate(method: method, context: self))
                collectedFragments.append(contentsOf: iotaTranslator.translate(method: method, context: self))
            }
            for variable in type.rawVariables {
                debugContext = "Translating variable \(type.name).\(variable.name)"
                guard variable.exportAnnotation != nil else { continue }
                collectedFragments.append(contentsOf: kotlinTranslator.translate(variable: variable, context: self))
                collectedFragments.append(contentsOf: iotaTranslator.translate(variable: variable, context: self))
            }
        }
        // Translate any top level functions
        for _ in templateContext.functions.compactMap(Method.init) {
            fatalErr("Support for exporting top level functions has been removed for now")
        }

        var generatedTypes = Set<BetterType>()
        var processedTypes = Set<BetterType>()
        while processedTypes != Set(typeCache.keys) {
            for type in typeCache.sorted(by: { "\($0.key)" < "\($1.key)" }) {
                debugContext = "generating definition code for \(type.key.name)"
                processedTypes.insert(type.key)
                guard !generatedTypes.contains(type.key),
                      case let .type(translatedType) = type.value
                else {
                    continue
                }
                collectedFragments.append(contentsOf: translatedType.definitionFragments(in: self))
                generatedTypes.insert(type.key)
            }
        }

        collectedFragments.append(
            contentsOf: translators.flatMap { translator -> [SourceFragment] in
                debugContext = "generating setup code for \(type(of: translator))"
                return translator.setupFragments(
                    context: self,
                    generatedTypes: generatedTypes.sorted { "\($0)" < "\($1)" }
                )
            }
        )

        collectedFragments.append(tsAnnotations.fragment)

        // process all the fragments so that inner classes are inside outer classes
        collectedFragments.append(
            contentsOf: processInnerClasses(
                rootClass: KotlinClass(module: module, documentation: [], name: "__root__"),
                in: &kotlinClasses
            )
        )
        collectedFragments.append(
            contentsOf: processInnerClasses(
                rootClass: CSharpClass(module: module, documentation: [], name: "__root__"),
                in: &cSharpClasses,
                ignorePrefix: "\(module.cSharpNamespace)."
            )
        )
        collectedFragments.append(
            contentsOf: dartClasses.map { $0.fragment(context: self) }
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

    typealias TypeNames = (c: String, ts: String, jni: JNIType, cSharp: String, dart: String, dartFFI: String)

    func resolve(type: BetterType, generics: [String: BetterType] = [:]) -> TranslatedType {
        do {
            return try tryResolve(type: type, generics: generics)
        } catch let error as ResolveError {
            fatalErr(error.message)
        } catch {
            fatalErr("\(error)")
        }
    }

    func tryResolve(type: BetterType, generics: [String: BetterType] = [:]) throws -> TranslatedType {
        var typeNameAsModuleQualified: BetterType?

        if
            case .named(var name) = type,
            name.module == nil,
            let module = name.namespace.first
        {
            name.module = module
            name.namespace.removeFirst()
            typeNameAsModuleQualified = BetterType.named(name)
        }

        // Sourcery doesn't report the difference between modules and namespaces, so I think trying both is the best we can do
        switch typeCache[type] ?? typeNameAsModuleQualified.flatMap({ typeCache[$0] }) {
        case let .type(resolved):
            return resolved
        case let .alias(name):
            precondition(name != type, "infinite loop")
            return resolve(type: name, generics: generics)
        case nil: ()
        }

        let primitiveTypeMap: [String: TypeNames] = [
            "Bool": (c: "bool", ts: "boolean", jni: JNIType.boolean, cSharp: "bool", dart: "bool", dartFFI: "Bool"),
            "Int8": (c: "int8_t", ts: "number", jni: JNIType.byte, cSharp: "sbyte", dart: "int", dartFFI: "Int8"),
            "Int16": (c: "int16_t", ts: "number", jni: JNIType.short, cSharp: "short", dart: "int", dartFFI: "Int16"),
            "Int32": (c: "int32_t", ts: "number", jni: JNIType.int, cSharp: "int", dart: "int", dartFFI: "Int32"),
            "Int64": (c: "int64_t", ts: "bigint", jni: JNIType.long, cSharp: "long", dart: "int", dartFFI: "Int64"),
            "Int": (c: "int", ts: "number", jni: JNIType.long, cSharp: "nint", dart: "int", dartFFI: "Int"),
            "Float": (c: "float", ts: "number", jni: JNIType.float, cSharp: "float", dart: "double", dartFFI: "Float"),
            "Double": (c: "double", ts: "number", jni: JNIType.double, cSharp: "double", dart: "double", dartFFI: "Double"),
        ]

        let primitiveUnsignedTypeMap: [String: TypeNames] = [
            "UInt8": (c: "uint8_t", ts: "number", jni: JNIType.byte, cSharp: "byte", dart: "int", dartFFI: "Uint8"),
            "UInt16": (c: "uint16_t", ts: "number", jni: JNIType.short, cSharp: "ushort", dart: "int", dartFFI: "Uint16"),
            "UInt32": (c: "uint32_t", ts: "number", jni: JNIType.int, cSharp: "uint", dart: "int", dartFFI: "Uint32"),
            "UInt64": (c: "uint64_t", ts: "bigint", jni: JNIType.long, cSharp: "ulong", dart: "int", dartFFI: "Uint64"),
            "UInt": (c: "uint64_t", ts: "number", jni: JNIType.long, cSharp: "nuint", dart: "int", dartFFI: "UnsignedInt" /* Seriously, dart? */),
        ]

        var dontCache = false
        let resolved = try { () throws -> TranslatedType in
            func recur(_ type: BetterType) throws -> TranslatedType {
                try tryResolve(type: type, generics: generics)
            }
            switch type {
            case let .named(name):
                if let names = primitiveTypeMap[name.globalName] {
                    return TranslatedPrimitive(
                        swift: name.name,
                        typeNames: names
                    )
                } else if let names = primitiveUnsignedTypeMap[name.globalName] {
                    return TranslatedUnsignedPrimitive(
                        swift: name.name,
                        typeNames: names
                    )
                } else if let typeOverride = generics[name.name] {
                    dontCache = true
                    return try recur(typeOverride)
                } else if name.name == "Index", name.namespace.last?.hasPrefix("Array<") == true {
                    // It's a hack.
                    return TranslatedPrimitive(swift: "Int", typeNames: primitiveTypeMap["Int"]!)
                } else {
                    switch name.globalName {
                    case "String", "Swift.String":
                        return TranslatedString()
                    case "AttributedString", "Foundation.AttributedString":
                        return translatedAttributedString
                    case "AttributedString.Index", "Foundation.AttributedString.Index":
                        return translatedAttributedStringIndex
                    case "AttributedString.UnicodeScalarView", "Foundation.AttributedString.UnicodeScalarView":
                        return translatedAttributedStringUnicodeScalarView
                    case "AttributedString.CharacterView", "Foundation.AttributedString.CharacterView":
                        return translatedAttributedStringCharacterView
                    case "AttributedString.Runs", "Foundation.AttributedString.Runs":
                        return translatedAttributedStringRuns
                    case "AttributedString.Runs.Index", "Foundation.AttributedString.Runs.Index":
                        return translatedAttributedStringRunsIndex
                    case "AttributedString.Runs.Run", "Foundation.AttributedString.Runs.Run":
                        return translatedAttributedStringRunsRun
                    case "AttributedSubstring", "Foundation.AttributedSubstring":
                        return translatedAttributedSubstring
                    case "AttributeContainer", "Foundation.AttributeContainer":
                        return translatedAttributeContainer
                    case "AttributeContainer.FoundationAttributes", "Foundation.AttributeContainer.FoundationAttributes":
                        return translatedAttributeContainerFoundationAttributes
                    case "Data", "Foundation.Data":
                        return TranslatedData()
                    case "URL", "Foundation.URL":
                        return TranslatedURL()
                    default:
                        throw ResolveError(
                            message: """
                                Don't know how to translate type `\(name.globalName)`.
                                Maybe annotate it with `sourcery:export(...)`?
                                context: \(debugContext)
                                """
                        )
                    }
                }
            case .void:
                return TranslatedVoid()
            case .tuple(let elements):
                return try TranslatedTuple(elements: elements.map { .init(label: $0.label, type: try recur($0.type)) })
            case .generic(let base, let args):
                switch (base.module ?? "Swift", base.namespace, base.name, args.count) {
                case ("Swift", [], "Optional", 1):
                    return try TranslatedOptional(wrapped: recur(args[0]))
                case ("Swift", [], "Array", 1):
                    return try TranslatedArray(element: recur(args[0]))
                case ("Swift", [], "Set", 1):
                    return try TranslatedSet(element: recur(args[0]))
                case ("Swift", [], "Dictionary", 2):
                    return try TranslatedDictionary(key: recur(args[0]), value: recur(args[1]))
                case ("Swift", [], "Result", 2):
                    return try TranslatedResult(success: recur(args[0]), failure: recur(args[1]))
                case ("Swift", [], "Range", 1):
                    return try TranslatedRange(bound: recur(args[0]), isClosedRange: false)
                case ("Swift", [], "ClosedRange", 1):
                    return try TranslatedRange(bound: recur(args[0]), isClosedRange: true)
                default:
                    throw ResolveError(
                        message: """
                            TODO: resolve(type: \(type))
                            context: \(debugContext)
                            """
                    )
                }
            case .function(let parameters, let returnType, let isAsync):
                return try TranslatedFunction(parameters: parameters.map(recur), returnType: recur(returnType), isAsync: isAsync)
            default:
                throw ResolveError(
                    message: """
                        TODO: resolve(type: \(type))
                        context: \(debugContext)
                        """
                )
            }
        }()
        if !dontCache {
            typeCache[type] = .type(resolved)
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

    func dart(method: Method, of type: TranslatedType) -> DartClass.MethodOrVariable? {
        dartTranslator.dart(method: method, of: type, context: self)
    }

    func dart(field: Variable, of type: TranslatedType, useNativeName: Bool = false) -> DartClass.MethodOrVariable? {
        dartTranslator.dart(field: field, of: type, context: self, useNativeName: useNativeName)
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

    // MARK: adding to classes

    func add(kotlinClass: KotlinClass) {
        kotlinClasses.append(kotlinClass)
    }

    func add(dartClass: DartClass) {
        dartClasses.append(dartClass)
        for (name, (args, returnType)) in dartClass.nativeMethods {
            dartTranslator.nativeMethods.append(
                .init(
                    name: name,
                    definingDartClass: dartClass.name,
                    args: args,
                    returnType: returnType
                )
            )
        }
    }

    func add(cSharpClass: CSharpClass) {
        cSharpClasses.append(cSharpClass)
    }
}

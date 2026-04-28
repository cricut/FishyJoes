import Foundation
import SourceryDataModel

public class FishyJoesContext {
    let module: Module
    let requiredModulePaths: [String: String]
    let templateContext: SourceryTemplateContext
    var typeCache: [BetterType: TranslatedTypeOrAlias] = [:]

    var fileHeaders: [String: Set<FileHeader>] = [:]
    func addHeader(file: String, priority: Int = 0, _ contents: String) {
        fileHeaders[file, default: []].insert(FileHeader(contents, priority: priority))
    }

    var debugContext = ""

    var tsAnnotations: TypeScriptAnnotations
    private(set) var kotlinClasses: [KotlinClass] = []
    private(set) var cSharpClasses: [CSharpClass] = []
    private(set) var dartClasses: [DartClass] = []
    private(set) var pythonClasses: [PythonClass] = []

    let nodeTranslator = NodeTranslator()
    let kotlinTranslator = KotlinTranslator()

    let iotaTranslator = IotaTranslator()
    let cSharpTranslator = CSharpTranslator()
    let dartTranslator = DartTranslator()
    let pythonTranslator = PythonTranslator()

    lazy var translators: [Translator] = [
        nodeTranslator,
        kotlinTranslator,

        iotaTranslator,
        cSharpTranslator,
        dartTranslator,
        pythonTranslator,
    ]

    enum TranslatedTypeOrAlias {
        case type(TranslatedType)
        case alias(BetterType)
    }

    struct ResolveError: Error {
        let message: String
    }

    public init(
        context: SourceryTemplateContext,
        module: String,
        requiredModulePaths: [String: String],
        extraDynamicLibraries: [String]
    ) {
        self.templateContext = context
        self.module = Module(
            name: module,
            dependencies: requiredModulePaths.values.map { (($0 as NSString).lastPathComponent as NSString).deletingPathExtension },
            extraDynamicLibraries: extraDynamicLibraries
        )
        self.requiredModulePaths = requiredModulePaths
        self.tsAnnotations = TypeScriptAnnotations(
            rootNamespaces: [.init(name: module, typealiases: [])],
            defaultNamespace: module
        )
    }

    func swiftFragment(_ name: String, withDedicatedFile: Bool = false, additionalImports: [String] = []) -> SourceFragment {
        var fileName = "swift-interfaces/generated/\(module.name)-bindings/Sources/\(name)"
        if !withDedicatedFile {
            fileName = (fileName.components(separatedBy: "/").dropLast() + ["\(module.name).swift"]).joined(separator: "/")
        }
        for dependency in module.dependencies + [module.name] + additionalImports {
            addHeader(file: fileName, "import \(dependency)")
        }
        // These need to be in order, so add them with higher priority
        addHeader(
            file: fileName,
            priority: 2,
            "// swiftlint:disable:next blanket_disable_command superfluous_disable_command"
        )
        addHeader(
            file: fileName,
            priority: 1,
            "// swiftlint:disable unused_closure_parameter syntactic_sugar attributes"
        )
        let fragment = SourceFragment(destinationPath: fileName)
        if !withDedicatedFile {
            fragment.blankLine()
            fragment.output("// MARK: - \(name)")
            fragment.blankLine()
        }
        return fragment
    }

    func kotlinFragment(_ name: String, additionalImports: [String] = []) -> SourceFragment {
        let fileName = "kotlin/generated/src/main/kotlin/com/cricut/\(module.name.lowercased())/\(name)"
        // Package must go before imports, use higher priority
        addHeader(file: fileName, priority: 1, "package \(module.kotlinPackage)\n")
        addHeader(file: fileName, "import kotlinx.coroutines.*")
        addHeader(file: fileName, "import java.lang.Exception")
        addHeader(file: fileName, "import com.cricut.fishyjoes.runtime.*")
        for dependency in module.dependencies {
            addHeader(file: fileName, "import com.cricut.\(dependency.lowercased()).*")
        }
        return SourceFragment(destinationPath: fileName)
    }

    func cSharpFragment(_ name: String) -> SourceFragment {
        let fileName = "c-sharp/generated/Cricut.\(module.name)/\(name)"
        addHeader(file: fileName, "using System;")
        addHeader(file: fileName, "using System.Runtime.InteropServices;")
        addHeader(file: fileName, "using System.Collections.Generic;")
        addHeader(file: fileName, "using Cricut.FishyJoesRuntime;")
        addHeader(file: fileName, "using static Cricut.FishyJoesRuntime.Utilities;")
        for dependency in module.dependencies {
            addHeader(file: fileName, "using Cricut.\(dependency);")
        }
        return SourceFragment(destinationPath: fileName)
    }

    func dartFragment(_ name: String, additionalImports: [String] = []) -> SourceFragment {
        let fileName = "dart/generated/lib/src/\(name)"

        addHeader(file: fileName, "import 'dart:ffi' as ffi;")
        addHeader(file: fileName, "import 'package:ffi/ffi.dart' as ffi;")
        addHeader(file: fileName, "import 'dart:typed_data' as typed_data;")
        addHeader(file: fileName, "import 'package:tuple/tuple.dart' as tuple;")
        addHeader(file: fileName, "import 'package:collection/collection.dart';")
        addHeader(file: fileName, "import 'package:fishyjoes_dart/runtime.dart' as FishyJoesRuntime;")
        addHeader(file: fileName, "import 'package:fishyjoes_dart/runtime.dart';")
        addHeader(file: fileName, "import 'package:fishyjoes_dart/utilities.dart' as utils;")

        for dependency in module.dependencies {
            addHeader(file: fileName, "import 'package:cricut_\(dependency.lowercased())/\(dependency.lowercased()).dart' as \(dependency);")
            addHeader(file: fileName, "import 'package:cricut_\(dependency.lowercased())/\(dependency.lowercased()).dart';")
        }
        addHeader(file: fileName, "import './_exports.dart' as \(module);")
        for additionalImport in additionalImports {
            addHeader(file: fileName, additionalImport)
        }

        return SourceFragment(destinationPath: fileName)
    }

    func pythonRawFragment(_ name: String) -> SourceFragment {
        let packageName = "cricut_\(module.name.lowercased())"
        let fileName = "python/generated/src/\(packageName)/\(name)"
        return SourceFragment(destinationPath: fileName)
    }

    func pythonFragment(_ name: String, additionalImports: [String] = []) -> SourceFragment {
        let packageName = "cricut_\(module.name.lowercased())"
        let fileName = "python/generated/src/\(packageName)/\(name)"

        addHeader(file: fileName, priority: 100, "from __future__ import annotations")
        addHeader(file: fileName, priority: 20, "from dataclasses import dataclass")
        addHeader(file: fileName, priority: 20, "import builtins")
        addHeader(file: fileName, priority: 20, "import enum")
        addHeader(file: fileName, priority: 20, "import typing")
        addHeader(
            file: fileName,
            priority: 10,
            "from .runtime import NativeReference, ensure_loaded as _ensure_runtime_loaded, get_runtime as _get_runtime, not_implemented as _not_implemented"
        )
        for additionalImport in additionalImports {
            addHeader(file: fileName, priority: 10, additionalImport)
        }
        return SourceFragment(destinationPath: fileName)
    }

    public func translateAll() -> [SourceFragment] {
        var collectedFragments: [SourceFragment] = []
        var moduleDefinedTypes: [ExternalTranslatedType] = []

        // Import any required FishyJoes modules
        for path in requiredModulePaths.values {
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
        let translatedTypes = templateContext.types.compactMap { type -> TranslatedType? in
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
        var methodsToTranslateForTypeDict = [SourceryType: [Method]]()
        for type in templateContext.types {
            methodsToTranslateForTypeDict[type] = Method.methods(type: type, context: self)
        }

        for (type, methods) in methodsToTranslateForTypeDict {
            for method in methods {
                debugContext = "Translating method \(type.name).\(method.name)"
                let betterType = BetterType(named: type, context: self)
                collectedFragments.append(contentsOf: kotlinTranslator.translate(method: method, context: self, betterType: betterType))
                collectedFragments.append(contentsOf: iotaTranslator.translate(method: method, context: self, betterType: betterType))
            }
        }

        var fieldsToTranslateForTypeDict = [SourceryType: [Field]]()
        for type in sourceryTypes.values {
            fieldsToTranslateForTypeDict[type] = Field.fields(type: type, context: self)
        }

        for (type, fields) in fieldsToTranslateForTypeDict {
            for field in fields {
                debugContext = "Translating variable \(type.name).\(field.name)"
                guard field.exportAnnotation != nil else { continue }

                collectedFragments.append(contentsOf: kotlinTranslator.translate(field: field, context: self, type: type))
                collectedFragments.append(contentsOf: iotaTranslator.translate(field: field, context: self, type: type))
            }
        }
        // Translate any top level functions
        let topLevelFunctions = templateContext.functions.compactMap { Method($0, inType: nil, context: self) }
        guard topLevelFunctions.isEmpty else {
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

        // Disambiguate Python classes whose unqualifiedName collides with a
        // sibling.  Three Swift types nested under different namespaces can
        // share the same final segment (e.g. PuttingTypesIntoQuestionablePlaces
        // exists under Foundation.AttributedString, Swift.String,
        // TestAPI.Structs and UnicodeScalar).  Without this pass they would
        // all emit into one .py file with multiple identical class
        // declarations and the ``_cls_<setupName>`` registry entries would
        // resolve to whichever definition won the source-level shadow
        // contest.
        //
        // The Swift author has already encoded the disambiguated name in the
        // export annotation (e.g. ``<!-- FishyJoes.export(AttributedString_PuttingTypesIntoQuestionablePlaces) -->``).
        // Trust that as the source of truth: parse it out of the doc comment
        // and use it verbatim as the Python class name when a collision is
        // detected.
        //
        // Must run *before* setupFragments below: the per-target setup code
        // emits ``from .X import X`` lines that need the disambiguated form.
        var unqualifiedCounts: [String: Int] = [:]
        for cls in pythonClasses {
            unqualifiedCounts[cls.unqualifiedName, default: 0] += 1
        }
        for cls in pythonClasses where (unqualifiedCounts[cls.unqualifiedName] ?? 0) > 1 {
            if let annotated = cls.exportAnnotationName(), annotated != cls.unqualifiedName {
                cls.explicitDisambiguatedName = annotated
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
                rootClass: KotlinClass(
                    module: module,
                    documentation: [],
                    name: "__root__",
                    fields: [],
                    methods: [],
                    conformances: []
                ),
                in: &kotlinClasses
            )
        )
        collectedFragments.append(
            contentsOf: processInnerClasses(
                rootClass: CSharpClass(module: module, documentation: [], name: "__root__", fields: [], methods: [], conformances: []),
                in: &cSharpClasses,
                ignorePrefix: "\(module.cSharpNamespace)."
            )
        )
        collectedFragments.append(
            contentsOf: dartClasses.map { $0.fragment(context: self) }
        )
        collectedFragments.append(
            contentsOf: pythonClasses.map { $0.fragment(context: self) }
        )

        // Output moduleInfo for FishyJoes packages that depend on this one
        let moduleInfoFragment = SourceFragment(destinationPath: "swift-interfaces/generated/\(module).fishyjoesmodule")
        let moduleInfo = ModuleInfo(
            types: moduleDefinedTypes,
            typeScriptAnnotations: tsAnnotations
        )
        collectedFragments.append(moduleInfoFragment)
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
        var jsonData = try! encoder.encode(moduleInfo)

        // Do an extra round trip using JSONSerialization.
        // This is needed because of some weird environment-dependent key-sorting behavior was happening with JSONEncoder.
        jsonData = try! JSONSerialization.data(
            withJSONObject: JSONSerialization.jsonObject(with: jsonData),
            options: [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
        )

        moduleInfoFragment.output(String(data: jsonData, encoding: .utf8)!)

        let headerFragments = fileHeaders.keys.map { fileName -> SourceFragment in
            let fragment = SourceFragment(destinationPath: fileName)
            for headerLine in fileHeaders[fileName, default: []].sorted() {
                fragment.output(headerLine.contents)
            }
            return fragment
        }

        return headerFragments + collectedFragments.sorted()
    }

    /// Process a set of classes to nest their inner classes properly for generation.
    ///
    /// - Important: The provided `rootClass` is assumed to transfer all ownership to this function.
    ///     It should genrally not be used elsewhere as it will be heavily mutated.
    ///     This is why an auto closure is used for this parameter.
    ///
    /// - Parameters:
    ///   - rootClass: The root to put all nested classes inside.
    ///   - classes: The classes to process.
    ///   - separator: The separator in the name to split on for namespaces.
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

    func translate(typeDefinition type: SourceryType) -> TranslatedType? {
        guard let annotation = type.exportAnnotation else {
            // Not annotated for export
            return nil
        }

        if annotation.kind == .asReference {
            return TranslatedReference(context: self, type: type)
        }
        switch type.kind {
        case .struct:
            return TranslatedStruct(context: self, type: type)
        case .enum:
            return TranslatedEnum(context: self, type: type)
        case .protocol:
            return TranslatedProtocol(context: self, type: type)
        case .class, .actor:
            return TranslatedReference(context: self, type: type)
        default:
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
            let module = name.namespace.first {
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
            "Int": (c: "int", ts: "number", jni: JNIType.long, cSharp: "nint", dart: "int", dartFFI: "IntPtr"),
            "Float": (c: "float", ts: "number", jni: JNIType.float, cSharp: "float", dart: "double", dartFFI: "Float"),
            "Double": (c: "double", ts: "number", jni: JNIType.double, cSharp: "double", dart: "double", dartFFI: "Double"),
        ]

        let primitiveUnsignedTypeMap: [String: TypeNames] = [
            "UInt8": (c: "uint8_t", ts: "number", jni: JNIType.byte, cSharp: "byte", dart: "int", dartFFI: "Uint8"),
            "UInt16": (c: "uint16_t", ts: "number", jni: JNIType.short, cSharp: "ushort", dart: "int", dartFFI: "Uint16"),
            "UInt32": (c: "uint32_t", ts: "number", jni: JNIType.int, cSharp: "uint", dart: "int", dartFFI: "Uint32"),
            "UInt64": (c: "uint64_t", ts: "bigint", jni: JNIType.long, cSharp: "ulong", dart: "int", dartFFI: "Uint64"),
            "UInt": (c: "uint64_t", ts: "number", jni: JNIType.long, cSharp: "nuint", dart: "int", dartFFI: "UintPtr"),
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
            case let .function(parameters, returnType, isAsync, isThrowing):
                return try TranslatedFunction(parameters: parameters.map(recur), returnType: recur(returnType), isAsync: isAsync, isThrowing: isThrowing)
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

    // Used to add types to the cache that don't show up in user code.
    // Currently only used by `Future`
    func addToTypeCache(_ translatedType: TranslatedType) {
        let type = translatedType.sourceType
        if typeCache.keys.contains(type) { return }
        typeCache[type] = .type(translatedType)
    }

    func ts(method: Method, explicitThis: Bool = false) -> TypeScriptAnnotations.Method? {
        nodeTranslator.ts(method: method, explicitThis: explicitThis, context: self)
    }

    func ts(field: Field, useNativeName: Bool = false) -> TypeScriptAnnotations.Variable? {
        nodeTranslator.ts(field: field, context: self, useNativeName: useNativeName)
    }

    func ts(fieldAsMethods field: Field, explicitThis: Bool) -> [TypeScriptAnnotations.Method] {
        nodeTranslator.ts(fieldAsMethods: field, explicitThis: explicitThis, context: self)
    }

    func kotlin(method: Method) -> KotlinClass.MethodOrVariable? {
        kotlinTranslator.kotlin(method: method, context: self)
    }

    func kotlin(field: Field, useNativeName: Bool = false) -> KotlinClass.MethodOrVariable? {
        kotlinTranslator.kotlin(field: field, context: self, useNativeName: useNativeName)
    }

    func cSharp(method: Method, of type: TranslatedType) -> CSharpClass.MethodOrVariable? {
        cSharpTranslator.cSharp(method: method, of: type, context: self)
    }

    func cSharp(field: Field, of type: TranslatedType, useNativeName: Bool = false) -> [CSharpClass.MethodOrVariable] {
        cSharpTranslator.cSharp(field: field, of: type, context: self, useNativeName: useNativeName)
    }

    func dart(method: Method, of type: TranslatedType) -> DartClass.MethodOrVariable? {
        dartTranslator.dart(method: method, of: type, context: self)
    }

    func dart(field: Field, of type: TranslatedType, useNativeName: Bool = false) -> DartClass.MethodOrVariable? {
        dartTranslator.dart(field: field, of: type, context: self, useNativeName: useNativeName)
    }

    func python(method: Method, of type: TranslatedType) -> PythonClass.MethodOrVariable? {
        pythonTranslator.python(method: method, of: type, context: self).map(PythonClass.MethodOrVariable.method)
    }

    func python(field: Field, of type: TranslatedType, useNativeName: Bool = false) -> PythonClass.MethodOrVariable? {
        pythonTranslator.python(field: field, of: type, context: self, useNativeName: useNativeName)
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

        for (name, (args, returnType, isDefaultImplementation, isProtocol)) in dartClass.nativeMethods {
            dartTranslator.nativeMethods.append(
                .init(
                    name: name,
                    definingDartClass: dartClass.name,
                    args: args,
                    returnType: returnType,
                    doDefaultImplementationsSuffix: isDefaultImplementation && isProtocol
                )
            )
        }
    }

    func add(cSharpClass: CSharpClass) {
        cSharpClasses.append(cSharpClass)
    }

    func add(pythonClass: PythonClass) {
        pythonClasses.append(pythonClass)
    }

    struct FileHeader: Hashable, Comparable {
        let contents: String
        // higher priorities are placed nearer the top of the file
        let priority: Int

        init(_ contents: String, priority: Int = 0) {
            self.priority = priority
            self.contents = contents
        }

        static func < (lhs: FileHeader, rhs: FileHeader) -> Bool {
            (-lhs.priority, lhs.contents) < (-rhs.priority, rhs.contents)
        }
    }

    lazy var sourceryTypes: [SourceryTypeName: SourceryType] =
        Dictionary(uniqueKeysWithValues: templateContext.types.map { ($0.name, $0) })

    // Used both for efficiency and to break cycles
    private var inhabitedCache: [SourceryType: Bool] = [:]
    func isTypeInhabited(_ type: SourceryType) -> Bool {
        if let inhabited = inhabitedCache[type] { return inhabited }

        // This will miss some uninhabited, cyclic types, but that's not super important
        inhabitedCache[type] = true
        let result: Bool
        switch type.kind {
        case .enum:
            // An enum must have at least one inhabited case to be inhabited
            result = type.cases.contains { enumCase in
                enumCase.associatedValues.allSatisfy {
                    sourceryTypes[$0.typeName].map(isTypeInhabited) ?? true
                }
            }
        case .protocol:
            // A protocol can always be inhabited
            result = true
        default:
            // A product must have all components inhabited to be inhabited
            result = type.storedVariables.allSatisfy {
                $0.isStatic || sourceryTypes[$0.typeName].map(isTypeInhabited) ?? true
            }
        }

        inhabitedCache[type] = result
        return result
    }
}

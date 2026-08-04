import Foundation

/// A Python type annotation (a `.pyi` annotation string plus the imports it
/// needs). Moved out of `PythonTranslator` so a `TranslatedType` conformer can
/// build and return it from `pythonRepresentation(in:)`.
struct PythonType: Hashable {
    let annotation: String
    let imports: Set<PythonImport>

    init(annotation: String, imports: Set<PythonImport> = []) {
        self.annotation = annotation
        self.imports = imports
    }

    func optional() -> PythonType {
        PythonType(annotation: "\(annotation) | None", imports: imports)
    }

    static func container(_ name: String, _ elements: [PythonType]) -> PythonType {
        PythonType(
            annotation: "\(name)[\(elements.map(\.annotation).joined(separator: ", "))]",
            imports: Set(elements.flatMap(\.imports))
        )
    }

    static func callable(parameters: [PythonType], returnType: PythonType) -> PythonType {
        PythonType(
            annotation: "Callable[[\(parameters.map(\.annotation).joined(separator: ", "))], \(returnType.annotation)]",
            imports: Set(parameters.flatMap(\.imports)).union(returnType.imports)
        )
    }

    static func awaitable(_ output: PythonType) -> PythonType {
        PythonType(annotation: "Awaitable[\(output.annotation)]", imports: output.imports)
    }
}

/// A Python import a generated annotation requires.
struct PythonImport: Hashable {
    let moduleName: String
    let className: String
    let isRelative: Bool

    init(moduleName: String, className: String, isRelative: Bool = true) {
        self.moduleName = moduleName
        self.className = className
        self.isRelative = isRelative
    }

    static func module(_ moduleName: String) -> PythonImport {
        PythonImport(moduleName: moduleName, className: "", isRelative: false)
    }

    static func absolute(moduleName: String, className: String) -> PythonImport {
        PythonImport(moduleName: moduleName, className: className, isRelative: false)
    }
}

/// The bundled Python representation of a `TranslatedType`: the annotation, the
/// C ABI type string, and the optional runtime conversion-descriptor expression.
///
/// A `nil` `PythonRepresentation?` (the result of
/// `TranslatedType.pythonRepresentation(in:)`) means "no C ABI representation" —
/// exactly the old `pythonCType == nil`. It does NOT mean "no annotation": when
/// the result is non-`nil`, `annotation` is always present.
///
/// `conversion` is the call-site conversion descriptor. It is `nil` for
/// primitives (whose C scalar passes through directly); a value-type field
/// descriptor for a primitive stored field is derived from `cType` by
/// `descriptorExpression`, matching the old standalone `pythonConversion`.
struct PythonRepresentation {
    let annotation: PythonType
    let cType: String
    let conversion: String?

    init(annotation: PythonType, cType: String, conversion: String?) {
        self.annotation = annotation
        self.cType = cType
        self.conversion = conversion
    }

    /// The conversion-descriptor expression for this representation, in the
    /// default `_native` module namespace. When `conversion` is `nil` (a
    /// primitive whose C scalar passes through), the descriptor is derived from
    /// the C type, exactly as the old standalone `pythonConversion` /
    /// `descriptorExpression(cType:)` did. This is what a container conversion
    /// embeds for its element, and what a value-type field descriptor uses.
    ///
    /// `nil` here means there is genuinely no descriptor for this C type (e.g.
    /// an opaque `foreignObject` with no conversion), preserving the old
    /// `descriptorExpression`'s `None` default as a `nil` signal callers turn
    /// into `"None"` where a descriptor literal is required.
    var conversionDescriptor: String? {
        if let conversion {
            return conversion
        }
        return PythonRepresentation.scalarDescriptor(cType: cType)
    }

    /// The runtime descriptor literal for a C scalar `cType`, in the given
    /// module namespace. Mirrors the old `descriptorExpression(cType:)` default
    /// branch. Returns `nil` for a `cType` with no scalar descriptor.
    static func scalarDescriptor(cType: String, nativeModuleName: String = "_native") -> String? {
        switch cType {
        case "bool":
            return "\(nativeModuleName).BOOL"
        case "int", "intptr_t":
            return "\(nativeModuleName).INT"
        case "int8_t":
            return "\(nativeModuleName).INT8"
        case "int16_t":
            return "\(nativeModuleName).INT16"
        case "int32_t":
            return "\(nativeModuleName).INT32"
        case "int64_t":
            return "\(nativeModuleName).INT64"
        case "uintptr_t":
            return "\(nativeModuleName).UINT"
        case "uint8_t":
            return "\(nativeModuleName).UINT8"
        case "uint16_t":
            return "\(nativeModuleName).UINT16"
        case "uint32_t":
            return "\(nativeModuleName).UINT32"
        case "uint64_t":
            return "\(nativeModuleName).UINT64"
        case "float":
            return "\(nativeModuleName).FLOAT"
        case "double":
            return "\(nativeModuleName).DOUBLE"
        case "void":
            return "\(nativeModuleName).VOID"
        default:
            return nil
        }
    }
}

/// Carries everything a `TranslatedType.pythonRepresentation(in:)` implementation
/// needs: the `FishyJoesContext`, the struct/protocol recursion guards, and the
/// shared Python naming/descriptor helpers. Immutable; the `recursingInto*`
/// methods derive a child context that reproduces the exact recursion-guard
/// discipline the old translator switches used.
struct PythonTranslationContext {
    let context: FishyJoesContext
    let visitedStructs: Set<String>
    let visitedProtocols: Set<String>

    init(
        context: FishyJoesContext,
        visitedStructs: Set<String> = [],
        visitedProtocols: Set<String> = []
    ) {
        self.context = context
        self.visitedStructs = visitedStructs
        self.visitedProtocols = visitedProtocols
    }

    // MARK: recursion-guard derivation

    /// Type-annotation recursion (Optional -> wrapped, Array -> element, etc.):
    /// both visited sets are threaded UNCHANGED.
    func recursingIntoChild() -> PythonTranslationContext {
        self
    }

    /// `canGenerateValueType` recursion into a struct's stored fields:
    /// `visitedStructs += thisStruct`, `visitedProtocols` RESET to [].
    func recursingIntoValueTypeField(of structName: String) -> PythonTranslationContext {
        PythonTranslationContext(
            context: context,
            visitedStructs: visitedStructs.union([structName]),
            visitedProtocols: []
        )
    }

    /// `canGenerateProtocolType` recursion into a protocol's members:
    /// `visitedStructs` RESET to [], `visitedProtocols += thisProtocol`.
    func recursingIntoProtocolMember(of protocolName: String) -> PythonTranslationContext {
        PythonTranslationContext(
            context: context,
            visitedStructs: [],
            visitedProtocols: visitedProtocols.union([protocolName])
        )
    }

    // MARK: diagnostics

    func warn(_ warning: String) {
        context.warn(warning)
    }

    // MARK: value-type / protocol-type generation probes

    /// Whether a struct can be generated as a Python value type: every stored
    /// field must have a C ABI representation. Uses `nil` as a normal "skip"
    /// signal — never emits a diagnostic. Recurses with the value-type-field
    /// guard discipline.
    func canGenerateValueType(_ structType: TranslatedStruct) -> Bool {
        if visitedStructs.contains(structType.nodeName) {
            return false
        }
        let childContext = recursingIntoValueTypeField(of: structType.nodeName)
        for field in structType.storedVariables {
            let resolvedType = context.resolve(type: field.type)
            guard resolvedType.pythonRepresentation(in: childContext) != nil else {
                return false
            }
        }
        return true
    }

    /// Whether a protocol can be generated as a Python protocol type: every
    /// field and method member must have a C ABI representation. Uses `nil` as a
    /// normal "skip" signal — never emits a diagnostic. Recurses with the
    /// protocol-member guard discipline.
    func canGenerateProtocolType(_ protocolType: TranslatedProtocol) -> Bool {
        if visitedProtocols.contains(protocolType.nodeName) {
            return true
        }
        let childContext = recursingIntoProtocolMember(of: protocolType.nodeName)
        for field in protocolType.fields {
            let resolvedFieldType = context.resolve(type: field.type)
            let fieldType = field.isAsync ? TranslatedFuture(output: resolvedFieldType) : resolvedFieldType
            guard fieldType.pythonRepresentation(in: childContext) != nil else {
                return false
            }
        }
        for method in protocolType.methods {
            let resolvedReturnType = context.resolve(type: method.returnType, generics: method.exportAnnotation.genericOverrides)
            let returnType = method.isAsync ? TranslatedFuture(output: resolvedReturnType) : resolvedReturnType
            guard returnType.pythonRepresentation(in: childContext) != nil else {
                return false
            }
            for parameter in method.parameters {
                let resolvedParameterType = context.resolve(type: parameter.type, generics: method.exportAnnotation.genericOverrides)
                guard resolvedParameterType.pythonRepresentation(in: childContext) != nil else {
                    return false
                }
            }
        }
        return true
    }

    // MARK: annotation helpers

    func pythonClassType(_ className: String) -> PythonType {
        PythonType(
            annotation: className,
            imports: [
                PythonImport(moduleName: pythonModuleName(className), className: className)
            ]
        )
    }

    /// Maps a Swift `Range`/`ClosedRange` to the runtime helper type parameterised
    /// over the converted bound, e.g. `Range<Int>` -> `SwiftRange[int]`. The
    /// helper is re-exported from `_native`; the bound carries its own imports.
    func pythonRangeType(isClosedRange: Bool, bound: PythonType) -> PythonType {
        let className = isClosedRange ? "SwiftClosedRange" : "SwiftRange"
        var imports = bound.imports
        imports.insert(PythonImport(moduleName: "_native", className: className))
        return PythonType(annotation: "\(className)[\(bound.annotation)]", imports: imports)
    }

    /// Maps a Swift `Result<Success, Failure>` to the union the runtime actually
    /// produces (`to_python` returns a `ResultSuccess` or a `ResultFailure`), each
    /// parameterised over its converted payload. Both helpers are re-exported
    /// from `_native`.
    func pythonResultType(success: PythonType, failure: PythonType) -> PythonType {
        var imports = success.imports.union(failure.imports)
        imports.insert(PythonImport(moduleName: "_native", className: "ResultSuccess"))
        imports.insert(PythonImport(moduleName: "_native", className: "ResultFailure"))
        return PythonType(
            annotation: "ResultSuccess[\(success.annotation)] | ResultFailure[\(failure.annotation)]",
            imports: imports
        )
    }

    func pythonExternalClassType(_ type: ExternalTranslatedType) -> PythonType {
        if type.definingModule == Module.runtime {
            let className = pythonExternalClassName(type)
            return PythonType(
                annotation: className,
                imports: [
                    PythonImport(moduleName: "_native", className: className)
                ]
            )
        }
        let className = pythonExternalClassName(type)
        let packageName = context.pythonImportPackageName(for: type.definingModule.name)
        return PythonType(
            annotation: className,
            imports: [
                .absolute(moduleName: "\(packageName).\(pythonModuleName(className))", className: className)
            ]
        )
    }

    // MARK: conversion-descriptor helpers

    func pythonValueTypeDescriptor(for type: TranslatedType) -> String {
        "_native.ValueType(\(pythonStringLiteral(pythonGeneratedTypeKey(for: type))))"
    }

    func pythonProtocolTypeDescriptor(for type: TranslatedProtocol) -> String {
        "_native.ProtocolType(\(pythonStringLiteral(pythonGeneratedTypeKey(for: type))))"
    }

    func pythonGeneratedTypeKey(for type: TranslatedType) -> String {
        type.sourceType.name
    }

    func pythonExternalTypeKey(_ type: ExternalTranslatedType) -> String {
        type.sourceType.name
    }

    // MARK: naming helpers (logic single-sourced in PythonNaming)

    func pythonModuleName(_ name: String) -> String {
        PythonNaming.moduleName(name)
    }

    func pythonClassName(_ name: String) -> String {
        PythonNaming.className(name)
    }

    func pythonRuntimeClassName(_ type: ExternalTranslatedType) -> String {
        let runtimePrefix = "Runtime."
        let runtimeName = type.nodeName.hasPrefix(runtimePrefix)
            ? String(type.nodeName.dropFirst(runtimePrefix.count))
            : type.nodeName
        return PythonNaming.className(runtimeName)
    }

    func pythonExternalClassName(_ type: ExternalTranslatedType) -> String {
        let modulePrefix = "\(type.definingModule.name)."
        let externalName = type.nodeName.hasPrefix(modulePrefix)
            ? String(type.nodeName.dropFirst(modulePrefix.count))
            : type.nodeName
        return PythonNaming.className(externalName)
    }

    func pythonStringLiteral(_ value: String) -> String {
        PythonNaming.stringLiteral(value)
    }
}

import Foundation
import SourceryDataModel

final class PythonTranslator: Translator {
    required init() {}

    func setupFragments(context: FishyJoesContext, generatedTypes: [BetterType]) -> [SourceFragment] {
        let fragment = context.pythonFragment("_type_setup.py")
        fragment.output("from .runtime import get_runtime")
        for dependency in context.module.dependencies {
            fragment.output("from cricut_\(dependency.lowercased()) import ensure_loaded as _ensure_\(dependency.lowercased())_loaded")
        }
        for pythonClass in context.pythonClasses.sorted(by: { $0.disambiguatedName < $1.disambiguatedName }) {
            fragment.output("from .\(pythonClass.disambiguatedName) import \(pythonClass.disambiguatedName)")
            // Also import the unique alias for reference types, so that setup_reference_type
            // receives the correct class even when multiple types share the same Python name.
            if let productClass = pythonClass as? PythonProductClass,
               case .reference = productClass.constructor,
               let setupName = productClass.iotaSetupName {
                fragment.output("from .\(pythonClass.disambiguatedName) import _cls_\(setupName)")
            }
        }
        fragment.blankLine()
        fragment.output("_runtime = get_runtime()")
        fragment.output("_SETUP_COMPLETE = False")
        fragment.blankLine()
        fragment.outputBlock("def ensure_loaded() -> None:", closeWith: "") {
            fragment.output("global _SETUP_COMPLETE")
            fragment.outputBlock("if _SETUP_COMPLETE:", closeWith: "") {
                fragment.output("return")
            }
            for dependency in context.module.dependencies {
                fragment.output("_ensure_\(dependency.lowercased())_loaded()")
            }
            fragment.output("_runtime.ensure_loaded()")
            for type in generatedTypes {
                let resolved = context.resolve(type: type)
                if let line = setupLine(for: resolved, context: context) {
                    fragment.output(line)
                }
            }
            fragment.output("_SETUP_COMPLETE = True")
        }

        let exportsFragment = context.pythonFragment("__init__.py")
        exportsFragment.output("from ._type_setup import ensure_loaded")
        for pythonClass in context.pythonClasses.sorted(by: { $0.disambiguatedName < $1.disambiguatedName }) {
            exportsFragment.output("from .\(pythonClass.disambiguatedName) import \(pythonClass.disambiguatedName)")
        }
        exportsFragment.blankLine()
        let exports = ["\"ensure_loaded\""] + context.pythonClasses
            .sorted(by: { $0.disambiguatedName < $1.disambiguatedName })
            .map { "\"\($0.disambiguatedName)\"" }
        exportsFragment.output("__all__ = [\(exports.joined(separator: ", "))]")

        let headerFragment = declarationsHeader(context: context, generatedTypes: generatedTypes)

        return [fragment, exportsFragment, headerFragment]
    }

    // MARK: - setup-line dispatch

    /// Returns the single ``_runtime.setup_*(...)`` line for a resolved type,
    /// or ``nil`` if the type does not need a runtime setup call.
    ///
    /// Each branch is one ``setup_<kind>`` runtime API; if a future runtime
    /// change adds, removes, or renames one of those APIs, the diff is
    /// localised to a single helper rather than scattered across the
    /// ``setupFragments`` switch.
    private func setupLine(
        for resolved: TranslatedType,
        context: FishyJoesContext
    ) -> String? {
        switch resolved {
        case let reference as TranslatedReference where reference.definingModule == context.module:
            return referenceSetup(reference)
        case let enumType as TranslatedEnum where enumType.definingModule == context.module:
            return enumSetup(enumType, context: context)
        case let valueType as TranslatedStruct where valueType.definingModule == context.module:
            return structSetup(valueType, context: context)
        case let proto as TranslatedProtocol where proto.definingModule == context.module:
            return protocolSetup(proto, context: context)
        case let array as TranslatedArray:
            return collectionSetup(name: array.converterType.name, elementFFIType: array.elementType.pythonFFIType.rawValue)
        case let set as TranslatedSet:
            return collectionSetup(name: set.converterType.name, elementFFIType: set.elementType.pythonFFIType.rawValue)
        case let dict as TranslatedDictionary:
            return "_runtime.setup_dictionary_type(\"\(dict.converterType.name)\")"
        case let tuple as TranslatedTuple:
            return "_runtime.setup_tuple_type(\"\(tuple.converterType.name)\", \(tuple.elements.count))"
        case let result as TranslatedResult:
            return "_runtime.setup_result_type(\"\(result.converterType.name)\")"
        case let range as TranslatedRange:
            return "_runtime.setup_range_type(\"\(range.converterType.name)\")"
        case let future as TranslatedFuture:
            return "_runtime.setup_future_type(\"\(future.converterType.name)\")"
        case let function as TranslatedFunction:
            return "_runtime.setup_function_type(\"\(function.converterType.name)\", \(function.parameters.count))"
        default:
            return nil
        }
    }

    private func referenceSetup(_ reference: TranslatedReference) -> String {
        return "_runtime.setup_reference_type(\"\(reference.iotaSetupName)\", _cls_\(reference.iotaSetupName))"
    }

    /// Look up the disambiguated Python class name for a given iota setup
    /// name.  Steps A's collision-disambiguation may have renamed the
    /// class away from the bare ``nonNamespacedName``; the runtime setup
    /// call must reference the *actual* class symbol that lives in the
    /// generated module, otherwise mypy will flag it as undefined and
    /// the runtime registration will hit a NameError.
    private func pythonClassName(forSetup iotaSetupName: String, fallback: String, context: FishyJoesContext) -> String {
        for cls in context.pythonClasses {
            if let productClass = cls as? PythonProductClass,
               productClass.iotaSetupName == iotaSetupName {
                return productClass.disambiguatedName
            }
        }
        // Enums and protocols don't have iotaSetupName on their PythonClass
        // (yet); fall back to bare-name lookup against unique siblings.
        let candidates = context.pythonClasses.filter { $0.unqualifiedName == fallback }
        if candidates.count == 1 {
            return candidates[0].disambiguatedName
        }
        // Multiple disambiguated siblings share this bare name — pick the
        // one whose explicitDisambiguatedName matches a substring of the
        // setup name, so e.g. ``Swift_String_PuttingTypes...`` resolves to
        // the ``String_PuttingTypesIntoQuestionablePlaces`` class.
        for cls in candidates where cls.explicitDisambiguatedName != nil {
            if iotaSetupName.contains(cls.disambiguatedName) {
                return cls.disambiguatedName
            }
        }
        return fallback
    }

    private func enumSetup(_ enumType: TranslatedEnum, context: FishyJoesContext) -> String {
        let caseSpecs = enumType.cases.map { enumCase in
            let valueSpecs = enumCase.associatedValues.map { value in
                let resolvedValue = context.resolve(type: value.type)
                return "(\"\(value.bindingName)\", \"\(resolvedValue.pythonFFIType.rawValue)\")"
            }.joined(separator: ", ")
            return "(\"\(enumCase.name)\", [\(valueSpecs)])"
        }.joined(separator: ", ")
        let className = pythonClassName(
            forSetup: enumType.iotaSetupName,
            fallback: enumType.sourceType.nonNamespacedName,
            context: context,
        )
        return "_runtime.setup_enum_type(\"\(enumType.iotaSetupName)\", \(className), \(enumType.isInhabited ? "True" : "False"), [\(caseSpecs)])"
    }

    private func structSetup(_ valueType: TranslatedStruct, context: FishyJoesContext) -> String {
        let mutableFields = valueType.storedVariables
            .filter(\.isMutable)
            .map { "\"\($0.name)\"" }
            .joined(separator: ", ")
        // Python ``{}`` is an empty dict, not an empty set; emit ``set()`` when no
        // fields are mutable so the resulting expression actually has type ``set[str]``.
        let mutableSet = mutableFields.isEmpty ? "set()" : "{\(mutableFields)}"
        let fieldSpecs = valueType.storedVariables.map { storedVar in
            let resolvedField = context.resolve(type: storedVar.type)
            return "(\"\(storedVar.name)\", \"\(resolvedField.pythonFFIType.rawValue)\")"
        }.joined(separator: ", ")
        let className = pythonClassName(
            forSetup: valueType.iotaSetupName,
            fallback: valueType.sourceType.nonNamespacedName,
            context: context,
        )
        return "_runtime.setup_struct_type(\"\(valueType.iotaSetupName)\", \(className), [\(fieldSpecs)], \(mutableSet))"
    }

    private func protocolSetup(_ proto: TranslatedProtocol, context: FishyJoesContext) -> String {
        let fieldSpecs = proto.fields.map { field in
            let resolvedField = context.resolve(type: field.type)
            return "(\"\(field.name)\", \"\(resolvedField.pythonFFIType.rawValue)\")"
        }.joined(separator: ", ")
        // Only non-default-implementation methods are part of the witness ABI.
        let methodSpecs = proto.methods.filter { !$0.isDefaultImplementation }.map { method in
            let paramFFITypes = method.parameters.map { param in
                let resolvedParam = context.resolve(type: param.type)
                return "\"\(resolvedParam.pythonFFIType.rawValue)\""
            }.joined(separator: ", ")
            let resolvedReturn = context.resolve(type: method.returnType)
            return "(\"\(method.callName)\", [\(paramFFITypes)], \"\(resolvedReturn.pythonFFIType.rawValue)\")"
        }.joined(separator: ", ")
        return "_runtime.setup_protocol_type(\"\(proto.iotaSetupName)\", \(proto.iotaExternalWitnessClassName), [\(fieldSpecs)], [\(methodSpecs)])"
    }

    private func collectionSetup(name: String, elementFFIType: String) -> String {
        return "_runtime.setup_collection_type(\"\(name)\", \"\(elementFFIType)\")"
    }

    // MARK: - _declarations.h

    /// Returns the C type string for a given FFIType, used in the cffi `cdef()` header.
    private func cType(for ffiType: PythonClass.FFIType) -> String {
        switch ffiType {
        case .void:   return "void"
        case .bool:   return "uint8_t"
        case .int8:   return "int8_t"
        case .int16:  return "int16_t"
        case .int32:  return "int32_t"
        case .int64:  return "int64_t"
        case .int:    return "intptr_t"
        case .uint8:  return "uint8_t"
        case .uint16: return "uint16_t"
        case .uint32: return "uint32_t"
        case .uint64: return "uint64_t"
        case .uint:   return "uintptr_t"
        case .float:  return "float"
        case .double: return "double"
        case .object: return "void*"
        }
    }

    /// Builds a `_declarations.h` fragment with C declarations for every @_cdecl symbol the
    /// Python runtime needs to call via cffi.
    private func declarationsHeader(context: FishyJoesContext, generatedTypes: [BetterType]) -> SourceFragment {
        let fragment = context.pythonRawFragment("_declarations.h")

        // Standard integer types used in the header
        fragment.output("#include <stdint.h>")
        fragment.output("#include <stddef.h>")
        fragment.blankLine()

        // Module-level registerTypes function
        let registerFn = "FishyJoes_\(context.module.name.mangled)_registerTypes"
        fragment.output("void \(registerFn)(void);")
        fragment.blankLine()

        // Detect which categories of runtime-generic types are used.
        // These types have definingModule = Module.runtime, so they won't pass
        // the per-module guard below — we must detect them in a separate pass.
        var hasGenericTypes = false
        var hasRangeTypes = false
        var hasFutureTypes = false

        for type in generatedTypes {
            let resolved = context.resolve(type: type)
            switch resolved {
            case is TranslatedArray, is TranslatedSet, is TranslatedDictionary,
                 is TranslatedTuple, is TranslatedResult, is TranslatedFunction:
                hasGenericTypes = true
            case is TranslatedRange:
                hasRangeTypes = true
            case is TranslatedFuture:
                hasFutureTypes = true
            default:
                break
            }
        }

        for type in generatedTypes {
            let resolved = context.resolve(type: type)
            guard resolved.definingModule == context.module else { continue }

            switch resolved {
            case let reference as TranslatedReference:
                emitReferenceDeclarations(reference, context: context, fragment: fragment)
            case let enumType as TranslatedEnum:
                emitEnumDeclarations(enumType, context: context, fragment: fragment)
            case let valueType as TranslatedStruct:
                emitStructDeclarations(valueType, context: context, fragment: fragment)
            case let proto as TranslatedProtocol:
                emitProtocolDeclarations(proto, context: context, fragment: fragment)
            default:
                continue
            }
            fragment.blankLine()
        }

        if hasGenericTypes || hasRangeTypes || hasFutureTypes {
            fragment.output("// Generic runtime setup functions")
        }
        if hasGenericTypes {
            fragment.output("void FishyJoesCommonRuntime_collection_setup(void* env, uint16_t* name, void* lengthMethod, void* valuesMethod, void* constructor, void* context, void** exn);")
            fragment.output("void FishyJoesCommonRuntime_TupleConverter_setup(void* env, uint16_t* name, void* get0, void* get1, void* get2, void* get3, void* get4, void* get5, void* ctor, void* context);")
            fragment.output("void FishyJoesCommonRuntime_ResultConverter_setup(void* env, uint16_t* name, void* get_contents, void* ctor, void* context);")
            fragment.output("void FishyJoesCommonRuntime_FunctionConverter_setup(void* env, uint16_t* name, void* ctor, void* invoke_fn, void* context, void** exn);")
        }
        if hasRangeTypes {
            fragment.output("void FishyJoesCommonRuntime_RangeConverter_setup(void* env, uint16_t* name, void* getLowerBound, void* getUpperBound, void* ctor, void* context);")
        }
        if hasFutureTypes {
            fragment.output("void FishyJoesCommonRuntime_FutureConverter_setup(void* env, uint16_t* name, void* constructor, void* sinkFutureMethod, void* resolveMethod, void* rejectMethod, void* context, void** exn);")
            fragment.output("void FishyJoesCommonRuntime_FutureConverter_invokeSinkHandler(void* env, void* context, uint32_t success, void* result, void** exn);")
        }
        if hasGenericTypes || hasRangeTypes || hasFutureTypes {
            fragment.blankLine()
        }

        return fragment
    }

    // MARK: Reference type

    private func emitReferenceDeclarations(_ ref: TranslatedReference, context: FishyJoesContext, fragment: SourceFragment) {
        let setupName = ref.iotaSetupName
        // setup: (void* env, void* constructor, void** exn)
        fragment.output("void \(setupName)(void* env, void* constructor, void** exn);")

        // method shims
        for method in ref.methods {
            emitMethodShim(method: method, typeName: ref.sourceType.name, context: context, fragment: fragment)
        }

        // field shims (computed variables only; stored handled by setup)
        for field in ref.computedVariables {
            guard field.exportAnnotation != nil else { continue }
            emitFieldShims(field: field, typeName: ref.sourceType.name, isStatic: field.isStatic, context: context, fragment: fragment)
        }

        // equals/hash shims (when the Swift type conforms to Equatable/Hashable)
        let mangledName = ref.sourceType.name.mangled
        if ref.equatable {
            // uint8_t __iota_TypeName_equals(void* env, void* lhs, void* rhs, void** exn);
            fragment.output("uint8_t __iota_\(mangledName)_equals(void* env, void* lhs, void* rhs, void** exn);")
        }
        if ref.hashable {
            // int32_t __iota_get_TypeName_hash(void* env, void* self, void** exn);
            fragment.output("int32_t __iota_get_\(mangledName)_hash(void* env, void* self, void** exn);")
        }
    }

    // MARK: Struct type

    private func emitStructDeclarations(_ s: TranslatedStruct, context: FishyJoesContext, fragment: SourceFragment) {
        let setupName = s.iotaSetupName
        // setup: (void* env, void* constructor, getter/setter per stored field, void** exn)
        var setupParams = "void* env, void* constructor"
        for storedVar in s.storedVariables {
            let resolved = context.resolve(type: storedVar.type)
            let ffiType = cType(for: resolved.pythonFFIType)
            setupParams += ", void* get_\(storedVar.name)"
            if storedVar.isMutable {
                setupParams += ", void* set_\(storedVar.name)"
            }
            _ = ffiType // type info used at runtime, not in the setup signature (all callbacks are void*)
        }
        setupParams += ", void** exn"
        fragment.output("void \(setupName)(\(setupParams));")

        // method shims
        for method in s.methods {
            emitMethodShim(method: method, typeName: s.sourceType.name, context: context, fragment: fragment)
        }

        // stored variable field shims (getter always; setter if mutable)
        for storedVar in s.storedVariables {
            emitFieldShims(field: storedVar, typeName: s.sourceType.name, isStatic: storedVar.isStatic, context: context, fragment: fragment, isStoredVar: true)
        }

        // computed variable field shims
        for field in s.computedVariables {
            guard field.exportAnnotation != nil else { continue }
            emitFieldShims(field: field, typeName: s.sourceType.name, isStatic: field.isStatic, context: context, fragment: fragment)
        }
    }

    // MARK: Enum type

    private func emitEnumDeclarations(_ e: TranslatedEnum, context: FishyJoesContext, fragment: SourceFragment) {
        let setupName = e.iotaSetupName
        // Build setup params. All callbacks are void*.
        var setupParams = "void* env"
        if e.isInhabited {
            setupParams += ", void* discriminator"
        }
        for enumCase in e.cases {
            setupParams += ", void* \(enumCase.name)_constructor"
            setupParams += ", void* \(enumCase.name)_extractor"
        }
        setupParams += ", void** exn"
        fragment.output("void \(setupName)(\(setupParams));")

        // Discriminator shim: int32_t __iota_discriminator_TypeName(void* env, void* self, void** exn)
        // (Discriminator is a setup callback, not a standalone @_cdecl — no separate shim needed)

        // Case constructor shims: __iota_TypeName_caseName_constructor emitted by iota translator? No —
        // the enum setup function registers callbacks. The actual shims called from Python are the
        // per-method/field shims for the enum's exported methods/fields.
        for method in e.methods {
            emitMethodShim(method: method, typeName: e.sourceType.name, context: context, fragment: fragment)
        }
        for field in e.fields {
            guard field.exportAnnotation != nil else { continue }
            emitFieldShims(field: field, typeName: e.sourceType.name, isStatic: field.isStatic, context: context, fragment: fragment)
        }
    }

    // MARK: Protocol type

    private func emitProtocolDeclarations(_ proto: TranslatedProtocol, context: FishyJoesContext, fragment: SourceFragment) {
        let setupName = proto.iotaSetupName
        // setup: (void* env, void* constructor, getter per field (no setters), callback per non-default method, void** exn)
        var setupParams = "void* env, void* constructor"
        for field in proto.fields {
            setupParams += ", void* get_\(field.name)"
        }
        for method in proto.methods where !method.isDefaultImplementation {
            setupParams += ", void* \(method.callName)"
        }
        setupParams += ", void** exn"
        fragment.output("void \(setupName)(\(setupParams));")

        // method shims
        for method in proto.methods {
            emitMethodShim(method: method, typeName: proto.sourceType.name, context: context, fragment: fragment)
        }

        // field shims (read-only in protocols)
        for field in proto.fields {
            guard field.exportAnnotation != nil else { continue }
            if field.isDefaultImplementation {
                // Default implementation fields use __iota__default_<ProtocolName>_<fieldName>
                guard let ann = field.exportAnnotation else { continue }
                let resolvedField = context.resolve(type: field.type)
                let fieldCType = cType(for: resolvedField.pythonFFIType)
                let getterName = "__iota__default_\(proto.sourceType.name)_\(ann.name)".mangled
                fragment.output("\(fieldCType) \(getterName)(void* env, void* self, void** exn);")
            } else {
                emitFieldShims(field: field, typeName: proto.sourceType.name, isStatic: false, context: context, fragment: fragment)
            }
        }
    }

    // MARK: Shared helpers

    /// Emits: `ReturnCType __iota_TypeName_methodName(void* env[, void* self], params..., void** exn);`
    private func emitMethodShim(method: Method, typeName: String, context: FishyJoesContext, fragment: SourceFragment) {
        let exportAnnotation = method.exportAnnotation
        let mangledName = "__iota_\(typeName)_\(exportAnnotation.name)".mangled
        let resolvedReturn = context.resolve(type: method.returnType, generics: exportAnnotation.genericOverrides)
        let returnCType = method.isAsync ? "void*" : cType(for: resolvedReturn.pythonFFIType)

        var params = "void* env"
        if !method.isStatic {
            params += ", void* self"
        }
        for param in method.parameters {
            let resolvedParam = context.resolve(type: param.type, generics: exportAnnotation.genericOverrides)
            params += ", \(cType(for: resolvedParam.pythonFFIType)) \(param.name)"
        }
        params += ", void** exn"

        fragment.output("\(returnCType) \(mangledName)(\(params));")
    }

    /// Emits getter (and optionally setter) shim declarations for a field.
    private func emitFieldShims(field: Field, typeName: String, isStatic: Bool, context: FishyJoesContext, fragment: SourceFragment, isStoredVar: Bool = false) {
        let fieldName: String
        if isStoredVar {
            fieldName = field.name
        } else {
            guard let ann = field.exportAnnotation else { return }
            fieldName = ann.name
        }
        let resolvedField = context.resolve(type: field.type)
        let fieldCType = cType(for: resolvedField.pythonFFIType)

        // For protocol default implementations the actual @_cdecl symbol is
        // __iota__default_<ProtocolName>_<fieldName> and lives on the protocol type, not
        // the concrete type.  The per-concrete-type getter does NOT exist in the dylib.
        // We skip emitting a redundant (and wrong) declaration here; the protocol's own
        // emitProtocolDeclarations call already emits the correct __iota__default_ declaration.
        guard !field.isDefaultImplementation else { return }

        let getterName = "__iota_get_\(typeName)_\(fieldName)".mangled
        if isStatic {
            fragment.output("\(fieldCType) \(getterName)(void* env, void** exn);")
        } else {
            fragment.output("\(fieldCType) \(getterName)(void* env, void* self, void** exn);")
        }

        if field.isPubliclyWritable {
            let setterName = "__iota_set_\(typeName)_\(fieldName)".mangled
            if isStatic {
                fragment.output("void \(setterName)(void* env, \(fieldCType) newValue, void** exn);")
            } else {
                fragment.output("void \(setterName)(void* env, void* self, \(fieldCType) newValue, void** exn);")
            }
        }
    }

    func python(method: Method, of type: TranslatedType, context: FishyJoesContext) -> PythonClass.Method? {
        let exportAnnotation = method.exportAnnotation
        var omitParameters = Set(exportAnnotation.omitParameters)
        var parameters: [PythonClass.Method.Parameter] = []
        var usedParameterSourceNames = Set(["self"])
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
            let defaultValue = parameter.defaultValue.flatMap(python(value:))
            parameters.append(
                .init(
                    labelComment: label,
                    name: parameter.name,
                    sourceName: PythonClass.uniqueSourceIdentifier(
                        for: parameter.name,
                        used: &usedParameterSourceNames
                    ),
                    type: resolved.pythonType,
                    ffiType: resolved.pythonFFIType,
                    defaultValue: defaultValue
                )
            )
        }

        let resolvedReturn = context.resolve(type: method.returnType, generics: exportAnnotation.genericOverrides)
        return PythonClass.Method(
            documentation: method.documentation,
            isStatic: method.isStatic,
            name: exportAnnotation.name,
            sourceName: PythonClass.sourceIdentifier(for: exportAnnotation.name),
            mangledName: "\(type.mangledName)_\(exportAnnotation.name.mangled)",
            parameters: parameters,
            returnType: method.isAsync ? .awaitable(resolvedReturn.pythonType) : resolvedReturn.pythonType,
            ffiReturnType: method.isAsync ? .object : resolvedReturn.pythonFFIType,
            deprecation: method.deprecation,
            body: nil,
            isAsync: method.isAsync
        )
    }

    func python(field: Field, of type: TranslatedType, context: FishyJoesContext, useNativeName: Bool = false) -> PythonClass.MethodOrVariable? {
        let pythonName: String
        var asMethod = false

        if useNativeName {
            guard field.exportAnnotation == nil else {
                fatalErr("field \(field.name) should not be annotated, as it's in a type being exported memberwise")
            }
            pythonName = field.name
        } else {
            guard let exportAnnotation = field.exportAnnotation else {
                return nil
            }
            asMethod = exportAnnotation.kind == .asMethod
            pythonName = exportAnnotation.name
        }

        let resolved = context.resolve(type: field.type)

        // For protocol default implementations, the iota symbol uses the protocol type's mangled name,
        // not the concrete type's mangled name. Resolve it from field.definedIn.
        var defaultImplProtocolMangledName: String?
        if field.isDefaultImplementation, let definedIn = field.definedIn {
            let protoResolved = context.resolve(type: definedIn)
            defaultImplProtocolMangledName = protoResolved.mangledName
        }

        return .variable(
            PythonClass.Variable(
                documentation: field.documentation,
                isStatic: field.isStatic,
                isMutable: field.isMutable,
                isPubliclyWritable: field.isPubliclyWritable,
                asMethod: asMethod,
                name: pythonName,
                mangledName: "\(type.mangledName)_\(pythonName.mangled)",
                type: resolved.pythonType,
                ffiType: resolved.pythonFFIType,
                deprecation: field.deprecation,
                isDefaultImplementation: field.isDefaultImplementation,
                sourceName: PythonClass.sourceIdentifier(for: pythonName),
                defaultImplProtocolMangledName: defaultImplProtocolMangledName
            )
        )
    }

    func python(value: String) -> String? {
        if let int = Int(value) {
            return "\(int)"
        }
        if let double = Double(value) {
            return "\(double)"
        }
        switch value {
        case "true":
            return "True"
        case "false":
            return "False"
        case "nil":
            return "None"
        default:
            return nil
        }
    }
}

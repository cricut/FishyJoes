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
        for pythonClass in context.pythonClasses.sorted(by: { $0.unqualifiedName < $1.unqualifiedName }) {
            fragment.output("from .\(pythonClass.unqualifiedName) import \(pythonClass.unqualifiedName)")
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
                switch resolved {
                case let reference as TranslatedReference where reference.definingModule == context.module:
                    fragment.output("_runtime.setup_reference_type(\"\(reference.iotaSetupName)\", \(reference.sourceType.nonNamespacedName))")
                case let enumType as TranslatedEnum where enumType.definingModule == context.module:
                    let caseSpecs = enumType.cases.map { enumCase in
                        let valueSpecs = enumCase.associatedValues.map { value in
                            let resolvedValue = context.resolve(type: value.type)
                            return "(\"\(value.bindingName)\", \"\(resolvedValue.pythonFFIType.rawValue)\")"
                        }.joined(separator: ", ")
                        return "(\"\(enumCase.name)\", [\(valueSpecs)])"
                    }.joined(separator: ", ")
                    fragment.output(
                        "_runtime.setup_enum_type(\"\(enumType.iotaSetupName)\", \(enumType.sourceType.nonNamespacedName), \(enumType.isInhabited ? "True" : "False"), [\(caseSpecs)])"
                    )
                case let valueType as TranslatedStruct where valueType.definingModule == context.module:
                    let mutableFields = valueType.storedVariables
                        .filter(\.isMutable)
                        .map { "\"\($0.name)\"" }
                        .joined(separator: ", ")
                    let fieldSpecs = valueType.storedVariables.map { storedVar in
                        let resolvedField = context.resolve(type: storedVar.type)
                        return "(\"\(storedVar.name)\", \"\(resolvedField.pythonFFIType.rawValue)\")"
                    }.joined(separator: ", ")
                    fragment.output(
                        "_runtime.setup_struct_type(\"\(valueType.iotaSetupName)\", \(valueType.sourceType.nonNamespacedName), [\(fieldSpecs)], {\(mutableFields)})"
                    )
                case let proto as TranslatedProtocol where proto.definingModule == context.module:
                    let fieldSpecs = proto.fields.map { field in
                        let resolvedField = context.resolve(type: field.type)
                        return "(\"\(field.name)\", \"\(resolvedField.pythonFFIType.rawValue)\")"
                    }.joined(separator: ", ")
                    // Only non-default-implementation methods are part of the witness ABI
                    let methodSpecs = proto.methods.filter { !$0.isDefaultImplementation }.map { method in
                        let paramFFITypes = method.parameters.map { param in
                            let resolvedParam = context.resolve(type: param.type)
                            return "\"\(resolvedParam.pythonFFIType.rawValue)\""
                        }.joined(separator: ", ")
                        let resolvedReturn = context.resolve(type: method.returnType)
                        return "(\"\(method.callName)\", [\(paramFFITypes)], \"\(resolvedReturn.pythonFFIType.rawValue)\")"
                    }.joined(separator: ", ")
                    fragment.output(
                        "_runtime.setup_protocol_type(\"\(proto.iotaSetupName)\", \(proto.iotaExternalWitnessClassName), [\(fieldSpecs)], [\(methodSpecs)])"
                    )
                default:
                    continue
                }
            }
            fragment.output("_SETUP_COMPLETE = True")
        }

        let exportsFragment = context.pythonFragment("__init__.py")
        exportsFragment.output("from ._type_setup import ensure_loaded")
        for pythonClass in context.pythonClasses.sorted(by: { $0.unqualifiedName < $1.unqualifiedName }) {
            exportsFragment.output("from .\(pythonClass.unqualifiedName) import \(pythonClass.unqualifiedName)")
        }
        exportsFragment.blankLine()
        let exports = ["\"ensure_loaded\""] + context.pythonClasses
            .sorted(by: { $0.unqualifiedName < $1.unqualifiedName })
            .map { "\"\($0.unqualifiedName)\"" }
        exportsFragment.output("__all__ = [\(exports.joined(separator: ", "))]")

        let headerFragment = declarationsHeader(context: context, generatedTypes: generatedTypes)

        return [fragment, exportsFragment, headerFragment]
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
            emitFieldShims(field: field, typeName: proto.sourceType.name, isStatic: false, context: context, fragment: fragment)
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
                deprecation: field.deprecation
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

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

        return [fragment, exportsFragment]
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

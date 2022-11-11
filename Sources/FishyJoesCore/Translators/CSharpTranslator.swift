import Foundation
import SourceryRuntime

final class CSharpTranslator: Translator {
    required init() {}

    func translate(method: Method, context: FishyJoesContext) -> [SourceFragment] {
        []
    }

    func translate(variable: Variable, context: FishyJoesContext) -> [SourceFragment] {
        []
    }

    func setupFragments(context: FishyJoesContext, generatedTypes: Set<BetterType>) -> [SourceFragment] {
        let generatedTypes = generatedTypes.sorted { $0.name < $1.name }
        let fragment = context.cSharpFragment("TypeSetup.cs")
        fragment.output("using static Cricut.FishyJoesRuntime.Loader;")
        fragment.blankLine()

        let moduleRegisterTypesFn = context.iotaTranslator.moduleRegisterTypesFn(context: context)

        fragment.outputBlock("namespace Cricut.\(context.module.name) {") {
            fragment.outputBlock("public class _TypeSetup {") {
                fragment.output(context.module.dllImportMark)
                fragment.output("static extern void \(moduleRegisterTypesFn)();")
                fragment.blankLine()

                var initializerWriters: [() -> Void] = []
                for type in generatedTypes {
                    let resolved = context.resolve(type: type)

                    let setupParams = resolved.cSharpSetupParameters(in: context)
                    let setupDelegates = resolved.cSharpSetupDelegates(in: context)

                    setupDelegates.forEach { fragment.output($0) }

                    if resolved.definingModule == context.module {
                        precondition(!setupParams.contains(where: \.isTypeParameter), "unexpected type parameter in \(type.name)")
                        fragment.output(resolved.definingModule.dllImportMark)
                        fragment.outputBlock("static extern void \(resolved.iotaSetupName)(", closeWith: ");") {
                            for param in setupParams {
                                fragment.output("\(param.type!) \(param.name!),")
                            }
                            fragment.output("out CreatedRef _exn")
                        }
                        fragment.blankLine()
                    } else if !type.isGeneric {
                        // non-generic types are sufficiently set up by defining module
                        continue
                    }

                    initializerWriters.append {
                        fragment.outputBlock("Once(\"setup_\(resolved.converterType.name)\", () => {", closeWith: "});") {
                            fragment.output("Console.WriteLine(\"setting up \(type.name)...\");")

                            var typeArgStr = ""
                            if case let typeArguments = setupParams.compactMap(\.typeValue), !typeArguments.isEmpty {
                                typeArgStr = "<\(typeArguments.joined(separator: ", "))>"
                            }

                            fragment.outputBlock("Utilities.Check((out CreatedRef exn) => \(resolved.iotaSetupName)\(typeArgStr)(", closeWith: "));") {
                                for param in setupParams {
                                    param.valueWriter(fragment)
                                }
                                fragment.output("out exn")
                            }
                        }
                    }
                }

                fragment.output("public static void _ensureLoaded() {}")
                fragment.blankLine()

                fragment.outputBlock("static _TypeSetup() {") {
                    fragment.output("// There's no explicit way to call the static constructor, so do this instead")
                    fragment.output("FishyJoesRuntime.Loader.ensureLoaded();")
                    for dependency in context.module.dependencies {
                        fragment.output("\(dependency)._ensureLoaded();")
                    }
                    fragment.output("\(moduleRegisterTypesFn)();")

                    fragment.blankLine()
                    for writer in initializerWriters {
                        writer()
                    }
                }
            }
        }
        return [fragment]
    }

    func cSharp(method: Method, of type: TranslatedType, context: FishyJoesContext) -> CSharpClass.MethodOrVariable? {
        let exportAnnotation = method.exportAnnotation
        var omitParameters = Set(exportAnnotation.omitParameters)
        var parameters: [(labelComment: String?, name: String, type: CSharpClass.CSType, defaultValue: String?)] = []
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
            var defaultValue: String?
            if let swiftDefaultValue = parameter.defaultValue {
                if let cSharpDefaultValue = cSharp(value: swiftDefaultValue) {
                    defaultValue = cSharpDefaultValue
                } else {
                    context.warnMissingDefault(parameter: parameter, in: method)
                }
            }
            parameters.append((label, parameter.name, resolved.cSharpType, defaultValue))
        }

        return .method(
            CSharpClass.Method(
                documentation: method.documentation,
                isStatic: method.isStatic,
                isOverride: method.exportAnnotation.isOverride,
                name: upperCaseFirst(exportAnnotation.name),
                mangledName: "\(type.mangledName)_\(exportAnnotation.name.mangled)",
                parameters: parameters,
                returnType: context.resolve(type: method.returnType, generics: exportAnnotation.genericOverrides).cSharpType,
                deprecation: method.deprecation,
                body: nil
            )
        )
    }

    func cSharp(field: Variable, of type: TranslatedType, context: FishyJoesContext, useNativeName: Bool = false) -> CSharpClass.MethodOrVariable? {
        let csName: String
        var asMethod = false

        let isOverride = field.exportAnnotation?.isOverride ?? false

        if useNativeName {
            guard field.exportAnnotation == nil else {
                fatalErr("field \(field.name) should not be annotated, as it's in a type being exported memberwise")
            }
            csName = upperCaseFirst(field.name)
        } else {
            guard let exportAnnotation = field.exportAnnotation else {
                return nil
            }
            asMethod = exportAnnotation.kind == .asMethod || (field.isComputed && !isOverride)
            csName = upperCaseFirst(exportAnnotation.cSharpName)
        }
        let resolved = context.resolve(type: field.typeName.better)
        return .variable(
            CSharpClass.Variable(
                documentation: field.documentation,
                isStatic: field.isStatic,
                isOverride: isOverride,
                readOnly: !field.isMutable,
                asMethod: asMethod,
                name: csName,
                mangledName: "\(type.mangledName)_\(csName.mangled)",
                type: resolved.cSharpType,
                deprecation: field.deprecation
            )
        )
    }

    func defaultObjectMethods(for type: CSharpClass.CSType, members: [String]) -> [CSharpClass.Method] {
        [
            CSharpClass.Method(
                documentation: [],
                isStatic: false,
                isOverride: true,
                name: "Equals",
                mangledName: "",
                parameters: [(nil, "obj", .optional(.primitive("object")), nil)],
                returnType: .primitive("bool"),
                deprecation: nil,
                body: ["return obj is \(type.name) ? this == (\(type.name))obj : false;"]
            ),
            CSharpClass.Method(
                documentation: [],
                isStatic: true,
                isOverride: false,
                name: "operator ==",
                mangledName: "",
                parameters: [
                    (nil, "lhs", type, nil),
                    (nil, "rhs", type, nil),
                ],
                returnType: .primitive("bool"),
                deprecation: nil,
                body: members.map { "if (lhs.\($0) != rhs.\($0)) { return false; }" } + ["return true;"]
            ),
            CSharpClass.Method(
                documentation: [],
                isStatic: true,
                isOverride: false,
                name: "operator !=",
                mangledName: "",
                parameters: [
                    (nil, "lhs", type, nil),
                    (nil, "rhs", type, nil),
                ],
                returnType: .primitive("bool"),
                deprecation: nil,
                body: ["return !(lhs == rhs);"]
            ),
            CSharpClass.Method(
                documentation: [],
                isStatic: false,
                isOverride: true,
                name: "GetHashCode",
                mangledName: "",
                parameters: [],
                returnType: .primitive("int"),
                deprecation: nil,
                body: ["return Cricut.FishyJoesRuntime.Utilities.Hash<object?>(new object?[] {\(members.joined(separator: ", "))});"]
            ),
        ]
    }

    // Very hacky. But values are an entirely separate language to what we process
    func cSharp(value: String) -> String? {
        if let int = Int(value) {
            return "\(int)"
        } else if let double = Double(value) {
            return "\(double)"
        } else if value == "Double.ulpOfOne.squareRoot()" {
            return "1.4901161193847656E-8"
        }
        switch value {
        case "nil":
            return "null"
        case "true", "false":
            return value
        default:
            return nil
        }
    }
}

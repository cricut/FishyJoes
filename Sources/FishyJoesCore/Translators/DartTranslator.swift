import Foundation
import SourceryRuntime

final class DartTranslator: Translator {
    required init() {}

    struct NativeMethod {
        var name: String
        var definingDartClass: String
        var args: [(name: String, type: DartClass.DartType)]
        var returnType: DartClass.DartType
    }

    public var nativeMethods: [NativeMethod] = []

    func translate(method: Method, context: FishyJoesContext) -> [SourceFragment] {
        []
    }

    func translate(variable: Variable, context: FishyJoesContext) -> [SourceFragment] {
        []
    }

    func declareExternVoid(_ symbol: String, params: [ForeignSetupParameter<DartClass.DartType>]) -> ((SourceFragment) -> Void) {
        { fragment in
            fragment.outputBlock("final \(symbol) = dylib.lookupFunction<", closeWith: ">('\(symbol)');") {
                fragment.outputBlock("ffi.Void Function(", closeWith: "),") {
                    for param in params {
                        fragment.output("\(param.type!.name()) \(param.name!),")
                    }
                    fragment.output("OutCreatedRef exn")
                }
                fragment.outputBlock("void Function(") {
                    for param in params {
                        fragment.output("\(param.type!.name()) \(param.name!),")
                    }
                    fragment.output("OutCreatedRef exn")
                }
            }
        }
    }

    func setupFragments(context: FishyJoesContext, generatedTypes: Set<BetterType>) -> [SourceFragment] {
        let generatedTypes = generatedTypes.sorted { $0.name < $1.name }
        let fragment = context.dartFragment(
            "type_setup.dart",
            additionalImports: [
                "import 'package:path/path.dart' as path;",
                "import 'dart:io' show Platform, Directory;",
            ]
        )

        let moduleRegisterTypesFn = context.iotaTranslator.moduleRegisterTypesFn(context: context)
        var externDeclarations: [(SourceFragment) -> Void] = []

        var initializerWriters: [() -> Void] = []
        for type in generatedTypes {
            let resolved = context.resolve(type: type)

            let setupParams = resolved.dartSetupParameters(in: context)
            let setupDelegates = resolved.dartSetupDelegates(in: context)

            setupDelegates.forEach { fragment.output($0) }

            if resolved.definingModule == context.module {
                precondition(!setupParams.contains(where: \.isTypeParameter), "unexpected type parameter in \(type.name)")

                externDeclarations.append(
                    declareExternVoid(resolved.iotaSetupName, params: setupParams)
                )

                // TODO
            } else if !type.isGeneric {
                // non-generic types are sufficiently set up by defining module
                continue
            }

            initializerWriters.append {
                fragment.outputBlock("Loader.shared.once(\"setup_\(resolved.converterType.name)\", () {", closeWith: "});") {
                    fragment.output("print(\"setting up \(type.name)...\");")

                    fragment.outputBlock("utils.check<void>((exn) {", closeWith: "});") {
                        let setupName: String
                        if resolved.definingModule.name == "FishyJoesRuntime" {
                            setupName = "Loader.shared.\(resolved.iotaSetupName)"
                        } else {
                            setupName = resolved.iotaSetupName
                        }

                        var typeArgStr = ""
                        if case let typeArguments = setupParams.compactMap(\.typeValue), !typeArguments.isEmpty {
                            typeArgStr = "<\(typeArguments.map { $0.name() }.joined(separator: ", "))>"
                        }

                        fragment.outputBlock("\(setupName)\(typeArgStr)(", closeWith: ");") {
                            for param in setupParams {
                                param.valueWriter(fragment)
                            }
                            fragment.output("exn")
                        }
                    }
                }
            }
        }

        for nativeMethod in nativeMethods {
            externDeclarations.append { fragment in
                fragment.outputBlock("\(nativeMethod.definingDartClass).f\(nativeMethod.name) = dylib.lookupFunction<", closeWith: ">", newLineTerminated: false) {
                    fragment.outputBlock("\(nativeMethod.returnType.ffiCreatedTag) Function(", closeWith: "),") {
                        for (argName, argType) in nativeMethod.args {
                            fragment.output("\(argType.ffiUnownedTag) \(argName),")
                        }
                        fragment.output("OutCreatedRef _exn")
                    }
                    fragment.outputBlock("\(nativeMethod.returnType.ffiCreatedName) Function(") {
                        for (argName, argType) in nativeMethod.args {
                            fragment.output("\(argType.ffiUnownedName) \(argName),")
                        }
                        fragment.output("OutCreatedRef _exn")
                    }
                }
                fragment.output("(\"\(nativeMethod.name)\");")
            }
        }

        fragment.blankLine()
        fragment.outputBlock("final ensureLoaded = (() {", closeWith: "})();") {
            fragment.output("final libraryPath = path.join(Directory.current.path, 'native', 'lib\(context.module)-iota.dylib');")
            fragment.output("final dylib = ffi.DynamicLibrary.open(libraryPath);")
            fragment.output("final arena = ffi.Arena();")

            fragment.blankLine()
            fragment.output("dylib.lookupFunction<ffi.Void Function(), void Function()>('\(moduleRegisterTypesFn)')();")

            fragment.blankLine()
            for externDeclaration in externDeclarations {
                externDeclaration(fragment)
            }

            fragment.blankLine()
            for writer in initializerWriters {
                writer()
                fragment.blankLine()
            }

            fragment.output("arena.releaseAll();")
        }

        return [fragment]
    }

    func dart(method: Method, of type: TranslatedType, context: FishyJoesContext) -> DartClass.MethodOrVariable? {
        let exportAnnotation = method.exportAnnotation
        var omitParameters = Set(exportAnnotation.omitParameters)
        var parameters: [(labelComment: String?, name: String, type: DartClass.DartType, defaultValue: String?)] = []
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
                if let dartDefaultValue = dart(value: swiftDefaultValue) {
                    defaultValue = dartDefaultValue
                } else {
                    context.warnMissingDefault(parameter: parameter, in: method)
                }
            }
            parameters.append((label, parameter.name, resolved.dartType, defaultValue))
        }

        return .method(
            DartClass.Method(
                documentation: method.documentation,
                isStatic: method.isStatic,
                name: exportAnnotation.name,
                mangledName: "\(type.mangledName)_\(exportAnnotation.name.mangled)",
                parameters: parameters,
                returnType: context.resolve(type: method.returnType, generics: exportAnnotation.genericOverrides).dartType,
                deprecation: method.deprecation,
                body: nil
            )
        )
    }

    func dart(field: Variable, of type: TranslatedType, context: FishyJoesContext, useNativeName: Bool = false) -> DartClass.MethodOrVariable? {
        let dartName: String
        let iotaName: String
        var asMethod = false

        let isOverride = field.exportAnnotation?.isOverride ?? false

        if useNativeName {
            guard field.exportAnnotation == nil else {
                fatalErr("field \(field.name) should not be annotated, as it's in a type being exported memberwise")
            }
            dartName = field.name
            iotaName = upperCaseFirst(field.name)
        } else {
            guard let exportAnnotation = field.exportAnnotation else {
                return nil
            }
            asMethod = exportAnnotation.kind == .asMethod || (field.isComputed && !isOverride)
            dartName = exportAnnotation.name
            iotaName = upperCaseFirst(exportAnnotation.cSharpName)
        }
        let resolved = context.resolve(type: field.typeName.better)
        return .variable(
            DartClass.Variable(
                documentation: field.documentation,
                isStatic: field.isStatic,
                readOnly: !field.isMutable,
                asMethod: asMethod,
                name: dartName,
                mangledName: "\(type.mangledName)_\(iotaName.mangled)",
                type: resolved.dartType,
                deprecation: field.deprecation
            )
        )
    }

    // Very hacky. But values are an entirely separate language to what we process
    func dart(value: String) -> String? {
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

import Foundation
import SourceryRuntime

final class DartTranslator: Translator {
    required init() {}

    func fakeNamespace<S: StringProtocol>(_ name: S) -> String {
        String(name.replacingOccurrences(of: ".", with: "_").drop { $0 == "_" })
    }

    func moduleRegisterTypesFn(context: FishyJoesContext) -> String {
        "FishyJoes_\(context.module.name.mangled)_registerTypes"
    }

    struct NativeMethod {
        var name: String
        var definingDartClass: String
        var args: [(name: String, type: DartClass.DartType)]
        var returnType: DartClass.DartType
        var isInExtension: Bool
    }

    public var nativeMethods: [NativeMethod] = []

    func declareExternVoid(_ symbol: String, params: [ForeignSetupParameter<DartClass.DartType>]) -> ((SourceFragment) -> Void) {
        { fragment in
            fragment.outputBlock("final \(symbol) = dylib.lookupFunction<", closeWith: ">('\(symbol)');") {
                fragment.outputBlock("ffi.Void Function(", closeWith: "),") {
                    fragment.output("Env env,")
                    for param in params {
                        fragment.output("\(param.type!.name()) \(param.name!),")
                    }
                    fragment.output("OutCreatedRef exn")
                }
                fragment.outputBlock("void Function(") {
                    fragment.output("Env env,")
                    for param in params {
                        fragment.output("\(param.type!.name()) \(param.name!),")
                    }
                    fragment.output("OutCreatedRef exn")
                }
            }
        }
    }

    func setupFragments(context: FishyJoesContext, generatedTypes: [BetterType]) -> [SourceFragment] {
        let fragment = context.dartFragment(
            "type_setup.dart",
            additionalImports: [
                "import 'package:path/path.dart' as path;",
                "import 'dart:io' show Platform, Directory;",
            ]
        )

        let moduleRegisterTypesFn = self.moduleRegisterTypesFn(context: context)
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
                    fragment.output("// print(\"setting up \(type.name) (env=0x${Loader.shared.env.address.toRadixString(16)})...\");")

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
                            fragment.output("Loader.shared.env,")
                            for param in setupParams {
                                param.valueWriter(fragment)
                            }
                            fragment.output("exn")
                        }
                    }
                }
            }
        }

        for nativeMethod in nativeMethods.sorted(by: { $0.name < $1.name }) {
            let definingDartClass = nativeMethod.definingDartClass + (nativeMethod.isInExtension ? "_DefaultImplementations" : "")
            externDeclarations.append { fragment in
                fragment.outputBlock("\(definingDartClass).f\(nativeMethod.name) = dylib.lookupFunction<", closeWith: ">", newLineTerminated: false) {
                    fragment.outputBlock("\(nativeMethod.returnType.ffiCreatedTag) Function(", closeWith: "),") {
                        fragment.output("Env env,")
                        for (argName, argType) in nativeMethod.args {
                            fragment.output("\(argType.ffiUnownedTag) \(argName),")
                        }
                        fragment.output("OutCreatedRef _exn")
                    }
                    fragment.outputBlock("\(nativeMethod.returnType.ffiCreatedName) Function(") {
                        fragment.output("Env env,")
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
            fragment.output("FishyJoesRuntime.Loader.shared.ensureLoaded;")
            for dependency in context.module.dependencies {
                fragment.output("\(dependency).ensureLoaded;")
            }
            fragment.blankLine()

            fragment.output("final dylib = Loader.openLibrary('\(context.module)-iota');")
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

        let exportsFragment = SourceFragment(sourceryDestination: "file:../../dart/lib/src/generated/_exports.dart")
        for dartClass in context.dartClasses {
            exportsFragment.output("export './\(dartClass.unqualifiedName).dart';")
        }

        return [fragment, exportsFragment]
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

        let returnType = context.resolve(type: method.returnType, generics: exportAnnotation.genericOverrides).dartType

        return .method(
            DartClass.Method(
                documentation: method.documentation,
                isStatic: method.isStatic,
                name: exportAnnotation.name,
                mangledName: "\(type.mangledName)_\(exportAnnotation.name.mangled)",
                parameters: parameters,
                returnType: method.isAsync ? .future(returnType) : returnType,
                deprecation: method.deprecation,
                body: nil,
                isInExtension: method.isInExtension
            )
        )
    }

    func dart(field: Variable, of type: TranslatedType, context: FishyJoesContext, useNativeName: Bool = false) -> DartClass.MethodOrVariable? {
        let dartName: String
        var asMethod = false

        if useNativeName {
            guard field.exportAnnotation == nil else {
                fatalErr("field \(field.name) should not be annotated, as it's in a type being exported memberwise")
            }
            dartName = field.name
        } else {
            guard let exportAnnotation = field.exportAnnotation else {
                return nil
            }
            asMethod = exportAnnotation.kind == .asMethod
            dartName = exportAnnotation.name
        }
        let resolved = context.resolve(type: field.typeName.better)
        return .variable(
            DartClass.Variable(
                documentation: field.documentation,
                isStatic: field.isStatic,
                isMutable: field.isMutable,
                isPubliclyWritable: field.isPubliclyWritable,
                asMethod: asMethod,
                name: dartName,
                mangledName: "\(type.mangledName)_\(dartName.mangled)",
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

import Foundation
import SourceryDataModel

final class PythonTranslator2: Translator {
    required init() {}

    func moduleRegisterTypesFn(context: FishyJoesContext) -> String {
        "FishyJoes_\(context.module.name.mangled)_registerTypes"
    }

    struct NativeMethod {
        var name: String
        var definingPythonClass: String
        var args: [(name: String, type: PythonClass2.PythonType)]
        var returnType: PythonClass2.PythonType
        var doDefaultImplementationsSuffix: Bool
    }

    public var nativeMethods: [NativeMethod] = []

    func declareExternVoid(_ symbol: String, params: [ForeignSetupParameter<PythonClass2.PythonType>]) -> ((SourceFragment) -> Void) {
        { fragment in
        }
    }

    func setupFragments(context: FishyJoesContext, generatedTypes: [BetterType]) -> [SourceFragment] {
        let cAPIFragment = context.pythonFragment("_c_api.py", additionalImports: ["import importlib"])
        let libVar = "_\(context.module.pythonPackageName)_lib"

        cAPIFragment.output("_resources = importlib.resources.files('\(context.module.pythonPackageName)')")
        cAPIFragment.output("fishyjoes_runtime.ffi.cdef((_resources / '_declarations.h').read_text('utf-8'))")
        cAPIFragment.output("\(libVar) = fishyjoes_runtime.ffi.dlopen(str(_resources / 'native' / 'lib\(context.module)-iota.dylib'))")
        cAPIFragment.output("__all__ = [ '_\(context.module.pythonPackageName)_lib' ]")

        let fragment = context.pythonFragment("fishyjoes_type_setup.py", additionalImports: ["from ._c_api import \(libVar)"])

        let moduleRegisterTypesFn = self.moduleRegisterTypesFn(context: context)
        var externDeclarations: [(SourceFragment) -> Void] = []

        var initializerWriters: [() -> Void] = []
        for type in generatedTypes {
            let resolved = context.resolve(type: type)

            let setupParams = resolved.pythonSetupParameters(in: context)
            let setupTypeAliases = resolved.pythonSetupTypeAliases(in: context)

            setupTypeAliases.forEach { fragment.output($0) }

            if resolved.definingModule == context.module {
                precondition(!setupParams.contains(where: \.isTypeParameter), "unexpected type parameter in \(type.name)")
                externDeclarations.append(
                    { fragment in
                        fragment.outputBlock("\(resolved.iotaSetupName): typing.Callable[[", closeWith: "], None]", newLineTerminated: false) {
                            fragment.output("fishyjoes_runtime.EnvRef,")
                            for param in setupParams {
                                fragment.output("\(param.type!.static.name()),")
                            }
                        }
                        fragment.output(" = fishyjoes_runtime.raise_by_out_ref(getattr(\(libVar), '\(resolved.iotaSetupName)'))")
                    }
                )
            } else if !type.isGeneric {
                // non-generic types are sufficiently set up by defining module
                continue
            }

            initializerWriters.append {
                fragment.output("@fishyjoes_runtime.eval_once_now('setup_\(resolved.converterType.name)')")
                fragment.outputBlock("def setup_\(resolved.converterType.name.mangled)() -> None:") {
                    fragment.output("print(f\"setting up \(type.name)\")")
                    let setupName = "\(resolved.definingModule.pythonPackageName).fishyjoes_type_setup.\(resolved.iotaSetupName)"
                    fragment.outputBlock("\(setupName)(") {
                        fragment.output("fishyjoes_runtime.Runtime.shared.env_ref,")
                        for param in setupParams {
                            param.valueWriter(fragment)
                        }
                    }
                }
            }
        }

        for nativeMethod in nativeMethods.sorted(by: { $0.name < $1.name }) {
            let definingPythonClass = nativeMethod.definingPythonClass + (nativeMethod.doDefaultImplementationsSuffix ? "_DefaultImplementations" : "")
            externDeclarations.append { fragment in
                fragment.outputBlock("\(definingPythonClass).f\(nativeMethod.name) = dylib.lookupFunction<", closeWith: ">", newLineTerminated: false) {
                    fragment.outputBlock("\(nativeMethod.returnType.static.ffiCreatedType.name()) Function(", closeWith: "),") {
                        fragment.output("Env env,")
                        for (argName, argType) in nativeMethod.args {
                            fragment.output("\(argType.static.ffiUnownedType.name()) \(argName),")
                        }
                        fragment.output("OutCreatedRef _exn")
                    }
                    fragment.outputBlock("\(nativeMethod.returnType.static.ffiCreatedType.name()) Function(") {
                        fragment.output("Env env,")
                        for (argName, argType) in nativeMethod.args {
                            fragment.output("\(argType.static.ffiUnownedType.name()) \(argName),")
                        }
                        fragment.output("OutCreatedRef _exn")
                    }
                }
                fragment.output("(\"\(nativeMethod.name)\")")
            }
        }

        fragment.blankLine()
        for externDeclaration in externDeclarations {
            externDeclaration(fragment)
        }

        fragment.blankLine()
        fragment.output("@fishyjoes_runtime.lazy_once(\"\(context.module.pythonPackageName)_setup\")")
        fragment.outputBlock("def ensure_loaded() -> None:") {
            fragment.output("fishyjoes_runtime.ensure_loaded()")
            for dependency in context.module.dependencies {
                fragment.output("\(dependency).fishyjoes_type_setup.ensure_loaded()")
            }

            fragment.blankLine()
            fragment.output("getattr(\(libVar), '\(moduleRegisterTypesFn)')()")

            fragment.outputBlock("with fishyjoes_runtime.CStringBag() as string_bag:") {
                fragment.blankLine()
                for writer in initializerWriters {
                    writer()
                    fragment.blankLine()
                }
            }
        }

        let pythonRootDir = "python/generated/src/\(context.module.pythonPackageName)"
        let internalExportedName = "_\(context.module.pythonPackageName)_exported"
        var initFragments: [[String]: SourceFragment] = [:]

        // mapping from nested namespaces to the exported, unqualified names in the namespace
        var exportedNamesByNamespace: [[String]: [(unqualifiedName: String, importLocation: String)]] = [:]
        exportedNamesByNamespace[[]] = [(unqualifiedName: "fishyjoes_type_setup", importLocation: ".")]

        for cls in context.pythonClasses {
            if let namespace = cls.associatedNamespace {
                exportedNamesByNamespace[cls.namespaces, default: []].append((namespace, "."))
            }
            exportedNamesByNamespace[cls.namespaces, default: []]
                .append((cls.unqualifiedName, ".\(cls.typeDefinitionModuleName)"))
        }

        for (namespace, names) in exportedNamesByNamespace {
            let namespacePath = ([pythonRootDir] + namespace).joined(separator: "/")
            let namespaceInitFragment = SourceFragment(destinationPath: "\(namespacePath)/__init__.py")
            initFragments[namespace] = namespaceInitFragment

            for (name, importLocation) in names {
                context.addHeader(to: namespaceInitFragment, "from \(importLocation) import \(name)")
            }
            namespaceInitFragment.outputBlock("__all__: list[str] = [") {
                for (name, _) in names {
                    namespaceInitFragment.output("\"\(name)\",")
                }
            }
        }

        // Duplicate top-level init.py into _module_exported.py so that both internal and external code can refer to `module.thing`
        let internalExportedFragment = context.duplicate(
            fragment: initFragments[[]]!,
            to: "\(pythonRootDir)/\(internalExportedName).py"
        )

        return [fragment, cAPIFragment, internalExportedFragment] + initFragments.values
    }

    func python(method: Method, of type: TranslatedType, context: FishyJoesContext) -> PythonClass2.MethodOrVariable? {
        let exportAnnotation = method.exportAnnotation
        var omitParameters = Set(exportAnnotation.omitParameters)
        var parameters: [(labelComment: String?, name: String, type: PythonClass2.PythonType, defaultValue: String?)] = []
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
                if let pythonDefaultValue = python(value: swiftDefaultValue) {
                    defaultValue = pythonDefaultValue
                } else {
                    context.warnMissingDefault(parameter: parameter, in: method)
                }
            }
            parameters.append((label, parameter.name, resolved.pythonType, defaultValue))
        }

        let returnType = context.resolve(type: method.returnType, generics: exportAnnotation.genericOverrides).pythonType

        return .method(
            PythonClass2.Method(
                documentation: method.documentation,
                isStatic: method.isStatic,
                name: exportAnnotation.name,
                mangledName: "\(type.mangledName)_\(exportAnnotation.name.mangled)",
                parameters: parameters,
                returnType: method.isAsync ? .future(returnType) : returnType,
                deprecation: method.deprecation,
                body: nil,
                isDefaultImplementation: method.isDefaultImplementation
            )
        )
    }

    func python(field: Field, of type: TranslatedType, context: FishyJoesContext, useNativeName: Bool = false) -> PythonClass2.MethodOrVariable? {
        let pythonName: String
        var asMethod = false

        if useNativeName {
            guard field.exportAnnotation == nil else {
                fatalErr("field \(field.name) should not be annotated, as it's in a type being exported memberwise")
            }
            pythonName = PythonClass2.deforbidify(field.name, localVar: false)
        } else {
            guard let exportAnnotation = field.exportAnnotation else {
                return nil
            }
            asMethod = exportAnnotation.kind == .asMethod
            pythonName = exportAnnotation.name
        }
        let resolved = context.resolve(type: field.type)
        return .variable(
            PythonClass2.Variable(
                documentation: field.documentation,
                isStatic: field.isStatic,
                isMutable: field.isMutable,
                isPubliclyWritable: field.isPubliclyWritable,
                asMethod: asMethod,
                name: pythonName,
                mangledName: "\(type.mangledName)_\(pythonName.mangled)",
                type: resolved.pythonType,
                deprecation: field.deprecation,
                isDefaultImplementation: field.isDefaultImplementation
            )
        )
    }

    func python(value: String) -> String? {
        guard let expression = SwiftDefaultExpression.parse(value) else {
            return nil
        }

        switch expression {
        case .nilLiteral:
            return "None"
        case let .boolLiteral(value):
            return value ? "True" : "False"
        case let .integerLiteral(value), let .floatingPointLiteral(value):
            return value
        case .memberAccess:
            return expression.swiftIntegerLimitValue ?? expression.swiftFloatingPointConstantLiteral
        case .call:
            return expression.swiftFloatingPointConstantLiteral
        case .implicitMember:
            return nil
        }
    }
}

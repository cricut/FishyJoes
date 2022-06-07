import Darwin
import Foundation
import SourceryRuntime

struct DartTranslator: Translator {
    init() {}

    func output(getter variable: Variable, context: FishyJoesContext, fragment: SourceFragment) {
        guard let exportAnnotation = variable.exportAnnotation else {
            fatalErr("Variable not annotated for export: \(variable)")
        }
        let dartName = exportAnnotation.name

        let selfExpression: String
        let containingNamespace: String

        if let selfType = variable.definedInTypeName?.better {
            containingNamespace = context.resolve(type: selfType).sourceType.name

            if variable.isStatic {
                selfExpression = containingNamespace
            } else {
                selfExpression = "env.this(converter: \(containingNamespace).self)"
            }
        } else {
            containingNamespace = context.module.name
            selfExpression = context.module.name
        }

        fragment.outputBlock("{ env, info in", closeWith: "}", newLineTerminated: false) {
            fragment.outputBlock("FishyJoesDartRuntime.callbackBody(env, info, name: \"\(dartName)\", expectedArgumentCount: 0) { env in", closeWith: "}") {
                let resolved = context.resolve(type: variable.typeName.better)
                fragment.output("try \(resolved.converterType.name).toDart(\(selfExpression).\(variable.name), env: env.env)")
            }
        }
    }

    func output(setter variable: Variable, context: FishyJoesContext, fragment: SourceFragment) {
        guard let exportAnnotation = variable.exportAnnotation else {
            fatalErr("Variable not annotated for export: \(variable)")
        }
        guard variable.isMutable, variable.accessLevel.write == .public else {
            fragment.output("nil")
            return
        }
        let dartName = exportAnnotation.name

        let selfExpression: String
        let containingNamespace: String

        if let selfType = variable.definedInTypeName?.better {
            containingNamespace = context.resolve(type: selfType).sourceType.name

            if variable.isStatic {
                selfExpression = containingNamespace
            } else {
                selfExpression = "env.this(converter: \(containingNamespace).self)"
            }
        } else {
            containingNamespace = context.module.name
            selfExpression = context.module.name
        }

        fragment.outputBlock("{ env, info in", closeWith: "}", newLineTerminated: false) {
            fragment.outputBlock("FishyJoesDartRuntime.callbackBody(env, info, name: \"\(dartName)\", expectedArgumentCount: 1) { env in", closeWith: "}") {
                let resolved = context.resolve(type: variable.typeName.better)
                if variable.isStatic {
                    fragment.output("\(selfExpression).\(variable.name) = try env.argument(at: 0, converter: \(resolved.converterType.name).self)")
                } else {
                    fragment.output("var mutatingSelf = try \(selfExpression)")
                    fragment.output("mutatingSelf.\(variable.name) = try env.argument(at: 0, converter: \(resolved.converterType.name).self)")
                    fragment.output("try \(containingNamespace).mutateDart(mutatingSelf, this: env.this(), env: env.env)")
                }
                fragment.output("return nil")
            }
        }
    }

    func output(method: Method, context: FishyJoesContext, fragment: SourceFragment, newLineTerminated: Bool = true) {
        let exportAnnotation = method.exportAnnotation
        let dartName = exportAnnotation.name

        var selfExpression: String
        let containingNamespace: String

        if let selfType = method.definedIn {
            containingNamespace = context.resolve(type: selfType).sourceType.name

            if method.isStatic {
                selfExpression = containingNamespace
            } else {
                selfExpression = "env.this(converter: \(containingNamespace).self)"
            }
        } else {
            containingNamespace = context.module.name
            selfExpression = context.module.name
        }

        let returnType = context.resolve(type: method.returnType, generics: exportAnnotation.genericOverrides)

        fragment.outputBlock("{ env, info in", closeWith: "}", newLineTerminated: newLineTerminated) {
            fragment.outputBlock("FishyJoesDartRuntime.callbackBody(env, info, name: \"\(dartName)\", expectedArgumentCount: \(method.parameters.count)) { env in", closeWith: "}") {
                let callName = method.sourceKind == .initializer ? "" : ".\(method.callName)"

                if method.isMutating {
                    fragment.output("var mutatingSelf = try \(selfExpression)")
                    selfExpression = "mutatingSelf"
                }

                fragment.outputBlock("let result = try \(returnType.converterType.name).toDart(") {
                    fragment.outputBlock("\(selfExpression)\(callName)(", closeWith: "),") {
                        fragment.outputMap(method.parameters.enumerated(), separator: ",") {
                            let (index, formal) = $0
                            let resolved = context.resolve(type: formal.type, generics: exportAnnotation.genericOverrides)
                            let result = (formal.label.map { "\($0): " } ?? "") + "try env.argument(at: \(index), "
                            return result + "converter: \(resolved.converterType.name).self)"
                        }
                    }
                    fragment.output("env: env.env")
                }
                if method.isMutating {
                    fragment.output("try Self.mutateDart(mutatingSelf, this: env.this(), env: env.env)")
                }
                fragment.output("return result")
            }
        }
    }

    func outputProperties(methods: [Method], context: FishyJoesContext, fragment: SourceFragment) -> Bool {
        for method in methods {
            fragment.outputBlock("\"\(method.exportAnnotation.name)\": (", closeWith: "),") {
                fragment.output(".method ", newLineTerminated: false)
                output(method: method, context: context, fragment: fragment, newLineTerminated: false)
                fragment.output(",")
                fragment.output("isStatic: \(method.isStatic)")
            }
        }
        return !methods.isEmpty
    }

    func outputProperties(computedVariables: [Variable], context: FishyJoesContext, fragment: SourceFragment) -> Bool {
        var didOutput = false
        for variable in computedVariables {
            guard let exportAnnotation = variable.exportAnnotation else {
                continue
            }
            let dartName = exportAnnotation.name
            fragment.outputBlock("\"\(dartName)\": (", closeWith: "),") {
                fragment.outputBlock(".accessor(", closeWith: "),") {
                    fragment.output("getter: ", newLineTerminated: false)
                    output(getter: variable, context: context, fragment: fragment)
                    fragment.output(",")
                    fragment.output("setter: ", newLineTerminated: false)
                    output(setter: variable, context: context, fragment: fragment)
                }
                fragment.output("isStatic: \(variable.isStatic)")
            }
            didOutput = true
        }
        return didOutput
    }

    func setupFragments(context: FishyJoesContext, generatedTypes: Set<BetterType>) -> [SourceFragment] {
        let dartFragment = SourceFragment(sourceryDestination: "file:../../dart/generated/type_setup.dart")

        dartFragment.output("import 'dart:ffi' as ffi;")
        dartFragment.output("import 'dart:io' show Platform, Directory;")
        dartFragment.blankLine()
        dartFragment.output("import 'package:path/path.dart' as path;")
        dartFragment.blankLine()

        dartFragment.outputBlock("void _ensureLoaded = (() {", closeWith: "})();") {
            dartFragment.output("final libraryPath = path.join(Directory.current.path, 'binaries', 'lib\(context.module).dylib');")
            dartFragment.output("final dylib = ffi.DynamicLibrary.open(libraryPath);")
            dartFragment.outputBlock("dylib.lookupFunction<", closeWith: ">", newLineTerminated: false) {
                dartFragment.output("ffi.Void Function(ffi.Pointer<ffi.Void>),")
                dartFragment.output("void Function(ffi.Pointer<ffi.Void>)")
            }
            dartFragment.output("('dart_dl_initialize')(ffi.NativeApi.initializeApiDLData);")

            for type in generatedTypes.sorted(by: { "\($0)" < "\($1)" }) {
                guard case .named = type, !(context.resolve(type: type) is ExternalTranslatedType) else { continue }
                dartFragment.output("dylib.lookupFunction<>('setup_\(type.mangledName)')()")
            }
        }

        let exportFragment = SourceFragment(sourceryDestination: "file:DartInterface/@_exported.swift")
        exportFragment.output("@_exported import \(context.module.name)")
        for dependency in context.module.dependencies {
            exportFragment.output("@_exported import \(dependency)_DartInterface")
        }

        return [dartFragment, exportFragment]
    }
}

// import Darwin
// import Foundation
// import SourceryRuntime

// struct DartTranslator: Translator {
//     init() {}

//     func output(getter variable: Variable, context: FishyJoesContext, fragment: SourceFragment) {
//         guard let exportAnnotation = variable.exportAnnotation else {
//             fatalErr("Variable not annotated for export: \(variable)")
//         }
//         let dartName = exportAnnotation.name

//         let selfExpression: String
//         let containingNamespace: String

//         if let selfType = variable.definedInTypeName?.better {
//             containingNamespace = context.resolve(type: selfType).sourceType.name

//             if variable.isStatic {
//                 selfExpression = containingNamespace
//             } else {
//                 selfExpression = "env.this(converter: \(containingNamespace).self)"
//             }
//         } else {
//             containingNamespace = context.module.name
//             selfExpression = context.module.name
//         }

//         fragment.outputBlock("{ env, info in", closeWith: "}", newLineTerminated: false) {
//             fragment.outputBlock("FishyJoesDartRuntime.callbackBody(env, info, name: \"\(dartName)\", expectedArgumentCount: 0) { env in", closeWith: "}") {
//                 let resolved = context.resolve(type: variable.typeName.better)
//                 fragment.output("try \(resolved.converterType.name).toDart(\(selfExpression).\(variable.name), env: env.env)")
//             }
//         }
//     }

//     func output(setter variable: Variable, context: FishyJoesContext, fragment: SourceFragment) {
//         guard let exportAnnotation = variable.exportAnnotation else {
//             fatalErr("Variable not annotated for export: \(variable)")
//         }
//         guard variable.isMutable, variable.accessLevel.write == .public else {
//             fragment.output("nil")
//             return
//         }
//         let dartName = exportAnnotation.name

//         let selfExpression: String
//         let containingNamespace: String

//         if let selfType = variable.definedInTypeName?.better {
//             containingNamespace = context.resolve(type: selfType).sourceType.name

//             if variable.isStatic {
//                 selfExpression = containingNamespace
//             } else {
//                 selfExpression = "env.this(converter: \(containingNamespace).self)"
//             }
//         } else {
//             containingNamespace = context.module.name
//             selfExpression = context.module.name
//         }

//         fragment.outputBlock("{ env, info in", closeWith: "}", newLineTerminated: false) {
//             fragment.outputBlock("FishyJoesDartRuntime.callbackBody(env, info, name: \"\(dartName)\", expectedArgumentCount: 1) { env in", closeWith: "}") {
//                 let resolved = context.resolve(type: variable.typeName.better)
//                 if variable.isStatic {
//                     fragment.output("\(selfExpression).\(variable.name) = try env.argument(at: 0, converter: \(resolved.converterType.name).self)")
//                 } else {
//                     fragment.output("var mutatingSelf = try \(selfExpression)")
//                     fragment.output("mutatingSelf.\(variable.name) = try env.argument(at: 0, converter: \(resolved.converterType.name).self)")
//                     fragment.output("try \(containingNamespace).mutateDart(mutatingSelf, this: env.this(), env: env.env)")
//                 }
//                 fragment.output("return nil")
//             }
//         }
//     }

//     func output(method: Method, context: FishyJoesContext, fragment: SourceFragment, newLineTerminated: Bool = true) {
//         let exportAnnotation = method.exportAnnotation
//         let dartName = exportAnnotation.name

//         var selfExpression: String
//         let containingNamespace: String

//         if let selfType = method.definedIn {
//             containingNamespace = context.resolve(type: selfType).sourceType.name

//             if method.isStatic {
//                 selfExpression = containingNamespace
//             } else {
//                 selfExpression = "env.this(converter: \(containingNamespace).self)"
//             }
//         } else {
//             containingNamespace = context.module.name
//             selfExpression = context.module.name
//         }

//         let returnType = context.resolve(type: method.returnType, generics: exportAnnotation.genericOverrides)

//         fragment.outputBlock("{ env, info in", closeWith: "}", newLineTerminated: newLineTerminated) {
//             fragment.outputBlock("FishyJoesDartRuntime.callbackBody(env, info, name: \"\(dartName)\", expectedArgumentCount: \(method.parameters.count)) { env in", closeWith: "}") {
//                 let callName = method.sourceKind == .initializer ? "" : ".\(method.callName)"

//                 if method.isMutating {
//                     fragment.output("var mutatingSelf = try \(selfExpression)")
//                     selfExpression = "mutatingSelf"
//                 }

//                 fragment.outputBlock("let result = try \(returnType.converterType.name).toDart(") {
//                     fragment.outputBlock("\(selfExpression)\(callName)(", closeWith: "),") {
//                         fragment.outputMap(method.parameters.enumerated(), separator: ",") {
//                             let (index, formal) = $0
//                             let resolved = context.resolve(type: formal.type, generics: exportAnnotation.genericOverrides)
//                             let result = (formal.label.map { "\($0): " } ?? "") + "try env.argument(at: \(index), "
//                             return result + "converter: \(resolved.converterType.name).self)"
//                         }
//                     }
//                     fragment.output("env: env.env")
//                 }
//                 if method.isMutating {
//                     fragment.output("try Self.mutateDart(mutatingSelf, this: env.this(), env: env.env)")
//                 }
//                 fragment.output("return result")
//             }
//         }
//     }

//     func outputProperties(methods: [Method], context: FishyJoesContext, fragment: SourceFragment) -> Bool {
//         for method in methods {
//             fragment.outputBlock("\"\(method.exportAnnotation.name)\": (", closeWith: "),") {
//                 fragment.output(".method ", newLineTerminated: false)
//                 output(method: method, context: context, fragment: fragment, newLineTerminated: false)
//                 fragment.output(",")
//                 fragment.output("isStatic: \(method.isStatic)")
//             }
//         }
//         return !methods.isEmpty
//     }

//     func outputProperties(computedVariables: [Variable], context: FishyJoesContext, fragment: SourceFragment) -> Bool {
//         var didOutput = false
//         for variable in computedVariables {
//             guard let exportAnnotation = variable.exportAnnotation else {
//                 continue
//             }
//             let dartName = exportAnnotation.name
//             fragment.outputBlock("\"\(dartName)\": (", closeWith: "),") {
//                 fragment.outputBlock(".accessor(", closeWith: "),") {
//                     fragment.output("getter: ", newLineTerminated: false)
//                     output(getter: variable, context: context, fragment: fragment)
//                     fragment.output(",")
//                     fragment.output("setter: ", newLineTerminated: false)
//                     output(setter: variable, context: context, fragment: fragment)
//                 }
//                 fragment.output("isStatic: \(variable.isStatic)")
//             }
//             didOutput = true
//         }
//         return didOutput
//     }

//     func setupFragments(context: FishyJoesContext, generatedTypes: Set<BetterType>) -> [SourceFragment] {
//         let dartFragment = SourceFragment(sourceryDestination: "file:../../dart/generated/type_setup.dart")

//         dartFragment.output("import 'dart:ffi' as ffi;")
//         dartFragment.output("import 'dart:io' show Platform, Directory;")
//         dartFragment.blankLine()
//         dartFragment.output("import 'package:path/path.dart' as path;")
//         dartFragment.blankLine()

//         dartFragment.outputBlock("void _ensureLoaded = (() {", closeWith: "})();") {
//             dartFragment.output("final libraryPath = path.join(Directory.current.path, 'binaries', 'lib\(context.module).dylib');")
//             dartFragment.output("final dylib = ffi.DynamicLibrary.open(libraryPath);")
//             dartFragment.outputBlock("dylib.lookupFunction<", closeWith: ">", newLineTerminated: false) {
//                 dartFragment.output("ffi.Void Function(ffi.Pointer<ffi.Void>),")
//                 dartFragment.output("void Function(ffi.Pointer<ffi.Void>)")
//             }
//             dartFragment.output("('dart_dl_initialize')(ffi.NativeApi.initializeApiDLData);")

//             for type in generatedTypes.sorted(by: { "\($0)" < "\($1)" }) {
//                 guard case .named = type, !(context.resolve(type: type) is ExternalTranslatedType) else { continue }
//                 dartFragment.output("dylib.lookupFunction<>('setup_\(type.mangledName)')()")
//             }
//         }

//         let exportFragment = SourceFragment(sourceryDestination: "file:DartInterface/@_exported.swift")
//         exportFragment.output("@_exported import \(context.module.name)")
//         for dependency in context.module.dependencies {
//             exportFragment.output("@_exported import \(dependency)_DartInterface")
//         }

//         return [dartFragment, exportFragment]
//     }
// }

import Foundation
import SourceryRuntime

final class DartTranslator: Translator {
    required init() {}

    func translate(method: Method, context: FishyJoesContext) -> [SourceFragment] {
        let exportAnnotation = method.exportAnnotation

        var selfExpression: String
        let containingNamespace: String

        if let selfType = method.definedIn {
            let resolved = context.resolve(type: selfType)
            containingNamespace = resolved.sourceType.name

            if method.isStatic {
                selfExpression = containingNamespace
            } else {
                selfExpression = "\(resolved.converterType.name).peekDart(_dartThis)"
            }
        } else {
            containingNamespace = context.module.name
            selfExpression = context.module.name
        }

        var formals: [(name: String, type: String)] = []
        if !method.isStatic {
            formals.append((name: "_dartThis", type: "dartObject"))
        }
        formals.append(
            contentsOf: method.parameters.map { parameter in
                let resolved = context.resolve(type: parameter.type, generics: exportAnnotation.genericOverrides)
                return (name: parameter.name, type: resolved.converterType.name + ".CType")
            }
        )
        formals.append((name: "_exn", type: "dartOutExn"))

        let fragment = context.swiftFragment(
            "DartInterface/\(containingNamespace)+dart-methods.swift",
            additionalImports: ["Foundation", "FishyJoesDartRuntime"]
        )
        fragment.output("// Generated by FishyJoes for `\(containingNamespace).\(method.name)`")
        let returnType = context.resolve(type: method.returnType, generics: exportAnnotation.genericOverrides)
        let returnSignature = "\(returnType.converterType.name).CType"

        let cMethod = "__dart_\(containingNamespace)_\(exportAnnotation.name)".mangled
        if let deprecation = method.deprecation {
            fragment.output(deprecation.swiftDeprecation)
        }
        fragment.output("@_cdecl(\"\(cMethod)\")")
        fragment.outputBlock("public func \(cMethod)(", newLineTerminated: false) {
            fragment.outputMap(formals, separator: ",") { formal in
                "\(formal.name): \(formal.type)"
            }
        }
        fragment.outputBlock(" -> \(returnSignature) {") {
            fragment.outputBlock("FishyJoesDartRuntime.Env.catching(to: _exn) {") {
                let callName = method.sourceKind == .initializer ? "" : ".\(method.callName)"

                var mutateBlock: (() -> Void) -> Void = { $0() }
                if method.isMutating {
                    mutateBlock = { body in
                        fragment.outputBlock("return try \(containingNamespace).mutateDart(_dartThis) { mutatingSelf in", closeWith: "}") {
                            body()
                        }
                    }
                    selfExpression = "mutatingSelf"
                }

                mutateBlock {
                    fragment.outputBlock(exportAnnotation.noReturn ? "try (" : "return try \(returnType.converterType.name).toDart(") {
                        fragment.outputBlock("\(selfExpression)\(callName)(") {
                            fragment.outputMap(method.parameters, separator: ",") { formal in
                                let resolved = context.resolve(type: formal.type, generics: exportAnnotation.genericOverrides)
                                return (formal.label.map { "\($0): " } ?? "") +
                                    "try \(resolved.converterType.name).peekDart(\(formal.name))"
                            }
                        }
                    }
                }
            }
        }

        return [fragment]
    }

    func translate(variable: Variable, context: FishyJoesContext) -> [SourceFragment] {
        guard let exportAnnotation = variable.exportAnnotation else {
            return []
        }
        let selfExpression: String
        let containingNamespace: String

        if let selfType = variable.definedInTypeName?.better {
            containingNamespace = context.resolve(type: selfType).sourceType.name

            if variable.isStatic {
                selfExpression = containingNamespace
            } else {
                selfExpression = "\(containingNamespace).peekDart(_dartThis)"
            }
        } else {
            containingNamespace = context.module.name
            selfExpression = context.module.name
        }

        let dartName = exportAnnotation.name
        let dartGetName = "__dart_\(exportAnnotation.kind == .asMethod ? "" : "get_")\(containingNamespace)_\(dartName)".mangled
        let dartSetName = "__dart_set_\(containingNamespace)_\(dartName)".mangled

        let fragment = context.swiftFragment(
            "DartInterface/\(containingNamespace)+dart-methods.swift",
            additionalImports: ["Foundation", "FishyJoesDartRuntime"]
        )

        let resolved = context.resolve(type: variable.typeName.better)
        let converterName = resolved.converterType.name
        let cType = "\(converterName).CType"

        // Getter
        let formals = (variable.isStatic ? [] : [(name: "_dartThis", type: "dartObject")]) + [
            (name: "_exn", type: "dartOutExn"),
        ]

        fragment.output("// Generated by FishyJoes for `\(containingNamespace).\(variable.name)`")
        if let deprecation = variable.deprecation {
            fragment.output(deprecation.swiftDeprecation)
        }
        fragment.output("@_cdecl(\"\(dartGetName)\")")
        fragment.outputBlock("public func \(dartGetName)(", newLineTerminated: false) {
            fragment.outputMap(formals, separator: ",") { formal in
                "\(formal.name): \(formal.type)"
            }
        }
        fragment.outputBlock(" -> \(cType) {") {
            fragment.outputBlock("FishyJoesDartRuntime.Env.catching(to: _exn) {") {
                fragment.output("try \(converterName).toDart(\(selfExpression).\(variable.name))")
            }
        }

        // Setter
        if variable.isMutable, variable.accessLevel.write == .public {
            let formals = (variable.isStatic ? [] : [(name: "_dartThis", type: "dartObject")]) + [
                (name: "newValue", type: cType),
                (name: "_exn", type: "dartOutExn"),
            ]

            if let deprecation = variable.deprecation {
                fragment.output(deprecation.swiftDeprecation)
            }
            fragment.output("@_cdecl(\"\(dartSetName)\")")
            fragment.outputBlock("public func \(dartSetName)(", newLineTerminated: false) {
                fragment.outputMap(formals, separator: ",") { formal in
                    "\(formal.name): \(formal.type)"
                }
            }
            fragment.outputBlock(" {") {
                fragment.outputBlock("FishyJoesDartRuntime.Env.catching(to: _exn) {") {
                    if variable.isStatic {
                        fragment.output("\(selfExpression).\(variable.name) = try \(converterName).peekDart(newValue)")
                    } else {
                        fragment.outputBlock("try \(containingNamespace).mutateDart(_dartThis) { value in", closeWith: "}") {
                            fragment.output("value.\(variable.name) = try \(converterName).peekDart(newValue)")
                        }
                    }
                }
            }
        }

        return [fragment]
    }

    func setupFragments(context: FishyJoesContext, generatedTypes: Set<BetterType>) -> [SourceFragment] {
        let generatedTypes = generatedTypes.sorted { $0.name < $1.name }
        let fragment = SourceFragment(sourceryDestination: "file:../../dart/generated/type_setup.dart")
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

                    let setupParams = resolved.dartSetupParameters(in: context)
                    let setupDelegates = resolved.dartSetupDelegates(in: context)

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

        let swiftSetupFragment = context.swiftFragment(
            "DartInterface/TypeSetup.swift",
            additionalImports: ["Foundation", "FishyJoesDartRuntime"]
        )

        swiftSetupFragment.output("@_cdecl(\"\(moduleRegisterTypesFn)\")")
        swiftSetupFragment.outputBlock("public func \(moduleRegisterTypesFn)() {") {
            for type in generatedTypes {
                let resolved = context.resolve(type: type)
                swiftSetupFragment.output("Env.registerType(\(resolved.converterType.name).self, as: \"\(resolved.converterType.name)\")")
            }
        }

        let exportFragment = SourceFragment(sourceryDestination: "file:DartInterface/@_exported.swift")
        exportFragment.output("@_exported import \(context.module.name)")
        for dependency in context.module.dependencies {
            exportFragment.output("@_exported import \(dependency)_DartInterface")
        }

        return [fragment, swiftSetupFragment, exportFragment]
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
                isOverride: method.exportAnnotation.isOverride,
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
        var asMethod = false

        let isOverride = field.exportAnnotation?.isOverride ?? false

        if useNativeName {
            guard field.exportAnnotation == nil else {
                fatalErr("field \(field.name) should not be annotated, as it's in a type being exported memberwise")
            }
            dartName = field.name
        } else {
            guard let exportAnnotation = field.exportAnnotation else {
                return nil
            }
            asMethod = exportAnnotation.kind == .asMethod || (field.isComputed && !isOverride)
            dartName = exportAnnotation.name
        }
        let resolved = context.resolve(type: field.typeName.better)
        return .variable(
            DartClass.Variable(
                documentation: field.documentation,
                isStatic: field.isStatic,
                isOverride: isOverride,
                readOnly: !field.isMutable,
                asMethod: asMethod,
                name: dartName,
                mangledName: "\(type.mangledName)_\(dartName.mangled)",
                type: resolved.dartType,
                deprecation: field.deprecation
            )
        )
    }

    func defaultObjectMethods(for type: DartClass.DartType, members: [String]) -> [DartClass.Method] {
        [
            DartClass.Method(
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
            DartClass.Method(
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
            DartClass.Method(
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
            DartClass.Method(
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

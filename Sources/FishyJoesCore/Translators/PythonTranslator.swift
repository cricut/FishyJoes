import Foundation

final class PythonTranslator: Translator {
    required init() {}

    struct NativeType {
        let cType: String
        let conversion: String?
        let pythonType: PythonType
    }

    struct PythonType: Hashable {
        let annotation: String
        let imports: Set<PythonImport>

        static let any = PythonType(annotation: "Any")

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

    struct NativeStoredField {
        var pythonName: String
        let cName: String
        let cType: String
        let conversion: String
        let pythonType: PythonType
        let isMutable: Bool
    }

    struct NativeEnumCase {
        var pythonName: String
        let cName: String
        let className: String
        var values: [NativeEnumCaseValue]
    }

    struct NativeEnumCaseValue {
        var pythonName: String
        let cName: String
        let cType: String
        let conversion: String?
        let pythonType: PythonType
    }

    struct NativeField {
        var pythonName: String
        let cName: String
        let symbol: String
        let setterSymbol: String?
        let isStatic: Bool
        let returnType: String
        let returnConversion: String?
        let pythonReturnType: PythonType
        let deprecationMessage: String?
        let originName: String
    }

    struct NativeParameter {
        var pythonName: String
        let cName: String
        let cType: String
        let conversion: String?
        let pythonType: PythonType
        let defaultValue: String?
        let defaultValueImports: Set<PythonImport>
    }

    struct PythonDefaultValue {
        let expression: String
        let imports: Set<PythonImport>

        init(expression: String, imports: Set<PythonImport> = []) {
            self.expression = expression
            self.imports = imports
        }
    }

    struct NativeMethod {
        var pythonName: String
        let cName: String
        let symbol: String
        let isStatic: Bool
        var parameters: [NativeParameter]
        let returnType: String
        let returnConversion: String?
        let pythonReturnType: PythonType
        let deprecationMessage: String?
        let originName: String
    }

    struct PythonClass {
        let originName: String
        let moduleName: String
        let fileName: String
        let className: String
        let setupName: String?
        let setupKind: String?
        let equalsSymbol: String?
        let hashSymbol: String?
        let isValueHashable: Bool
        let storedFields: [NativeStoredField]
        let enumCases: [NativeEnumCase]
        let fields: [NativeField]
        let methods: [NativeMethod]
    }

    func setupFragments(context: FishyJoesContext, generatedTypes: [BetterType]) -> [SourceFragment] {
        var classes: [PythonClass] = []
        var declarations: Set<String> = []

        for type in generatedTypes.sorted(by: { $0.name < $1.name }) {
            let resolved = context.resolve(type: type)
            guard let pythonClass = self.pythonClass(for: resolved, context: context) else {
                continue
            }
            classes.append(pythonClass)
            for field in pythonClass.fields {
                let selfParam = field.isStatic ? [] : ["foreignObject _iotaThis"]
                let allParams = (["EnvRef envRef"] + selfParam + ["foreignOutExn _exn"]).joined(separator: ", ")
                declarations.insert("\(field.returnType) \(field.symbol)(\(allParams));")
                if let setterSymbol = field.setterSymbol {
                    let setterParams = (["EnvRef envRef"] + selfParam + ["\(field.returnType) newValue"] + ["foreignOutExn _exn"]).joined(separator: ", ")
                    declarations.insert("void \(setterSymbol)(\(setterParams));")
                }
            }
            for method in pythonClass.methods {
                let params = method.parameters.map { "\($0.cType) \($0.cName)" }
                let selfParam = method.isStatic ? [] : ["foreignObject _iotaThis"]
                let allParams = (["EnvRef envRef"] + selfParam + params + ["foreignOutExn _exn"]).joined(separator: ", ")
                declarations.insert("\(method.returnType) \(method.symbol)(\(allParams));")
            }
            if let setupName = pythonClass.setupName {
                switch pythonClass.setupKind {
                case "reference":
                    let constructorType = "\(pythonClass.className)ConstructorFn"
                    declarations.insert("typedef foreignObject (*\(constructorType))(void *ptr, foreignOutExn _exn);")
                    declarations.insert("void \(setupName)(EnvRef envRef, \(constructorType) constructorMethod, foreignOutExn _exn);")
                case "emptyValue":
                    let constructorType = "\(pythonClass.className)ConstructorFn"
                    declarations.insert("typedef foreignObject (*\(constructorType))(foreignOutExn _exn);")
                    declarations.insert("void \(setupName)(EnvRef envRef, \(constructorType) constructorMethod, foreignOutExn _exn);")
                case "value":
                    let constructorType = "\(pythonClass.className)ConstructorFn"
                    let constructorArgs = (pythonClass.storedFields.map { "\($0.cType) \($0.cName)" } + ["foreignOutExn _exn"]).joined(separator: ", ")
                    declarations.insert("typedef foreignObject (*\(constructorType))(\(constructorArgs));")
                    var setupArgs = ["EnvRef envRef", "\(constructorType) constructorMethod"]
                    for field in pythonClass.storedFields {
                        let getterType = "\(pythonClass.className)_\(field.cName)GetterFn"
                        declarations.insert("typedef \(field.cType) (*\(getterType))(foreignObject obj, foreignOutExn _exn);")
                        setupArgs.append("\(getterType) \(field.cName)Getter")
                        if field.isMutable {
                            let setterType = "\(pythonClass.className)_\(field.cName)SetterFn"
                            declarations.insert("typedef void (*\(setterType))(foreignObject obj, \(field.cType) newValue, foreignOutExn _exn);")
                            setupArgs.append("\(setterType) \(field.cName)Setter")
                        }
                    }
                    setupArgs.append("foreignOutExn _exn")
                    declarations.insert("void \(setupName)(\(setupArgs.joined(separator: ", ")));")
                case "enum":
                    let discriminatorType = "\(pythonClass.className)DiscriminatorFn"
                    declarations.insert("typedef int (*\(discriminatorType))(foreignObject obj, foreignOutExn _exn);")
                    var setupArgs = ["EnvRef envRef", "\(discriminatorType) discriminator"]
                    for enumCase in pythonClass.enumCases {
                        let constructorType = "\(pythonClass.className)_\(enumCase.cName)ConstructorFn"
                        let extractorType = "\(pythonClass.className)_\(enumCase.cName)ExtractorFn"
                        let constructorArgs = (enumCase.values.map { "\($0.cType) \($0.cName)" } + ["foreignOutExn _exn"]).joined(separator: ", ")
                        let extractorArgs = (["foreignObject obj"] + enumCase.values.map { "\($0.cType) *\($0.cName)" } + ["foreignOutExn _exn"]).joined(separator: ", ")
                        declarations.insert("typedef foreignObject (*\(constructorType))(\(constructorArgs));")
                        declarations.insert("typedef void (*\(extractorType))(\(extractorArgs));")
                        setupArgs.append("\(constructorType) \(enumCase.cName)_constructor")
                        setupArgs.append("\(extractorType) \(enumCase.cName)_extractor")
                    }
                    declarations.insert("void \(setupName)(\(setupArgs.joined(separator: ", ")));")
                case "protocol":
                    let constructorType = "\(pythonClass.className)ConstructorFn"
                    declarations.insert("typedef foreignObject (*\(constructorType))(void *ptr, foreignOutExn _exn);")
                    var setupArgs = ["EnvRef envRef", "\(constructorType) constructorMethod"]
                    for field in pythonClass.fields {
                        let getterType = "\(pythonClass.className)_\(field.cName)GetterFn"
                        declarations.insert("typedef \(field.returnType) (*\(getterType))(foreignObject obj, foreignOutExn _exn);")
                        setupArgs.append("\(getterType) \(field.cName)Getter")
                    }
                    for method in pythonClass.methods {
                        let callbackType = "\(pythonClass.className)_\(method.cName)MethodFn"
                        let callbackArgs = (["foreignObject obj"] + method.parameters.map { "\($0.cType) \($0.cName)" } + ["foreignOutExn _exn"]).joined(separator: ", ")
                        declarations.insert("typedef \(method.returnType) (*\(callbackType))(\(callbackArgs));")
                        setupArgs.append("\(callbackType) \(method.cName)")
                    }
                    setupArgs.append("foreignOutExn _exn")
                    declarations.insert("void \(setupName)(\(setupArgs.joined(separator: ", ")));")
                default:
                    break
                }
            }
            if let equalsSymbol = pythonClass.equalsSymbol {
                declarations.insert("bool \(equalsSymbol)(EnvRef envRef, foreignObject lhs, foreignObject rhs, foreignOutExn _exn);")
            }
            if let hashSymbol = pythonClass.hashSymbol {
                declarations.insert("int32_t \(hashSymbol)(EnvRef envRef, foreignObject _iotaThis, foreignOutExn _exn);")
            }
        }

        var fragments = classes.flatMap { pythonClass in
            [classFragment(pythonClass), classStubFragment(pythonClass)]
        }

        let exportsFragment = context.pythonFragment("_exports.py")
        exportsFragment.output("# THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT.")
        exportsFragment.blankLine()
        for pythonClass in classes.sorted(by: { $0.className < $1.className }) {
            exportsFragment.output("from .\(pythonClass.moduleName) import \(pythonClass.className)")
        }
        exportsFragment.blankLine()
        let exportedNames = classes.sorted(by: { $0.className < $1.className }).map { "\"\($0.className)\"" }
        exportsFragment.output("__all__ = [\(exportedNames.joined(separator: ", "))]")
        fragments.append(exportsFragment)

        let exportsStubFragment = context.pythonFragment("_exports.pyi")
        exportsStubFragment.output("# THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT.")
        exportsStubFragment.blankLine()
        for pythonClass in classes.sorted(by: { $0.className < $1.className }) {
            exportsStubFragment.output("from .\(pythonClass.moduleName) import \(pythonClass.className) as \(pythonClass.className)")
        }
        exportsStubFragment.blankLine()
        exportsStubFragment.output("__all__: list[str]")
        fragments.append(exportsStubFragment)

        let initStubFragment = context.pythonFragment("__init__.pyi")
        initStubFragment.output("# THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT.")
        initStubFragment.blankLine()
        initStubFragment.output("from typing import Any")
        initStubFragment.blankLine()
        for pythonClass in classes.sorted(by: { $0.className < $1.className }) {
            initStubFragment.output("from .\(pythonClass.moduleName) import \(pythonClass.className) as \(pythonClass.className)")
        }
        initStubFragment.blankLine()
        initStubFragment.output("SUPPORTED: bool")
        initStubFragment.output("ResultFailure: Any")
        initStubFragment.output("ResultSuccess: Any")
        initStubFragment.output("SwiftClosedRange: Any")
        initStubFragment.output("SwiftRange: Any")
        initStubFragment.output("def diagnostics() -> dict[str, Any]: ...")
        initStubFragment.output("__all__: list[str]")
        fragments.append(initStubFragment)

        let nativeStubTypes = Set(
            classes
                .flatMap { pythonStubImports(for: $0) }
                .filter { $0.isRelative && $0.moduleName == "_native" && !$0.className.isEmpty }
                .map(\.className)
        ).sorted()
        if !nativeStubTypes.isEmpty {
            let nativeStubFragment = context.pythonFragment("_native.pyi")
            nativeStubFragment.output("# THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT.")
            nativeStubFragment.blankLine()
            nativeStubFragment.output("from typing import Any")
            nativeStubFragment.blankLine()
            nativeStubFragment.output("SUPPORTED: bool")
            nativeStubFragment.output("def diagnostics(package_name: str | None = None) -> dict[str, Any]: ...")
            nativeStubFragment.output("def shutdown() -> None: ...")
            nativeStubFragment.blankLine()
            for typeName in nativeStubTypes {
                nativeStubFragment.output("class \(typeName): ...")
            }
            fragments.append(nativeStubFragment)
        }

        let pyTypedFragment = context.pythonFragment("py.typed")
        pyTypedFragment.output("")
        fragments.append(pyTypedFragment)

        let declarationsFragment = context.pythonFragment("_generated_declarations.h")
        declarationsFragment.output("/* THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT. */")
        declarationsFragment.blankLine()
        declarationsFragment.output("/*")
        declarationsFragment.output("ABI pointer conventions:")
        declarationsFragment.output("- calling-convention: cdecl for all exported functions and callback typedefs.")
        declarationsFragment.output("- nullability: EnvRef is nonnull; foreignOutExn is nonnull; foreignObject values are nonnull unless named optional or documented otherwise.")
        declarationsFragment.output("- ownership: foreignObject return values are created unless explicitly documented; foreignObject parameters are borrowed unless explicitly documented; foreignOutExn is nonnull and receives an optional created error object.")
        declarationsFragment.output("*/")
        declarationsFragment.blankLine()
        for declaration in declarations.sorted() {
            declarationsFragment.output(declaration)
        }
        fragments.append(declarationsFragment)

        return fragments
    }

    private func classFragment(_ pythonClass: PythonClass) -> SourceFragment {
        let fragment = SourceFragment(destinationPath: "python/generated/src/\(pythonClass.fileName)")
        let isAssociatedEnum = hasAssociatedValues(pythonClass)
        let runtimeImports = pythonRuntimeImports(for: pythonClass)
        fragment.output("# THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT.")
        fragment.blankLine()
        fragment.output("from __future__ import annotations")
        fragment.blankLine()
        if pythonClass.setupKind == "value" || isAssociatedEnum {
            fragment.output("from dataclasses import dataclass")
        }
        if pythonClass.setupKind == "enum" && !isAssociatedEnum {
            fragment.output("import enum")
        }
        for importedModule in runtimeImports where importedModule.className.isEmpty {
            fragment.output(pythonImportStatement(importedModule))
        }
        if pythonClass.setupKind == "value" || pythonClass.setupKind == "enum" || runtimeImports.contains(where: \.className.isEmpty) {
            fragment.blankLine()
        }
        fragment.output("from . import _native")
        for importedType in runtimeImports where !importedType.className.isEmpty && (!importedType.isRelative || importedType.className != pythonClass.className) {
            fragment.output(pythonImportStatement(importedType))
        }
        for importedType in runtimeImports where !importedType.isRelative && !importedType.className.isEmpty {
            fragment.output("_native.register_external_type(\(importedType.className))")
        }
        fragment.blankLine()
        for symbol in boundSymbols(for: pythonClass) {
            fragment.output("\(pythonFunctionName(for: symbol)) = _native.bind(\"\(symbol)\")")
        }
        if !boundSymbols(for: pythonClass).isEmpty {
            fragment.blankLine()
        }
        let baseClass: String
        switch pythonClass.setupKind {
        case "emptyValue":
            baseClass = "(_native.IotaObject)"
        case "reference":
            baseClass = "(_native.SwiftReference)"
        case "enum":
            baseClass = isAssociatedEnum ? "" : "(enum.Enum)"
        case "protocol":
            baseClass = "(_native.SwiftReference)"
        default:
            baseClass = ""
        }
        if pythonClass.setupKind == "value" {
            fragment.output(pythonClass.isValueHashable ? "@dataclass(unsafe_hash=True)" : "@dataclass")
        }
        fragment.output("class \(pythonClass.className)\(baseClass):")
        fragment.indent {
            let origins = ([("__type__", pythonClass.originName)] +
                pythonClass.fields.map { ($0.pythonName, $0.originName) } +
                pythonClass.methods.map { ($0.pythonName, $0.originName) })
                .sorted { $0.0 < $1.0 }
            fragment.output("__fishyjoes_origin__ = {")
            fragment.indent {
                for (name, origin) in origins {
                    fragment.output("\(pythonStringLiteral(name)): \(pythonStringLiteral(origin)),")
                }
            }
            fragment.output("}")
            if !pythonClass.enumCases.isEmpty || !pythonClass.fields.isEmpty || !pythonClass.methods.isEmpty || !pythonClass.storedFields.isEmpty {
                fragment.blankLine()
            }
            if pythonClass.setupKind == "enum" && !isAssociatedEnum {
                for enumCase in pythonClass.enumCases {
                    fragment.output("\(enumCase.pythonName) = \"\(enumCase.cName)\"")
                }
                if !pythonClass.enumCases.isEmpty, (!pythonClass.fields.isEmpty || !pythonClass.methods.isEmpty) {
                    fragment.blankLine()
                }
            } else if isAssociatedEnum {
                for enumCase in pythonClass.enumCases {
                    fragment.output("@classmethod")
                    let signature = enumCase.values.map(\.pythonName).joined(separator: ", ")
                    let allSignatureParams = signature.isEmpty ? "cls" : "cls, \(signature)"
                    fragment.output("def \(enumCase.pythonName)(\(allSignatureParams)):")
                    fragment.indent {
                        let args = enumCase.values.map(\.pythonName).joined(separator: ", ")
                        fragment.output("return \(enumCase.className)(\(args))")
                    }
                    fragment.blankLine()
                }
            }
            if pythonClass.setupKind == "value" {
                for field in pythonClass.storedFields {
                    fragment.output("\(field.pythonName): object")
                }
                if !pythonClass.storedFields.isEmpty, (!pythonClass.fields.isEmpty || !pythonClass.methods.isEmpty) {
                    fragment.blankLine()
                }
            }
            if pythonClass.fields.isEmpty, pythonClass.methods.isEmpty, pythonClass.storedFields.isEmpty, pythonClass.enumCases.isEmpty {
                fragment.output("pass")
            } else {
                for field in pythonClass.fields.sorted(by: { $0.pythonName < $1.pythonName }) {
                    let fieldFunction = pythonFunctionName(for: field.symbol)
                    if field.isStatic {
                        let valueExpression: String
                        if let returnConversion = field.returnConversion {
                            valueExpression = convertedInvocation(function: fieldFunction, args: [], conversion: returnConversion)
                        } else {
                            valueExpression = "_native.check(lambda exn: \(fieldFunction)(_native.env, exn))"
                        }
                        if let deprecationMessage = field.deprecationMessage {
                            fragment.output("\(field.pythonName) = _native.StaticProperty(lambda: _native.deprecated_getter(lambda: \(valueExpression), \"\(deprecationMessage)\"))")
                        } else if field.returnConversion != nil {
                            fragment.output("\(field.pythonName) = _native.StaticProperty(lambda: \(valueExpression))")
                        } else {
                            fragment.output("\(field.pythonName) = \(valueExpression)")
                        }
                    } else {
                        fragment.output("@property")
                        fragment.output("def \(field.pythonName)(self):")
                        fragment.indent {
                            if let deprecationMessage = field.deprecationMessage {
                                fragment.output("_native.warn_deprecated(\"\(deprecationMessage)\")")
                            }
                            if let receiverConversion = selfConversion(for: pythonClass) {
                                let returnConversion = field.returnConversion ?? "None"
                                fragment.output("return _native.call(\(fieldFunction), args=[self], arg_conversions=[\(receiverConversion)], return_conversion=\(returnConversion))")
                            } else if let returnConversion = field.returnConversion {
                                fragment.output("return \(convertedInvocation(function: fieldFunction, args: ["self._iota_ref"], conversion: returnConversion))")
                            } else {
                                fragment.output("return _native.check(lambda exn: \(fieldFunction)(_native.env, self._iota_ref, exn))")
                            }
                        }
                        if let setterSymbol = field.setterSymbol {
                            let setterFunction = pythonFunctionName(for: setterSymbol)
                            fragment.output("@\(field.pythonName).setter")
                            fragment.output("def \(field.pythonName)(self, value):")
                            fragment.indent {
                                if let deprecationMessage = field.deprecationMessage {
                                    fragment.output("_native.warn_deprecated(\"\(deprecationMessage)\")")
                                }
                                if let receiverConversion = selfConversion(for: pythonClass) {
                                    let conversion = field.returnConversion ?? "None"
                                    fragment.output("_native.call(\(setterFunction), args=[self, value], arg_conversions=[\(receiverConversion), \(conversion)])")
                                } else if field.returnConversion != nil {
                                    let conversion = field.returnConversion ?? "None"
                                    fragment.output("_native.call(\(setterFunction), args=[self._iota_ref, value], arg_conversions=[None, \(conversion)])")
                                } else {
                                    fragment.output("_native.check(lambda exn: \(setterFunction)(_native.env, self._iota_ref, value, exn))")
                                }
                            }
                        }
                    }
                }
                if !pythonClass.fields.isEmpty, !pythonClass.methods.isEmpty {
                    fragment.blankLine()
                }
                for method in pythonClass.methods.sorted(by: { $0.pythonName < $1.pythonName }) {
                    let methodFunction = pythonFunctionName(for: method.symbol)
                    let params = method.parameters.map(\.pythonName)
                    let conversions = method.parameters.map { $0.conversion ?? "None" }
                    let signatureParameters = method.parameters
                        .filter { $0.defaultValue == nil } +
                        method.parameters.filter { $0.defaultValue != nil }
                    let pythonParams = signatureParameters.map { parameter in
                        parameter.defaultValue.map { "\(parameter.pythonName)=\($0)" } ?? parameter.pythonName
                    }
                    let signatureParams = pythonParams.joined(separator: ", ")
                    if method.isStatic {
                        fragment.output("@staticmethod")
                    }
                    let allSignatureParams = method.isStatic ? signatureParams : (signatureParams.isEmpty ? "self" : "self, \(signatureParams)")
                    fragment.output("def \(method.pythonName)(\(allSignatureParams)):")
                    fragment.indent {
                        if let deprecationMessage = method.deprecationMessage {
                            fragment.output("_native.warn_deprecated(\"\(deprecationMessage)\")")
                        }
                        let receiverConversion = method.isStatic ? nil : selfConversion(for: pythonClass)
                        if method.returnConversion != nil || method.parameters.contains(where: { $0.conversion != nil }) || receiverConversion != nil {
                            let nativeArgs = method.isStatic ? params : [(receiverConversion == nil ? "self._iota_ref" : "self")] + params
                            let receiverConversions = method.isStatic ? [] : [receiverConversion ?? "None"]
                            let nativeConversions = receiverConversions + conversions
                            let args = nativeArgs.isEmpty ? "[]" : "[\(nativeArgs.joined(separator: ", "))]"
                            let returnConversion = method.returnConversion ?? "None"
                            fragment.output("return _native.call(\(methodFunction), args=\(args), arg_conversions=[\(nativeConversions.joined(separator: ", "))], return_conversion=\(returnConversion))")
                        } else {
                            let nativeArgs = method.isStatic ? params : ["self._iota_ref"] + params
                            let args = (nativeArgs + ["exn"]).joined(separator: ", ")
                            fragment.output("return _native.check(lambda exn: \(methodFunction)(_native.env, \(args)))")
                        }
                    }
                }
                if let equalsSymbol = pythonClass.equalsSymbol {
                    let equalsFunction = pythonFunctionName(for: equalsSymbol)
                    fragment.output("def __eq__(self, other):")
                    fragment.indent {
                        fragment.output("if not isinstance(other, \(pythonClass.className)):")
                        fragment.indent {
                            fragment.output("return False")
                        }
                        fragment.output("return bool(_native.check(lambda exn: \(equalsFunction)(_native.env, self._iota_ref, other._iota_ref, exn)))")
                    }
                }
                if let hashSymbol = pythonClass.hashSymbol {
                    let hashFunction = pythonFunctionName(for: hashSymbol)
                    fragment.output("def __hash__(self):")
                    fragment.indent {
                        fragment.output("return _native.check(lambda exn: \(hashFunction)(_native.env, self._iota_ref, exn))")
                    }
                }
            }
        }
        if isAssociatedEnum {
            for enumCase in pythonClass.enumCases {
                fragment.blankLine()
                fragment.output("@dataclass(frozen=True)")
                fragment.output("class \(enumCase.className)(\(pythonClass.className)):")
                fragment.indent {
                    if enumCase.values.isEmpty {
                        fragment.output("pass")
                    } else {
                        for value in enumCase.values {
                            fragment.output("\(value.pythonName): object")
                        }
                    }
                }
            }
            fragment.blankLine()
            for enumCase in pythonClass.enumCases {
                fragment.output("setattr(\(pythonClass.className), \"\(upperCaseFirst(enumCase.cName))\", \(enumCase.className))")
            }
        }
        if let setupName = pythonClass.setupName {
            fragment.blankLine()
            let setupFunction = pythonFunctionName(for: setupName)
            fragment.output(setupTypeStatement(for: pythonClass, setupFunction: setupFunction, nativeModuleName: "_native"))
            fragment.blankLine()
            fragment.output("def _fishyjoes_setup_external(target_native):")
            fragment.indent {
                fragment.output(
                    setupTypeStatement(for: pythonClass, setupFunction: setupFunction, nativeModuleName: "target_native")
                )
            }
        }
        return fragment
    }

    private func classStubFragment(_ pythonClass: PythonClass) -> SourceFragment {
        let fileName = pythonClass.fileName.replacingOccurrences(of: ".py", with: ".pyi")
        let isAssociatedEnum = hasAssociatedValues(pythonClass)
        let shadowedBuiltinTypes = pythonShadowedBuiltinTypes(in: pythonClass)
        let stubImports = pythonStubImports(for: pythonClass)
        let fragment = SourceFragment(destinationPath: "python/generated/src/\(fileName)")
        fragment.output("# THIS FILE IS AUTOMATICALLY GENERATED, AND WILL BE OVERWRITTEN. DO NOT EDIT.")
        fragment.blankLine()
        fragment.output("from collections.abc import Awaitable, Callable")
        fragment.output("from typing import Any, ClassVar, NoReturn")
        if !shadowedBuiltinTypes.isEmpty {
            fragment.output("import builtins")
        }
        if pythonClass.setupKind == "enum" && !isAssociatedEnum {
            fragment.output("import enum")
        }
        for importedModule in stubImports where importedModule.className.isEmpty {
            fragment.output(pythonImportStatement(importedModule))
        }
        for importedType in stubImports where !importedType.className.isEmpty && importedType.className != pythonClass.className {
            fragment.output(pythonImportStatement(importedType))
        }
        fragment.blankLine()

        let baseClass: String
        switch pythonClass.setupKind {
        case "enum":
            baseClass = isAssociatedEnum ? "" : "(enum.Enum)"
        default:
            baseClass = ""
        }
        fragment.output("class \(pythonClass.className)\(baseClass):")
        fragment.indent {
            var emittedMember = false
            if pythonClass.setupKind == "enum" && !isAssociatedEnum {
                for enumCase in pythonClass.enumCases {
                    fragment.output("\(enumCase.pythonName) = ...")
                    emittedMember = true
                }
            } else if isAssociatedEnum {
                for enumCase in pythonClass.enumCases {
                    let parameters = enumCase.values.map {
                        "\($0.pythonName): \(pythonTypeAnnotation($0.pythonType, shadowedBuiltinTypes: shadowedBuiltinTypes))"
                    }.joined(separator: ", ")
                    let signature = parameters.isEmpty ? "cls" : "cls, \(parameters)"
                    fragment.output("@classmethod")
                    fragment.output("def \(enumCase.pythonName)(\(signature)) -> \(pythonClass.className): ...")
                    let caseTypeName = upperCaseFirst(enumCase.cName)
                    if canEmitPythonStubAttribute(caseTypeName) {
                        fragment.output("\(caseTypeName): ClassVar[type[\(enumCase.className)]]")
                    }
                    emittedMember = true
                }
            }
            if pythonClass.setupKind == "value" {
                for field in pythonClass.storedFields {
                    fragment.output("\(field.pythonName): \(pythonTypeAnnotation(field.pythonType, shadowedBuiltinTypes: shadowedBuiltinTypes))")
                    emittedMember = true
                }
                let constructorParams = pythonClass.storedFields.map { field in
                    "\(field.pythonName): \(pythonTypeAnnotation(field.pythonType, shadowedBuiltinTypes: shadowedBuiltinTypes))"
                }
                let signature = (["self"] + constructorParams).joined(separator: ", ")
                fragment.output("def __init__(\(signature)) -> None: ...")
                emittedMember = true
            }
            for field in pythonClass.fields.sorted(by: { $0.pythonName < $1.pythonName }) {
                let returnAnnotation = pythonTypeAnnotation(field.pythonReturnType, shadowedBuiltinTypes: shadowedBuiltinTypes)
                if field.isStatic {
                    fragment.output("\(field.pythonName): ClassVar[\(returnAnnotation)]")
                } else {
                    fragment.output("@property")
                    fragment.output("def \(field.pythonName)(self) -> \(returnAnnotation): ...")
                    if field.setterSymbol != nil {
                        fragment.output("@\(field.pythonName).setter")
                        fragment.output("def \(field.pythonName)(self, value: \(returnAnnotation)) -> None: ...")
                    }
                }
                emittedMember = true
            }
            for method in pythonClass.methods.sorted(by: { $0.pythonName < $1.pythonName }) {
                if method.isStatic {
                    fragment.output("@staticmethod")
                }
                let signatureParameters = method.parameters
                    .filter { $0.defaultValue == nil } +
                    method.parameters.filter { $0.defaultValue != nil }
                let pythonParams = signatureParameters.map { parameter in
                    let parameterAnnotation = pythonTypeAnnotation(parameter.pythonType, shadowedBuiltinTypes: shadowedBuiltinTypes)
                    return parameter.defaultValue.map { "\(parameter.pythonName): \(parameterAnnotation) = \($0)" } ?? "\(parameter.pythonName): \(parameterAnnotation)"
                }
                let signatureParams = pythonParams.joined(separator: ", ")
                let allSignatureParams = method.isStatic ? signatureParams : (signatureParams.isEmpty ? "self" : "self, \(signatureParams)")
                let returnAnnotation = pythonTypeAnnotation(method.pythonReturnType, shadowedBuiltinTypes: shadowedBuiltinTypes)
                fragment.output("def \(method.pythonName)(\(allSignatureParams)) -> \(returnAnnotation): ...")
                emittedMember = true
            }
            if pythonClass.equalsSymbol != nil {
                fragment.output("def __eq__(self, other: object) -> bool: ...")
                emittedMember = true
            }
            if pythonClass.hashSymbol != nil || pythonClass.isValueHashable {
                fragment.output("def __hash__(self) -> int: ...")
                emittedMember = true
            }
            if !emittedMember {
                fragment.output("pass")
            }
        }
        if isAssociatedEnum {
            for enumCase in pythonClass.enumCases {
                fragment.blankLine()
                fragment.output("class \(enumCase.className)(\(pythonClass.className)):")
                fragment.indent {
                    if enumCase.values.isEmpty {
                        fragment.output("pass")
                    } else {
                        for value in enumCase.values {
                            fragment.output("\(value.pythonName): \(pythonTypeAnnotation(value.pythonType, shadowedBuiltinTypes: shadowedBuiltinTypes))")
                        }
                    }
                }
            }
        }
        return fragment
    }

    private func pythonShadowedBuiltinTypes(in pythonClass: PythonClass) -> Set<String> {
        let builtinTypeNames: Set<String> = ["bool", "bytes", "dict", "float", "int", "list", "set", "str", "tuple"]
        var memberNames = Set<String>()
        memberNames.formUnion(pythonClass.storedFields.map(\.pythonName))
        memberNames.formUnion(pythonClass.fields.map(\.pythonName))
        memberNames.formUnion(pythonClass.methods.map(\.pythonName))
        for enumCase in pythonClass.enumCases {
            memberNames.insert(enumCase.pythonName)
            memberNames.formUnion(enumCase.values.map(\.pythonName))
        }
        return memberNames.intersection(builtinTypeNames)
    }

    private func pythonTypeAnnotation(_ type: PythonType, shadowedBuiltinTypes: Set<String>) -> String {
        var annotation = type.annotation
        for builtinType in shadowedBuiltinTypes.sorted(by: { $0.count > $1.count }) {
            annotation = annotation.replacingOccurrences(
                of: #"(?<![\w.])\#(builtinType)(?![\w])"#,
                with: "builtins.\(builtinType)",
                options: .regularExpression
            )
        }
        return annotation
    }

    private func pythonStubImports(for pythonClass: PythonClass) -> [PythonImport] {
        var imports = Set<PythonImport>()
        for field in pythonClass.storedFields {
            imports.formUnion(field.pythonType.imports)
        }
        for enumCase in pythonClass.enumCases {
            for value in enumCase.values {
                imports.formUnion(value.pythonType.imports)
            }
        }
        for field in pythonClass.fields {
            imports.formUnion(field.pythonReturnType.imports)
        }
        for method in pythonClass.methods {
            imports.formUnion(method.pythonReturnType.imports)
            for parameter in method.parameters {
                imports.formUnion(parameter.pythonType.imports)
                imports.formUnion(parameter.defaultValueImports)
            }
        }
        return imports.sorted {
            ($0.moduleName, $0.className) < ($1.moduleName, $1.className)
        }
    }

    private func pythonRuntimeImports(for pythonClass: PythonClass) -> [PythonImport] {
        var imports = Set<PythonImport>()
        for field in pythonClass.storedFields {
            imports.formUnion(field.pythonType.imports.filter { !$0.isRelative })
        }
        for enumCase in pythonClass.enumCases {
            for value in enumCase.values {
                imports.formUnion(value.pythonType.imports.filter { !$0.isRelative })
            }
        }
        for field in pythonClass.fields {
            imports.formUnion(field.pythonReturnType.imports.filter { !$0.isRelative })
        }
        for method in pythonClass.methods {
            imports.formUnion(method.pythonReturnType.imports.filter { !$0.isRelative })
            for parameter in method.parameters {
                imports.formUnion(parameter.pythonType.imports.filter { !$0.isRelative })
                imports.formUnion(parameter.defaultValueImports)
            }
        }
        return imports.sorted {
            ($0.moduleName, $0.className) < ($1.moduleName, $1.className)
        }
    }

    private func pythonImportStatement(_ importedType: PythonImport) -> String {
        if importedType.className.isEmpty {
            return "import \(importedType.moduleName)"
        }
        let prefix = importedType.isRelative ? "." : ""
        return "from \(prefix)\(importedType.moduleName) import \(importedType.className) as \(importedType.className)"
    }

    private func pythonClass(for type: TranslatedType, context: FishyJoesContext) -> PythonClass? {
        let className: String
        let fields: [Field]
        let methods: [Method]
        let setupKind: String?
        let equalsSymbol: String?
        let hashSymbol: String?
        let isValueHashable: Bool
        let storedFields: [NativeStoredField]
        let enumCases: [NativeEnumCase]

        switch type {
        case let translatedEnum as TranslatedEnum:
            className = pythonClassName(translatedEnum.nodeName)
            fields = translatedEnum.fields
            methods = translatedEnum.methods
            setupKind = translatedEnum.isInhabited ? "enum" : nil
            equalsSymbol = nil
            hashSymbol = nil
            isValueHashable = false
            storedFields = []
            enumCases = translatedEnum.cases.compactMap { enumCase in
                let values = enumCase.associatedValues.compactMap { value -> NativeEnumCaseValue? in
                    let resolved = context.resolve(type: value.type)
                    guard let nativeType = pythonCType(
                        for: resolved,
                        context: context,
                        visitedStructs: [],
                        visitedProtocols: []
                    ) else {
                        return nil
                    }
                    return NativeEnumCaseValue(
                        pythonName: value.bindingName,
                        cName: value.bindingName.mangled,
                        cType: nativeType.cType,
                        conversion: nativeType.conversion,
                        pythonType: nativeType.pythonType
                    )
                }
                guard values.count == enumCase.associatedValues.count else {
                    return nil
                }
                return NativeEnumCase(
                    pythonName: enumCase.name,
                    cName: enumCase.name.mangled,
                    className: "\(className)_\(upperCaseFirst(enumCase.name))",
                    values: values
                )
            }
            guard enumCases.count == translatedEnum.cases.count else {
                return nil
            }
        case let translatedStruct as TranslatedStruct:
            className = pythonClassName(translatedStruct.nodeName)
            fields = translatedStruct.computedVariables
            methods = translatedStruct.methods
            let translatedFields = translatedStruct.storedVariables.compactMap { nativeStoredField($0, context: context) }
            guard translatedFields.count == translatedStruct.storedVariables.count else {
                return nil
            }
            setupKind = translatedFields.isEmpty ? "emptyValue" : "value"
            equalsSymbol = nil
            hashSymbol = nil
            isValueHashable = translatedStruct.hashable
            storedFields = translatedFields
            enumCases = []
        case let translatedReference as TranslatedReference:
            className = pythonClassName(translatedReference.nodeName)
            fields = translatedReference.computedVariables
            methods = translatedReference.methods
            setupKind = "reference"
            equalsSymbol = translatedReference.equatable ? "__iota_\(translatedReference.sourceType.name.mangled)_equals" : nil
            hashSymbol = translatedReference.hashable ? "__iota_get_\(translatedReference.sourceType.name.mangled)_hash" : nil
            isValueHashable = false
            storedFields = []
            enumCases = []
        case let translatedProtocol as TranslatedProtocol:
            guard canGenerateProtocolType(translatedProtocol, context: context, visitedProtocols: []) else {
                return nil
            }
            className = pythonClassName(translatedProtocol.nodeName)
            fields = translatedProtocol.fields
            methods = translatedProtocol.methods
            setupKind = "protocol"
            equalsSymbol = nil
            hashSymbol = nil
            isValueHashable = false
            storedFields = []
            enumCases = []
        default:
            return nil
        }

        var finalStoredFields = storedFields
        var finalEnumCases = enumCases
        var nativeFields = fields.compactMap { nativeField($0, of: type, context: context) }
        var nativeMethods = methods.compactMap { nativeMethod($0, of: type, context: context) }
        let needsNominalType = setupKind == "reference"
        guard needsNominalType || !nativeFields.isEmpty || !nativeMethods.isEmpty || !storedFields.isEmpty || !enumCases.isEmpty else {
            return nil
        }
        disambiguateClassMemberNames(
            storedFields: &finalStoredFields,
            enumCases: &finalEnumCases,
            fields: &nativeFields,
            methods: &nativeMethods
        )

        let moduleName = pythonModuleName(className)
        return PythonClass(
            originName: type.sourceType.name,
            moduleName: moduleName,
            fileName: "\(context.pythonImportPackageName)/\(moduleName).py",
            className: className,
            setupName: setupKind == nil ? nil : type.iotaSetupName,
            setupKind: setupKind,
            equalsSymbol: equalsSymbol,
            hashSymbol: hashSymbol,
            isValueHashable: isValueHashable,
            storedFields: finalStoredFields,
            enumCases: finalEnumCases,
            fields: nativeFields,
            methods: nativeMethods
        )
    }

    private func nativeStoredField(_ field: Field, context: FishyJoesContext) -> NativeStoredField? {
        let resolvedType = context.resolve(type: field.type)
        guard let nativeType = pythonCType(for: resolvedType, context: context),
              let conversion = nativeType.conversion ?? pythonConversion(for: resolvedType, context: context) else {
            return nil
        }
        return NativeStoredField(
            pythonName: field.name,
            cName: field.name.mangled,
            cType: nativeType.cType,
            conversion: conversion,
            pythonType: nativeType.pythonType,
            isMutable: field.isMutable
        )
    }

    private func nativeField(_ field: Field, of type: TranslatedType, context: FishyJoesContext) -> NativeField? {
        guard field.isStatic || supportsInstanceMembers(for: type) else {
            return nil
        }
        guard let exportAnnotation = field.exportAnnotation else {
            return nil
        }
        let resolvedFieldType = context.resolve(type: field.type)
        let fieldType = field.isAsync ? TranslatedFuture(output: resolvedFieldType) : resolvedFieldType
        guard let returnType = pythonCType(for: fieldType, context: context) else {
            return nil
        }

        let sourceName = type.sourceType.name
        let cName = exportAnnotation.name.mangled
        let symbol = field.isDefaultImplementation
            ? "__iota__default_\(sourceName)_\(exportAnnotation.name)".mangled
            : "__iota_get_\(sourceName)_\(exportAnnotation.name)".mangled
        let setterSymbol = field.isPubliclyWritable
            ? "__iota_set_\(sourceName)_\(exportAnnotation.name)".mangled
            : nil

        return NativeField(
            pythonName: exportAnnotation.name,
            cName: cName,
            symbol: symbol,
            setterSymbol: setterSymbol,
            isStatic: field.isStatic,
            returnType: returnType.cType,
            returnConversion: returnType.conversion,
            pythonReturnType: returnType.pythonType,
            deprecationMessage: field.deprecation?.quotedMessage,
            originName: "\(sourceName).\(exportAnnotation.name)"
        )
    }

    private func nativeMethod(_ method: Method, of type: TranslatedType, context: FishyJoesContext) -> NativeMethod? {
        guard method.isStatic || supportsInstanceMembers(for: type) else {
            return nil
        }
        let resolvedReturnType = context.resolve(type: method.returnType, generics: method.exportAnnotation.genericOverrides)
        let effectiveReturnType = method.isAsync ? TranslatedFuture(output: resolvedReturnType) : resolvedReturnType
        let returnType: NativeType
        if let supportedReturnType = pythonCType(for: effectiveReturnType, context: context) {
            returnType = supportedReturnType
        } else if method.exportAnnotation.noReturn {
            returnType = NativeType(cType: "foreignObject", conversion: nil, pythonType: PythonType(annotation: "NoReturn"))
        } else {
            return nil
        }

        var parameters: [NativeParameter] = []
        for parameter in method.parameters {
            let resolvedParameterType = context.resolve(type: parameter.type, generics: method.exportAnnotation.genericOverrides)
            guard let cType = pythonCType(for: resolvedParameterType, context: context) else {
                return nil
            }
            let parameterName = swiftIdentifierName(parameter.name)
            var defaultValue: PythonDefaultValue?
            if let swiftDefaultValue = parameter.defaultValue {
                if let translatedDefaultValue = pythonDefaultValue(swiftDefaultValue, type: resolvedParameterType, context: context) {
                    defaultValue = translatedDefaultValue
                } else {
                    context.warnMissingDefault(parameter: parameter, in: method)
                }
            }
            parameters.append(NativeParameter(
                pythonName: parameterName,
                cName: parameterName.mangled,
                cType: cType.cType,
                conversion: cType.conversion,
                pythonType: cType.pythonType,
                defaultValue: defaultValue?.expression,
                defaultValueImports: defaultValue?.imports ?? []
            ))
        }

        let sourceName = type.sourceType.name
        let symbol = "__iota_\(sourceName)_\(method.exportAnnotation.name)".mangled
        return NativeMethod(
            pythonName: method.exportAnnotation.name,
            cName: method.exportAnnotation.name.mangled,
            symbol: symbol,
            isStatic: method.isStatic,
            parameters: parameters,
            returnType: returnType.cType,
            returnConversion: returnType.conversion,
            pythonReturnType: returnType.pythonType,
            deprecationMessage: method.deprecation?.quotedMessage,
            originName: "\(sourceName).\(method.exportAnnotation.name)"
        )
    }

    private func pythonCType(for type: TranslatedType, context: FishyJoesContext, visitedStructs: Set<String> = [], visitedProtocols: Set<String> = []) -> NativeType? {
        let pythonType = pythonType(for: type, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) ?? .any
        if type is TranslatedVoid {
            return NativeType(cType: "void", conversion: "_native.VOID", pythonType: pythonType)
        }
        if let primitive = type as? TranslatedPrimitive {
            return NativeType(cType: primitive.cName, conversion: nil, pythonType: pythonType)
        }
        if let unsignedPrimitive = type as? TranslatedUnsignedPrimitive {
            return NativeType(cType: unsignedPrimitive.cName, conversion: nil, pythonType: pythonType)
        }
        if type is TranslatedString {
            return NativeType(cType: "foreignObject", conversion: "_native.STRING", pythonType: pythonType)
        }
        if type is TranslatedData {
            return NativeType(cType: "foreignObject", conversion: "_native.DATA", pythonType: pythonType)
        }
        if type is TranslatedURL {
            return NativeType(cType: "foreignObject", conversion: "_native.URL", pythonType: pythonType)
        }
        if let conversion = pythonConversion(for: type, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) {
            return NativeType(cType: "foreignObject", conversion: conversion, pythonType: pythonType)
        }
        if let translatedStruct = type as? TranslatedStruct,
           canGenerateValueType(translatedStruct, context: context, visitedStructs: visitedStructs) {
            return NativeType(cType: "foreignObject", conversion: "_native.ValueType(\"\(pythonClassName(translatedStruct.nodeName))\")", pythonType: pythonType)
        }
        if let translatedReference = type as? TranslatedReference {
            return NativeType(cType: "foreignObject", conversion: "_native.ValueType(\"\(pythonClassName(translatedReference.nodeName))\")", pythonType: pythonType)
        }
        if let translatedProtocol = type as? TranslatedProtocol,
           (visitedProtocols.contains(translatedProtocol.nodeName) ||
            canGenerateProtocolType(translatedProtocol, context: context, visitedProtocols: visitedProtocols)) {
            return NativeType(cType: "foreignObject", conversion: "_native.ProtocolType(\"\(pythonClassName(translatedProtocol.nodeName))\")", pythonType: pythonType)
        }
        if let externalType = type as? ExternalTranslatedType, externalType.definingModule == Module.runtime {
            return NativeType(cType: "foreignObject", conversion: "_native.ValueType(\"\(pythonRuntimeClassName(externalType))\")", pythonType: pythonType)
        }
        if let externalType = type as? ExternalTranslatedType,
           externalType.isInhabited {
            return NativeType(cType: "foreignObject", conversion: "_native.ValueType(\"\(pythonExternalClassName(externalType))\")", pythonType: pythonType)
        }
        if let translatedEnum = type as? TranslatedEnum,
           translatedEnum.isInhabited {
            return NativeType(cType: "foreignObject", conversion: "_native.ValueType(\"\(pythonClassName(translatedEnum.nodeName))\")", pythonType: pythonType)
        }
        return nil
    }

    private func pythonType(for type: TranslatedType, context: FishyJoesContext, visitedStructs: Set<String> = [], visitedProtocols: Set<String> = []) -> PythonType? {
        if type is TranslatedVoid {
            return PythonType(annotation: "None")
        }
        if let primitive = type as? TranslatedPrimitive {
            switch primitive.sourceType.name {
            case "Swift.Bool":
                return PythonType(annotation: "bool")
            case "Swift.Int", "Swift.Int32":
                return PythonType(annotation: "int")
            case "Swift.Float", "Swift.Double":
                return PythonType(annotation: "float")
            default:
                return nil
            }
        }
        if let unsignedPrimitive = type as? TranslatedUnsignedPrimitive {
            switch unsignedPrimitive.sourceType.name {
            case "Swift.UInt8":
                return PythonType(annotation: "int")
            default:
                return nil
            }
        }
        if type is TranslatedString || type is TranslatedURL {
            return PythonType(annotation: "str")
        }
        if type is TranslatedData {
            return PythonType(annotation: "bytes")
        }
        if let optional = type as? TranslatedOptional,
           let wrapped = pythonType(for: optional.wrapped, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) {
            return wrapped.optional()
        }
        if let array = type as? TranslatedArray,
           let element = pythonType(for: array.elementType, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) {
            return .container("list", [element])
        }
        if let set = type as? TranslatedSet,
           let element = pythonType(for: set.elementType, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) {
            return .container("set", [element])
        }
        if let dictionary = type as? TranslatedDictionary,
           let key = pythonType(for: dictionary.keyType, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols),
           let value = pythonType(for: dictionary.valueType, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) {
            return .container("dict", [key, value])
        }
        if let tuple = type as? TranslatedTuple {
            let elements = tuple.elements.compactMap { pythonType(for: $0.type, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) }
            guard elements.count == tuple.elements.count else {
                return nil
            }
            return .container("tuple", elements)
        }
        if let future = type as? TranslatedFuture,
           let output = pythonType(for: future.output, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) {
            return .awaitable(output)
        }
        if let function = type as? TranslatedFunction {
            let parameters = function.parameters.compactMap { pythonType(for: $0, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) }
            guard parameters.count == function.parameters.count,
                  let returnType = pythonType(for: function.returnType, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) else {
                return nil
            }
            return .callable(
                parameters: parameters,
                returnType: function.isAsync ? .awaitable(returnType) : returnType
            )
        }
        if let translatedStruct = type as? TranslatedStruct,
           canGenerateValueType(translatedStruct, context: context, visitedStructs: visitedStructs) {
            return pythonClassType(pythonClassName(translatedStruct.nodeName))
        }
        if let translatedReference = type as? TranslatedReference {
            return pythonClassType(pythonClassName(translatedReference.nodeName))
        }
        if let translatedProtocol = type as? TranslatedProtocol,
           (visitedProtocols.contains(translatedProtocol.nodeName) ||
            canGenerateProtocolType(translatedProtocol, context: context, visitedProtocols: visitedProtocols)) {
            return pythonClassType(pythonClassName(translatedProtocol.nodeName))
        }
        if let translatedEnum = type as? TranslatedEnum,
           translatedEnum.isInhabited {
            return pythonClassType(pythonClassName(translatedEnum.nodeName))
        }
        if let externalType = type as? ExternalTranslatedType,
           externalType.isInhabited {
            return pythonExternalClassType(externalType, context: context)
        }
        return nil
    }

    private func pythonClassType(_ className: String) -> PythonType {
        PythonType(
            annotation: className,
            imports: [
                PythonImport(moduleName: pythonModuleName(className), className: className)
            ]
        )
    }

    private func pythonExternalClassType(_ type: ExternalTranslatedType, context: FishyJoesContext) -> PythonType {
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

    private func pythonConversion(for type: TranslatedType, context: FishyJoesContext, visitedStructs: Set<String> = [], visitedProtocols: Set<String> = []) -> String? {
        if type is TranslatedVoid {
            return "_native.VOID"
        }
        if let primitive = type as? TranslatedPrimitive {
            switch primitive.sourceType.name {
            case "Swift.Bool":
                return "_native.BOOL"
            case "Swift.Int":
                return "_native.INT"
            case "Swift.Int32":
                return "_native.INT32"
            case "Swift.Float":
                return "_native.FLOAT"
            case "Swift.Double":
                return "_native.DOUBLE"
            default:
                return nil
            }
        }
        if let unsignedPrimitive = type as? TranslatedUnsignedPrimitive {
            switch unsignedPrimitive.sourceType.name {
            case "Swift.UInt8":
                return "_native.UINT8"
            default:
                return nil
            }
        }
        if type is TranslatedString {
            return "_native.STRING"
        }
        if type is TranslatedData {
            return "_native.DATA"
        }
        if type is TranslatedURL {
            return "_native.URL"
        }
        if let optional = type as? TranslatedOptional,
           let wrapped = pythonConversion(for: optional.wrapped, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) {
            return "_native.Optional(\(wrapped))"
        }
        if let array = type as? TranslatedArray,
           let element = pythonConversion(for: array.elementType, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) {
            return "_native.Array(\"\(array.converterType.name)\", \(element))"
        }
        if let set = type as? TranslatedSet,
           let element = pythonConversion(for: set.elementType, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) {
            return "_native.Set(\"\(set.converterType.name)\", \(element))"
        }
        if let dictionary = type as? TranslatedDictionary,
           let key = pythonConversion(for: dictionary.keyType, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols),
           let value = pythonConversion(for: dictionary.valueType, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) {
            return "_native.Dictionary(\"\(dictionary.converterType.name)\", \(key), \(value))"
        }
        if let range = type as? TranslatedRange,
           let bound = pythonConversion(for: range.bound, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) {
            let constructor = range.isClosedRange ? "_native.ClosedRange" : "_native.Range"
            return "\(constructor)(\"\(range.converterType.name)\", \(bound))"
        }
        if let tuple = type as? TranslatedTuple {
            let elements = tuple.elements.compactMap { pythonConversion(for: $0.type, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) }
            guard elements.count == tuple.elements.count else {
                return nil
            }
            return "_native.Tuple(\"\(tuple.converterType.name)\", [\(elements.joined(separator: ", "))])"
        }
        if let result = type as? TranslatedResult,
           let success = pythonConversion(for: result.success, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols),
           let failure = pythonConversion(for: result.failure, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) {
            return "_native.Result(\"\(result.converterType.name)\", \(success), \(failure))"
        }
        if let future = type as? TranslatedFuture,
           let output = pythonConversion(for: future.output, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) {
            return "_native.Future(\"\(future.converterType.name)\", \(output))"
        }
        if let function = type as? TranslatedFunction, function.isAsync {
            let parameters = function.parameters.compactMap { pythonConversion(for: $0, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) }
            guard parameters.count == function.parameters.count,
                  let returnType = pythonConversion(for: function.returnType, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) else {
                return nil
            }
            return "_native.AsyncFunction(\"\(function.converterType.name)\", \"\(function.translatedFutureFunction.converterType.name)\", [\(parameters.joined(separator: ", "))], \(returnType))"
        }
        if let function = type as? TranslatedFunction {
            let parameters = function.parameters.compactMap { pythonConversion(for: $0, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) }
            guard parameters.count == function.parameters.count,
                  let returnType = pythonConversion(for: function.returnType, context: context, visitedStructs: visitedStructs, visitedProtocols: visitedProtocols) else {
                return nil
            }
            return "_native.Function(\"\(function.converterType.name)\", [\(parameters.joined(separator: ", "))], \(returnType))"
        }
        if let translatedStruct = type as? TranslatedStruct,
           canGenerateValueType(translatedStruct, context: context, visitedStructs: visitedStructs) {
            return "_native.ValueType(\"\(pythonClassName(translatedStruct.nodeName))\")"
        }
        if let translatedReference = type as? TranslatedReference {
            return "_native.ValueType(\"\(pythonClassName(translatedReference.nodeName))\")"
        }
        if let translatedProtocol = type as? TranslatedProtocol {
            if visitedProtocols.contains(translatedProtocol.nodeName) ||
                canGenerateProtocolType(translatedProtocol, context: context, visitedProtocols: visitedProtocols) {
                return "_native.ProtocolType(\"\(pythonClassName(translatedProtocol.nodeName))\")"
            }
        }
        if let externalType = type as? ExternalTranslatedType, externalType.definingModule == Module.runtime {
            return "_native.ValueType(\"\(pythonRuntimeClassName(externalType))\")"
        }
        if let externalType = type as? ExternalTranslatedType,
           externalType.isInhabited {
            return "_native.ValueType(\"\(pythonExternalClassName(externalType))\")"
        }
        if let translatedEnum = type as? TranslatedEnum,
           translatedEnum.isInhabited {
            return "_native.ValueType(\"\(pythonClassName(translatedEnum.nodeName))\")"
        }
        return nil
    }

    private func canGenerateValueType(_ structType: TranslatedStruct, context: FishyJoesContext, visitedStructs: Set<String>) -> Bool {
        if visitedStructs.contains(structType.nodeName) {
            return false
        }
        let nextVisitedStructs = visitedStructs.union([structType.nodeName])
        for field in structType.storedVariables {
            let resolvedType = context.resolve(type: field.type)
            guard pythonCType(for: resolvedType, context: context, visitedStructs: nextVisitedStructs) != nil else {
                return false
            }
        }
        return true
    }

    private func canGenerateProtocolType(_ protocolType: TranslatedProtocol, context: FishyJoesContext, visitedProtocols: Set<String>) -> Bool {
        if visitedProtocols.contains(protocolType.nodeName) {
            return true
        }
        let nextVisitedProtocols = visitedProtocols.union([protocolType.nodeName])
        for field in protocolType.fields {
            let resolvedFieldType = context.resolve(type: field.type)
            let fieldType = field.isAsync ? TranslatedFuture(output: resolvedFieldType) : resolvedFieldType
            guard pythonCType(for: fieldType, context: context, visitedStructs: [], visitedProtocols: nextVisitedProtocols) != nil else {
                return false
            }
        }
        for method in protocolType.methods {
            let resolvedReturnType = context.resolve(type: method.returnType, generics: method.exportAnnotation.genericOverrides)
            let returnType = method.isAsync ? TranslatedFuture(output: resolvedReturnType) : resolvedReturnType
            guard pythonCType(for: returnType, context: context, visitedStructs: [], visitedProtocols: nextVisitedProtocols) != nil else {
                return false
            }
            for parameter in method.parameters {
                guard pythonCType(for: context.resolve(type: parameter.type, generics: method.exportAnnotation.genericOverrides), context: context, visitedStructs: [], visitedProtocols: nextVisitedProtocols) != nil else {
                    return false
                }
            }
        }
        return true
    }

    private func disambiguateClassMemberNames(
        storedFields: inout [NativeStoredField],
        enumCases: inout [NativeEnumCase],
        fields: inout [NativeField],
        methods: inout [NativeMethod]
    ) {
        let memberNames = uniquePythonNames(
            storedFields.map(\.pythonName) +
            enumCases.map(\.pythonName) +
            fields.map(\.pythonName) +
            methods.map(\.pythonName)
        )
        var index = 0
        for storedIndex in storedFields.indices {
            storedFields[storedIndex].pythonName = memberNames[index]
            index += 1
        }
        for enumIndex in enumCases.indices {
            enumCases[enumIndex].pythonName = memberNames[index]
            index += 1
            enumCases[enumIndex].values = disambiguatedEnumCaseValues(enumCases[enumIndex].values)
        }
        for fieldIndex in fields.indices {
            fields[fieldIndex].pythonName = memberNames[index]
            index += 1
        }
        for methodIndex in methods.indices {
            methods[methodIndex].pythonName = memberNames[index]
            methods[methodIndex].parameters = disambiguatedParameters(methods[methodIndex].parameters)
            index += 1
        }
    }

    private func disambiguatedEnumCaseValues(_ values: [NativeEnumCaseValue]) -> [NativeEnumCaseValue] {
        let valueNames = uniqueAssociatedValueNames(values.map(\.pythonName))
        return values.indices.map { index in
            var value = values[index]
            value.pythonName = valueNames[index]
            return value
        }
    }

    private func disambiguatedParameters(_ parameters: [NativeParameter]) -> [NativeParameter] {
        let parameterNames = uniquePythonNames(parameters.map(\.pythonName))
        return parameters.indices.map { index in
            var parameter = parameters[index]
            parameter.pythonName = parameterNames[index]
            return parameter
        }
    }

    private func uniquePythonNames(_ rawNames: [String]) -> [String] {
        uniquePythonNames(rawNames, sanitize: pythonSafeIdentifier)
    }

    private func uniqueAssociatedValueNames(_ rawNames: [String]) -> [String] {
        uniquePythonNames(rawNames, sanitize: pythonSafeAssociatedValueIdentifier)
    }

    private func uniquePythonNames(_ rawNames: [String], sanitize: (String) -> String) -> [String] {
        var used = Set<String>()
        var names = Array(repeating: "", count: rawNames.count)
        for index in rawNames.indices.sorted(by: { rawNames[$0] < rawNames[$1] }) {
            let rawName = rawNames[index]
            let baseName = sanitize(rawName)
            var name = baseName
            var suffix = 2
            while used.contains(name) || isReservedPythonName(name) {
                name = "\(baseName)_\(suffix)"
                suffix += 1
            }
            used.insert(name)
            names[index] = name
        }
        return names
    }

    private func boundSymbols(for pythonClass: PythonClass) -> [String] {
        var symbols = Set<String>()
        for field in pythonClass.fields {
            symbols.insert(field.symbol)
            if let setterSymbol = field.setterSymbol {
                symbols.insert(setterSymbol)
            }
        }
        for method in pythonClass.methods {
            symbols.insert(method.symbol)
        }
        if let setupName = pythonClass.setupName {
            symbols.insert(setupName)
        }
        if let equalsSymbol = pythonClass.equalsSymbol {
            symbols.insert(equalsSymbol)
        }
        if let hashSymbol = pythonClass.hashSymbol {
            symbols.insert(hashSymbol)
        }
        return symbols.sorted()
    }

    private func pythonFunctionName(for symbol: String) -> String {
        "_fj_\(symbol)"
    }

    private func convertedInvocation(function: String, args: [String], conversion: String) -> String {
        let nativeArgs = args.isEmpty ? "[]" : "[\(args.joined(separator: ", "))]"
        return "_native.call(\(function), args=\(nativeArgs), return_conversion=\(conversion))"
    }

    private func setupTypeStatement(
        for pythonClass: PythonClass,
        setupFunction: String,
        nativeModuleName: String
    ) -> String {
        if pythonClass.setupKind == "reference" {
            return "\(nativeModuleName).setup_reference_type(\(setupFunction), \(pythonClass.className))"
        }
        if pythonClass.setupKind == "value" {
            let fields = pythonClass.storedFields.map { field in
                "\(nativeModuleName).Field(\"\(field.pythonName)\", \(descriptorExpression(cType: field.cType, conversion: field.conversion, nativeModuleName: nativeModuleName)), mutable=\(field.isMutable ? "True" : "False"))"
            }
            return "\(nativeModuleName).setup_value_type(\(setupFunction), \(pythonClass.className), [\(fields.joined(separator: ", "))])"
        }
        if pythonClass.setupKind == "enum" {
            if hasAssociatedValues(pythonClass) {
                let cases = pythonClass.enumCases.map { enumCase in
                    let fields = enumCase.values.map { value in
                        "\(nativeModuleName).Field(\"\(value.pythonName)\", \(descriptorExpression(cType: value.cType, conversion: value.conversion, nativeModuleName: nativeModuleName)))"
                    }.joined(separator: ", ")
                    return "\(nativeModuleName).EnumCase(\"\(enumCase.pythonName)\", \(enumCase.className), [\(fields)])"
                }.joined(separator: ", ")
                return "\(nativeModuleName).setup_associated_enum_type(\(setupFunction), \(pythonClass.className), [\(cases)])"
            }
            let cases = pythonClass.enumCases.map { "\"\($0.pythonName)\"" }.joined(separator: ", ")
            return "\(nativeModuleName).setup_simple_enum_type(\(setupFunction), \(pythonClass.className), [\(cases)])"
        }
        if pythonClass.setupKind == "protocol" {
            let fields = pythonClass.fields.map { field in
                "\(nativeModuleName).ProtocolField(\"\(field.pythonName)\", \(descriptorExpression(cType: field.returnType, conversion: field.returnConversion, nativeModuleName: nativeModuleName)))"
            }
            let methods = pythonClass.methods.map { method in
                let parameters = method.parameters.map {
                    descriptorExpression(cType: $0.cType, conversion: $0.conversion, nativeModuleName: nativeModuleName)
                }.joined(separator: ", ")
                return "\(nativeModuleName).ProtocolMethod(\"\(method.pythonName)\", [\(parameters)], \(descriptorExpression(cType: method.returnType, conversion: method.returnConversion, nativeModuleName: nativeModuleName)))"
            }
            return "\(nativeModuleName).setup_protocol_type(\(setupFunction), \(pythonClass.className), fields=[\(fields.joined(separator: ", "))], methods=[\(methods.joined(separator: ", "))])"
        }
        return "\(nativeModuleName).setup_empty_value_type(\(setupFunction), \(pythonClass.className))"
    }

    private func descriptorExpression(cType: String, conversion: String?, nativeModuleName: String = "_native") -> String {
        if let conversion {
            return conversion.replacingOccurrences(of: "_native.", with: "\(nativeModuleName).")
        }
        switch cType {
        case "bool":
            return "\(nativeModuleName).BOOL"
        case "int":
            return "\(nativeModuleName).INT"
        case "intptr_t":
            return "\(nativeModuleName).INT"
        case "int32_t":
            return "\(nativeModuleName).INT32"
        case "uint8_t":
            return "\(nativeModuleName).UINT8"
        case "double":
            return "\(nativeModuleName).DOUBLE"
        case "void":
            return "\(nativeModuleName).VOID"
        default:
            return "None"
        }
    }

    private func selfConversion(for pythonClass: PythonClass) -> String? {
        switch pythonClass.setupKind {
        case "emptyValue", "value", "enum":
            return "_native.ValueType(\"\(pythonClass.className)\")"
        default:
            return nil
        }
    }

    private func pythonDefaultValue(_ swiftValue: String, type: TranslatedType, context: FishyJoesContext) -> PythonDefaultValue? {
        guard let expression = SwiftDefaultExpression.parse(swiftValue) else {
            return nil
        }
        return pythonDefaultValue(expression, type: type, context: context)
    }

    private func pythonDefaultValue(_ swiftValue: SwiftDefaultExpression, type: TranslatedType, context: FishyJoesContext) -> PythonDefaultValue? {
        switch swiftValue {
        case .nilLiteral:
            return PythonDefaultValue(expression: "None")
        case let .boolLiteral(value):
            return PythonDefaultValue(expression: value ? "True" : "False")
        case let .integerLiteral(value), let .floatingPointLiteral(value):
            return PythonDefaultValue(expression: value)
        case let .implicitMember(memberName):
            if let integerLimit = pythonIntegerLimitDefaultValue(memberName: memberName, type: type) {
                return integerLimit
            }
            return pythonSimpleEnumDefaultValue(memberName, type: type)
        case let .memberAccess(components):
            if let integerLimit = pythonIntegerLimitDefaultValue(components: components) {
                return integerLimit
            }
            if let standardLibraryMember = pythonSwiftStandardLibraryMemberAccess(components) {
                return standardLibraryMember
            }
            if components.count == 1 {
                return pythonSimpleEnumDefaultValue(components[0], type: type)
            }
            return nil
        case let .call(callee, arguments):
            return pythonZeroArgumentMethodCall(callee: callee, arguments: arguments, type: type, context: context)
        }
    }

    private func pythonIntegerLimitDefaultValue(memberName: String, type: TranslatedType) -> PythonDefaultValue? {
        switch type.sourceType.unqualifiedName {
        case "Int":
            switch memberName {
            case "min":
                return PythonDefaultValue(expression: "-sys.maxsize - 1", imports: [.module("sys")])
            case "max":
                return PythonDefaultValue(expression: "sys.maxsize", imports: [.module("sys")])
            default:
                return nil
            }
        case "UInt":
            switch memberName {
            case "min":
                return PythonDefaultValue(expression: "0")
            case "max":
                return PythonDefaultValue(expression: "sys.maxsize * 2 + 1", imports: [.module("sys")])
            default:
                return nil
            }
        case "Int8", "Int16", "Int32", "Int64", "UInt8", "UInt16", "UInt32", "UInt64":
            return pythonFixedWidthIntegerLimitDefaultValue(components: [type.sourceType.unqualifiedName, memberName]).map {
                PythonDefaultValue(expression: $0)
            }
        default:
            return nil
        }
    }

    private func pythonIntegerLimitDefaultValue(components: [String]) -> PythonDefaultValue? {
        guard components.count == 2 else {
            return nil
        }
        switch (components[0], components[1]) {
        case ("Int", "min"):
            return PythonDefaultValue(expression: "-sys.maxsize - 1", imports: [.module("sys")])
        case ("Int", "max"):
            return PythonDefaultValue(expression: "sys.maxsize", imports: [.module("sys")])
        case ("UInt", "min"):
            return PythonDefaultValue(expression: "0")
        case ("UInt", "max"):
            return PythonDefaultValue(expression: "sys.maxsize * 2 + 1", imports: [.module("sys")])
        default:
            return pythonFixedWidthIntegerLimitDefaultValue(components: components).map {
                PythonDefaultValue(expression: $0)
            }
        }
    }

    private func pythonFixedWidthIntegerLimitDefaultValue(components: [String]) -> String? {
        SwiftDefaultExpression.memberAccess(components).swiftIntegerLimitValue
    }

    private func pythonZeroArgumentMethodCall(
        callee: SwiftDefaultExpression,
        arguments: [SwiftDefaultExpression],
        type: TranslatedType,
        context: FishyJoesContext
    ) -> PythonDefaultValue? {
        guard arguments.isEmpty,
              case let .memberAccess(components) = callee,
              let methodName = components.last else {
            return nil
        }

        let receiver = SwiftDefaultExpression.memberAccess(Array(components.dropLast()))
        guard let receiverDefault = pythonDefaultValue(receiver, type: type, context: context) else {
            return nil
        }

        switch methodName {
        case "squareRoot":
            return PythonDefaultValue(
                expression: "\(receiverDefault.expression) ** 0.5",
                imports: receiverDefault.imports
            )
        default:
            return nil
        }
    }

    private func pythonSwiftStandardLibraryMemberAccess(_ components: [String]) -> PythonDefaultValue? {
        switch components {
        case ["Double", "ulpOfOne"]:
            return PythonDefaultValue(expression: "sys.float_info.epsilon", imports: [.module("sys")])
        default:
            return nil
        }
    }

    private func pythonSimpleEnumDefaultValue(_ swiftCaseName: String, type: TranslatedType) -> PythonDefaultValue? {
        guard let translatedEnum = type as? TranslatedEnum,
              translatedEnum.isInhabited,
              translatedEnum.cases.allSatisfy({ $0.associatedValues.isEmpty }) else {
            return nil
        }
        let enumCaseNames = pythonSimpleEnumCaseNames(translatedEnum)
        guard let pythonCaseName = enumCaseNames[swiftCaseName] else {
            return nil
        }
        let className = pythonClassName(translatedEnum.nodeName)
        let importedType = PythonImport(moduleName: pythonModuleName(className), className: className)
        return PythonDefaultValue(
            expression: "\(className).\(pythonCaseName)",
            imports: [importedType]
        )
    }

    private func pythonSimpleEnumCaseNames(_ translatedEnum: TranslatedEnum) -> [String: String] {
        var rawMemberNames = translatedEnum.cases.map(\.name)
        rawMemberNames.append(contentsOf: translatedEnum.fields.compactMap(\.exportAnnotation?.name))
        rawMemberNames.append(contentsOf: translatedEnum.methods.map(\.exportAnnotation.name))
        let memberNames = uniquePythonNames(rawMemberNames)
        return Dictionary(uniqueKeysWithValues: zip(translatedEnum.cases.map(\.name), memberNames.prefix(translatedEnum.cases.count)))
    }

    private func pythonModuleName(_ name: String) -> String {
        pythonSafeIdentifier(name)
    }

    private func pythonClassName(_ name: String) -> String {
        name.replacingOccurrences(of: ".", with: "_")
    }

    private func pythonRuntimeClassName(_ type: ExternalTranslatedType) -> String {
        let runtimePrefix = "Runtime."
        let runtimeName = type.nodeName.hasPrefix(runtimePrefix)
            ? String(type.nodeName.dropFirst(runtimePrefix.count))
            : type.nodeName
        return pythonClassName(runtimeName)
    }

    private func pythonExternalClassName(_ type: ExternalTranslatedType) -> String {
        let modulePrefix = "\(type.definingModule.name)."
        let externalName = type.nodeName.hasPrefix(modulePrefix)
            ? String(type.nodeName.dropFirst(modulePrefix.count))
            : type.nodeName
        return pythonClassName(externalName)
    }

    private func pythonStringLiteral(_ value: String) -> String {
        "\"\(value.replacingOccurrences(of: "\\", with: "\\\\").replacingOccurrences(of: "\"", with: "\\\""))\""
    }

    private func pythonSafeIdentifier(_ name: String) -> String {
        var identifier = pythonName(swiftIdentifierName(name)).trimmingCharacters(in: CharacterSet(charactersIn: "_"))
        if identifier.isEmpty {
            identifier = "value"
        }
        if identifier.first?.isNumber == true {
            identifier = "value_\(identifier)"
        }
        if isReservedPythonName(identifier) {
            identifier += "_"
        }
        return identifier
    }

    private func pythonSafeAssociatedValueIdentifier(_ name: String) -> String {
        let normalized = swiftIdentifierName(name)
        let pythonIdentifier = pythonName(normalized)
        if pythonIdentifier.hasPrefix("_") || pythonIdentifier.first?.isNumber == true {
            return "m_\(pythonIdentifier.trimmingCharacters(in: CharacterSet(charactersIn: "_")))"
        }
        return pythonSafeIdentifier(normalized)
    }

    private func pythonName(_ name: String) -> String {
        let normalized = name
            .replacingOccurrences(of: "NaN", with: "Nan")
            .replacingOccurrences(of: "UInt", with: "Uint")
            .replacingOccurrences(of: "URL", with: "Url")
            .replacingOccurrences(of: "UTF", with: "Utf")
        return snakify(normalized).lowercased()
    }

    private func swiftIdentifierName(_ name: String) -> String {
        name.unescapedSwiftIdentifier
    }

    private func isReservedPythonName(_ name: String) -> Bool {
        Self.pythonReservedNames.contains(name)
    }

    private func canEmitPythonStubAttribute(_ name: String) -> Bool {
        guard name.range(of: #"^[A-Za-z_][A-Za-z0-9_]*$"#, options: .regularExpression) != nil else {
            return false
        }
        return !Self.pythonSyntaxNames.contains(name)
    }

    private static let pythonSyntaxNames: Set<String> = pythonReservedNames.union([
        "False",
        "None",
        "True",
    ])

    private static let pythonReservedNames: Set<String> = [
        "and",
        "as",
        "assert",
        "async",
        "await",
        "break",
        "case",
        "class",
        "continue",
        "def",
        "del",
        "elif",
        "else",
        "except",
        "finally",
        "for",
        "from",
        "global",
        "if",
        "import",
        "in",
        "is",
        "lambda",
        "match",
        "nonlocal",
        "not",
        "or",
        "pass",
        "raise",
        "return",
        "try",
        "while",
        "with",
        "yield",
    ]

    private func hasAssociatedValues(_ pythonClass: PythonClass) -> Bool {
        pythonClass.enumCases.contains { !$0.values.isEmpty }
    }

    private func supportsInstanceMembers(for type: TranslatedType) -> Bool {
        if type is TranslatedStruct {
            return true
        }
        if type is TranslatedReference {
            return true
        }
        if type is TranslatedProtocol {
            return true
        }
        if let translatedEnum = type as? TranslatedEnum {
            return translatedEnum.isInhabited
        }
        return false
    }
}

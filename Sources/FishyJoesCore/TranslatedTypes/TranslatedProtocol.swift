import SourceryRuntime

struct TranslatedProtocol: TranslatedType {
    let sourceType: BetterType
    let converterType: BetterType
    var neutralName: String
    let nodeName: String
    let kotlinPackage: String?
    let kotlinName: String
    let jniType: JNIType
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let definingModule: Module
    let definingTSNamespace: String?
    let isInhabited: Bool
    var containedNamedTypes: [TranslatedType] { [self] }
    let conformances: Set<String>
    let methods: [Method]
    let computedVariables: [Variable]
    let documentation: [String]
    let className: String
    let javaExternalWitnessClassName: String
    let iotaExternalWitnessClassName: String

    init(context: FishyJoesContext, type: SourceryProtocol) {
        guard let exportAnnotation = type.exportAnnotation else {
            fatalErr("type not annotated for export")
        }
        let typeName = exportAnnotation.name

        self.sourceType = BetterType(named: type, context: context)
        var module = sourceType.module
        if module != nil,
           !module!.isEmpty {
            module! += "_CommonInterface"
        }
        self.converterType = .named(.init(name: "_\(sourceType.nonNamespacedName)Converter", module: module))
        self.neutralName = "Struct<Named=\(exportAnnotation.name)>"
        self.nodeName = typeName
        self.kotlinPackage = context.module.kotlinPackage
        self.kotlinName = typeName

        self.jniType = .object(context.kotlinTranslator.javaClassName(nodeName, in: context))
        self.cSharpType = .named(package: context.module.cSharpNamespace, name: exportAnnotation.cSharpName)
        self.dartType = .named(package: context.module.dartNamespace, name: context.dartTranslator.fakeNamespace(exportAnnotation.name))

        self.definingModule = context.module
        self.definingTSNamespace = context.module.name
        self.isInhabited = type.isInhabited

        self.conformances = exportAnnotation.conformances

        let methodsToConvert = type.methodsPreferringDefaultImpl()
        self.methods = methodsToConvert.compactMap(Method.init)

        self.computedVariables = type.variables.filter { $0.exportAnnotation != nil }
        self.documentation = type.documentation
        self.className = context.kotlinTranslator.javaClassName(kotlinName, in: context)
        self.javaExternalWitnessClassName = context.kotlinTranslator.javaClassName("_ExternalWitness_\(kotlinName)", in: context)
        self.iotaExternalWitnessClassName = "ExternalWitness_\(sourceType.nonNamespacedName)"

        enforceProtocolThrows()
        enforceNoProtocolSetters()
        enforceNoProtocolStatics()
    }

    func enforceProtocolThrows() {
        let nonThrowingMethods = methods.filter { !$0.isThrowing }
        guard nonThrowingMethods.isEmpty else {
            var nameSpace = ""
            if let ns = nonThrowingMethods.first!.definedIn?.name {
                nameSpace = "\(ns)."
            }
            fatalError("☠️ Error on \(nameSpace)\(nonThrowingMethods.first!.name): All Protocol methods exported through FishyJoes must be throwing, it's the law 👮!")
        }

        let nonThrowingGetters = computedVariables.filter { !$0.`throws` && !$0.isMutable }
        guard nonThrowingGetters.isEmpty else {
            var nameSpace = ""
            if let ns = nonThrowingGetters.first!.definedInTypeName?.name {
                nameSpace = "\(ns)."
            }
            fatalError("☠️ Error on \(nameSpace)\(nonThrowingGetters.first!.name): All Protocol get only property getters exported through FishyJoes must be throwing, it's the law 👮!")
        }
    }

    func enforceNoProtocolSetters() {
        let setters = computedVariables.filter { $0.isMutable }
        guard setters.isEmpty else {
            var nameSpace = ""
            if let ns = setters.first!.definedInTypeName?.name {
                nameSpace = "\(ns)."
            }
            fatalError("☠️ Error on \(nameSpace)\(setters.first!.name): No setters allowed in protocols because the Swift language does not allow them to throw, it's the law 👮! Use a function instead.")
        }
    }

    func enforceNoProtocolStatics() {
        let staticVars = computedVariables.filter { $0.isStatic }
        let staticFuncs = methods.filter { $0.isStatic }
        guard staticVars.isEmpty else {
            var nameSpace = ""
            if let ns = staticVars.first!.definedInTypeName?.name {
                nameSpace = "\(ns)."
            }
            fatalError("☠️ Error on \(nameSpace)\(staticVars.first!.name): No static properties allowed in protocols because other languages do not generally support them, it's the law 👮!")
        }
        guard staticFuncs.isEmpty else {
            var nameSpace = ""
            if let ns = staticFuncs.first!.definedIn?.name {
                nameSpace = "\(ns)"
            }
            fatalError("☠️ Error on \(nameSpace)\(staticFuncs.first!.name): No static functions allowed in protocols because other languages do not generally support them, it's the law 👮!")
        }
    }

    func dartSetupDelegates(in context: FishyJoesContext) -> [String] {
        var lines: [String] = []
        lines.append("typedef _\(sourceType.genericBaseName.mangledName)Constructor = \(dartType.ffiCreatedName) Function(")
        lines.append("    ffi.Pointer ref,")
        lines.append("    OutCreatedRef exn")
        lines.append(");")
        for computedVar in computedVariables {
            let resolved = context.resolve(type: computedVar.typeName.better)
            let commonName = "_\(sourceType.genericBaseName.mangledName)_\(computedVar.name)"
            lines.append("typedef \(commonName)Getter = \(resolved.dartType.ffiCreatedTag) Function(\(dartType.ffiUnownedTag) obj, OutCreatedRef exn);")
            if computedVar.isMutable {
                lines.append("typedef \(commonName)Setter = ffi.Void Function(\(dartType.ffiUnownedTag) obj, \(resolved.dartType.ffiConsumedTag) newValue, OutCreatedRef exn);")
            }
        }
        for method in methods {
            let returnType = context.resolve(type: method.returnType)
            let commonName = "_\(sourceType.genericBaseName.mangledName)_\(method.callName)"
            let params = method.parameters.map {
                let resolved = context.resolve(type: $0.type)
                return "\(resolved.dartType.ffiTag) \($0.name)"
            }
            let paramsStr = params.isEmpty ? "" : "\(params.joined(separator: ", ")),"
            lines.append("typedef \(commonName) = \(returnType.dartType.ffiCreatedTag) Function(\(dartType.ffiUnownedTag) obj, \(paramsStr) OutCreatedRef exn);")
        }
        return lines
    }

    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>] {
        var setupParams = [ForeignSetupParameter<DartClass.DartType>]()

        let constructorType = "_\(sourceType.genericBaseName.mangledName)Constructor"

        setupParams.append(
            .value(
                name: "constructor",
                type: .named(package: nil, name: "ffi.Pointer<ffi.NativeFunction<\(constructorType)>>")
            ) { fragment in
                fragment.output("ffi.Pointer.fromFunction(\(context.module.name).\(iotaExternalWitnessClassName).ffi_new),")
            }
        )

        for computedVar in computedVariables {
            let resolved = context.resolve(type: computedVar.typeName.better)
            let commonName = "_\(sourceType.genericBaseName.mangledName)_\(computedVar.name)"
            let getType = "\(commonName)Getter"

            setupParams.append(
                .value(
                    name: "get_\(computedVar.name)",
                    type: .named(package: nil, name: "ffi.Pointer<ffi.NativeFunction<\(getType)>>")
                ) { fragment in
                    let defaultValue = resolved.dartType.defaultReturnValue.map { ", \($0)" } ?? ""
                    fragment.output("ffi.Pointer.fromFunction(\(context.module.name).\(iotaExternalWitnessClassName).ffi_get_\(computedVar.name)\(defaultValue)),")
                }
            )
        }

        let normalMethods = methods.filter { !$0.isInExtension }
        let defaultMethods = methods.filter { $0.isInExtension }

        for method in normalMethods {
            let resolvedReturn = context.resolve(type: method.returnType)
            let commonName = "_\(sourceType.genericBaseName.mangledName)_\(method.callName)"

            setupParams.append(
                .value(
                    name: method.callName,
                    type: .named(package: nil, name: "ffi.Pointer<ffi.NativeFunction<\(commonName)>>")
                ) { fragment in
                    let defaultValue = resolvedReturn.dartType.defaultReturnValue.map { ", \($0)" } ?? ""
                    fragment.output("ffi.Pointer.fromFunction(\(context.module.name).\(iotaExternalWitnessClassName).ffi_\(method.callName)\(defaultValue)),")
                }
            )
        }

        for method in defaultMethods {
            let resolvedReturn = context.resolve(type: method.returnType)
            let commonName = "_\(sourceType.genericBaseName.mangledName)_\(method.callName)"

            setupParams.append(
                .value(
                    name: method.callName,
                    type: .named(package: nil, name: "ffi.Pointer<ffi.NativeFunction<\(commonName)>>")
                ) { fragment in
                    let defaultValue = resolvedReturn.dartType.defaultReturnValue.map { ", \($0)" } ?? ""
                    fragment.output("ffi.Pointer.fromFunction(\(sourceType.name)_DefaultImplementations.ffi_\(method.callName)\(defaultValue)),")
                }
            )
        }

        return setupParams
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        return [
            commonDefinitionFragment(in: context),
            nodeDefinitionFragment(in: context),
            iotaDefinitionFragment(in: context),
        ] + jniDefinitionFragments(in: context)
    }

    func commonDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "CommonInterface/\(converterType.name).swift",
            additionalImports: ["Foundation"]
        )

        fragment.outputBlock("public enum \(converterType.nonNamespacedName) {") {
            fragment.output("public typealias SwiftType = \(sourceType.name)")
        }

        return fragment
    }

    func nodeDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "NodeInterface/\(sourceType.name)+node.swift",
            additionalImports: ["Foundation", "FishyJoesNodeRuntime", "\(context.module.name)_CommonInterface"]
        )

        fragment.outputBlock("struct _Node\(sourceType.nonNamespacedName): \(sourceType.name) {") {
            fragment.output("let _nodeWitness: NodeReference")
            fragment.blankLine()
            // TODO: Implement this stubby code
            for computedVar in computedVariables {
                fragment.output("var \(computedVar.name): \(computedVar.typeName.better.name)")
            }
            for method in methods {
                var returnSignature = "\(method.isThrowing ? " throws" : "")"
                if method.returnType.name != "Void" {
                    returnSignature.append(" -> \(method.returnType.name)")
                }
                var paramSigs = [String]()
                do {
                    for param in method.parameters {
                        paramSigs.append("\(param.labelAndName): \(param.type.name)")
                    }
                }
                fragment.output("var \(method.callName)Impl: (() -> \(method.returnType.name))?")
                fragment.outputBlock("\(method.isStatic ? "static " : "")public func \(method.callName)(\(paramSigs.joined(separator: ", ")))\(returnSignature) {") {
                    fragment.output("\(method.callName)Impl!()")
                }
            }
        }
        fragment.outputBlock("extension \(converterType.name): NodeMutator {") {
            fragment.outputBlock("public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {") {
                fragment.outputBlock("return _Node\(sourceType.nonNamespacedName)(") {
                    fragment.output("_nodeWitness: try NodeReference(env: env, value: value)", newLineTerminated: false)
                    if !computedVariables.isEmpty {
                        fragment.output(",")
                    } else {
                        fragment.output("")
                    }
                    fragment.outputMap(computedVariables, separator: ",") {
                        "\($0.name): \($0.typeName.name.replacingOccurrences(of: "?", with: ""))()"
                    }
                }
            }

            fragment.outputBlock("public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {") {
                fragment.output("let constructor = try NodeClass.constructor(for: \"\(nodeName)\", env: env)")
                fragment.outputBlock("let args: [NAPI.Value] = [") {
                    for computedVar in computedVariables {
                        let resolved = context.resolve(type: computedVar.typeName.better)
                        fragment.output("try \(resolved.converterType.name).toNode(value.\(computedVar.name), env: env),")
                    }
                }
                fragment.output("return try env.newInstance(constructor, args)")
            }

            fragment.outputBlock("public static func mutateNode(_ value: SwiftType, this: NAPI.Value, env: NAPI.Env) throws {") {
                for computedVar in computedVariables {
                    guard computedVar.isMutable else { continue }
                    let resolved = context.resolve(type: computedVar.typeName.better)
                    fragment.output("try env.setNamedProperty(this, \"\(computedVar.name)\", \(resolved.converterType.name).toNode(value.\(computedVar.name), env: env))")
                }
            }

            fragment.blankLine()
            fragment.output("@available(*, deprecated, message: \"Not actually deprecated, but this silences warnings because it may refer to deprecated methods\")")
            fragment.outputBlock("public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {") {
                // fragment.output("print(\"setting up \(sourceType.name)\")")

                fragment.outputBlock("let nodeClass = try NodeClass(") {
                    fragment.output("env: env,")
                    fragment.output("name: \"\(nodeName)\",")
                    fragment.outputBlock("properties: [", closeWith: "],") {
                        var hasProperties = false
                        hasProperties ||= context.nodeTranslator.outputProperties(methods: methods, context: context, fragment: fragment)
                        hasProperties ||= context.nodeTranslator.outputProperties(computedVariables: computedVariables, context: context, fragment: fragment)
//                        for computedVar in computedVariables {
//                            // Limitation in wasm implementation of napi_create_class doesn't allow constructors to assign to non-mutable property.
//                            // let mutable = computedVar.isPubliclyWritable
//                            let mutable = true
//                            fragment.output("\"\(computedVar.name)\": (.stored(mutable: \(mutable)), isStatic: \(computedVar.isStatic)),")
//                            hasProperties = true
//                        }
                        if !hasProperties {
                            fragment.output(":")
                        }
                    }
                    fragment.outputBlock("constructor: { env, info in", closeWith: "}") {
                        fragment.outputBlock("callbackBody(env, info, name: \"\(nodeName)_constructor\", expectedArgumentCount: \(computedVariables.count)) { env in", closeWith: "}") {
                            fragment.output("// TODO: typecheck?")
                            fragment.output("let this = try env.this()")
                            for (index, computedVar) in computedVariables.enumerated() {
                                fragment.output("try env.env.setNamedProperty(this, \"\(computedVar.name)\", env.argument(at: \(index)))")
                            }
                            fragment.output("return this")
                        }
                    }
                }
                fragment.outputBlock("try mergeDefinitionInto(") {
                    fragment.output("env: env,")
                    fragment.output("module: module,")
                    fragment.output("path: \"\(nodeName)\",")
                    fragment.output("nodeClass: nodeClass.constructor.value(env: env)")
                }
            }
        }

        context.tsAnnotations.add(class:
            .init(
                documentation: documentation,
                name: nodeName,
                constructor: .visible(
                    computedVariables.map {
                        (
                            name: $0.name,
                            type: context.resolve(type: $0.typeName.better).nodeType
                        )
                    }
                ),
                fields:
                    computedVariables.compactMap {context.ts(field: $0, useNativeName: false) },
                methods: methods.compactMap { context.ts(method: $0) }
            )
        )
        fragment.blankLine()
        return fragment
    }

    func iotaDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "IotaInterface/\(sourceType.name)+iota-type.swift",
            additionalImports: ["Foundation", "FishyJoesIotaRuntime", "\(context.module.name)_CommonInterface"]
        )

        let foreignProtocolType = "_Iota\(sourceType.nonNamespacedName)"
        let defaultMethods = methods.filter { $0.isInExtension }
        let normalMethods = methods.filter { !$0.isInExtension }

        fragment.outputBlock("struct \(foreignProtocolType): \(sourceType.name) {") {
            fragment.output("let _iotaWitness: IotaReference")
            for variable in computedVariables {
                fragment.output()
                let name = variable.name
                let type = variable.typeName.better.name
                let resolved = context.resolve(type: variable.typeName.better)

                fragment.outputBlock("\(variable.isStatic ? "static " : "")public var \(name): \(type) {") {
                    fragment.outputBlock("get throws {") {
                        fragment.outputBlock("try \(type).consumeIota(") {
                            fragment.outputBlock("try _iotaWitness.env.check { exn in", closeWith: "},") {
                                fragment.output("\(converterType.name)._\(name)Getter[_iotaWitness.env](_iotaWitness.object, exn)")
                            }
                            fragment.output("env: _iotaWitness.env")
                        }
                    }
                }
            }

            for method in methods {
                fragment.output()
                let resolvedReturn = context.resolve(type: method.returnType)
                var returnSignature = "\(method.isThrowing ? " throws" : "")"
                if method.returnType.name != "Void" {
                    returnSignature.append(" -> \(method.returnType.name)")
                }

                var paramSigs = [String]()
                do {
                    for param in method.parameters {
                        paramSigs.append("\(param.labelAndName): \(param.type.name)")
                    }
                }
                fragment.outputBlock("\(method.isStatic ? "static " : "")public func \(method.callName)(\(paramSigs.joined(separator: ", ")))\(returnSignature) {") {
                    fragment.outputBlock("try \(resolvedReturn.converterType.name).peekIota(") {
                        fragment.outputBlock("try _iotaWitness.env.check { exn in", closeWith: "},") {
                            fragment.outputBlock("\(converterType.name)._\(method.callName)[_iotaWitness.env](") {
                                fragment.output("_iotaWitness.object,")
                                for param in method.parameters {
                                    let resolvedParam = context.resolve(type: param.type)
                                    fragment.output("try \(resolvedParam.converterType.name).toIota(\(param.name), env: _iotaWitness.env),")
                                }
                                fragment.output("exn")
                            }
                        }
                        fragment.output("env: _iotaWitness.env")
                    }
                }
            }
        }

        fragment.blankLine()

        for defaultMethod in defaultMethods {
            fragment.outputBlock("struct \(foreignProtocolType)_sans_\(defaultMethod.callName): \(sourceType.name) {", closeWith: "}") {
                fragment.output("var wrapped: \(sourceType.name)")

                for variable in computedVariables {
                    fragment.output()
                    let name = variable.name
                    let type = variable.typeName.better.name
                    fragment.outputBlock("public var \(name): \(type) {") {
                        fragment.outputBlock("get throws {") {
                            fragment.output("try wrapped.\(name)")
                        }
                    }
                }
                for method in methods {
                    guard method.name != defaultMethod.name else {
                        continue
                    }
                    fragment.output()
                    let returnSignature = "\(method.isThrowing ? " throws" : "") -> \(method.returnType.name)"
                    fragment.outputBlock("public func \(method.name)\(returnSignature) {", closeWith: "}") {
                        var methodParamsStr = [String]()
                        for param in method.parameters {
                            if let paramLabel = param.label {
                                methodParamsStr.append("\(paramLabel): \(param.name)")
                            } else {
                                methodParamsStr.append("\(param.name)")
                            }
                        }
                        fragment.output("\(method.isThrowing ? "try " : "")wrapped.\(method.callName)(\(methodParamsStr.joined(separator: ", ")))")
                    }
                }
            }
            fragment.output()
        }

        fragment.blankLine()

        fragment.output("@_cdecl(\"\(iotaSetupName)\")")
        fragment.outputBlock("public func \(iotaSetupName)(", newLineTerminated: false) {
            fragment.output("envRef: EnvRef,")
            fragment.output("constructorMethod: @escaping \(converterType.name)._ConstructorMethod,")
            for computedVar in computedVariables {
                let resolved = context.resolve(type: computedVar.typeName.better)
                fragment.output("_ \(computedVar.name)Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> \(resolved.converterType.name).CType,")
                if computedVar.isMutable {
                    fragment.output("_ \(computedVar.name)Setter: @escaping @convention(c) (foreignObject, \(resolved.converterType.name).CType, _ exn: foreignOutExn) -> Void,")
                }
            }
            for method in methods {
                let resolvedReturnType = context.resolve(type: method.returnType)
                fragment.outputBlock("_ \(method.callName): @escaping @convention(c) (", closeWith: ") -> \(resolvedReturnType.converterType.name).CType,") {
                    fragment.output("foreignObject,")
                    for param in method.parameters {
                        let resolvedParam = context.resolve(type: param.type)
                        fragment.output("\(resolvedParam.converterType.name),")
                    }
                    fragment.output("_ exn: foreignOutExn")
                }
            }
            fragment.output("_ exn: foreignOutExn")
        }
        fragment.outputBlock(" {") {
            fragment.output("let env = Env(envRef)")
            fragment.output("if \(converterType.name)._constructorMethod.isInitialized(env) { return }")
            fragment.output("\(converterType.name)._constructorMethod[env] = constructorMethod")
            for computedVar in computedVariables {
                fragment.output("\(converterType.name)._\(computedVar.name)Getter[env] = \(computedVar.name)Getter")
                if computedVar.isMutable {
                    fragment.output("\(converterType.name)._\(computedVar.name)Setter[env] = \(computedVar.name)Setter")
                }
            }
            for method in methods {
                fragment.output("\(converterType.name)._\(method.callName)[env] = \(method.callName)")
            }
        }
        fragment.blankLine()

        fragment.outputBlock("extension \(converterType.name): IotaMutator {") {
            fragment.output("public typealias CType = foreignObject")

            fragment.outputBlock("public typealias _ConstructorMethod = @convention(c) (", closeWith: ") -> foreignObject") {
                fragment.output("_ ref: UnsafeMutableRawPointer,")
                fragment.output("_ exn: foreignOutExn")
            }
            fragment.output("fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()")
            for computedVar in computedVariables {
                let resolved = context.resolve(type: computedVar.typeName.better)
                fragment.output("fileprivate static let _\(computedVar.name)Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> \(resolved.converterType.name).CType>()")
                if computedVar.isMutable {
                    fragment.output("fileprivate static let _\(computedVar.name)Setter = Env.CallbackMap<@convention(c) (foreignObject, \(resolved.converterType.name).CType, _ exn: foreignOutExn) -> Void>()")
                }
            }
            for method in methods {
                let resolvedReturnType = context.resolve(type: method.returnType)
                fragment.outputBlock("fileprivate static let _\(method.callName) = Env.CallbackMap<@convention(c) (", closeWith: ") -> \(resolvedReturnType.converterType.name).CType>()") {
                    fragment.output("foreignObject,")
                    for param in method.parameters {
                        let resolvedParam = context.resolve(type: param.type)
                        fragment.output("\(resolvedParam.converterType.name),")
                    }
                    fragment.output("_ exn: foreignOutExn")
                }
            }
            fragment.blankLine()

            fragment.outputBlock("public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {") {
                fragment.outputBlock("do {", newLineTerminated: false) {
                    fragment.output("let box = try Box<SwiftType>.peekIota(value, env: env)")
                    fragment.output("return box.value")
                }
                fragment.outputBlock(" catch {") {
                    fragment.output("let iotaWitness = try IotaReference(value, env: env)")
                    fragment.output("return _IotaAProtocol(_iotaWitness: iotaWitness)")
                }
            }
            fragment.blankLine()

            fragment.outputBlock("public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {") {
                fragment.outputBlock("try env.check { exn in", closeWith: "}") {
                    fragment.output("// here's where we should make a new witness with witness constructor")
                    fragment.outputBlock("_constructorMethod[env](") {
                        fragment.output("Box(value).retainedOpaque(),")
                        fragment.output("exn")
                    }
                }
            }
            fragment.blankLine()

            fragment.outputBlock("public static func mutateIota(_ this: foreignObject, to value: SwiftType, env: Env) throws {") {
                for computedVar in computedVariables {
                    let resolved = context.resolve(type: computedVar.typeName.better)
                    if computedVar.isMutable {
                        fragment.outputBlock("try env.check { exn in _\(computedVar.name)Setter[env](", closeWith: ")}") {
                            fragment.output("this,")
                            fragment.output("try \(resolved.converterType.name).toIota(value.\(computedVar.name), env: env),")
                            fragment.output("exn")
                        }
                    }
                }
            }
        }

        registerDartClass(context: context)

        // TODO: Handle Protocols
        if conformances.isEmpty {
            registerCSharpClass(context: context)
        }

        return fragment
    }

    func jniDefinitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        let fragment = context.swiftFragment(
            "JavaInterface/\(sourceType.name)+java-type.swift",
            additionalImports: ["Foundation", "FishyJoesJavaRuntime", "\(context.module.name)_CommonInterface"]
        )

        let foreignProtocolType = "_Java\(sourceType.nonNamespacedName)"

        var methodIDs: [(idHandle: String, name: String, signature: String)] = []
        let defaultMethods = methods.filter { $0.isInExtension }
        let normalMethods = methods.filter { !$0.isInExtension }

        fragment.outputBlock("struct \(foreignProtocolType): \(sourceType.name) {") {
            fragment.output("let _javaWitness: JavaReference")

            for variable in computedVariables {
                fragment.output()
                let name = variable.name
                let type = variable.typeName.better.name
                let resolved = context.resolve(type: variable.typeName.better)
                let getID = "_\(name)GetMethodID"
                let setID = variable.isMutable ? "_\(name)SetMethodID" : nil
                methodIDs.append((idHandle: getID, name: "get_\(name)", signature: "()\(resolved.jniType.asSignature)"))
                fragment.output("static var \(getID): jmethodID?")
                if let setID = setID {
                    methodIDs.append((idHandle: setID, name: "set_\(name)", signature: "(\(resolved.jniType.asSignature))V"))
                    fragment.output("static var \(setID): jmethodID?")
                }
                fragment.outputBlock("\(variable.isStatic ? "static " : "")public var \(name): \(type) {") {
                    fragment.outputBlock("get\(!variable.isMutable ? " throws" : "") {") {
                        let perhapsExclaim = variable.isMutable ? "!" : ""
                        fragment.output("let env = try\(perhapsExclaim) Env.acquireJVMThread(on: _javaWitness.vm)")
                        fragment.outputBlock("defer {") {
                            fragment.output("try? Env.relinquishJVMThread(on: _javaWitness.vm)")
                        }
                        fragment.outputBlock("return try\(perhapsExclaim) \(resolved.converterType.name).fromJava(") {
                            fragment.output("env.Call\(resolved.jniType.valueType)Method(_javaWitness.object, Self.\(getID)),")
                            fragment.output("env: env")
                        }
                    }
                    if variable.isMutable {
                        fragment.outputBlock("set {") {
                            fragment.output("let env = try! Env.acquireJVMThread(on: _javaWitness.vm)")
                            fragment.outputBlock("defer {") {
                                fragment.output("try? Env.relinquishJVMThread(on: _javaWitness.vm)")
                            }
                            fragment.output("let javaNewValue = try! \(resolved.converterType.name).toJava(newValue, env: env)")
                            fragment.output("try! env.CallVoidMethod(_javaWitness.object, Self._\(name)SetMethodID, jvalue(javaNewValue))")
                        }
                    }
                }
            }
            for method in methods {
                fragment.output()
                let resolvedReturn = context.resolve(type: method.returnType)
                var returnSignature = "\(method.isThrowing ? " throws" : "")"
                if method.returnType.name != "Void" {
                    returnSignature.append(" -> \(method.returnType.name)")
                }
                fragment.output("static var _\(method.callName)MethodID: jmethodID?")
                var paramSigs = [String]()
                do {
                    for param in method.parameters {
                        paramSigs.append("\(param.labelAndName): \(param.type.name)")
                    }
                }
                fragment.outputBlock("\(method.isStatic ? "static " : "")public func \(method.callName)(\(paramSigs.joined(separator: ", ")))\(returnSignature) {") {
                    fragment.output("let env = try Env.acquireJVMThread(on: _javaWitness.vm)")
                    fragment.outputBlock("defer {") {
                        fragment.output("try? Env.relinquishJVMThread(on: _javaWitness.vm)")
                    }
                    fragment.outputBlock("return try \(resolvedReturn.converterType.name).fromJava(") {
                        fragment.outputBlock("env.Call\(resolvedReturn.jniType.valueType)Method(", closeWith: "),") {
                            fragment.output("_javaWitness.object,")
                            fragment.output("Self._\(method.callName)MethodID", newLineTerminated: false)
                            for param in method.parameters {
                                fragment.output(",")
                                let resolved = context.resolve(type: param.type)
                                fragment.output("jvalue(try \(resolved.converterType.name).toJava(\(param.name), env: env))", newLineTerminated: false)
                            }
                            fragment.output()
                        }
                        fragment.output("env: env")
                    }
                }
            }
        }

        fragment.output()

        for defaultMethod in defaultMethods {
            fragment.outputBlock("struct \(foreignProtocolType)_sans_\(defaultMethod.callName): \(sourceType.name) {", closeWith: "}") {
                fragment.output("var wrapped: \(sourceType.name)")

                for variable in computedVariables {
                    fragment.output()
                    let name = variable.name
                    let type = variable.typeName.better.name
                    fragment.outputBlock("public var \(name): \(type) {") {
                        fragment.outputBlock("get throws {") {
                            fragment.output("try wrapped.\(name)")
                        }
                    }
                }
                for method in methods {
                    guard method.name != defaultMethod.name else {
                        continue
                    }
                    fragment.output()
                    let returnSignature = "\(method.isThrowing ? " throws" : "") -> \(method.returnType.name)"
                    fragment.outputBlock("public func \(method.name)\(returnSignature) {", closeWith: "}") {
                        var methodParamsStr = [String]()
                        for param in method.parameters {
                            if let paramLabel = param.label {
                                methodParamsStr.append("\(paramLabel): \(param.name)")
                            } else {
                                methodParamsStr.append("\(param.name)")
                            }
                        }
                        fragment.output("\(method.isThrowing ? "try " : "")wrapped.\(method.callName)(\(methodParamsStr.joined(separator: ", ")))")
                    }
                }
            }
            fragment.output()
        }

        fragment.outputBlock("extension \(converterType.name): JavaMutator {") {
            fragment.output("public typealias CType = jobject?")

            fragment.output("public static var javaClass: jclass?")
            fragment.output("public static var externalWitnessClass: jclass?")

            fragment.output("public static var externalWitnessConstructor: jmethodID?")

            if !defaultMethods.isEmpty {
                fragment.output("public static var externalCompanionClass: jclass?")
            }

            fragment.outputBlock("public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {") {
                fragment.outputBlock("if env.IsInstanceOf(value, AnyBox.javaClass) {") {
                    fragment.output("return try Box<SwiftType>.fromJava(value, env: env).value")
                }
                fragment.output("return \(foreignProtocolType)(_javaWitness: try JavaReference(local: value, env: env))")
            }

            fragment.outputBlock("public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {") {
                fragment.outputBlock("try env.NewObject(") {
                    fragment.output("externalWitnessClass,")
                    fragment.output("externalWitnessConstructor,")
                    fragment.output("jvalue(pointer: Box(value).retainedOpaque())")
                }
            }

            fragment.outputBlock("public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout SwiftType) throws -> R) throws -> R {") {
                fragment.output("try body(&Box<SwiftType>.fromJava(this, env: env).value)")
            }

            fragment.outputBlock("public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout SwiftType, inout Env) async throws -> R) async throws -> R {") {
                fragment.output("try await body(&Box<SwiftType>.fromJava(this, env: env).value, &env)")
            }

            fragment.outputBlock("public static func javaSetup(env: Env) throws {") {
                fragment.output("javaClass = try env.globalRef(env.FindClass(\"\(className)\"))")
                fragment.output("externalWitnessClass = try env.globalRef(env.FindClass(\"\(javaExternalWitnessClassName)\"))")
                fragment.output("externalWitnessConstructor = try env.GetMethodID(externalWitnessClass, \"<init>\", \"(J)V\")")
                for computedVar in computedVariables {
                    let resolved = context.resolve(type: computedVar.typeName.better)
                    let jniSignature = resolved.jniType.asSignature
                    fragment.output("\(foreignProtocolType)._\(computedVar.name)GetMethodID = try env.GetMethodID(javaClass, \"get\(computedVar.name.capitalized)\", \"()\(jniSignature)\")")
                    if computedVar.isMutable {
                        fragment.output("\(foreignProtocolType)._\(computedVar.name)SetMethodID = try env.GetMethodID(javaClass, \"set\(computedVar.name.capitalized)\", \"(\(jniSignature))V\")")
                    }
                }
                for normalMethod in normalMethods {
                    let jniSignature = normalMethod.jniSignature(context: context)
                    fragment.output("\(foreignProtocolType)._\(normalMethod.callName)MethodID = try env.GetMethodID(javaClass, \"\(normalMethod.callName)\", \"\(jniSignature)\")")
                }
                if !defaultMethods.isEmpty {
                    fragment.output("externalCompanionClass = try env.globalRef(env.FindClass(\"\(className)$Companion\"))")
                    for defaultMethod in defaultMethods {
                        let jniSignature = defaultMethod.jniSignature(context: context)
                        fragment.output("\(foreignProtocolType)._\(defaultMethod.callName)MethodID = try env.GetMethodID(javaClass, \"\(defaultMethod.callName)\", \"\(jniSignature)\")")
                    }
                }
            }
        }

        context.add(
            kotlinClass: KotlinInterface(
                module: context.module,
                documentation: documentation,
                name: kotlinName,
                fieldsAndMethods:
                    computedVariables.compactMap { context.kotlin(field: $0, useNativeName: false) } +
                    methods.flatMap { method -> [KotlinClass.MethodOrVariable] in
                        guard let kotlinMethodOrVariable = context.kotlin(method: method) else { return [] }

                        guard !method.isStatic, method.isInExtension, case .method(var kotlinMethod) = kotlinMethodOrVariable else {
                            return [kotlinMethodOrVariable]
                        }

                        var defaultMethod = kotlinMethod
                        defaultMethod.name = "_default_\(defaultMethod.name)"
                        defaultMethod.parameters.insert((nil, "self", .named(package: nil, name: kotlinName), nil), at: 0)
                        defaultMethod.isStatic = true

                        var parameters = ["this"]
                        parameters.append(contentsOf: kotlinMethod.parameters.map(\.name))
                        kotlinMethod.body = "__jni_\(defaultMethod.name)(\(parameters.joined(separator: ", ")))"

                        return [.method(kotlinMethod), .method(defaultMethod)]
                    }
            ).conforming(to: conformances, context: context)
        )

        context.add(
            kotlinClass: KotlinProductClass(
                module: context.module,
                isPrivate: true,
                documentation: [],
                name: "_ExternalWitness_\(kotlinName)",
                constructor: .reference,
                fieldsAndMethods: {
                    let nonDefaultMethods = methods.filter { !$0.isInExtension }
                    var fAndM = computedVariables.compactMap { context.kotlin(field: $0, useNativeName: false)}
                    fAndM.append(contentsOf: nonDefaultMethods.compactMap { context.kotlin(method: $0) })
                    return fAndM
                }(),
                conformances: ["com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference)"]
            ).conforming(to: [sourceType.name], context: context)
        )

        return [fragment]
    }

    func registerCSharpClass(context: FishyJoesContext) {
        // TODO: Implement me!
    }

    func registerDartClass(context: FishyJoesContext) {
        context.add(
            dartClass: DartProtocolClass(
                module: context.module,
                documentation: documentation,
                name: dartType.name(),
                fieldsAndMethods: {
                    var fAndM = computedVariables.compactMap { context.dart(field: $0, of: self, useNativeName: false) }
                    fAndM.append(contentsOf: methods.compactMap { context.dart(method: $0, of: self) })
                    return fAndM
                }(),
                conformances: conformances
            )
        )

        context.add(
            dartClass: DartProductClass(
                module: context.module,
                documentation: documentation,
                name: "\(context.module.name).ExternalWitness_\(sourceType.nonNamespacedName)",
                constructor: .reference,
                fieldsAndMethods: {
                    let nonDefaultMethods = methods.filter { !$0.isInExtension }
                    var fAndM = computedVariables.compactMap {
                        context.dart(field: $0, of: self, useNativeName: false)
                    }
                    fAndM.append(contentsOf: nonDefaultMethods.compactMap { context.dart(method: $0, of: self) })
                    return fAndM
                }(),
                conformances: [sourceType.nonNamespacedName],
                isExternalWitness: true
            )
        )
    }
}

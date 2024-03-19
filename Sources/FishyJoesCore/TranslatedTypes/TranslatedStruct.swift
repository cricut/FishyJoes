import SourceryRuntime

struct TranslatedStruct: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let neutralName: String
    var containedNamedTypes: [TranslatedType] { [self] }
    let kotlinPackage: String?
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let storedVariables: [Variable]
    let computedVariables: [Variable]
    let methods: [Method]
    let documentation: [String]
    let jniType: JNIType
    let isInhabited: Bool
    let definingModule: Module
    let conformances: Set<String>

    init(context: FishyJoesContext, type: Type) {
        guard let exportAnnotation = type.exportAnnotation else {
            fatalErr("c symbol not specified")
        }
        guard type.kind == "struct" else { fatalErr("not a struct") }

        self.sourceType = BetterType(named: type, context: context)
        self.nodeName = exportAnnotation.name
        self.kotlinName = exportAnnotation.name
        self.neutralName = "Struct<Named=\(exportAnnotation.name)>"
        self.kotlinPackage = context.module.kotlinPackage
        self.cSharpType = .named(package: context.module.cSharpNamespace, name: exportAnnotation.cSharpName)
        self.dartType = .named(package: context.module.dartNamespace, name: context.dartTranslator.fakeNamespace(exportAnnotation.name))
        self.jniType = .object(context.kotlinTranslator.javaClassName(nodeName, in: context))

        self.storedVariables = type.storedVariables
        self.computedVariables =
            (type.computedVariables + type.staticVariables).filter { $0.exportAnnotation != nil }

        self.methods = type.methods.compactMap { Method($0) }.sorted(by: { $0.name < $1.name })
        self.documentation = type.documentation
        self.isInhabited = type.isInhabited
        self.definingModule = context.module
        self.conformances = exportAnnotation.conformances
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        [
            nodeDefinitionFragment(in: context),
            jniDefinitionFragment(in: context),
            iotaDefinitionFragment(in: context),
        ] + neutralDefinitionFragments(in: context)
    }

    func neutralDefinitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        guard context.dumpDebugRepresentation else { return [] }

        let fragment = SourceFragment(
            sourceryDestination: "file:../../DebugGenerated/\(sourceType.name)+StructInfo.txt"
        )
        fragment.outputBlock("TranslatedStruct for \(sourceType.name) {") {
            fragment.outputBlock("Documentation {") {
                for doc in documentation {
                    fragment.output(doc)
                }
            }
            fragment.outputBlock("Methods {") {
                for method in methods {
                    context.neutralTranslator.output(method: method, context: context, fragment: fragment)
                }
            }
            fragment.outputBlock("Stored Variables {") {
                for variable in storedVariables {
                    context.neutralTranslator.output(variable: variable, context: context, fragment: fragment)
                }
            }
            fragment.outputBlock("Computed Variables {") {
                for variable in computedVariables {
                    context.neutralTranslator.output(variable: variable, context: context, fragment: fragment)
                }
            }
        }
        return [fragment]
    }

    func nodeDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "NodeInterface/\(sourceType.name)+node.swift",
            additionalImports: ["Foundation", "FishyJoesNodeRuntime", "\(context.module.name)_CommonInterface"]
        )

        fragment.outputBlock("extension \(sourceType.name): NodeMutator {") {
            fragment.output("public typealias SwiftType = Self")
            fragment.outputBlock("public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {") {
                // TODO: type check
                fragment.outputBlock("Self(") {
                    for (index, storedVar) in storedVariables.enumerated() {
                        let resolved = context.resolve(type: storedVar.typeName.better)
                        let last = index == storedVariables.count - 1
                        fragment.outputBlock("\(storedVar.name): try { () -> \(resolved.sourceType.name) in", closeWith: last ? "}()" : "}(),") {
                            fragment.output("let fieldValue = try env.getNamedProperty(value, \"\(storedVar.name)\")")
                            fragment.output("return try \(resolved.converterType.name).fromNode(fieldValue, env: env)")
                        }
                    }
                }
            }

            fragment.outputBlock("public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {") {
                fragment.output("let constructor = try NodeClass.constructor(for: \"\(nodeName)\", env: env)")
                fragment.outputBlock("let args: [NAPI.Value] = [") {
                    for storedVar in storedVariables {
                        let resolved = context.resolve(type: storedVar.typeName.better)
                        fragment.output("try \(resolved.converterType.name).toNode(value.\(storedVar.name), env: env),")
                    }
                }
                fragment.output("return try env.newInstance(constructor, args)")
            }

            fragment.outputBlock("public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {") {
                for storedVar in storedVariables {
                    guard storedVar.isMutable else { continue }
                    let resolved = context.resolve(type: storedVar.typeName.better)
                    fragment.output("try env.setNamedProperty(this, \"\(storedVar.name)\", \(resolved.converterType.name).toNode(value.\(storedVar.name), env: env))")
                }
            }

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
                        for storedVar in storedVariables {
                            // Limitation in wasm implementation of napi_create_class doesn't allow constructors to assign to non-mutable property.
                            // let mutable = storedVar.isPubliclyWritable
                            let mutable = true
                            fragment.output("\"\(storedVar.name)\": (.stored(mutable: \(mutable)), isStatic: \(storedVar.isStatic)),")
                            hasProperties = true
                        }
                        if !hasProperties {
                            fragment.output(":")
                        }
                    }
                    fragment.outputBlock("constructor: { env, info in", closeWith: "}") {
                        fragment.outputBlock("callbackBody(env, info, name: \"\(nodeName)_constructor\", expectedArgumentCount: \(storedVariables.count)) { env in", closeWith: "}") {
                            fragment.output("// TODO: typecheck?")
                            fragment.output("let this = try env.this()")
                            for (index, storedVar) in storedVariables.enumerated() {
                                fragment.output("try env.env.setNamedProperty(this, \"\(storedVar.name)\", env.argument(at: \(index)))")
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
                    storedVariables.map {
                        (
                            name: $0.name,
                            type: context.resolve(type: $0.typeName.better).nodeType
                        )
                    }
                ),
                fields:
                    storedVariables.compactMap { context.ts(field: $0, useNativeName: true) } +
                    computedVariables.compactMap {context.ts(field: $0, useNativeName: false) },
                methods: methods.compactMap { context.ts(method: $0) }
            )
        )

        return fragment
    }

    func jniDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "JavaInterface/\(sourceType.name)+java-type.swift",
            additionalImports: ["Foundation", "FishyJoesJavaRuntime"]
        )
        let className = context.kotlinTranslator.javaClassName(kotlinName, in: context)
        fragment.outputBlock("extension \(sourceType.name): JavaMutator {") {
            fragment.output("public typealias SwiftType = Self")
            fragment.output("public typealias CType = jobject?")
            fragment.blankLine()

            fragment.output("public static var javaClass: jclass?")
            for storedVar in storedVariables {
                fragment.output("private static var _java_\(storedVar.name)_id: jfieldID!")
            }
            fragment.output("private static var _constructorMethodID: jmethodID!")

            fragment.outputBlock("public static func fromJava(_ value: jobject?, env: Env) throws -> Self {") {
                fragment.outputBlock("Self(") {
                    for (index, storedVar) in storedVariables.enumerated() {
                        let resolved = context.resolve(type: storedVar.typeName.better)
                        let last = index == storedVariables.count - 1
                        let fieldCType = resolved.jniType.valueType
                        fragment.outputBlock("\(storedVar.name): try \(resolved.converterType.name).fromJava(", closeWith: last ? ")" : "),") {
                            fragment.output("env.Get\(fieldCType)Field(value, Self._java_\(storedVar.name)_id),")
                            fragment.output("env: env")
                        }
                    }
                }
            }

            fragment.outputBlock("public static func toJava(_ value: Self, env: Env) throws -> jobject? {") {
                fragment.outputBlock("try env.NewObject(") {
                    let args = [
                        "Self.javaClass",
                        "Self._constructorMethodID",
                    ] + storedVariables.map { storedVar in
                        let resolved = context.resolve(type: storedVar.typeName.better)
                        return "jvalue(\(resolved.converterType.name).toJava(value.\(storedVar.name), env: env))"
                    }
                    fragment.outputMap(args, separator: ",") { $0 }
                }
            }

            fragment.outputBlock("public static func javaSetup(env: Env) throws {") {
                fragment.output("guard javaClass == nil else { return }")
                fragment.output("javaClass = try env.globalRef(env.FindClass(\"\(className)\"))")
                var constructorDescriptor = ""
                for storedVar in storedVariables {
                    let resolved = context.resolve(type: storedVar.typeName.better)
                    fragment.output("_java_\(storedVar.name)_id = try env.GetFieldID(javaClass, \"\(storedVar.name)\", \"\(resolved.jniType.asSignature)\")")
                    constructorDescriptor += resolved.jniType.asSignature
                }
                fragment.output("_constructorMethodID = try env.GetMethodID(javaClass, \"<init>\", \"(\(constructorDescriptor))V\")")
            }

            fragment.outputBlock("public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Self) throws -> R) throws -> R {") {
                fragment.output("var mutatingSelf = try fromJava(this, env: env)")
                fragment.output("let result = try body(&mutatingSelf)")
                for storedVar in storedVariables {
                    let resolved = context.resolve(type: storedVar.typeName.better)
                    let fieldCType = resolved.jniType.valueType
                    fragment.outputBlock("try env.Set\(fieldCType)Field(") {
                        fragment.output("this, Self._java_\(storedVar.name)_id,")
                        fragment.output("\(resolved.converterType.name).toJava(mutatingSelf.\(storedVar.name), env: env)")
                    }
                }
                fragment.output("return result")
            }

            fragment.outputBlock("public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout Self, inout Env) async throws -> R) async throws -> R {") {
                fragment.output("var mutatingSelf = try fromJava(this, env: env)")
                fragment.output("let result = try await body(&mutatingSelf, &env)")
                for storedVar in storedVariables {
                    let resolved = context.resolve(type: storedVar.typeName.better)
                    let fieldCType = resolved.jniType.valueType
                    fragment.outputBlock("try env.Set\(fieldCType)Field(") {
                        fragment.output("this, Self._java_\(storedVar.name)_id,")
                        fragment.output("\(resolved.converterType.name).toJava(mutatingSelf.\(storedVar.name), env: env)")
                    }
                }
                fragment.output("return result")
            }
        }

        let (fields, methods) = KotlinClass.separate(
            fieldsAndMethods:
                computedVariables.compactMap {
                    context.kotlin(field: $0, useNativeName: false)
                } + methods.compactMap {
                    context.kotlin(method: $0)
                }
        )

        context.add(
            kotlinClass: KotlinProductClass(
                module: context.module,
                documentation: documentation,
                name: kotlinName,
                // storedVariables go into constructor. Export annotation can specify .exportMethod instead of .export, but this is only valid for computed properties, so throw an error if a storedVariable has an .exportMethod annotation (handled in the context.kotlin(field:useNativeName) method).
                constructor: .`public`(
                    fields: storedVariables.compactMap {
                        switch context.kotlin(field: $0, useNativeName: true) {
                        case .method: fatalErr("Can't export a stored variable as a method")
                        case .variable(let field): return field
                        case nil: return nil
                        }
                    },
                    arguments: []
                ),
                fields: fields,
                methods: methods
            ).conforming(to: conformances, context: context)
        )

        return fragment
    }

    func cSharpSetupDelegates(in context: FishyJoesContext) -> [String] {
        var lines: [String] = []
        lines.append("delegate \(cSharpType.pInvokeCreatedName) _\(converterType.genericBaseName.mangledName)Constructor(")
        for storedVar in storedVariables {
            let resolved = context.resolve(type: storedVar.typeName.better)
            lines.append("    \(resolved.cSharpType.pInvokeConsumedName) \(CSharpClass.deforbidify(storedVar.name)),")
        }
        lines.append("    out CreatedRef exn")
        lines.append(");")
        for storedVar in storedVariables {
            let resolved = context.resolve(type: storedVar.typeName.better)
            let commonName = "_\(converterType.genericBaseName.mangledName)_\(storedVar.name)"
            lines.append("delegate \(resolved.cSharpType.pInvokeCreatedName) \(commonName)Getter(\(cSharpType.pInvokeUnownedName) obj, out CreatedRef exn);")
            if storedVar.isMutable {
                lines.append("delegate void \(commonName)Setter(\(cSharpType.pInvokeUnownedName) obj, \(resolved.cSharpType.pInvokeConsumedName) newValue, out CreatedRef exn);")
            }
        }
        return lines
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>] {
        let constructorType = "_\(converterType.genericBaseName.mangledName)Constructor"
        let constructorArgs = storedVariables.map { storedVar in
            let resolved = context.resolve(type: storedVar.typeName.better)
            return "\(resolved.cSharpType.pInvokeConsumedName) \(CSharpClass.deforbidify(storedVar.name)), "
        }.joined()
        return [
            .value(
                name: "constructor",
                type: constructorType
            ) { fragment in
                fragment.outputBlock("bag<\(constructorType)>((\(constructorArgs)out CreatedRef exn) => Catching(out exn, () => {", closeWith: "})),") {
                    fragment.outputBlock("return new CreatedRef(new \(cSharpType.name)(", closeWith: "));") {
                        fragment.outputMap(storedVariables, separator: ",") { storedVar in
                            let resolved = context.resolve(type: storedVar.typeName.better)
                            if resolved.cSharpType.isObject {
                                return "\(CSharpClass.deforbidify(storedVar.name)).Consume<\(resolved.cSharpType.name)>()"
                            } else {
                                return CSharpClass.deforbidify(storedVar.name)
                            }
                        }
                    }
                }
            },
            // ("constructorMethod: @escaping \(converterType.name)._ConstructorMethod,")
        ] + storedVariables.flatMap { storedVar -> [ForeignSetupParameter] in
            let resolved = context.resolve(type: storedVar.typeName.better)
            let commonName = "_\(converterType.genericBaseName.mangledName)_\(storedVar.name)"
            let getType = "\(commonName)Getter"
            let setType = "\(commonName)Setter"
            return [
                .value(
                    name: "get_\(storedVar.name)",
                    type: getType
                ) { fragment in
                    fragment.outputBlock("bag<\(getType)>((\(cSharpType.pInvokeUnownedName) obj, out CreatedRef exn) => Catching(out exn, () =>", closeWith: ")),") {
                        let grab = "obj.Peek<\(cSharpType.name)>().\(CSharpClass.deforbidify(upperCaseFirst(storedVar.name)))"
                        if resolved.cSharpType.isObject {
                            fragment.output("new CreatedRef(\(grab))")
                        } else {
                            fragment.output("\(grab)")
                        }
                    }
                }
            ] + (
                storedVar.isMutable ? [
                    .value(
                        name: "set_\(storedVar.name)",
                        type: setType
                    ) { fragment in
                        fragment.outputBlock("bag<\(setType)>((\(cSharpType.pInvokeUnownedName) obj, \(resolved.cSharpType.pInvokeConsumedName) newValue, out CreatedRef exn) => Catching(out exn, () => {", closeWith: "})),") {
                            fragment.output("obj.Peek<\(cSharpType.name)>().\(CSharpClass.deforbidify(upperCaseFirst(storedVar.name))) = ", newLineTerminated: false)
                            fragment.output(resolved.cSharpType.isObject ? "newValue.Consume<\(resolved.cSharpType.name)>();" : "newValue;")
                        }
                    },
                ] : []
            )
        }
    }

    func dartSetupDelegates(in context: FishyJoesContext) -> [String] {
        var lines: [String] = []
        lines.append("typedef _\(converterType.genericBaseName.mangledName)Constructor = \(dartType.ffiCreatedName) Function(")
        for storedVar in storedVariables {
            let resolved = context.resolve(type: storedVar.typeName.better)
            lines.append("    \(resolved.dartType.ffiConsumedTag) \(storedVar.name),")
        }
        lines.append("    OutCreatedRef exn")
        lines.append(");")
        for storedVar in storedVariables {
            let resolved = context.resolve(type: storedVar.typeName.better)
            let commonName = "_\(converterType.genericBaseName.mangledName)_\(storedVar.name)"
            lines.append("typedef \(commonName)Getter = \(resolved.dartType.ffiCreatedTag) Function(\(dartType.ffiUnownedTag) obj, OutCreatedRef exn);")
            if storedVar.isMutable {
                lines.append("typedef \(commonName)Setter = ffi.Void Function(\(dartType.ffiUnownedTag) obj, \(resolved.dartType.ffiConsumedTag) newValue, OutCreatedRef exn);")
            }
        }
        return lines
    }

    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>] {
        let constructorType = "_\(converterType.genericBaseName.mangledName)Constructor"
        var setupParams = [ForeignSetupParameter<DartClass.DartType>]()

        setupParams.append(
            .value(
                name: "constructor",
                type: .named(package: nil, name: "ffi.Pointer<ffi.NativeFunction<\(constructorType)>>")
            ) { fragment in
                fragment.output("ffi.Pointer.fromFunction(\(dartType.name()).ffi_constructor),")
            }
        )

        setupParams.append(
            contentsOf:
                storedVariables.flatMap { storedVar -> [ForeignSetupParameter<DartClass.DartType>] in
                    let resolved = context.resolve(type: storedVar.typeName.better)
                    let commonName = "_\(converterType.genericBaseName.mangledName)_\(storedVar.name)"
                    let getType = "\(commonName)Getter"
                    let setType = "\(commonName)Setter"
                    var returnVals = [ForeignSetupParameter<DartClass.DartType>]()
                    returnVals.append(
                        .value(
                            name: "get_\(storedVar.name)",
                            type: .named(package: nil, name: "ffi.Pointer<ffi.NativeFunction<\(getType)>>")
                        ) { fragment in
                            let defaultValue = resolved.dartType.defaultReturnValue.map { ", \($0)" } ?? ""
                            fragment.output("ffi.Pointer.fromFunction(\(dartType.name()).ffi_get_\(storedVar.name)\(defaultValue)),")
                        }
                    )
                    if storedVar.isMutable {
                        returnVals.append(
                            .value(
                                name: "set_\(storedVar.name)",
                                type: .named(package: nil, name: "ffi.Pointer<ffi.NativeFunction<\(setType)>>")
                            ) { fragment in
                                fragment.output("ffi.Pointer.fromFunction(\(dartType.name()).ffi_set_\(storedVar.name)),")
                            }
                        )
                    }
                    return returnVals
                }
        )

        return setupParams
    }

    func iotaDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "IotaInterface/\(sourceType.name)+iota-type.swift",
            additionalImports: ["Foundation", "FishyJoesIotaRuntime"]
        )

        fragment.output("@_cdecl(\"\(iotaSetupName)\")")
        fragment.outputBlock("public func \(iotaSetupName)(", newLineTerminated: false) {
            fragment.output("envRef: EnvRef,")
            fragment.output("constructorMethod: @escaping \(converterType.name)._ConstructorMethod,")
            for storedVar in storedVariables {
                let resolved = context.resolve(type: storedVar.typeName.better)
                fragment.output("_ \(storedVar.name)Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> \(resolved.converterType.name).CType,")
                if storedVar.isMutable {
                    fragment.output("_ \(storedVar.name)Setter: @escaping @convention(c) (foreignObject, \(resolved.converterType.name).CType, _ exn: foreignOutExn) -> Void,")
                }
            }
            fragment.output("_ exn: foreignOutExn")
        }
        fragment.outputBlock(" {") {
            fragment.output("let env = Env(envRef)")
            fragment.output("if \(converterType.name)._constructorMethod.isInitialized(env) { return }")
            fragment.output("\(converterType.name)._constructorMethod[env] = constructorMethod")
            for storedVar in storedVariables {
                fragment.output("\(converterType.name)._\(storedVar.name)Getter[env] = \(storedVar.name)Getter")
                if storedVar.isMutable {
                    fragment.output("\(converterType.name)._\(storedVar.name)Setter[env] = \(storedVar.name)Setter")
                }
            }
        }
        fragment.blankLine()

        fragment.outputBlock("extension \(converterType.name): IotaMutator {") {
            for storedVar in storedVariables {
                let resolved = context.resolve(type: storedVar.typeName.better)
                fragment.output("fileprivate static let _\(storedVar.name)Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> \(resolved.converterType.name).CType>()")
                if storedVar.isMutable {
                    fragment.output("fileprivate static let _\(storedVar.name)Setter = Env.CallbackMap<@convention(c) (foreignObject, \(resolved.converterType.name).CType, _ exn: foreignOutExn) -> Void>()")
                }
            }
            fragment.outputBlock("public typealias _ConstructorMethod = @convention(c) (", closeWith: ") -> foreignObject") {
                for storedVar in storedVariables {
                    let resolved = context.resolve(type: storedVar.typeName.better)
                    fragment.output("\(resolved.converterType.name).CType,")
                }
                fragment.output("_ exn: foreignOutExn")
            }
            fragment.output("fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()")
            fragment.blankLine()

            fragment.outputBlock("public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {") {
                fragment.outputBlock("Self(") {
                    for (index, storedVar) in storedVariables.enumerated() {
                        let resolved = context.resolve(type: storedVar.typeName.better)
                        let last = index == storedVariables.count - 1
                        fragment.outputBlock("\(storedVar.name): try \(resolved.converterType.name).consumeIota(", closeWith: last ? ")" : "),") {
                            fragment.output("try env.check { exn in _\(storedVar.name)Getter[env](value, exn) },")
                            fragment.output("env: env")
                        }
                    }
                }
            }
            fragment.blankLine()

            fragment.outputBlock("public static func toIota(_ value: Self, env: Env) throws -> foreignObject {") {
                fragment.outputBlock("try env.check { exn in", closeWith: "}") {
                    fragment.outputBlock("_constructorMethod[env](") {
                        for storedVar in storedVariables {
                            let resolved = context.resolve(type: storedVar.typeName.better)
                            fragment.output("try \(resolved.converterType.name).toIota(value.\(storedVar.name), env: env),")
                        }
                        fragment.output("exn")
                    }
                }
            }
            fragment.blankLine()

            fragment.outputBlock("public static func mutateIota(_ this: foreignObject, to value: Self, env: Env) throws {") {
                for storedVar in storedVariables {
                    let resolved = context.resolve(type: storedVar.typeName.better)
                    if storedVar.isMutable {
                        fragment.outputBlock("try env.check { exn in _\(storedVar.name)Setter[env](", closeWith: ")}") {
                            fragment.output("this,")
                            fragment.output("try \(resolved.converterType.name).toIota(value.\(storedVar.name), env: env),")
                            fragment.output("exn")
                        }
                    }
                }
                let mutableFields = storedVariables.filter { $0.isMutable }
                if mutableFields.isEmpty {
                    fragment.output("// no mutable fields exist to mutate")
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

    func registerCSharpClass(context: FishyJoesContext) {
        let fieldsAndMethods =
            computedVariables.compactMap { context.cSharp(field: $0, of: self, useNativeName: false) } +
            methods.compactMap { context.cSharp(method: $0, of: self) }

        context.add(
            cSharpClass: CSharpProductClass(
                module: context.module,
                documentation: documentation,
                name: cSharpType.name,
                constructor: .`public`(
                    fields: storedVariables.compactMap {
                        switch context.cSharp(field: $0, of: self, useNativeName: true) {
                        case .method: fatalErr("Can't export a stored variable `\(self.sourceType.name).\($0.name)` as a method")
                        case .variable(let field): return field
                        case nil: return nil
                        }
                    }
                ),
                fieldsAndMethods: fieldsAndMethods
            )
        )
    }

    func registerDartClass(context: FishyJoesContext) {
        let (fields, methods) = DartClass.separate(
            fieldsAndMethods:
                computedVariables.compactMap {
                    context.dart(field: $0, of: self, useNativeName: false)
                } + methods.compactMap {
                    context.dart(method: $0, of: self)
                }
        )

        context.add(
            dartClass: DartProductClass(
                module: context.module,
                documentation: documentation,
                name: dartType.name(),
                constructor: .`public`(
                    fields: storedVariables.compactMap {
                        switch context.dart(field: $0, of: self, useNativeName: true) {
                        case .method: fatalErr("Can't export a stored variable `\(self.sourceType.name).\($0.name)` as a method")
                        case .variable(let field): return field
                        case nil: return nil
                        }
                    }
                ),
                fields: fields,
                methods: methods,
                conformances: conformances
            )
        )
    }
}

import SourceryRuntime

struct TranslatedReference: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let definingTSNamespace: String?
    let kotlinName: String
    let neutralName: String
    var containedNamedTypes: [TranslatedType] { [self] }
    let kotlinPackage: String?
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let methods: [Method]
    let computedVariables: [Variable]
    let documentation: [String]
    let className: String
    let jniType: JNIType
    let equatable: Bool
    let hashable: Bool
    let isInhabited: Bool
    let definingModule: Module
    let implements: [Type]
    let conformances: Set<String>

    init(context: FishyJoesContext, type: Type) {
        guard let exportAnnotation = type.exportAnnotation else {
            fatalErr("c symbol not specified")
        }
        let typeName = exportAnnotation.name

        self.sourceType = BetterType(named: type, context: context)
        self.nodeName = typeName
        self.definingTSNamespace = context.module.name
        self.neutralName = "Reference<To=\(typeName)>"
        self.kotlinName = typeName
        self.kotlinPackage = context.module.kotlinPackage
        self.cSharpType = .named(package: context.module.cSharpNamespace, name: exportAnnotation.cSharpName)
        self.dartType = .named(package: context.module.dartNamespace, name: context.dartTranslator.fakeNamespace(exportAnnotation.name))
        self.methods = type.methods.compactMap { Method($0) }
        self.computedVariables = type.variables.filter { $0.exportAnnotation != nil }
        self.documentation = type.documentation
        self.className = context.kotlinTranslator.javaClassName(kotlinName, in: context)
        self.jniType = .object(className)
        self.equatable = type.equatable
        self.hashable = type.hashable
        self.isInhabited = type.isInhabited
        self.definingModule = context.module
        self.implements = Array(type.implements.values)
        self.conformances = exportAnnotation.conformances
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        return [
            nodeDefinitionFragment(in: context),
            jniDefinitionFragment(in: context),
            iotaDefinitionFragment(in: context),
        ] + neutralDefinitionFragments(in: context)
    }

    func neutralDefinitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        guard context.dumpDebugRepresentation else { return [] }

        let fragment = SourceFragment(
            sourceryDestination: "file:../../DebugGenerated/\(sourceType.name)+ReferenceInfo.txt"
        )
        fragment.outputBlock("TranslatedReference for \(sourceType.name) {") {
            fragment.output("Equatable: \(equatable)")
            fragment.output("Hashable: \(hashable)")
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
            fragment.outputBlock("Variables {") {
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
            additionalImports: [
                "Foundation",
                "FishyJoesNodeRuntime",
                "\(context.module.name)_CommonInterface"
            ]
        )
        fragment.outputBlock("extension \(sourceType.name): FishyJoesNodeRuntime.NodeConverter {") {
            fragment.outputBlock("public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> \(sourceType.name) {") {
                fragment.outputBlock("guard let nonNilPointer = try env.unwrap(value) else {") {
                    fragment.output("throw JSException(message: \"expected \(sourceType.name), got nil\")")
                }
                fragment.output("return try Box<\(sourceType.name)>.takeUnretainedOpaque(nonNilPointer).value")
            }
            fragment.blankLine()

            fragment.outputBlock("public static func toNode(_ value: \(sourceType.name), env: NAPI.Env) throws -> NAPI.Value {") {
                guard isInhabited else {
                    fragment.output("// Uninhabited")
                    return
                }
                fragment.output("let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: \"\(nodeName)\", env: env)")
                fragment.output("let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)")
                fragment.output("return try env.newInstance(constructor, [arg])")
            }
            fragment.blankLine()

            fragment.outputBlock("public static func mutateNode(_ value: \(sourceType.name), this: NAPI.Value, env: NAPI.Env) throws {") {
                guard isInhabited else {
                    fragment.output("// Uninhabited")
                    return
                }
                fragment.outputBlock("guard let pointer = try env.unwrap(this) else {") {
                    fragment.output("throw JSException(message: \"expected \(sourceType.name), got nil\")")
                }
                fragment.output("try Box<\(sourceType.name)>.takeUnretainedOpaque(pointer).value = value")
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
                        if !hasProperties {
                            fragment.output(":")
                        }
                    }
                    fragment.outputBlock("constructor: { env, info in", closeWith: "}") {
                        fragment.outputBlock("FishyJoesNodeRuntime.callbackBody(env, info, name: \"\(nodeName)_constructor\", expectedArgumentCount: 1) { env in", closeWith: "}") {
                            fragment.output("try FishyJoesNodeRuntime.Box<\(sourceType.name)>.construct(env: env)")
                        }
                    }
                }
                fragment.outputBlock("try FishyJoesNodeRuntime.mergeDefinitionInto(") {
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
                constructor: .hidden,
                fields: computedVariables.compactMap { context.ts(field: $0) },
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
        fragment.outputBlock("extension \(sourceType.name): JavaMutator {") {
            fragment.output("public static var javaClass: jclass?")
            fragment.output("private static var _constructorMethodID: jmethodID!")

            fragment.outputBlock("public static func fromJava(_ value: jobject?, env: Env) throws -> \(sourceType.name) {") {
                fragment.output("try Box<\(sourceType.name)>.fromJava(value, env: env).value")
            }

            fragment.outputBlock("public static func toJava(_ value: \(sourceType.name), env: Env) throws -> jobject? {") {
                if !isInhabited {
                    fragment.output("// Uninhabited type")
                } else {
                    fragment.output("let ptr = jvalue(pointer: Box(value).retainedOpaque())")
                    fragment.output("return try env.NewObject(javaClass, _constructorMethodID, ptr)")
                }
            }

            fragment.outputBlock("public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout \(sourceType.name), inout Env) async throws -> R) async throws -> R {") {
                fragment.output("try await body(&Box<\(sourceType.name)>.fromJava(this, env: env).value, &env)")
            }

            fragment.outputBlock("public static func javaSetup(env: Env) throws {") {
                fragment.output("guard javaClass == nil else { return }")
                fragment.output("try AnyBox.javaSetup(env: env)")
                fragment.output("javaClass = try env.globalRef(env.FindClass(\"\(className)\"))")
                fragment.output("_constructorMethodID = try env.GetMethodID(javaClass, \"<init>\", \"(J)V\")")
            }

            fragment.outputBlock("public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout \(sourceType.name)) throws -> R) throws -> R {") {
                fragment.output("try body(&Box<\(sourceType.name)>.fromJava(this, env: env).value)")
            }

            if equatable != hashable {
                fatalErr("Type \(sourceType.name) must implement either none or both of Equatable and Hashable")
            }

            if equatable {
                fragment.outputBlock("static let _javaEquals: @convention(c)(", newLineTerminated: false) {
                    fragment.output("UnsafeMutablePointer<JNIEnv?>,")
                    fragment.output("jobject?,")
                    fragment.output("jobject?,")
                    fragment.output("jobject?")
                }
                fragment.outputBlock(" -> Bool.CType = { _javaEnv, _, lhs, rhs in", closeWith: "}") {
                    fragment.outputBlock("FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in", closeWith: "}") {
                        fragment.outputBlock("return try Bool.toJava(") {
                            fragment.output("\(sourceType.name).fromJava(lhs, env: _javaEnv) == \(sourceType.name).fromJava(rhs, env: _javaEnv),")
                            fragment.output("env: _javaEnv")
                        }
                    }
                }
            }
            if hashable {
                fragment.outputBlock("static let _javaHash: @convention(c)(", newLineTerminated: false) {
                    fragment.output("UnsafeMutablePointer<JNIEnv?>,")
                    fragment.output("jobject?")
                }
                fragment.outputBlock(" -> Int32.CType = { _javaEnv, _javaThis in", closeWith: "}") {
                    fragment.outputBlock("FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in", closeWith: "}") {
                        fragment.outputBlock("return try Int32.toJava(") {
                            fragment.output("Int32(truncatingIfNeeded: \(sourceType.name).fromJava(_javaThis, env: _javaEnv).hashValue),")
                            fragment.output("env: _javaEnv")
                        }
                    }
                }
            }
        }

        if equatable {
            context.kotlinTranslator.allMethods[sourceType.name, default: []].append(
                (
                    javaName: "__jni_swiftEquals",
                    signature: "(\(jniType.asSignature)\(jniType.asSignature))Z",
                    cName: "\(sourceType.name)._javaEquals",
                    isProtocolDefault: false
                )
            )
        }
        if hashable {
            context.kotlinTranslator.allMethods[sourceType.name, default: []].append(
                (
                    javaName: "__jni_hashCode",
                    signature: "()I",
                    cName: "\(sourceType.name)._javaHash",
                    isProtocolDefault: false
                )
            )
        }

        var fieldsAndMethods =
            computedVariables.compactMap { context.kotlin(field: $0, useNativeName: false) } +
            methods.compactMap { context.kotlin(method: $0) }

        if equatable {
            fieldsAndMethods.append(
                .method(
                    KotlinClass.Method(
                        documentation: [],
                        isStatic: true,
                        isSuspend: false,
                        isOverride: false,
                        name: "swiftEquals",
                        parameters: [
                            (labelComment: nil, name: "lhs", type: kotlinType, defaultValue: nil),
                            (labelComment: nil, name: "rhs", type: kotlinType, defaultValue: nil),
                        ],
                        compatibilityOrder: [],
                        returnType: .named(package: nil, name: "Boolean"),
                        deprecation: nil,
                        body: nil
                    )
                )
            )
            fieldsAndMethods.append(
                .method(
                    KotlinClass.Method(
                        documentation: [],
                        isStatic: false,
                        isSuspend: false,
                        isOverride: true,
                        name: "equals",
                        parameters: [
                            (labelComment: nil, name: "other", type: .optional(.named(package: nil, name: "Any")), defaultValue: nil),
                        ],
                        compatibilityOrder: [],
                        returnType: .named(package: nil, name: "Boolean"),
                        deprecation: nil,
                        body: "(other is \(kotlinType.kotlinType)) && __jni_swiftEquals(this, other)"
                    )
                )
            )
        }
        if hashable {
            fieldsAndMethods.append(
                .method(
                    KotlinClass.Method(
                        documentation: [],
                        isStatic: false,
                        isSuspend: false,
                        isOverride: true,
                        name: "hashCode",
                        parameters: [],
                        compatibilityOrder: [],
                        returnType: .named(package: nil, name: "Int"),
                        deprecation: nil,
                        body: nil
                    )
                )
            )
        }

        let (fields, methods) = KotlinClass.separate(fieldsAndMethods: fieldsAndMethods)
        let product = KotlinProductClass(
            module: context.module,
            documentation: documentation,
            name: kotlinName,
            constructor: .reference,
            fields: fields,
            methods: methods,
            conformances: ["com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference)"]
        ).conforming(to: conformances, context: context)
        context.add(kotlinClass: product)

        return fragment
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>] {
        [
            .value(
                name: "constructorMethod",
                type: "SwiftReference.ConstructorDelegate"
            ) { fragment in
                fragment.outputBlock("bag<SwiftReference.ConstructorDelegate>((ConsumedRef ptr, out CreatedRef exn) => Catching(out exn, () => {", closeWith: "})),") {
                    fragment.output("return new CreatedRef(new \(cSharpType.name)(ptr));")
                }
            },
        ]
    }

    func iotaDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "IotaInterface/\(sourceType.name)+iota-type.swift",
            additionalImports: ["Foundation", "FishyJoesIotaRuntime"]
        )

        fragment.output("@_cdecl(\"\(iotaSetupName)\")")
        fragment.outputBlock("public func \(iotaSetupName)(", newLineTerminated: false) {
            fragment.output("envRef: EnvRef,")
            fragment.output("constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject,")
            fragment.output("_ exn: foreignOutExn")
        }
        fragment.outputBlock(" {") {
            fragment.output("let env = Env(envRef)")
            fragment.output("if \(converterType.name)._constructorMethod.isInitialized(env) { return }")
            fragment.output("\(converterType.name)._constructorMethod[env] = constructorMethod")
        }
        fragment.blankLine()

        fragment.outputBlock("extension \(converterType.name): IotaReferenceMutator {") {
            fragment.output("fileprivate static var _constructorMethod = Env.CallbackMap<(UnsafeMutableRawPointer, _ exn: foreignOutExn) -> foreignObject>()")
            fragment.blankLine()

            fragment.outputBlock("public static func peekIota(_ value: foreignObject, env: Env) throws -> \(sourceType.name) {") {
                fragment.output("try Box<\(sourceType.name)>.peekIota(value, env: env).value")
            }
            fragment.blankLine()

            fragment.outputBlock("public static func toIota(_ value: \(sourceType.name), env: Env) throws -> foreignObject {") {
                if !isInhabited {
                    fragment.output("// Uninhabited type")
                } else {
                    fragment.output("let ptr = Box(value).retainedOpaque()")
                    fragment.output("return try env.check { exn in _constructorMethod[env](ptr, exn) }")
                }
            }
            fragment.blankLine()
        }

        if equatable != hashable {
            fatalErr("Type \(sourceType.name) must implement either none or both of Equatable and Hashable")
        }

        if equatable {
            fragment.output("@_cdecl(\"__iota_\(sourceType.name.mangled)_equals\")")
            fragment.outputBlock("public func \(sourceType.name.mangled)_iotaEquals(envRef: EnvRef, lhs: foreignObject, rhs: foreignObject, exn: foreignOutExn) -> Bool.CType {") {
                fragment.output("let env = Env(envRef)")
                fragment.outputBlock("return env.catching(to: exn) {") {
                    fragment.outputBlock("try Bool.toIota(") {
                        fragment.output("\(sourceType.name).peekIota(lhs, env: env) == \(sourceType.name).peekIota(rhs, env: env),")
                        fragment.output("env: env")
                    }
                }
            }
        }
        if hashable {
            fragment.output("@_cdecl(\"__iota_get_\(sourceType.name.mangled)_hash\")")
            fragment.outputBlock("public func \(sourceType.name.mangled)_iotaHash(envRef: EnvRef, this: foreignObject, exn: foreignOutExn) -> Int32.CType {") {
                fragment.output("let env = Env(envRef)")
                fragment.outputBlock("return env.catching(to: exn) {") {
                    fragment.outputBlock("try Int32.toIota(") {
                        fragment.output("Int32(truncatingIfNeeded: \(sourceType.name).peekIota(this, env: env).hashValue),")
                        fragment.output("env: env")
                    }
                }
            }
        }

        registerDartClass(in: context)
        registerCSharpClass(in: context)

        return fragment
    }

    func registerCSharpClass(in context: FishyJoesContext) {
        var fieldsAndMethods =
        computedVariables.compactMap { context.cSharp(field: $0, of: self, useNativeName: false) } +
            methods.compactMap { context.cSharp(method: $0, of: self) }

        if equatable {
            fieldsAndMethods.append(
                .method(
                    CSharpClass.Method(
                        documentation: [],
                        isStatic: false,
                        isOverride: true,
                        name: "Equals",
                        mangledName: "",
                        parameters: [
                            (labelComment: nil, name: "other", type: .optional(.named(package: nil, name: "object")), defaultValue: nil),
                        ],
                        returnType: .primitive("bool"),
                        deprecation: nil,
                        body: [
                            "using var thisHandle = new GCRef(this);",
                            "using var otherHandle = new GCRef(other as \(cSharpType.name));",
                            "return Check((out CreatedRef exn) => __iota_\(sourceType.name.mangled)_equals(Loader.env, thisHandle.ptr, otherHandle.ptr, out exn));",
                        ]
                    )
                )
            )
            fieldsAndMethods.append(
                .method(
                    CSharpClass.Method(
                        documentation: [],
                        isStatic: true,
                        isOverride: false,
                        name: "_equals",
                        mangledName: "\(sourceType.name.mangled)_equals",
                        parameters: [
                            (labelComment: nil, name: "lhs", type: cSharpType, nil),
                            (labelComment: nil, name: "rhs", type: .optional(cSharpType), nil),
                        ],
                        returnType: .primitive("bool"),
                        deprecation: nil,
                        body: nil
                    )
                )
            )
        }
        if hashable {
            fieldsAndMethods.append(
                .method(
                    CSharpClass.Method(
                        documentation: [],
                        isStatic: false,
                        isOverride: true,
                        name: "GetHashCode",
                        mangledName: "\(sourceType.name.mangled)_hash",
                        parameters: [],
                        returnType: .primitive("int"),
                        deprecation: nil,
                        body: nil
                    )
                )
            )
        }

        let (productFields, productMethods) = CSharpClass.separate(fieldsAndMethods: fieldsAndMethods)

        let product = CSharpProductClass(
            module: context.module,
            documentation: documentation,
            name: cSharpType.name,
            constructor: .reference,
            fields: productFields,
            methods: productMethods,
            conformances: conformances
        )
        context.add(cSharpClass: product)
    }

    func registerDartClass(in context: FishyJoesContext) {
        var fieldsAndMethods =
        computedVariables.compactMap {
            context.dart(field: $0, of: self, useNativeName: false)
        } +
        methods.compactMap {
            context.dart(method: $0, of: self)
        }

        if equatable {
            fieldsAndMethods.append(
                .method(
                    DartClass.Method(
                        documentation: [],
                        isStatic: false,
                        name: "operator ==",
                        mangledName: "",
                        parameters: [
                            (labelComment: nil, name: "other", type: .optional(.named(package: nil, name: "Object")), defaultValue: nil),
                        ],
                        returnType: .primitive("bool", ffiName: "Bool"),
                        deprecation: nil,
                        body: [
                            "GCRef.using(this, (thisHandle) =>",
                            "    GCRef.using(other as \(dartType.name()), (otherHandle) =>",
                            "        check((exn) => f__iota_\(sourceType.name.mangled)_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn))))",
                        ],
                        isDefaultImplementation: false
                    )
                )
            )
            fieldsAndMethods.append(
                .method(
                    DartClass.Method(
                        documentation: [],
                        isStatic: true,
                        name: "_equals",
                        mangledName: "\(sourceType.name.mangled)_equals",
                        parameters: [
                            (labelComment: nil, name: "lhs", type: dartType, nil),
                            (labelComment: nil, name: "rhs", type: .optional(dartType), nil),
                        ],
                        returnType: .primitive("bool", ffiName: "Bool"),
                        deprecation: nil,
                        body: nil,
                        isDefaultImplementation: false
                    )
                )
            )
        }
        if hashable {
            fieldsAndMethods.append(
                .variable(
                    DartClass.Variable(
                        documentation: [],
                        isStatic: false,
                        isMutable: false,
                        isPubliclyWritable: false,
                        asMethod: false,
                        name: "hashCode",
                        mangledName: "\(sourceType.name.mangled)_hash",
                        type: .primitive("int", ffiName: "Int"),
                        deprecation: nil
                    )
                )
            )
        }

        let (fields, methods) = DartClass.separate(fieldsAndMethods: fieldsAndMethods)
        let dartProduct = DartProductClass(
            module: context.module,
            documentation: documentation,
            name: dartType.name(),
            constructor: .reference,
            fields: fields,
            methods: methods,
            conformances: conformances
        )
        context.add(dartClass: dartProduct)
    }

    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>] {
        [
            .value(
                name: "constructorMethod",
                type: .named(
                    package: "ffi",
                    name: "Pointer",
                    genericArgs: [
                        .named(
                            package: "ffi",
                            name: "NativeFunction",
                            genericArgs: [
                                .function(
                                    args: [.named(package: "ffi", name: "Pointer"), .named(package: nil, name: "OutCreatedRef")],
                                    return: .named(package: nil, name: "CreatedRef")
                                ),
                            ]
                        ),
                    ]
                )
            ) { fragment in
                fragment.output("ffi.Pointer.fromFunction(\(dartType.name()).ffi_new),")
            },
        ]
    }
}

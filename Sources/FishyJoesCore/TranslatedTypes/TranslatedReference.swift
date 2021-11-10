import SourceryRuntime

struct TranslatedReference: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let methods: [Method]
    let computedVariables: [Variable]
    let documentation: [String]
    let className: String
    let jniType: JNIType
    let equatable: Bool
    let hashable: Bool

    init(context: FishyJoesContext, type: Type) {
        guard let exportAnnotation = type.exportAnnotation else {
            fatalErr("c symbol not specified")
        }
        let typeName = exportAnnotation.name

        self.sourceType = BetterType(named: type)
        self.nodeName = typeName
        self.kotlinName = typeName
        self.methods = type.methods.compactMap { Method($0) }
        self.computedVariables = type.variables.filter { $0.exportAnnotation != nil }
        self.documentation = type.documentation
        self.className = context.kotlinTranslator.javaClassName(kotlinName, in: context)
        self.jniType = .object(className)
        self.equatable = type.equatable
        self.hashable = type.hashable
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        return [nodeDefinitionFragment(in: context), jniDefinitionFragment(in: context)]
    }

    func nodeDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "NodeInterface/\(sourceType.name)+node.swift",
            additionalImports: ["FishyJoesNodeRuntime"]
        )
        fragment.outputBlock("extension \(sourceType.name): FishyJoesNodeRuntime.NodeConverter {") {
            fragment.outputBlock("public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {") {
                fragment.output("var pointer: UnsafeMutableRawPointer?")
                fragment.output("try check(napi_unwrap(env, value, &pointer))")
                fragment.outputBlock("guard let nonNilPointer = pointer else {") {
                    fragment.output("throw JSException(message: \"expected \(sourceType.name), got nil\")")
                }
                fragment.output("return try Box<\(sourceType.name)>.takeUnretainedOpaque(nonNilPointer).value")
            }
            fragment.outputBlock("public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {") {
                fragment.output("let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: \"\(nodeName)\", env: env)")
                fragment.output("var args: napi_value? = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)")
                fragment.output("var result: napi_value?")
                fragment.output("try check(napi_new_instance(env, constructor, 1, &args, &result))")
                fragment.output("return result")
            }
            fragment.outputBlock("public static func mutateNode(_ value: Self, this: napi_value?, env: napi_env) throws {") {
                fragment.output("var pointer: UnsafeMutableRawPointer?")
                fragment.output("try check(napi_unwrap(env, this, &pointer))")
                fragment.outputBlock("guard let nonNilPointer = pointer else {") {
                    fragment.output("throw JSException(message: \"expected \(sourceType.name), got nil\")")
                }
                fragment.output("try Box<\(sourceType.name)>.takeUnretainedOpaque(nonNilPointer).value = value")
            }
            fragment.outputBlock("public static func nodeSetup(env: napi_env, module: napi_value) throws {") {
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
                            fragment.output("// TODO: typecheck?")
                            fragment.output("let this = try env.this()")
                            fragment.output("let selfValue = try env.argument(at: 0)")
                            fragment.output("let boxed = try FishyJoesNodeRuntime.Box<\(sourceType.name)>.takeUnretained(selfValue, env: env.env)")
                            fragment.outputBlock("let finalizer: napi_finalize = { env, data, _ in", closeWith: "}") {
                                fragment.output("FishyJoesNodeRuntime.Box<\(sourceType.name)>.releaseOpaque(data)")
                            }
                            fragment.output("try check(env: env.env, napi_wrap(env.env, this, boxed.retainedOpaque(), finalizer, nil, nil))")
                            fragment.output("return this")
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
            "JavaInterface/\(sourceType.name)+java.swift",
            additionalImports: ["FishyJoesJavaRuntime"]
        )
        fragment.outputBlock("extension \(sourceType.name): JavaMutator {") {
            fragment.output("public static var javaClass: jclass?")
            fragment.output("public static var javaDescriptor: String { \"L\(className);\" }")
            fragment.output("private static var _refFieldID: jfieldID!")
            fragment.output("private static var _constructorMethodID: jmethodID!")

            fragment.outputBlock("public static func fromJava(_ value: jobject?, env: Env) throws -> Self {") {
                fragment.output("let longRef = UInt(env.GetLongField(value, _refFieldID))")
                fragment.output("return try Box<\(sourceType.name)>.takeUnretainedOpaque(javaNonNull(UnsafeMutablePointer(bitPattern: longRef))).value")
            }

            fragment.outputBlock("static let _javaFinalizer: @convention(c)(", newLineTerminated: false) {
                fragment.output("UnsafeMutablePointer<JNIEnv?>,")
                fragment.output("jobject")
            }
            fragment.outputBlock(" -> Void = { env, this in", closeWith: "}") {
                fragment.outputBlock("FishyJoesJavaRuntime.callbackBody(env) { env in", closeWith: "}") {
                    fragment.output("let longRef = UInt(env.GetLongField(this, _refFieldID))")
                    fragment.output("Box<\(sourceType.name)>.releaseOpaque(try javaNonNull(UnsafeMutablePointer(bitPattern: longRef)))")
                }
            }

            fragment.outputBlock("public static func toJava(_ value: Self, env: Env) throws -> jobject? {") {
                fragment.output("let ptr = jvalue(j: jlong(UInt(bitPattern: Box(value).retainedOpaque())))")
                fragment.output("return try env.NewObject(javaClass, _constructorMethodID, ptr)")
            }

            fragment.outputBlock("public static func javaSetup(env: Env) throws {") {
                fragment.output("javaClass = try env.globalRef(env.FindClass(\"\(className)\"))")
                fragment.output("_refFieldID = try env.GetFieldID(javaClass, \"_swiftReference\", \"J\")")
                fragment.output("_constructorMethodID = try env.GetMethodID(javaClass, \"<init>\", \"(J)V\")")
            }

            fragment.outputBlock("public static func mutateJava(_ value: Self, javaThis: jobject?, env: Env) throws {") {
                fragment.output("let longRef = UInt(env.GetLongField(javaThis, _refFieldID))")
                fragment.output("try Box<\(sourceType.name)>.takeUnretainedOpaque(javaNonNull(UnsafeMutablePointer(bitPattern: longRef))).value = value")
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
            fragment.outputBlock("static let _javaToString: @convention(c)(", newLineTerminated: false) {
                fragment.output("UnsafeMutablePointer<JNIEnv?>,")
                fragment.output("jobject?")
            }
            fragment.outputBlock(" -> String.CType = { _javaEnv, _javaThis in", closeWith: "}") {
                fragment.outputBlock("FishyJoesJavaRuntime.callbackBody(_javaEnv) { _javaEnv in", closeWith: "}") {
                    fragment.outputBlock("try String.toJava(") {
                        fragment.output("\"\\(\(sourceType.name).fromJava(_javaThis, env: _javaEnv))\",")
                        fragment.output("env: _javaEnv")
                    }
                }
            }
        }

        context.kotlinTranslator.allMethods[sourceType.name, default: []].append(
            (javaName: "finalize", signature: "()V" , cName: "\(sourceType.name)._javaFinalizer")
        )
        context.kotlinTranslator.allMethods[sourceType.name, default: []].append(
            (javaName: "toString", signature: "()Ljava/lang/String;" , cName: "\(sourceType.name)._javaToString")
        )
        if equatable {
            context.kotlinTranslator.allMethods[sourceType.name, default: []].append(
                (
                    javaName: "_swiftEquals",
                    signature: "(\(jniType.asSignature)\(jniType.asSignature))Z",
                    cName: "\(sourceType.name)._javaEquals"
                )
            )
        }
        if hashable {
            context.kotlinTranslator.allMethods[sourceType.name, default: []].append(
                (
                    javaName: "hashCode",
                    signature: "()I",
                    cName: "\(sourceType.name)._javaHash"
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
                        isOverride: false,
                        name: "_swiftEquals",
                        parameters: [
                            (labelComment: nil, name: "lhs", type: kotlinType),
                            (labelComment: nil, name: "rhs", type: kotlinType),
                        ],
                        returnType: .named("Boolean"),
                        body: nil
                    )
                )
            )
            fieldsAndMethods.append(
                .method(
                    KotlinClass.Method(
                        documentation: [],
                        isStatic: false,
                        isOverride: true,
                        name: "equals",
                        parameters: [
                            (labelComment: nil, name: "other", type: .optional(.named("Any"))),
                        ],
                        returnType: .named("Boolean"),
                        body: "(other is \(kotlinType)) && _swiftEquals(this, other)"
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
                        isOverride: true,
                        name: "hashCode",
                        parameters: [],
                        returnType: .named("Int"),
                        body: nil
                    )
                )
            )
        }
        fieldsAndMethods.append(
            .method(
                KotlinClass.Method(
                    documentation: [],
                    isStatic: false,
                    isOverride: true,
                    name: "toString",
                    parameters: [],
                    returnType: .named("String"),
                    body: nil
                )
            )
        )

        context.kotlinClasses.append(
            KotlinProductClass(
                module: context.module,
                documentation: documentation,
                name: nodeName,
                constructor: .init(
                    private: true,
                    fields: [
                        .init(
                            documentation: [],
                            isStatic: false,
                            isOverride: false,
                            readOnly: true,
                            name: "_swiftReference",
                            type: .named("Long")
                        ),
                    ]
                ),
                fieldsAndMethods: fieldsAndMethods,
                finalizer: true
            )
        )

        return fragment
    }
}

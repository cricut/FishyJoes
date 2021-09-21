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

    init(context: FishyJoesContext, type: Type) {
        guard let exportAnnotation = type.exportAnnotation,
              let cTypeName = exportAnnotation.c else {
            fatalErr("c symbol not specified")
        }
        let nodeName = exportAnnotation.js ?? cTypeName

        self.sourceType = BetterType(named: type)
        self.nodeName = nodeName
        self.kotlinName = nodeName
        self.methods = type.methods.filter { $0.exportAnnotation != nil }
        self.computedVariables = type.variables.filter { $0.exportAnnotation != nil }
        self.documentation = type.documentation
        self.className = context.kotlinTranslator.javaClassName(kotlinName, in: context)
        self.jniType = .object(className)
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        return [nodeDefinitionFragment(in: context), jniDefinitionFragment(in: context)]
    }

    func nodeDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let nodeFragment = context.swiftFragment(
            "NodeInterface/\(sourceType.name)+node.swift",
            additionalImports: ["FishyJoesNodeRuntime"]
        )
        nodeFragment.outputBlock("extension \(sourceType.name): FishyJoesNodeRuntime.NodeConvertible {") {
            nodeFragment.outputBlock("public init(fromNode value: napi_value?, env: napi_env) throws {") {
                nodeFragment.output("var pointer: UnsafeMutableRawPointer?")
                nodeFragment.output("try check(napi_unwrap(env, value, &pointer))")
                nodeFragment.outputBlock("guard let nonNilPointer = pointer else {") {
                    nodeFragment.output("throw JSException(message: \"expected \(sourceType.name), got nil\")")
                }
                nodeFragment.output("self = try Box<\(sourceType.name)>.takeUnretainedOpaque(nonNilPointer).value")
            }
            nodeFragment.outputBlock("public func toNode(env: napi_env) throws -> napi_value? {") {
                nodeFragment.output("let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: \"\(nodeName)\", env: env)")
                nodeFragment.output("var args: napi_value? = try FishyJoesNodeRuntime.Box(self).retainedExternal(env: env)")
                nodeFragment.output("var result: napi_value?")
                nodeFragment.output("try check(napi_new_instance(env, constructor, 1, &args, &result))")
                nodeFragment.output("return result")
            }
            nodeFragment.outputBlock("public func mutateNode(this: napi_value?, env: napi_env) throws {") {
                nodeFragment.output("var pointer: UnsafeMutableRawPointer?")
                nodeFragment.output("try check(napi_unwrap(env, this, &pointer))")
                nodeFragment.outputBlock("guard let nonNilPointer = pointer else {") {
                    nodeFragment.output("throw JSException(message: \"expected \(sourceType.name), got nil\")")
                }
                nodeFragment.output("try Box<\(sourceType.name)>.takeUnretainedOpaque(nonNilPointer).value = self")
            }
            nodeFragment.outputBlock("public static func nodeSetup(env: napi_env, module: napi_value) throws {") {
                // nodeFragment.output("print(\"setting up \(sourceType.name)\")")

                nodeFragment.outputBlock("let nodeClass = try NodeClass(") {
                    nodeFragment.output("env: env,")
                    nodeFragment.output("name: \"\(nodeName)\",")
                    let properties: [String] =
                        context.nodeTranslator.properties(for: methods) +
                        context.nodeTranslator.properties(for: computedVariables)
                    if properties.isEmpty {
                        nodeFragment.output("properties: [:],")
                    } else {
                        nodeFragment.outputBlock("properties: [", closeWith: "],") {
                            for prop in properties {
                                nodeFragment.output(prop)
                            }
                        }
                    }
                    nodeFragment.outputBlock("constructor: { env, info in", closeWith: "}") {
                        nodeFragment.outputBlock("FishyJoesNodeRuntime.callbackBody(env, info, name: \"\(nodeName)_constructor\", expectedArgumentCount: 1) { env in", closeWith: "}") {
                            nodeFragment.output("// TODO: typecheck?")
                            nodeFragment.output("let this = try env.this()")
                            nodeFragment.output("let selfValue = try env.argument(at: 0)")
                            nodeFragment.output("let boxed = try FishyJoesNodeRuntime.Box<\(sourceType.name)>.takeUnretained(selfValue, env: env.env)")
                            nodeFragment.outputBlock("let finalizer: napi_finalize = { env, data, _ in", closeWith: "}") {
                                nodeFragment.output("FishyJoesNodeRuntime.Box<\(sourceType.name)>.releaseOpaque(data)")
                            }
                            nodeFragment.output("try check(env: env.env, napi_wrap(env.env, this, boxed.retainedOpaque(), finalizer, nil, nil))")
                            nodeFragment.output("return this")
                        }
                    }
                }
                nodeFragment.output("try check(napi_set_named_property(env, module, \"\(nodeName)\", nodeClass.constructor.value(env: env)))")
            }
        }

        context.tsFragment.classes.append(
            .init(
                documentation: documentation,
                name: nodeName,
                constructor: .hidden,
                fields: computedVariables.compactMap { context.ts(field: $0) },
                methods: methods.compactMap { context.ts(method: $0) }
            )
        )

        return nodeFragment
    }

    func jniDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let jniFragment = context.swiftFragment(
            "JavaInterface/\(sourceType.name)+java.swift",
            additionalImports: ["FishyJoesJavaRuntime"]
        )
        jniFragment.outputBlock("extension \(sourceType.name): JavaMutable {") {
            jniFragment.output("public static var javaClass: jclass?")
            jniFragment.output("public static var javaDescriptor: String { \"L\(className);\" }")
            jniFragment.output("private static var _refFieldID: jfieldID!")
            jniFragment.output("private static var _constructorMethodID: jmethodID!")

            jniFragment.outputBlock("public init(fromJava value: jobject?, env: Env) throws {") {
                jniFragment.output("let longRef = uintptr_t(env.GetLongField(value, Self._refFieldID))")
                jniFragment.output("self = try Box<\(sourceType.name)>.takeUnretainedOpaque(UnsafeMutablePointer(bitPattern: longRef)!).value")
            }

            jniFragment.outputBlock("static let _javaFinalizer: @convention(c)(", newLineTerminated: false) {
                jniFragment.output("UnsafeMutablePointer<JNIEnv?>,")
                jniFragment.output("jobject")
            }
            jniFragment.outputBlock(" -> Void = { env, this in", closeWith: "}") {
                jniFragment.outputBlock("FishyJoesJavaRuntime.callbackBody(env) { env in", closeWith: "}") {
                    jniFragment.output("let longRef = uintptr_t(env.GetLongField(this, Self._refFieldID))")
                    jniFragment.output("Box<\(sourceType.name)>.releaseOpaque(UnsafeMutablePointer(bitPattern: longRef)!)")
                }
            }

            jniFragment.outputBlock("public func toJava(env: Env) throws -> jobject? {") {
                jniFragment.output("let ptr = jvalue(j: jlong(uintptr_t(bitPattern: Box(self).retainedOpaque())))")
                jniFragment.output("return try javaNonNull(env.NewObject(Self.javaClass, Self._constructorMethodID, ptr))")
            }

            jniFragment.outputBlock("public static func javaSetup(env: Env) throws {") {
                jniFragment.output("javaClass = try env.globalRef(env.FindClass(\"\(className)\"))")
                jniFragment.output("_refFieldID = try javaNonNull(env.GetFieldID(javaClass, \"_swiftReference\", \"J\"))")
                jniFragment.output("_constructorMethodID = try javaNonNull(env.GetMethodID(javaClass, \"<init>\", \"(J)V\"))")
            }

            jniFragment.outputBlock("public func mutateJava(this: jobject?, env: Env) throws {") {
                jniFragment.output("let longRef = uintptr_t(env.GetLongField(this, Self._refFieldID))")
                jniFragment.output("try Box<\(sourceType.name)>.takeUnretainedOpaque(UnsafeMutablePointer(bitPattern: longRef)!).value = self")
            }
        }

        context.kotlinTranslator.allMethods[sourceType.name, default: []].append(
            (javaName: "finalize", signature: "()V" , cName: "\(sourceType.name)._javaFinalizer")
        )

        context.kotlinFragments.append(
            KotlinProductClass(
                module: context.module,
                name: nodeName,
                documentation: documentation,
                constructor: .init(
                    private: true,
                    fields: [.init(documentation: [], isStatic: false, readOnly: true, name: "_swiftReference", type: .named("Long"))]
                ),
                fields: computedVariables.compactMap { context.kotlin(field: $0, useNativeName: false) },
                methods: methods.compactMap { context.kotlin(method: $0) },
                finalizer: true
            )
        )

        return jniFragment
    }
}

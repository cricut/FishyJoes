import SourceryRuntime

struct TranslatedReference: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let cppName: String
    let neutralName: String
    var containedNamedTypes: [TranslatedType] { [self] }
    let kotlinPackage: String?
    let cSharpName: String
    let cSharpNamespace: String?
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
        self.cppName = typeName.replacingOccurrences(of: ".", with: "::")
        self.neutralName = "Reference<To=\(typeName)>"
        self.kotlinName = typeName
        self.kotlinPackage = context.module.kotlinPackage
        self.cSharpName = typeName
        self.cSharpNamespace = context.module.cSharpNamespace
        self.methods = type.methods.compactMap { Method($0) }
        self.computedVariables = type.variables.filter { $0.exportAnnotation != nil }
        self.documentation = type.documentation
        self.className = context.kotlinTranslator.javaClassName(kotlinName, in: context)
        self.jniType = .object(className)
        self.equatable = type.equatable
        self.hashable = type.hashable
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        return [nodeDefinitionFragment(in: context), jniDefinitionFragment(in: context), neutralDefinitionFragment(in: context), cppDefinitionFragment(in: context)]
    }

    func cppDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        // Set up C++ class
        var newMethods: [CPPClass.CPPMethod] = []
        newMethods.append(contentsOf: methods.map { context.cppTranslator.translateToHeader(method: $0, in: context) })
        for variable in computedVariables {
            let accessors = context.cppTranslator.translateToHeader(variable: variable, in: context)
            newMethods.append(accessors.getter)
            if let setter = accessors.setter {
                newMethods.append(setter)
            }
        }
        let refField = CPPClass.CPPField(
            documentation: [
                "Reference to Swift-managed data"
            ],
            isStatic: false,
            isPrivate: true,
            name: "_ref",
            type: .swiftRef(hashable: hashable, equatable: equatable),
            initializer: nil
        )
        let newClass = CPPClass(
            module: context.module,
            documentation: documentation,
            name: sourceType.name,
            methods: newMethods,
            fields: [refField],
            serializedFields: [refField],
            completeConstructorVisible: false
        )
        context.cppClasses[newClass.qualifiedName] = newClass

        // Swift fragment
        let fragment = context.swiftFragment(
            "CPPInterface/\(sourceType.name)+CPP.swift",
            additionalImports: ["Foundation", "FishyJoesCPPRuntime"]
        )
        fragment.outputBlock("extension \(sourceType.name): FishyJoesCPPRuntime.CPPConverter {") {
            fragment.outputBlock("public static func fromCPP(_ packer: CPPPacker) throws -> Self {") {
                fragment.output("return try Box<Self>.fromCPP(packer).value")
            }
            fragment.outputBlock("public static func toCPP(_ packer: CPPPacker, _ value: Self) {") {
                fragment.output("Box<Self>.toCPP(packer, Box<Self>(value))")
            }
        }
        return fragment
    }

    func neutralDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
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
        return fragment
    }

    func nodeDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "NodeInterface/\(sourceType.name)+node.swift",
            additionalImports: ["Foundation", "FishyJoesNodeRuntime"]
        )
        fragment.outputBlock("extension \(sourceType.name): FishyJoesNodeRuntime.NodeConverter {") {
            fragment.outputBlock("public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {") {
                fragment.outputBlock("guard let nonNilPointer = try env.unwrap(value) else {") {
                    fragment.output("throw JSException(message: \"expected \(sourceType.name), got nil\")")
                }
                fragment.output("return try Box<\(sourceType.name)>.takeUnretainedOpaque(nonNilPointer).value")
            }
            fragment.outputBlock("public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {") {
                fragment.output("let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: \"\(nodeName)\", env: env)")
                fragment.output("let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)")
                fragment.output("return try env.newInstance(constructor, [arg])")
            }
            fragment.outputBlock("public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {") {
                fragment.outputBlock("guard let pointer = try env.unwrap(this) else {") {
                    fragment.output("throw JSException(message: \"expected \(sourceType.name), got nil\")")
                }
                fragment.output("try Box<\(sourceType.name)>.takeUnretainedOpaque(pointer).value = value")
            }
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
            "JavaInterface/\(sourceType.name)+java.swift",
            additionalImports: ["Foundation", "FishyJoesJavaRuntime"]
        )
        fragment.outputBlock("extension \(sourceType.name): JavaMutator {") {
            fragment.output("public static var javaClass: jclass?")
            fragment.output("private static var _constructorMethodID: jmethodID!")

            fragment.outputBlock("public static func fromJava(_ value: jobject?, env: Env) throws -> Self {") {
                fragment.output("try Box<\(sourceType.name)>.fromJava(value, env: env).value")
            }

            fragment.outputBlock("public static func toJava(_ value: Self, env: Env) throws -> jobject? {") {
                fragment.output("let ptr = jvalue(j: jlong(UInt(bitPattern: Box(value).retainedOpaque())))")
                fragment.output("return try env.NewObject(javaClass, _constructorMethodID, ptr)")
            }

            fragment.outputBlock("public static func javaSetup(env: Env) throws {") {
                fragment.output("try AnyBox.javaSetup(env: env)")
                fragment.output("javaClass = try env.globalRef(env.FindClass(\"\(className)\"))")
                fragment.output("_constructorMethodID = try env.GetMethodID(javaClass, \"<init>\", \"(J)V\")")
            }

            fragment.outputBlock("public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Self) throws -> R) throws -> R {") {
                fragment.output("try body(&Box<\(sourceType.name)>.fromJava(this, env: env).value)")
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
                    cName: "\(sourceType.name)._javaEquals"
                )
            )
        }
        if hashable {
            context.kotlinTranslator.allMethods[sourceType.name, default: []].append(
                (
                    javaName: "__jni_hashCode",
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
                        name: "swiftEquals",
                        parameters: [
                            (labelComment: nil, name: "lhs", type: kotlinType),
                            (labelComment: nil, name: "rhs", type: kotlinType),
                        ],
                        returnType: .named(package: nil, name: "Boolean"),
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
                            (labelComment: nil, name: "other", type: .optional(.named(package: nil, name: "Any"))),
                        ],
                        returnType: .named(package: nil, name: "Boolean"),
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
                        isOverride: true,
                        name: "hashCode",
                        parameters: [],
                        returnType: .named(package: nil, name: "Int"),
                        body: nil
                    )
                )
            )
        }

        let product = KotlinProductClass(
            module: context.module,
            documentation: documentation,
            name: nodeName,
            constructor: .reference,
            fieldsAndMethods: fieldsAndMethods,
            reference: true
        )
        context.kotlinClasses.append(product)

        return fragment
    }
}

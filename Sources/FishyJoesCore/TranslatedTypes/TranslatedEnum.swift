import SourceryRuntime

struct TranslatedEnum: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let enumType: Enum
    let jniType: JNIType

    init(context: FishyJoesContext, type: Enum) {
        guard let nodeName = type.exportAnnotation?.js else { fatalErr("js symbol not specified") }

        self.sourceType = BetterType(named: type)
        self.nodeName = nodeName
        self.kotlinName = nodeName
        self.enumType = type
        self.jniType = .object(context.kotlinTranslator.javaClassName(nodeName, in: context))
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
                nodeFragment.outputBlock("switch try String(fromNode: value, env: env) {") {
                    for enumCase in enumType.cases {
                        nodeFragment.output("case \"\(enumCase.name)\": self = .\(enumCase.name)")
                    }
                    nodeFragment.output("case let unknown: print(\"invalid enum string '\\(unknown)' for \(sourceType.name)\"); fatalError()")
                }
            }

            nodeFragment.outputBlock("public func toNode(env: napi_env) throws -> napi_value? {") {
                nodeFragment.outputBlock("switch self {") {
                    for enumCase in enumType.cases {
                        nodeFragment.output("case .\(enumCase.name): return try \"\(enumCase.name)\".toNode(env: env)")
                    }
                }
            }
        }
        context.tsFragment.typealiases.append(
            .init(
                name: nodeName,
                value: .union(enumType.cases.map { .exactString($0.name) })
            )
        )
        return nodeFragment
    }

    func jniDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let jniFragment = context.swiftFragment(
            "JavaInterface/\(sourceType.name)+java.swift",
            additionalImports: ["FishyJoesJavaRuntime"]
        )
        let className = context.kotlinTranslator.javaClassName(nodeName, in: context)
        jniFragment.outputBlock("extension \(sourceType.name): FishyJoesJavaRuntime.JavaConvertible {") {
            jniFragment.output("public static var javaClass: jclass?")
            jniFragment.output("public static var javaDescriptor: String { \"\(jniType.asSignature)\" }")
            for enumCase in enumType.cases {
                jniFragment.output("static var _java_\(enumCase.name): jobject!")
            }
            jniFragment.outputBlock("public init(fromJava value: jobject?, env: Env) throws {") {
                for enumCase in enumType.cases {
                    jniFragment.outputBlock("if env.IsSameObject(value, Self._java_\(enumCase.name)) {") {
                        jniFragment.output("self = .\(enumCase.name)")
                        jniFragment.output("return")
                    }
                }
                jniFragment.output("throw JNIError(message: \"invalid enum for \(sourceType.name)\")")
            }

            jniFragment.outputBlock("public func toJava(env: Env) throws -> jobject? {") {
                jniFragment.outputBlock("switch self {") {
                    for enumCase in enumType.cases {
                        jniFragment.output("case .\(enumCase.name): return Self._java_\(enumCase.name)")
                    }
                }
            }

            jniFragment.outputBlock("public static func javaSetup(env: Env) throws {") {
                jniFragment.output("javaClass = try env.globalRef(env.FindClass(\"\(className)\"))")
                for enumCase in enumType.cases {
                    let name = enumCase.name
                    let subclassName = "\(className)$\(upperCaseFirst(camel: name))"
                    jniFragment.output("let _class_\(name) = try javaNonNull(env.FindClass(\"\(subclassName)\"))")
                    jniFragment.outputBlock("_java_\(name) = try env.globalRef(") {
                        jniFragment.outputBlock("env.GetStaticObjectField(") {
                            jniFragment.output("_class_\(name),")
                            jniFragment.output("javaNonNull(env.GetStaticFieldID(_class_\(name), \"INSTANCE\", \"L\(subclassName);\"))")
                        }
                    }
                }
            }
        }

        context.kotlinFragments.append(
            KotlinEnumClass(
                module: context.module,
                name: nodeName,
                documentation: enumType.documentation,
                cases: enumType.cases.map { upperCaseFirst(camel: $0.name) }
            )
        )

        return jniFragment
    }
}

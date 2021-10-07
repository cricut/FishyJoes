import SourceryRuntime

struct TranslatedEnum: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let jniType: JNIType
    let cases: [Case]
    let documentation: [String]
    let methods: [Method]
    let computedVariables: [Variable]

    struct Case {
        let name: String
        let associatedValues: [Value]

        var classVar: String {
            "_java_\(name)"
        }
        var classInitVar: String {
            "_java_\(name)_init"
        }
    }

    struct Value {
        let index: Int
        let name: String?
        let type: BetterType

        var bindingName: String {
            name ?? "_\(index)"
        }
        var fieldVar: String {
            "_field_\(name ?? "\(index)")"
        }
    }

    init(context: FishyJoesContext, type: Enum) {
        guard let nodeName = type.exportAnnotation?.js else { fatalErr("js symbol not specified") }

        self.sourceType = BetterType(named: type)
        self.nodeName = nodeName
        self.kotlinName = nodeName
        self.cases = type.cases.map { enumCase in
            Case(
                name: enumCase.name,
                associatedValues: enumCase.associatedValues.enumerated().map {
                    let (index, value) = $0
                    return Value(
                        index: index,
                        name: value.localName,
                        type: value.typeName.better
                    )
                }
            )
        }
        self.jniType = .object(context.kotlinTranslator.javaClassName(nodeName, in: context))
        self.documentation = type.documentation
        self.methods = type.methods.compactMap { Method($0) }
        self.computedVariables = type.computedVariables
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
                    for enumCase in cases {
                        nodeFragment.output("case \"\(enumCase.name)\": self = .\(enumCase.name)")
                    }
                    nodeFragment.output("case let unknown: print(\"invalid enum string '\\(unknown)' for \(sourceType.name)\"); fatalError()")
                }
            }

            nodeFragment.outputBlock("public func toNode(env: napi_env) throws -> napi_value? {") {
                nodeFragment.outputBlock("switch self {") {
                    for enumCase in cases {
                        nodeFragment.output("case .\(enumCase.name): return try \"\(enumCase.name)\".toNode(env: env)")
                    }
                }
            }
        }
        context.tsFragment.typealiases.append(
            .init(
                name: nodeName,
                value: .union(cases.map { .exactString($0.name) })
            )
        )
        return nodeFragment
    }

    func jniDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "JavaInterface/\(sourceType.name)+java.swift",
            additionalImports: ["FishyJoesJavaRuntime"]
        )
        let className = context.kotlinTranslator.javaClassName(nodeName, in: context)
        fragment.outputBlock("extension \(sourceType.name): FishyJoesJavaRuntime.JavaConvertible {") {
            fragment.output("public static var javaClass: jclass?")
            fragment.output("public static var javaDescriptor: String { \"\(jniType.asSignature)\" }")
            for enumCase in cases {
                if enumCase.associatedValues.isEmpty {
                    fragment.output("static var \(enumCase.classVar): jobject!")
                } else {
                    fragment.output("static var \(enumCase.classVar): jclass!")
                    fragment.output("static var \(enumCase.classInitVar): jmethodID!")
                    for value in enumCase.associatedValues {
                        fragment.output("static var \(enumCase.classVar)\(value.fieldVar): jfieldID!")
                    }
                }
            }
            fragment.output()

            fragment.outputBlock("public init(fromJava value: jobject?, env: Env) throws {") {
                for enumCase in cases {
                    if enumCase.associatedValues.isEmpty {
                        fragment.outputBlock("if env.IsSameObject(value, Self.\(enumCase.classVar)) {") {
                            fragment.output("self = .\(enumCase.name)")
                            fragment.output("return")
                        }
                    } else {
                        fragment.outputBlock("if env.IsInstanceOf(value, Self.\(enumCase.classVar)) {") {
                            fragment.outputBlock("self = .\(enumCase.name)(") {
                                fragment.outputMap(enumCase.associatedValues, separator: ",") { value in
                                    let resolved = context.resolve(type: value.type)
                                    let field = "Self.\(enumCase.classVar)\(value.fieldVar)"
                                    return "\(value.name.map { "\($0): " } ?? "")try \(resolved.sourceType.name)(fromJava: env.Get\(resolved.jniType.valueType)Field(value, \(field)), env: env)"
                                }
                            }
                            fragment.output("return")
                        }
                    }
                }
                fragment.output("throw JNIError(message: \"invalid enum \\(try env.javaDescription(value)) for \(sourceType.name)\")")
            }
            fragment.output()

            fragment.outputBlock("public func toJava(env: Env) throws -> jobject? {") {
                fragment.output("switch self {")
                for enumCase in cases {
                    let name = enumCase.name
                    if enumCase.associatedValues.isEmpty {
                        fragment.output("case .\(name): return env.NewLocalRef(Self._java_\(name))")
                    } else {
                        let joinedNames = enumCase.associatedValues.map(\.bindingName).joined(separator: ", ")
                        fragment.outputBlock("case let .\(name)(\(joinedNames)):", closeWith: "", newLineTerminated: false) {
                            fragment.outputBlock("return try env.NewObject(", closeWith: ")") {
                                fragment.output("Self.\(enumCase.classVar),")
                                fragment.output("Self.\(enumCase.classInitVar)", newLineTerminated: false)
                                for value in enumCase.associatedValues {
                                    fragment.output(",")
                                    fragment.output("jvalue(\(value.bindingName).toJava(env: env))", newLineTerminated: false)
                                }
                                fragment.output()
                            }
                        }
                    }
                }
                fragment.output("}")
            }
            fragment.output()

            fragment.outputBlock("public static func javaSetup(env: Env) throws {") {
                fragment.output("javaClass = try env.globalRef(env.FindClass(\"\(className)\"))")
                for enumCase in cases {
                    let name = enumCase.name
                    let subclassName = "\(className)$\(upperCaseFirst(camel: name))"
                    if enumCase.associatedValues.isEmpty {
                        fragment.output("let _class_\(name) = try env.FindClass(\"\(subclassName)\")")
                        fragment.outputBlock("\(enumCase.classVar) = try env.globalRef(") {
                            fragment.outputBlock("env.GetStaticObjectField(") {
                                fragment.output("_class_\(name),")
                                fragment.output("env.GetStaticFieldID(_class_\(name), \"INSTANCE\", \"L\(subclassName);\")")
                            }
                        }
                    } else {
                        var sig = "\"("
                        for value in enumCase.associatedValues {
                            let resolved = context.resolve(type: value.type)
                            sig += resolved.jniType.asSignature
                        }
                        sig += ")V\""
                        fragment.output("\(enumCase.classVar) = try env.globalRef(env.FindClass(\"\(subclassName)\"))")
                        fragment.output("\(enumCase.classInitVar) = try env.GetMethodID(\(enumCase.classVar), \"<init>\", \(sig))")
                        for value in enumCase.associatedValues {
                            let resolved = context.resolve(type: value.type)
                            fragment.output("\(enumCase.classVar)\(value.fieldVar) = try env.GetFieldID(\(enumCase.classVar), \"\(value.bindingName)\", \"\(resolved.jniType.asSignature)\")")
                        }
                    }
                }
            }
        }

        context.kotlinFragments.append(
            KotlinEnumClass(
                module: context.module,
                name: nodeName,
                documentation: documentation,
                cases: cases.map { enumCase in
                    let name = upperCaseFirst(camel: enumCase.name)
                    if enumCase.associatedValues.isEmpty {
                        return .object(name: name)
                    } else {
                        return .dataClass(
                            name: name,
                            values: enumCase.associatedValues.map { value in
                                (value.bindingName, context.resolve(type: value.type).kotlinType)
                            }
                        )
                    }
                },
                fieldsAndMethods:
                    computedVariables.compactMap { context.kotlin(field: $0, useNativeName: false) } +
                    methods.compactMap { context.kotlin(method: $0) }
            )
        )

        return fragment
    }
}

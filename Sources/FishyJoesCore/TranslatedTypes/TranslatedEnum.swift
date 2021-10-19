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
        let documentation: [String]
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
        guard let nodeName = type.exportAnnotation?.name else { fatalErr("export symbol not specified") }

        self.sourceType = BetterType(named: type)
        self.nodeName = nodeName
        self.kotlinName = nodeName
        self.cases = type.cases.map { enumCase in
            Case(
                documentation: enumCase.documentation,
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
        let fragment = context.swiftFragment(
            "NodeInterface/\(sourceType.name)+node.swift",
            additionalImports: ["FishyJoesNodeRuntime"]
        )
        if cases.allSatisfy({ $0.associatedValues.isEmpty }) {
            // Simple enum, export as strings
            fragment.outputBlock("extension \(sourceType.name): FishyJoesNodeRuntime.NodeConvertible {") {
                fragment.outputBlock("public init(fromNode value: napi_value?, env: napi_env) throws {") {
                    fragment.outputBlock("switch try String(fromNode: value, env: env) {") {
                        for enumCase in cases {
                            fragment.output("case \"\(enumCase.name)\": self = .\(enumCase.name)")
                        }
                        fragment.output("case let unknown: print(\"invalid enum string '\\(unknown)' for \(sourceType.name)\"); fatalError()")
                    }
                }

                fragment.outputBlock("public func toNode(env: napi_env) throws -> napi_value? {") {
                    fragment.outputBlock("switch self {") {
                        for enumCase in cases {
                            fragment.output("case .\(enumCase.name): return try \"\(enumCase.name)\".toNode(env: env)")
                        }
                    }
                }
            }
            context.tsAnnotations.add(
                typealias: .init(
                    documentation: documentation,
                    name: nodeName,
                    value: .union(cases.map { .exactString($0.name) })
                )
            )
        } else {
            fragment.outputBlock("extension \(sourceType.name): FishyJoesNodeRuntime.NodeConvertible {") {
                fragment.outputBlock("public init(fromNode value: napi_value?, env: napi_env) throws {") {
                    fragment.output("let instanceData = try FishyJoesNodeRuntime.InstanceData.data(for: env)")
                    fragment.output("var isInstanceResult = false")
                    for enumCase in cases {
                        let className = "\(nodeName).\(upperCaseFirst(enumCase.name))"

                        fragment.outputBlock("try check(napi_instanceof(", closeWith: "))") {
                            fragment.output("env,")
                            fragment.output("value,")
                            fragment.output("instanceData.constructor(for: \"\(className)\", env: env),")
                            fragment.output("&isInstanceResult")
                        }
                        fragment.outputBlock("if isInstanceResult {") {
                            for value in enumCase.associatedValues {
                                let name = value.bindingName
                                fragment.output("var \(name): napi_value?")
                                fragment.output("try check(napi_get_named_property(env, value, \"\(name)\", &\(name)))")
                            }
                            if enumCase.associatedValues.isEmpty {
                                fragment.output("self = .\(enumCase.name)")
                            } else {
                                fragment.outputBlock("self = .\(enumCase.name)(") {
                                    fragment.outputMap(enumCase.associatedValues, separator: ",") { value in
                                        let resolved = context.resolve(type: value.type)
                                        return "\(value.name.map { "\($0): " } ?? "")try \(resolved.sourceType.name)(fromNode: \(value.bindingName), env: env)"
                                    }
                                }
                            }
                            fragment.output("return")
                        }
                        fragment.blankLine()
                    }
                    fragment.output("fatalError(\"invalid enum for \(sourceType.name)\")")
                }
                fragment.blankLine()

                fragment.outputBlock("public func toNode(env: napi_env) throws -> napi_value? {") {
                    fragment.output("let instanceData = try FishyJoesNodeRuntime.InstanceData.data(for: env)")
                    fragment.output("var _result: napi_value?")
                    fragment.output("switch self {")
                    for enumCase in cases {
                        let className = "\(nodeName).\(upperCaseFirst(enumCase.name))"

                        let caseStatement: String
                        if enumCase.associatedValues.isEmpty {
                            caseStatement = "case .\(enumCase.name):"
                        } else {
                            let values = enumCase.associatedValues.map(\.bindingName).joined(separator: ", ")
                            caseStatement = "case let .\(enumCase.name)(\(values)):"
                        }
                        fragment.outputBlock(caseStatement, closeWith: "") {
                            fragment.outputBlock("try check(napi_new_instance(", closeWith: "))") {
                                fragment.output("env,")
                                fragment.output("instanceData.constructor(for: \"\(className)\", env: env),")
                                fragment.output("\(enumCase.associatedValues.count),")
                                fragment.outputBlock("[", closeWith: "],") {
                                    for value in enumCase.associatedValues {
                                        fragment.output("\(value.bindingName).toNode(env: env),")
                                    }
                                }
                                fragment.output("&_result")
                            }
                        }
                    }
                    fragment.output("}")
                    fragment.output("return _result")
                }
                fragment.blankLine()

                fragment.outputBlock("public static func nodeSetup(env: napi_env, module: napi_value) throws {") {
                    for enumCase in cases {
                        let name = upperCaseFirst(enumCase.name)
                        let className = "\(nodeName).\(name)"
                        let classVarName = "\(enumCase.name)Class"
                        fragment.outputBlock("let \(classVarName) = try NodeClass(") {
                            fragment.output("env: env,")
                            fragment.output("name: \"\(className)\",")
                            fragment.outputBlock("properties: [", closeWith: "],") {
                                var hasProperties = false
                                hasProperties ||= context.nodeTranslator.outputProperties(methods: methods, context: context, fragment: fragment)
                                hasProperties ||= context.nodeTranslator.outputProperties(computedVariables: computedVariables, context: context, fragment: fragment)
                                for value in enumCase.associatedValues {
                                    // Limitation is wasm implementation of napi_create_class doesn't allow constructors to assign to non-mutable property.
                                    fragment.output("\"\(value.bindingName)\": (.stored(mutable: true), isStatic: false),")
                                    hasProperties = true
                                }
                                if !hasProperties {
                                    fragment.output(":")
                                }
                            }
                            fragment.outputBlock("constructor: { env, info in", closeWith: "}") {
                                fragment.outputBlock("FishyJoesNodeRuntime.callbackBody(", newLineTerminated: false) {
                                    fragment.output("env, info,")
                                    fragment.output("name: \"\(className)_constructor\",")
                                    fragment.output("expectedArgumentCount: \(enumCase.associatedValues.count)")
                                }
                                fragment.outputBlock(" { env in", closeWith: "}") {
                                    fragment.output("// TODO: typecheck?")
                                    fragment.output("let this = try env.this()")
                                    for value in enumCase.associatedValues {
                                        fragment.output("try check(napi_set_named_property(env.env, this, \"\(value.bindingName)\", env.argument(at: \(value.index))))")
                                    }
                                    fragment.output("return this")
                                }
                            }
                        }
                        fragment.outputBlock("try FishyJoesNodeRuntime.mergeDefinitionInto(") {
                            fragment.output("env: env,")
                            fragment.output("module: module,")
                            fragment.output("path: \"\(className)\",")
                            fragment.output("nodeClass: \(classVarName).constructor.value(env: env)")
                        }
                    }
                }
            }

            context.tsAnnotations.add(class:
                .init(
                    documentation: [],
                    name: "\(nodeName)._FictionalCommonSuperclass",
                    exported: false,
                    constructor: .visible([]),
                    fields: computedVariables.compactMap {context.ts(field: $0, useNativeName: false) },
                    methods: methods.compactMap { context.ts(method: $0) }
                )
            )

            for enumCase in cases {
                context.tsAnnotations.add(class:
                    .init(
                        documentation: enumCase.documentation,
                        name: "\(nodeName).\(upperCaseFirst(enumCase.name))",
                        superclass: "_FictionalCommonSuperclass",
                        constructor: .visible(
                            enumCase.associatedValues.map { value in
                                (value.bindingName, context.resolve(type: value.type).nodeType)
                            }
                        ),
                        fields: enumCase.associatedValues.map { value in
                            .init(
                                documentation: [],
                                readOnly: true,
                                isStatic: false,
                                name: value.bindingName,
                                type: context.resolve(type: value.type).nodeType
                            )
                        },
                        methods: []
                    )
                )
            }

            context.tsAnnotations.add(typealias:
                .init(
                    documentation: documentation,
                    name: nodeName,
                    value: .union(cases.map { .named("\(nodeName).\(upperCaseFirst($0.name))") })
                )
            )
        }
        return fragment
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
            fragment.blankLine()

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
            fragment.blankLine()

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
                                fragment.blankLine()
                            }
                        }
                    }
                }
                fragment.output("}")
            }
            fragment.blankLine()

            fragment.outputBlock("public static func javaSetup(env: Env) throws {") {
                fragment.output("javaClass = try env.globalRef(env.FindClass(\"\(className)\"))")
                for enumCase in cases {
                    let name = enumCase.name
                    let subclassName = "\(className)$\(upperCaseFirst(name))"
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

        context.kotlinClasses.append(
            KotlinEnumClass(
                module: context.module,
                documentation: documentation,
                name: nodeName,
                cases: cases.map { enumCase in
                    let name = upperCaseFirst(enumCase.name)
                    if enumCase.associatedValues.isEmpty {
                        return .object(name: name)
                    } else {
                        return .dataClass(
                            documentation: enumCase.documentation,
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

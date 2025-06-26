import SourceryRuntime

struct TranslatedEnum: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let definingTSNamespace: String?
    let kotlinName: String
    let neutralName: String
    var containedNamedTypes: [TranslatedType] { [self] }
    let kotlinPackage: String?
    let jniType: JNIType
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let cases: [Case]
    let documentation: [String]
    let methods: [Method]
    let fields: [Field]
    let isInhabited: Bool
    let definingModule: Module
    let conformances: Set<BetterType>

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
        var classInstanceVar: String {
            "_java_\(name)_INSTANCE"
        }
    }

    struct Value {
        let index: Int
        let name: String?
        let label: String?
        // It would be nice if this were a TranslatedType instead, but self-referrential enums make this problematic
        let type: BetterType

        var bindingName: String {
            CSharpClass.deforbidify(name ?? label ?? "_\(index)")
        }
        var fieldVar: String {
            "_field_\(name ?? "\(index)")"
        }
    }

    init(context: FishyJoesContext, type: Enum) {
        guard let exportAnnotation = type.exportAnnotation else { fatalErr("export symbol not specified") }
        let name = exportAnnotation.name

        self.sourceType = BetterType(named: type, context: context)
        self.neutralName = "Enum<TranslatedFrom=\(name)>"
        self.nodeName = name
        self.definingTSNamespace = context.module.name
        self.kotlinName = name
        self.kotlinPackage = context.module.kotlinPackage
        self.cSharpType = .named(package: context.module.cSharpNamespace, name: exportAnnotation.cSharpName)
        self.dartType = .named(package: context.module.dartNamespace, name: context.dartTranslator.fakeNamespace(name))
        self.cases = type.cases.map { enumCase in
            Case(
                documentation: enumCase.documentation,
                name: enumCase.name,
                associatedValues: enumCase.associatedValues.enumerated().map {
                    let (index, value) = $0
                    var label: String?
                    // If externalName is "0" or "1", don't use it
                    if let externalName = value.externalName, Int(externalName) == nil {
                        label = externalName
                    }
                    return Value(
                        index: index,
                        name: value.localName,
                        label: label,
                        type: value.typeName.better
                    )
                }
            )
        }
        self.jniType = .object(context.kotlinTranslator.javaClassName(nodeName, in: context))
        self.documentation = type.documentation

        self.methods = Method.methods(type: type)
        self.fields = Field.fields(type: type)
        self.isInhabited = type.isInhabited
        self.definingModule = context.module

        self.conformances = Set(type.implements.compactMap {
            return .init(named: $0.value, context: context)
        })
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        [
            nodeDefinitionFragment(in: context),
            jniDefinitionFragment(in: context),
            iotaDefinitionFragment(in: context),
        ]
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

        if cases.allSatisfy({ $0.associatedValues.isEmpty }), !cases.isEmpty {
            // Simple enum, export as strings
            fragment.outputBlock("extension \(sourceType.name): FishyJoesNodeRuntime.NodeConverter {") {
                fragment.output("public typealias SwiftType = Self")
                fragment.outputBlock("public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {") {
                    fragment.output("switch try String.fromNode(value, env: env) {")
                    for enumCase in cases {
                        fragment.output("case \"\(enumCase.name)\": return Self.\(enumCase.name)")
                    }
                    fragment.output("case let unknown: fatalError(\"invalid enum string '\\(unknown)' for \(sourceType.name)\")")
                    fragment.output("}")
                }

                fragment.outputBlock("public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {") {
                    fragment.output("switch value {")
                    for enumCase in cases {
                        fragment.outputBlock("case .\(enumCase.name):", closeWith: "", newLineTerminated: false) {
                            fragment.output("return try String.toNode(\"\(enumCase.name)\", env: env)")
                        }
                    }
                    fragment.output("}")
                }

                fragment.outputBlock("public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {") {
                    fragment.output("let object = try env.createObject()")
                    fragment.outputBlock("let props = try NodeClass.descriptorsFor(properties: [", closeWith: "], env: env)") {
                        var hasProperties = false
                        hasProperties ||= context.nodeTranslator.outputProperties(
                            methods: methods,
                            explicitThis: true,
                            context: context,
                            fragment: fragment,
                            converterName: converterType.name
                        )
                        hasProperties ||= context.nodeTranslator.outputProperties(
                            computedVariables: fields,
                            explicitThis: true,
                            context: context,
                            fragment: fragment,
                            converterName: converterType.name
                        )
                        if !hasProperties {
                            fragment.output(":")
                        }
                    }
                    fragment.output("try env.defineProperties(object, properties: props)")

                    fragment.outputBlock("try FishyJoesNodeRuntime.mergeDefinitionInto(") {
                        fragment.output("env: env,")
                        fragment.output("module: module,")
                        fragment.output("path: \"\(nodeName)\",")
                        fragment.output("nodeClass: object")
                    }
                }
            }
            let caseDocumentation = cases.flatMap { (enumCase) -> [String] in
                let caseLabel = " - \"\(enumCase.name)\":"
                switch enumCase.documentation.count {
                case 0:
                    return []
                case 1:
                    return ["\(caseLabel) \(enumCase.documentation[0])"]
                default:
                    return [caseLabel] + enumCase.documentation.map { "    \($0)" }
                }
            }
            context.tsAnnotations.add(
                typealias: .init(
                    documentation: documentation + caseDocumentation,
                    name: nodeName,
                    value: .union(cases.map { .exactString($0.name) })
                )
            )

            let staticFields = fields.filter { $0.isStatic }
            let instanceFields = fields.filter { !$0.isStatic }
            context.tsAnnotations.add(
                namespace: .init(
                    name: nodeName,
                    fields: staticFields.compactMap { context.ts(field: $0) },
                    methods:
                        methods.compactMap { context.ts(method: $0, explicitThis: true) } +
                        instanceFields.flatMap { context.ts(fieldAsMethods: $0, explicitThis: true) }
                )
            )
        } else {
            fragment.outputBlock("extension \(sourceType.name): FishyJoesNodeRuntime.NodeConverter {") {
                fragment.output("public typealias SwiftType = Self")
                fragment.outputBlock("public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {") {
                    for enumCase in cases {
                        let className = "\(nodeName).\(upperCaseFirst(enumCase.name))"

                        fragment.outputBlock(#"if try env.instanceof(value, NodeClass.constructor(for: "\#(className)", module: "\#(context.module.name)", env: env)) {"#) {
                            func variable(for value: Value) -> String { return "_\(value.bindingName)" }
                            for value in enumCase.associatedValues {
                                fragment.output("let \(variable(for: value)) = try env.getNamedProperty(value, \"\(value.bindingName)\")")
                            }
                            if enumCase.associatedValues.isEmpty {
                                fragment.output("return \(enumCase.name)")
                            } else {
                                fragment.outputBlock("return Self.\(enumCase.name)(") {
                                    fragment.outputMap(enumCase.associatedValues, separator: ",") { value in
                                        let resolved = context.resolve(type: value.type)
                                        return "\(value.name.map { "\($0): " } ?? "")try \(resolved.converterType.name).fromNode(\(variable(for: value)), env: env)"
                                    }
                                }
                            }
                        }
                        fragment.blankLine()
                    }
                    fragment.output("fatalError(\"invalid enum for \(sourceType.name)\")")
                }
                fragment.blankLine()

                fragment.outputBlock("public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {") {
                    if cases.isEmpty {
                        fragment.output("// Uninhabited type")
                    } else {
                        fragment.output("switch value {")
                        for enumCase in cases {
                            let className = "\(nodeName).\(upperCaseFirst(enumCase.name))"

                            let caseStatement: String
                            if enumCase.associatedValues.isEmpty {
                                caseStatement = "case .\(enumCase.name):"
                            } else {
                                let values = enumCase.associatedValues.map(\.bindingName).joined(separator: ", ")
                                caseStatement = "case let .\(enumCase.name)(\(values)):"
                            }
                            fragment.outputBlock(caseStatement, closeWith: "", newLineTerminated: false) {
                                fragment.outputBlock("return try env.newInstance(") {
                                    fragment.output(#"NodeClass.constructor(for: "\#(className)", module: "\#(context.module)", env: env),"#)
                                    fragment.outputBlock("[") {
                                        for value in enumCase.associatedValues {
                                            let resolved = context.resolve(type: value.type)
                                            fragment.output("\(resolved.converterType.name).toNode(\(value.bindingName), env: env),")
                                        }
                                    }
                                }
                            }
                        }
                        fragment.output("}")
                    }
                }
                fragment.blankLine()

                fragment.output("@available(*, deprecated, message: \"Not actually deprecated, but this silences warnings because it may refer to deprecated methods\")")
                fragment.outputBlock("public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {") {
                    fragment.outputBlock("let superclass = try NodeClass(") {
                        fragment.output("env: env,")
                        fragment.output(#"module: "\#(context.module)","#)
                        fragment.output(#"name: "\#(nodeName)","#)
                        fragment.outputBlock("properties: [", closeWith: "],") {
                            var hasProperties = false
                            hasProperties ||= context.nodeTranslator.outputProperties(
                                methods: methods,
                                context: context,
                                fragment: fragment,
                                converterName: converterType.name
                            )
                            hasProperties ||= context.nodeTranslator.outputProperties(
                                computedVariables: fields,
                                context: context,
                                fragment: fragment,
                                converterName: converterType.name
                            )
                            if !hasProperties {
                                fragment.output(":")
                            }
                        }
                        fragment.outputBlock("constructor: { env, info in", closeWith: "}") {
                            fragment.outputBlock("FishyJoesNodeRuntime.callbackBody(", newLineTerminated: false) {
                                fragment.output("env, info,")
                                fragment.output("name: \"\(nodeName)_constructor\",")
                                fragment.output("expectedArgumentCount: 0")
                            }
                            fragment.outputBlock(" { env in", closeWith: "}") {
                                fragment.output("return try env.this()")
                            }
                        }
                    }
                    fragment.outputBlock("try FishyJoesNodeRuntime.mergeDefinitionInto(") {
                        fragment.output("env: env,")
                        fragment.output("module: module,")
                        fragment.output("path: \"\(nodeName)\",")
                        fragment.output("nodeClass: superclass.constructor.value(env: env)")
                    }

                    for enumCase in cases {
                        let name = upperCaseFirst(enumCase.name)
                        let className = "\(nodeName).\(name)"
                        let classVarName = "\(enumCase.name)Class"
                        fragment.outputBlock("let \(classVarName) = try NodeClass(") {
                            fragment.output("env: env,")
                            fragment.output(#"module: "\#(context.module)","#)
                            fragment.output(#"name: "\#(className)","#)
                            fragment.output("superclass: superclass,")
                            if enumCase.associatedValues.isEmpty {
                                fragment.output("properties: [:],")
                            } else {
                                fragment.outputBlock("properties: [", closeWith: "],") {
                                    for value in enumCase.associatedValues {
                                        // Limitation is wasm implementation of napi_create_class doesn't allow constructors to assign to non-mutable property.
                                        fragment.output("\"\(value.bindingName)\": (.stored(mutable: true), isStatic: false),")
                                    }
                                }
                            }
                            fragment.outputBlock("constructor: { env, info in", closeWith: "}") {
                                fragment.outputBlock("FishyJoesNodeRuntime.callbackBody(", newLineTerminated: false) {
                                    fragment.output("env, info,")
                                    fragment.output("name: \"\(className)_constructor\",")
                                    fragment.output("expectedArgumentCount: \(enumCase.associatedValues.count)")
                                }
                                fragment.outputBlock(" { env in", closeWith: "}") {
                                    fragment.output("let this = try env.this()")
                                    for value in enumCase.associatedValues {
                                        fragment.output("try env.env.setNamedProperty(this, \"\(value.bindingName)\", env.argument(at: \(value.index)))")
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

            let commonInterfaceName = "\(nodeName)_Common"
            if !cases.isEmpty {
                context.tsAnnotations.add(
                    interface: .init(
                        name: commonInterfaceName,
                        forNamespace: nodeName,
                        fields: fields.filter { !$0.isStatic }.compactMap { context.ts(field: $0, useNativeName: false) },
                        methods: methods.filter { !$0.isStatic }.compactMap { context.ts(method: $0) }
                    )
                )
            }

            context.tsAnnotations.add(
                namespace: .init(
                    name: nodeName,
                    fields: fields.filter(\.isStatic).compactMap { context.ts(field: $0) },
                    methods: methods.filter(\.isStatic).compactMap { context.ts(method: $0) }
                )
            )

            let nodeConformances = Set(exportedConformances(in: context).map { $0.nodeType })
            var tsCases: [TypeScriptAnnotations.TSType] = []
            for enumCase in cases {
                let className = "\(nodeName).\(upperCaseFirst(enumCase.name))"
                tsCases.append(.named(className))
                context.tsAnnotations.add(
                    class: .init(
                        documentation: enumCase.documentation,
                        name: className,
                        extends: [commonInterfaceName],
                        implements: nodeConformances,
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
                                type: context.resolve(type: value.type).nodeType,
                                hasDefaultImplementation: false
                            )
                        },
                        methods: []
                    )
                )
            }

            context.tsAnnotations.add(
                typealias: .init(documentation: documentation, name: nodeName, value: .union(tsCases))
            )
        }
        return fragment
    }

    func jniDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "JavaInterface/\(sourceType.name)+java-type.swift",
            additionalImports: ["Foundation", "FishyJoesJavaRuntime"]
        )

        let className = context.kotlinTranslator.javaClassName(nodeName, in: context)
        fragment.outputBlock("extension \(sourceType.name): FishyJoesJavaRuntime.JavaConverter {") {
            fragment.output("public typealias SwiftType = Self")
            fragment.output("public typealias CType = jobject?")
            fragment.blankLine()

            fragment.output("public static var javaClass: jclass?")
            for enumCase in cases {
                if enumCase.associatedValues.isEmpty {
                    fragment.output("static var \(enumCase.classVar): jclass!")
                    fragment.output("static var \(enumCase.classInstanceVar): jfieldID!")
                } else {
                    fragment.output("static var \(enumCase.classVar): jclass!")
                    fragment.output("static var \(enumCase.classInitVar): jmethodID!")
                    for value in enumCase.associatedValues {
                        fragment.output("static var \(enumCase.classVar)\(value.fieldVar): jfieldID!")
                    }
                }
            }
            fragment.blankLine()

            fragment.outputBlock("public static func fromJava(_ value: jobject?, env: Env) throws -> Self {") {
                for enumCase in cases {
                    fragment.outputBlock("if env.IsInstanceOf(value, Self.\(enumCase.classVar)) {") {
                        if enumCase.associatedValues.isEmpty {
                            fragment.output("return Self.\(enumCase.name)")
                        } else {
                            fragment.outputBlock("return Self.\(enumCase.name)(") {
                                fragment.outputMap(enumCase.associatedValues, separator: ",") { value in
                                    let resolved = context.resolve(type: value.type)
                                    let field = "Self.\(enumCase.classVar)\(value.fieldVar)"
                                    return "\(value.name.map { "\($0): " } ?? "")try \(resolved.converterType.name).fromJava(env.Get\(resolved.jniType.valueType)Field(value, \(field)), env: env)"
                                }
                            }
                        }
                    }
                }
                fragment.output("throw JNIError(message: \"invalid enum \\(try env.javaDescription(value)) for \(sourceType.name)\")")
            }
            fragment.blankLine()

            fragment.outputBlock("public static func toJava(_ value: Self, env: Env) throws -> jobject? {") {
                if cases.isEmpty {
                    fragment.output("// Uninhabited type")
                } else {
                    fragment.output("switch value {")
                    for enumCase in cases {
                        let name = enumCase.name
                        if enumCase.associatedValues.isEmpty {
                            fragment.outputBlock("case .\(name):", closeWith: "", newLineTerminated: false) {
                                fragment.output("return env.GetStaticObjectField(Self.\(enumCase.classVar), Self.\(enumCase.classInstanceVar))")
                            }
                        } else {
                            let joinedNames = enumCase.associatedValues.map(\.bindingName).joined(separator: ", ")
                            fragment.outputBlock("case let .\(name)(\(joinedNames)):", closeWith: "", newLineTerminated: false) {
                                fragment.outputBlock("return try env.NewObject(", closeWith: ")") {
                                    fragment.output("Self.\(enumCase.classVar),")
                                    fragment.output("Self.\(enumCase.classInitVar)", newLineTerminated: false)
                                    for value in enumCase.associatedValues {
                                        let resolved = context.resolve(type: value.type)
                                        fragment.output(",")
                                        fragment.output("jvalue(\(resolved.converterType.name).toJava(\(value.bindingName), env: env))", newLineTerminated: false)
                                    }
                                    fragment.blankLine()
                                }
                            }
                        }
                    }
                    fragment.output("}")
                }
            }
            fragment.blankLine()

            fragment.outputBlock("public static func javaSetup(env: Env) throws {") {
                fragment.output("guard javaClass == nil else { return }")
                fragment.output("javaClass = try env.globalRef(env.FindClass(\"\(className)\"))")
                for enumCase in cases {
                    let name = enumCase.name
                    let subclassName = "\(className)$\(upperCaseFirst(name))"
                    fragment.output("\(enumCase.classVar) = try env.globalRef(env.FindClass(\"\(subclassName)\"))")
                    if enumCase.associatedValues.isEmpty {
                        fragment.output("\(enumCase.classInstanceVar) = try env.GetStaticFieldID(\(enumCase.classVar), \"INSTANCE\", \"L\(subclassName);\")")
                    } else {
                        var sig = "\"("
                        for value in enumCase.associatedValues {
                            let resolved = context.resolve(type: value.type)
                            sig += resolved.jniType.asSignature
                        }
                        sig += ")V\""
                        fragment.output("\(enumCase.classInitVar) = try env.GetMethodID(\(enumCase.classVar), \"<init>\", \(sig))")
                        for value in enumCase.associatedValues {
                            let resolved = context.resolve(type: value.type)
                            fragment.output("\(enumCase.classVar)\(value.fieldVar) = try env.GetFieldID(\(enumCase.classVar), \"\(value.bindingName)\", \"\(resolved.jniType.asSignature)\")")
                        }
                    }
                }
            }
        }

        let (fields, methods) = KotlinClass.separate(
            fieldsAndMethods:
                fields.compactMap {
                    context.kotlin(field: $0, useNativeName: false)
                } + methods.compactMap {
                    context.kotlin(method: $0)
                }
        )

        context.add(
            kotlinClass: KotlinEnumClass(
                module: context.module,
                documentation: documentation,
                name: nodeName,
                cases: cases.map { enumCase in
                    let name = upperCaseFirst(enumCase.name)
                    if enumCase.associatedValues.isEmpty {
                        return .object(documentation: enumCase.documentation, name: name)
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
                fields: fields,
                methods: methods,
                conformances: Set(exportedConformances(in: context).map { $0.kotlinType })
            ).conforming(to: exportedConformances(in: context), context: context)
        )

        return fragment
    }
}

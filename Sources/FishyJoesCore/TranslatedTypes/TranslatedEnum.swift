import SourceryRuntime

struct TranslatedEnum: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let cppName: String
    let neutralName: String
    var containedNamedTypes: [TranslatedType] { [self] }
    let kotlinPackage: String?
    let jniType: JNIType
    let cSharpType: CSharpClass.CSType
    let cases: [Case]
    let documentation: [String]
    let methods: [Method]
    let computedVariables: [Variable]
    let isInhabited: Bool
    let definingModule: Module

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

        self.sourceType = BetterType(named: type)
        self.neutralName = "Enum<TranslatedFrom=\(name)>"
        self.cppName = name.replacingOccurrences(of: ".", with: "::")
        self.nodeName = name
        self.kotlinName = name
        self.kotlinPackage = context.module.kotlinPackage
        self.cSharpType = .named(package: context.module.cSharpNamespace, name: exportAnnotation.cSharpName)
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
        self.methods = type.methods.compactMap { Method($0) }
        self.computedVariables = type.variables.filter { $0.exportAnnotation != nil }
        self.isInhabited = type.isInhabited
        self.definingModule = context.module
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        return [
            nodeDefinitionFragment(in: context),
            jniDefinitionFragment(in: context),
            cSharpDefinitionFragment(in: context),
            cppDefinitionFragment(in: context),
        ] + neutralDefinitionFragments(in: context)
    }

    func cppDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        var newMethods: [CPPClass.CPPMethod] = []
        newMethods.append(contentsOf: methods.map { context.cppTranslator.translateToHeaderFragment(method: $0, in: context) })
        for variable in computedVariables {
            let accessors = context.cppTranslator.translateToHeaderFragment(variable: variable, in: context)
            newMethods.append(accessors.getter)
            if let setter = accessors.setter {
                newMethods.append(setter)
            }
        }
        let innerStructs = cases.map { caseObj -> CPPClass in
            let innerFields = caseObj.associatedValues.map({ val in
                CPPClass.CPPField(
                    documentation: [],
                    isStatic: false,
                    isPrivate: false,
                    name: val.bindingName,
                    type: .type(context.resolve(type: val.type)),
                    initializer: nil
                )
            })
            return CPPClass(
                module: context.module,
                documentation: caseObj.documentation,
                name: sourceType.name + "." + caseObj.name,
                methods: [],
                fields: innerFields,
                serializedFields: innerFields,
                innerClases: [],
                completeConstructorVisible: true
            )
        }
        for innerStruct in innerStructs {
            context.cppClasses[innerStruct.qualifiedName] = innerStruct
        }
        let varField = CPPClass.CPPField(
            documentation: ["std::variant containing subtypes"],
            isStatic: false,
            isPrivate: true,
            name: "_variant",
            type: .variant(cases.map(\.name)),
            initializer: nil
        )
        let me = sourceType.name.split(separator: ".").last!
        let newClass = CPPClass(
            module: context.module,
            documentation: documentation,
            name: sourceType.name,
            methods: newMethods,
            fields: [varField],
            serializedFields: [varField],
            magicalElements: [ {(fragment: SourceFragment) -> Void in
                // define VariantType for later methods
                fragment.output("private:")
                fragment.output("using VariantType = std::variant<\(cases.map(\.name).joined(separator: ", "))>;")
            }, {(fragment: SourceFragment) -> Void in
                fragment.output("public:")
                fragment.output("template <typename T>")
                fragment.output("\(me)(const T& caseObj): _variant(caseObj) {}")
            }, {(fragment: SourceFragment) -> Void in
                fragment.output("template <typename T>")
                fragment.outputBlock("\(me)& operator=(const T& rhs) {") {
                    fragment.output("_variant = rhs;")
                    fragment.output("return *this;")
                }
            }, {(fragment: SourceFragment) -> Void in
                fragment.output("template <typename T>")
                fragment.outputBlock("std::invoke_result_t<T, std::variant_alternative_t<0, VariantType>> visit(const T& visitor) {") {
                    fragment.output("return std::visit(visitor, _variant);")
                }
            }, {(fragment: SourceFragment) -> Void in
                fragment.output("template <typename T>")
                fragment.outputBlock("bool isOfType() {") {
                    fragment.output("std::holds_alternative<T>(_variant);")
                }
                fragment.output("template <const auto& n>")
                fragment.outputBlock("bool isOfType() {") {
                    fragment.output("return isOfType<std::decay_t<decltype(n)>>();")
                }
            }, {(fragment: SourceFragment) -> Void in
                fragment.output("template <typename T>")
                fragment.outputBlock("T* getIfIs() {") {
                    fragment.output("return std::get_if<T>(&_variant);")
                }
                fragment.output("template <const auto& n>")
                fragment.outputBlock("std::decay_t<decltype(n)>* getIfIs() {") {
                    fragment.output("return getIfIs<std::decay_t<decltype(n)>>();")
                }
            }, {(fragment: SourceFragment) -> Void in
                fragment.output("template <typename T>")
                fragment.outputBlock("T& get() {") {
                    fragment.output("return std::get<T>(_variant);")
                }
                fragment.output("template <const auto& n>")
                fragment.outputBlock("std::decay_t<decltype(n)>& get() {") {
                    fragment.output("return get<std::decay_t<decltype(n)>>();")
                }
            }],
            completeConstructorVisible: false
        )
        context.cppClasses[newClass.qualifiedName] = newClass
        return SourceFragment(sourceryDestination: "file:CPPInterface/\(sourceType.name).swift")
    }

    func neutralDefinitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        guard context.dumpDebugRepresentation else { return [] }

        let fragment = SourceFragment(
            sourceryDestination: "file:../../DebugGenerated/\(sourceType.name)+EnumInfo.txt"
        )
        fragment.outputBlock("TranslatedEnum for \(sourceType.name) {") {
            fragment.outputBlock("Documentation {") {
                for doc in documentation {
                    fragment.output(doc)
                }
            }
            fragment.outputBlock("Cases {") {
                for singleCase in cases {
                    fragment.outputBlock("Case \(singleCase.name) {") {
                        fragment.outputBlock("Documentation {") {
                            for doc in singleCase.documentation {
                                fragment.output(doc)
                            }
                        }
                        fragment.outputBlock("Values {") {
                            for value in singleCase.associatedValues {
                                fragment.outputBlock("Value \(value.name ?? "(nil)") {") {
                                    fragment.output("Index: \(value.index)")
                                    fragment.output("Label: \(value.label ?? "(nil)")")
                                    fragment.output("Type: \(context.resolve(type: value.type).neutralName)")
                                }
                            }
                        }
                    }
                }
            }
            fragment.outputBlock("Methods {") {
                for method in methods {
                    context.neutralTranslator.output(method: method, context: context, fragment: fragment)
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
            additionalImports: ["Foundation", "FishyJoesNodeRuntime"]
        )
        if cases.allSatisfy({ $0.associatedValues.isEmpty }), !cases.isEmpty {
            // Simple enum, export as strings
            fragment.outputBlock("extension \(sourceType.name): FishyJoesNodeRuntime.NodeConverter {") {
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
            }
            context.tsAnnotations.add(
                typealias: .init(
                    documentation: documentation,
                    name: nodeName,
                    value: .union(cases.map { .exactString($0.name) })
                )
            )
        } else {
            fragment.outputBlock("extension \(sourceType.name): FishyJoesNodeRuntime.NodeConverter {") {
                fragment.outputBlock("public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {") {
                    if !cases.isEmpty {
                        fragment.output("let instanceData = try FishyJoesNodeRuntime.InstanceData.data(for: env)")
                    }
                    for enumCase in cases {
                        let className = "\(nodeName).\(upperCaseFirst(enumCase.name))"

                        fragment.outputBlock("if try env.instanceof(value, instanceData.constructor(for: \"\(className)\", env: env)) {") {
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
                        fragment.output("let instanceData = try FishyJoesNodeRuntime.InstanceData.data(for: env)")
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
                                    fragment.output("instanceData.constructor(for: \"\(className)\", env: env),")
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

                fragment.outputBlock("public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {") {
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
            additionalImports: ["Foundation", "FishyJoesJavaRuntime"]
        )
        let className = context.kotlinTranslator.javaClassName(nodeName, in: context)
        fragment.outputBlock("extension \(sourceType.name): JavaConverter {") {
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

    func cSharpDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "CSharpInterface/\(sourceType.name)+cSharp-type.swift",
            additionalImports: ["Foundation", "FishyJoesCSharpRuntime"]
        )

        var setupMethods = isInhabited ? [(name: "discriminator", args: ["csObject", "csOutExn"], returns: "Int")] : []

        for enumCase in cases {
            let args = enumCase.associatedValues.map { value in
                "\(context.resolve(type: value.type).converterType.name).CType"
            }
            setupMethods.append((name: "\(enumCase.name)_constructor", args: args + ["csOutExn"], returns: "csObject"))
            setupMethods.append((name: "\(enumCase.name)_extractor", args: ["csObject"] + args.map { "UnsafePointer<\($0)>" } + ["csOutExn"], returns: "Void"))
        }

        fragment.output("@_cdecl(\"\(cSharpSetupName)\")")
        fragment.outputBlock("public func \(cSharpSetupName)(", newLineTerminated: false) {
            fragment.outputMap(setupMethods, separator: ",") { method in
                "\(method.name): @escaping \(sourceType.name).\(upperCaseFirst(method.name))"
            }
        }
        fragment.outputBlock(" {") {
            for method in setupMethods {
                fragment.output("\(sourceType.name).\(method.name) = \(method.name)")
            }
        }
        fragment.blankLine()

        fragment.outputBlock("extension \(sourceType.name): CSharpConverter {") {
            for method in setupMethods {
                fragment.outputBlock("public typealias \(upperCaseFirst(method.name)) = @convention(c) (", closeWith: ") -> \(method.returns)") {
                    fragment.outputMap(method.args, separator: ",") { $0 }
                }
                fragment.output("fileprivate static var \(method.name): \(upperCaseFirst(method.name))!")
            }
            if !setupMethods.isEmpty {
                fragment.blankLine()
            }

            fragment.outputBlock("public static func peekCSharp(_ value: csObject) throws -> Self {") {
                if isInhabited {
                    fragment.output("switch try Env.check({ exn in discriminator(value, exn) }) {")
                    for (index, enumCase) in cases.enumerated() {
                        fragment.outputBlock("case \(index):", closeWith: "", newLineTerminated: false) {
                            var args = "value, "
                            var cleanup: [String] = []
                            for value in enumCase.associatedValues {
                                let resolved = context.resolve(type: value.type)
                                fragment.output("var _\(value.bindingName) = \(resolved.converterType.name).CType.default")
                                args += "&_\(value.bindingName), "
                                if resolved.cSharpType.isObject {
                                    cleanup.append("Env.deleteRef(_\(value.bindingName))")
                                }
                            }
                            fragment.output("try Env.check { exn in \(enumCase.name)_extractor(\(args)exn) }")
                            if enumCase.associatedValues.isEmpty {
                                fragment.output("return Self.\(enumCase.name)")
                            } else {
                                if !cleanup.isEmpty {
                                    fragment.outputBlock("defer {") {
                                        cleanup.forEach { fragment.output($0) }
                                    }
                                }
                                fragment.outputBlock("return Self.\(enumCase.name)(") {
                                    fragment.outputMap(enumCase.associatedValues, separator: ",") { value in
                                        let resolved = context.resolve(type: value.type)
                                        return "\(value.name.map { "\($0): " } ?? "")try \(resolved.converterType.name).peekCSharp(_\(value.bindingName))"
                                    }
                                }
                            }
                        }
                    }
                    fragment.outputBlock("case let disc:", closeWith: "", newLineTerminated: false) {
                        fragment.output("fatalError(\"bad discriminator value \\(disc) encountered for type \\(self)\")")
                    }
                    fragment.output("}")
                } else {
                    fragment.output("throw UninhabitedTypeCreationError(self)")
                }
            }
            fragment.blankLine()

            fragment.outputBlock("public static func toCSharp(_ value: Self) throws -> csObject {") {
                if isInhabited {
                    fragment.output("switch value {")
                    for enumCase in cases {
                        let joinedValues = enumCase.associatedValues.map(\.bindingName).joined(separator: ", ")
                        if enumCase.associatedValues.isEmpty {
                            fragment.output("case \(enumCase.name)", newLineTerminated: false)
                        } else {
                            fragment.output("case let \(enumCase.name)(\(joinedValues))", newLineTerminated: false)
                        }
                        fragment.outputBlock(":", closeWith: "", newLineTerminated: false) {
                            fragment.outputBlock("return try Env.check { exn in", closeWith: "}") {
                                fragment.outputBlock("return \(enumCase.name)_constructor(") {
                                    for value in enumCase.associatedValues {
                                        let resolved = context.resolve(type: value.type)
                                        fragment.output("try \(resolved.converterType.name).toCSharp(\(value.bindingName)),")
                                    }
                                    fragment.output("exn")
                                }
                            }
                        }
                    }
                    fragment.output("}")
                }
            }
            fragment.blankLine()
        }

        context.cSharpClasses.append(
            CSharpEnumClass(
                module: context.module,
                documentation: documentation,
                name: cSharpType.name,
                cases: cases.map { enumCase in
                    let name = upperCaseFirst(enumCase.name)
                    return CSharpEnumClass.Case(
                        documentation: enumCase.documentation,
                        name: name,
                        values: enumCase.associatedValues.map { value in
                            (upperCaseFirst(value.bindingName), context.resolve(type: value.type).cSharpType)
                        }
                    )
                },
                fieldsAndMethods:
                    computedVariables.compactMap { context.cSharp(field: $0, of: self, useNativeName: false) } +
                    methods.compactMap { context.cSharp(method: $0, of: self) }
            )
        )
        return fragment
    }

    func cSharpSetupDelegates(in context: FishyJoesContext) -> [String] {
        var lines: [String] = []
        for enumCase in cases {
            lines.append("delegate \(cSharpType.pInvokeCreatedName) \(cSharpType.name.mangled)_new_\(enumCase.name.mangled)(")
            for value in enumCase.associatedValues {
                let resolved = context.resolve(type: value.type)
                lines.append("    \(resolved.cSharpType.pInvokeConsumeName) \(value.bindingName),")
            }
            lines.append("    out CreatedRef _exn")
            lines.append(");")
            lines.append("unsafe delegate void \(cSharpType.name.mangled)_extract_\(enumCase.name.mangled)(")
            lines.append("    \(cSharpType.pInvokeUnownedName) obj,")
            for value in enumCase.associatedValues {
                let resolved = context.resolve(type: value.type)
                lines.append("    ref \(resolved.cSharpType.pInvokeCreatedName) \(value.bindingName),")
            }
            lines.append("    out CreatedRef _exn")
            lines.append(");")
        }
        return lines
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [CSharpSetupParameter] {
        var parameters: [CSharpSetupParameter] = []
        if isInhabited {
            parameters.append(
                .value(name: "discriminator", type: "FishyJoesRuntime.EnumDiscriminator") { fragment in
                    fragment.outputBlock("bag<FishyJoesRuntime.EnumDiscriminator>((\(cSharpType.pInvokeUnownedName) obj, out CreatedRef exn) => Catching(out exn, () => {", closeWith: "})),") {
                        fragment.output("var enumeration = obj.Peek<\(cSharpType.name)>();")
                        for (index, enumCase) in cases.enumerated() {
                            fragment.output("if (enumeration is \(cSharpType.name).\(upperCaseFirst(enumCase.name))) { return (nint)\(index); }")
                        }
                        fragment.output("throw new Exception($\"Found unexpected subclass of \(cSharpType.name): {enumeration}\");")
                    }
                }
            )
        }
        for enumCase in cases {
            let constructorDelegate = "\(cSharpType.name.mangled)_new_\(enumCase.name.mangled)"
            parameters.append(
                .value(name: "\(enumCase.name)_constructor", type: constructorDelegate) { fragment in
                    fragment.outputBlock("bag<\(constructorDelegate)>(", closeWith: "),") {
                        fragment.outputBlock("(", newLineTerminated: false) {
                            for value in enumCase.associatedValues {
                                let resolved = context.resolve(type: value.type)
                                fragment.output("\(resolved.cSharpType.pInvokeConsumeName) _\(value.bindingName),")
                            }
                            fragment.output("out CreatedRef exn")
                        }
                        fragment.outputBlock(" => Catching(out exn, () => ", closeWith: ")") {
                            fragment.outputBlock("new CreatedRef(new \(cSharpType.name).\(upperCaseFirst(enumCase.name))(", closeWith: "))") {
                                fragment.outputMap(enumCase.associatedValues, separator: ",") { value in
                                    let resolved = context.resolve(type: value.type)
                                    if resolved.cSharpType.isObject {
                                        return "_\(value.bindingName).Consume<\(resolved.cSharpType.name)>()"
                                    } else {
                                        return "_\(value.bindingName)"
                                    }
                                }
                            }
                        }
                    }
                }
            )
            let extractorDelegate = "\(cSharpType.name.mangled)_extract_\(enumCase.name.mangled)"
            parameters.append(
                .value(name: "\(enumCase.name)_extractor", type: extractorDelegate) { fragment in
                    fragment.outputBlock("bag<\(extractorDelegate)>(", closeWith: "),") {
                        fragment.outputBlock("(", newLineTerminated: false) {
                            fragment.output("\(cSharpType.pInvokeUnownedName) obj,")
                            for value in enumCase.associatedValues {
                                let resolved = context.resolve(type: value.type)
                                fragment.output("ref \(resolved.cSharpType.pInvokeCreatedName) _\(value.bindingName),")
                            }
                            fragment.output("out CreatedRef exn")
                        }
                        fragment.outputBlock(" => {") {
                            fragment.outputBlock("try {", newLineTerminated: false) {
                                fragment.output("var enumeration = obj.Peek<\(cSharpType.name).\(upperCaseFirst(enumCase.name))>();")
                                for value in enumCase.associatedValues {
                                    let resolved = context.resolve(type: value.type)
                                    if resolved.cSharpType.isObject {
                                        fragment.output("_\(value.bindingName) = new CreatedRef(enumeration.\(upperCaseFirst(value.bindingName)));")
                                    } else {
                                        fragment.output("_\(value.bindingName) = enumeration.\(upperCaseFirst(value.bindingName));")
                                    }
                                }
                                fragment.output("exn = CreatedRef.Null;")
                            }
                            fragment.outputBlock(" catch (Exception e) {") {
                                fragment.output("exn = new CreatedRef(e);")
                            }
                        }
                    }
                }
            )
        }
        return parameters
    }
}

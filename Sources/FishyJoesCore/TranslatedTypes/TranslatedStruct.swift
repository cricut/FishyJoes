import SourceryRuntime

struct TranslatedStruct: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let cppName: String
    let neutralName: String
    var containedNamedTypes: [TranslatedType] { [self] }
    let kotlinPackage: String?
    let cSharpType: CSharpClass.CSType
    let globalName: String
    let storedVariables: [Variable]
    let computedVariables: [Variable]
    let methods: [Method]
    let documentation: [String]
    let jniType: JNIType
    let isInhabited: Bool
    let definingModule: Module

    init(context: FishyJoesContext, type: Type) {
        guard let exportAnnotation = type.exportAnnotation else {
            fatalErr("c symbol not specified")
        }
        guard type.kind == "struct" else { fatalErr("not a struct") }

        self.sourceType = BetterType(named: type)
        self.nodeName = exportAnnotation.name
        self.kotlinName = exportAnnotation.name
        self.cppName = exportAnnotation.name.replacingOccurrences(of: ".", with: "::")
        self.neutralName = "Struct<Named=\(exportAnnotation.name)>"
        self.kotlinPackage = context.module.kotlinPackage
        self.cSharpType = .named(package: context.module.cSharpNamespace, name: exportAnnotation.cSharpName)
        self.globalName = "\(context.module).\(type.globalName)"
        self.jniType = .object(context.kotlinTranslator.javaClassName(nodeName, in: context))

        self.storedVariables = type.storedVariables
        self.computedVariables =
            (type.computedVariables + type.staticVariables).filter { $0.exportAnnotation != nil }

        self.methods = type.methods.compactMap { Method($0) }
        self.documentation = type.documentation
        self.isInhabited = type.isInhabited
        self.definingModule = context.module
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        [
            nodeDefinitionFragment(in: context),
            jniDefinitionFragment(in: context),
            cSharpDefinitionFragment(in: context),
            cppDefinitionFragment(in: context),
        ] + neutralDefinitionFragments(in: context)
    }

    func cppDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = SourceFragment(sourceryDestination: "file:CPPInterface/\(sourceType.name).swift")
        var newMethods: [CPPClass.CPPMethod] = []
        newMethods.append(contentsOf: methods.map { context.cppTranslator.translateToHeaderFragment(method: $0, in: context) })
        for variable in computedVariables {
            let accessors = context.cppTranslator.translateToHeaderFragment(variable: variable, in: context)
            newMethods.append(accessors.getter)
            if let setter = accessors.setter {
                newMethods.append(setter)
            }
        }
        let newFields: [CPPClass.CPPField] = storedVariables.map { variable in
            let fieldType = context.resolve(type: variable.typeName.better)
            return CPPClass.CPPField(
                documentation: variable.documentation,
                isStatic: variable.isStatic,
                isPrivate: false,
                name: variable.name,
                type: .type(fieldType),
                initializer: nil
            )
        }
        let newClass = CPPClass(
            module: context.module,
            documentation: documentation,
            name: sourceType.name,
            methods: newMethods,
            fields: newFields,
            serializedFields: newFields,
            completeConstructorVisible: true
        )
        context.cppClasses[newClass.qualifiedName] = newClass
        return fragment
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
            "NodeInterface/\(globalName)+node.swift",
            additionalImports: ["Foundation", "FishyJoesNodeRuntime"]
        )

        fragment.outputBlock("extension \(globalName): NodeMutator {") {
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
                fragment.output("let constructor = try InstanceData.data(for: env).constructor(for: \"\(nodeName)\", env: env)")
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
                // fragment.output("print(\"setting up \(globalName)\")")

                fragment.outputBlock("let nodeClass = try NodeClass(") {
                    fragment.output("env: env,")
                    fragment.output("name: \"\(nodeName)\",")
                    fragment.outputBlock("properties: [", closeWith: "],") {
                        var hasProperties = false
                        hasProperties ||= context.nodeTranslator.outputProperties(methods: methods, context: context, fragment: fragment)
                        hasProperties ||= context.nodeTranslator.outputProperties(computedVariables: computedVariables, context: context, fragment: fragment)
                        for storedVar in storedVariables {
                            // Limitation is wasm implementation of napi_create_class doesn't allow constructors to assign to non-mutable property.
                            // let mutable = storedVar.isMutable
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
            "JavaInterface/\(sourceType.name)+java.swift",
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
            
            fragment.outputBlock("public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Self) async throws -> R) async throws -> R {") {
                fragment.output("var mutatingSelf = try fromJava(this, env: env)")
                fragment.output("let result = try await body(&mutatingSelf)")
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

        context.kotlinClasses.append(
            KotlinProductClass(
                module: context.module,
                documentation: documentation,
                name: kotlinName,
                constructor: .`public`(
                    fields: storedVariables.compactMap {
                        switch context.kotlin(field: $0, useNativeName: true) {
                        case .method: fatalErr("Can't export a stored variable as a method")
                        case .variable(let field): return field
                        case nil: return nil
                        }
                    }
                ),
                fieldsAndMethods:
                    computedVariables.compactMap { context.kotlin(field: $0, useNativeName: false) } +
                    methods.compactMap { context.kotlin(method: $0) }
            )
        )

        return fragment
    }

    func cSharpSetupDelegates(in context: FishyJoesContext) -> [String] {
        var lines: [String] = []
        lines.append("delegate \(cSharpType.pInvokeCreatedName) _\(converterType.genericBaseName.mangledName)Constructor(")
        for storedVar in storedVariables {
            let resolved = context.resolve(type: storedVar.typeName.better)
            lines.append("    \(resolved.cSharpType.pInvokeConsumeName) \(CSharpClass.deforbidify(storedVar.name)),")
        }
        lines.append("    out CreatedRef exn")
        lines.append(");")
        for storedVar in storedVariables {
            let resolved = context.resolve(type: storedVar.typeName.better)
            let commonName = "_\(converterType.genericBaseName.mangledName)_\(storedVar.name)"
            lines.append("delegate \(resolved.cSharpType.pInvokeCreatedName) \(commonName)Getter(\(cSharpType.pInvokeUnownedName) obj, out CreatedRef exn);")
            lines.append("delegate void \(commonName)Setter(\(cSharpType.pInvokeUnownedName) obj, \(resolved.cSharpType.pInvokeConsumeName) newValue, out CreatedRef exn);")
        }
        return lines
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [CSharpSetupParameter] {
        let constructorType = "_\(converterType.genericBaseName.mangledName)Constructor"
        let constructorArgs = storedVariables.map { storedVar in
            let resolved = context.resolve(type: storedVar.typeName.better)
            return "\(resolved.cSharpType.pInvokeConsumeName) \(CSharpClass.deforbidify(storedVar.name)), "
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
        ] + storedVariables.flatMap { storedVar -> [CSharpSetupParameter] in
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
                },
                .value(
                    name: "set_\(storedVar.name)",
                    type: setType
                ) { fragment in
                    fragment.outputBlock("bag<\(setType)>((\(cSharpType.pInvokeUnownedName) obj, \(resolved.cSharpType.pInvokeConsumeName) newValue, out CreatedRef exn) => Catching(out exn, () => {", closeWith: "})),") {
                        fragment.output("obj.Peek<\(cSharpType.name)>().\(CSharpClass.deforbidify(upperCaseFirst(storedVar.name))) = ", newLineTerminated: false)
                        fragment.output(resolved.cSharpType.isObject ? "newValue.Consume<\(resolved.cSharpType.name)>();" : "newValue;")
                    }
                },
            ]
        }
    }

    func cSharpDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "CSharpInterface/\(sourceType.name)+cSharp-type.swift",
            additionalImports: ["Foundation", "FishyJoesCSharpRuntime"]
        )

        fragment.output("@_cdecl(\"\(cSharpSetupName)\")")
        fragment.outputBlock("public func \(cSharpSetupName)(", newLineTerminated: false) {
            fragment.output("constructorMethod: @escaping \(converterType.name)._ConstructorMethod,")
            for storedVar in storedVariables {
                let resolved = context.resolve(type: storedVar.typeName.better)
                fragment.output("_ \(storedVar.name)Getter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> \(resolved.converterType.name).CType,")
                fragment.output("_ \(storedVar.name)Setter: @escaping @convention(c) (csObject, \(resolved.converterType.name).CType, _ exn: csOutExn) -> Void,")
            }
            fragment.output("_ exn: csOutExn")
        }
        fragment.outputBlock(" {") {
            fragment.output("guard \(converterType.name)._constructorMethod == nil else { return }")
            fragment.output("\(converterType.name)._constructorMethod = constructorMethod")
            for storedVar in storedVariables {
                fragment.output("\(converterType.name)._\(storedVar.name)Getter = \(storedVar.name)Getter")
                fragment.output("\(converterType.name)._\(storedVar.name)Setter = \(storedVar.name)Setter")
            }
        }
        fragment.blankLine()

        fragment.outputBlock("extension \(converterType.name): CSharpMutator {") {
            for storedVar in storedVariables {
                let resolved = context.resolve(type: storedVar.typeName.better)
                fragment.output("fileprivate static var _\(storedVar.name)Getter: (@convention(c) (csObject, _ exn: csOutExn) -> \(resolved.converterType.name).CType)!")
                fragment.output("fileprivate static var _\(storedVar.name)Setter: (@convention(c) (csObject, \(resolved.converterType.name).CType, _ exn: csOutExn) -> Void)!")
            }
            fragment.outputBlock("public typealias _ConstructorMethod = @convention(c) (", closeWith: ") -> csObject") {
                for storedVar in storedVariables {
                    let resolved = context.resolve(type: storedVar.typeName.better)
                    fragment.output("\(resolved.converterType.name).CType,")
                }
                fragment.output("_ exn: csOutExn")
            }
            fragment.output("fileprivate static var _constructorMethod: _ConstructorMethod!")
            fragment.blankLine()

            fragment.outputBlock("public static func peekCSharp(_ value: csObject) throws -> Self {") {
                fragment.outputBlock("Self(") {
                    for (index, storedVar) in storedVariables.enumerated() {
                        let resolved = context.resolve(type: storedVar.typeName.better)
                        let last = index == storedVariables.count - 1
                        fragment.outputBlock("\(storedVar.name): try \(resolved.converterType.name).consumeCSharp(", closeWith: last ? ")" : "),") {
                            fragment.output("try Env.check { exn in _\(storedVar.name)Getter(value, exn) }")
                        }
                    }
                }
            }
            fragment.blankLine()

            fragment.outputBlock("public static func toCSharp(_ value: Self) throws -> csObject {") {
                fragment.outputBlock("try Env.check { exn in", closeWith: "}") {
                    fragment.outputBlock("_constructorMethod(") {
                        for storedVar in storedVariables {
                            let resolved = context.resolve(type: storedVar.typeName.better)
                            fragment.output("try \(resolved.converterType.name).toCSharp(value.\(storedVar.name)),")
                        }
                        fragment.output("exn")
                    }
                }
            }
            fragment.blankLine()

            fragment.outputBlock("public static func mutateCSharp<R>(_ this: csObject, body: (inout Self) throws -> R) throws -> R {") {
                fragment.output("var mutatingSelf = try peekCSharp(this)")
                fragment.output("let result = try body(&mutatingSelf)")
                for storedVar in storedVariables {
                    let resolved = context.resolve(type: storedVar.typeName.better)
                    fragment.outputBlock("try Env.check { exn in _\(storedVar.name)Setter(", closeWith: ")}") {
                        fragment.output("this,")
                        fragment.output("try \(resolved.converterType.name).toCSharp(mutatingSelf.\(storedVar.name)),")
                        fragment.output("exn")
                    }
                }
                fragment.output("return result")
            }
        }

        let fieldsAndMethods =
            computedVariables.compactMap { context.cSharp(field: $0, of: self, useNativeName: false) } +
            methods.compactMap { context.cSharp(method: $0, of: self) }

        context.cSharpClasses.append(
            CSharpProductClass(
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

        return fragment
    }
}

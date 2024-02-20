import SourceryRuntime

struct TranslatedProtocol: TranslatedType {
    let sourceType: BetterType
    let converterType: BetterType
    var neutralName: String
    let nodeName: String
    let kotlinPackage: String?
    let kotlinName: String
    let jniType: JNIType
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let definingModule: Module
    let definingTSNamespace: String?
    let isInhabited: Bool
    var containedNamedTypes: [TranslatedType] { [self] }
    let conformances: Set<String>
    let methods: [Method]
    let computedVariables: [Variable]
    let documentation: [String]
    let className: String
    let externalWitnessClassName: String

    init(context: FishyJoesContext, type: SourceryProtocol) {
        guard let exportAnnotation = type.exportAnnotation else {
            fatalErr("type not annotated for export")
        }
        let typeName = exportAnnotation.name

        self.sourceType = BetterType(named: type, context: context)
//        self.converterType = .named(.init(name: "\(sourceType.namespace.joined())._\(sourceType.nonNamespacedName)Converter", module: nil))
        self.converterType = .named(.init(name: "_\(sourceType.nonNamespacedName)Converter", module: nil))
        self.neutralName = "Struct<Named=\(exportAnnotation.name)>"
        self.nodeName = typeName
        self.kotlinPackage = context.module.kotlinPackage
        self.kotlinName = typeName

        self.jniType = .object(context.kotlinTranslator.javaClassName(nodeName, in: context))
        self.cSharpType = .named(package: context.module.cSharpNamespace, name: exportAnnotation.cSharpName)
        self.dartType = .named(package: context.module.dartNamespace, name: context.dartTranslator.fakeNamespace(exportAnnotation.name))

        self.definingModule = context.module
        self.definingTSNamespace = context.module.name
        self.isInhabited = type.isInhabited

        self.conformances = exportAnnotation.conformances
//        var methods = type.methods.compactMap { Method($0) }
//        for method in type.rawMethods {
//            guard let ext = method.definedInType, ext.isExtension else { continue }
//            // TODO: check that ext doesn't have too many "where" requirements. Is this possible with Sourcery?
//            if let index = methods.firstIndex(where: { $0.name == method.name }) {
//                methods[index].implemented = true
//            }
//        }
//        self.methods = methods
        let methodsToConvert = type.methodsPreferringImplemented()
        self.methods = methodsToConvert.compactMap { Method($0, isProtocolDef: true) }

        self.computedVariables = type.variables.filter { $0.exportAnnotation != nil }
        self.documentation = type.documentation
        self.className = context.kotlinTranslator.javaClassName(kotlinName, in: context)
        self.externalWitnessClassName = context.kotlinTranslator.javaClassName("_ExternalWitness_\(kotlinName)", in: context)
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        return [
            commonDefinitionFragment(in: context),
            nodeDefinitionFragment(in: context),
        ] + jniDefinitionFragments(in: context)
    }

    func commonDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "CommonInterface/\(converterType.name).swift",
            additionalImports: ["Foundation", "FishyJoesCommonRuntime"]
        )

        fragment.outputBlock("public enum \(converterType.name): Converter {") {
            fragment.output("public typealias SwiftType = \(sourceType.name)")
        }

        return fragment
    }

    func nodeDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "NodeInterface/\(sourceType.name)+node.swift",
            additionalImports: ["Foundation", "FishyJoesNodeRuntime"]
        )
        return fragment
    }

    func jniDefinitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        let fragment = context.swiftFragment(
            "JavaInterface/\(sourceType.nonNamespacedName)+java.swift",
            additionalImports: ["Foundation", "FishyJoesJavaRuntime", "CommonInterface"]
        )

        let foreignProtocolType = "_Java\(sourceType.nonNamespacedName)"

        var methodIDs: [(idHandle: String, name: String, signature: String)] = []
        let defaultMethods = methods.filter { $0.implemented }
        let normalMethods = methods.filter { !$0.implemented }

        fragment.outputBlock("struct \(foreignProtocolType): \(sourceType.nonNamespacedName) {") {
            fragment.output("let _javaWitness: JavaReference")
            let hasStaticMethods = methods.contains(where: { $0.isStatic })
            let hasStaticVariables = computedVariables.contains(where: { $0.isStatic })
            if hasStaticMethods || hasStaticVariables {
                fragment.output("static let _javaWitness: JavaReference = { _javaWitness }()")
            }

            for variable in computedVariables {
                fragment.output()
                let name = variable.name
                let type = variable.typeName.better.name
                let resolved = context.resolve(type: variable.typeName.better)
                let getID = "_\(name)GetMethodID"
                let setID = variable.isMutable ? "_\(name)SetMethodID" : nil
                methodIDs.append((idHandle: getID, name: "get_\(name)", signature: "()\(resolved.jniType.asSignature)"))
                fragment.output("static var \(getID): jmethodID?")
                if let setID = setID {
                    methodIDs.append((idHandle: setID, name: "set_\(name)", signature: "(\(resolved.jniType.asSignature))V"))
                    fragment.output("static var \(setID): jmethodID?")
                }
                fragment.outputBlock("\(variable.isStatic ? "static " : "")public var \(name): \(type) {") {
                    func gnr8GetterCode(fragment: SourceFragment) {
                        fragment.output("let env = try! _javaWitness.currentThreadEnv()")
                        fragment.outputBlock("return try! \(resolved.converterType.name).fromJava(") {
                            fragment.output("env.Call\(resolved.jniType.valueType)Method(_javaWitness.object, Self.\(getID)),")
                            fragment.output("env: env")
                        }
                    }
                    if variable.isMutable {
                        fragment.outputBlock("get {") {
                            gnr8GetterCode(fragment: fragment)
                        }
                    } else {
                        gnr8GetterCode(fragment: fragment)
                    }
                    if variable.isMutable {
                        fragment.outputBlock("set {") {
                            fragment.output("let env = try! _javaWitness.currentThreadEnv()")
                            fragment.output("let javaNewValue = try! \(resolved.converterType.name).toJava(newValue, env: env)")
                            fragment.output("try! env.CallVoidMethod(_javaWitness.object, Self._\(name)SetMethodID, jvalue(javaNewValue))")
                        }
                    }
                }
            }
            for method in methods {
                fragment.output()
                let resolvedReturn = context.resolve(type: method.returnType)
                var returnSignature = "\(method.isThrowing ? " throws" : "")"
                if method.returnType.name != "Void" {
                    returnSignature.append(" -> \(method.returnType.name)")
                }
                fragment.output("static var _\(method.callName)MethodID: jmethodID?")
                if method.implemented {
                    fragment.output("\(method.isStatic ? "static " : "")public var \(method.callName)Impl: (\(method.swiftClosureSignature()))?")
                }
                var paramSigs = [String]()
                do {
                    var unnamedParamCnt = 1
                    for param in method.parameters {
                        var paramName = param.name
                        if paramName.isEmpty {
                            paramName = "_ _\(unnamedParamCnt)"
                            unnamedParamCnt += 1
                        }
                        paramSigs.append("\(paramName): \(param.type.name)")
                    }
                }
                fragment.outputBlock("\(method.isStatic ? "static " : "")public func \(method.callName)(\(paramSigs.joined(separator: ", ")))\(returnSignature) {") {
                    if method.implemented {
                        fragment.output("guard let \(method.callName)Impl = \(method.callName)Impl else", newLineTerminated: false)
                        fragment.outputBlock(" {", closeWith: "}") {
                            let methodCallStr = "\(method.callName)(\(method.parameters.map { "\($0.name): \($0.name)" }.joined(separator: ", ")))"
                            fragment.output("return \(foreignProtocolType)_sans_\(method.callName)(wrapped: self).\(methodCallStr)")
                        }
                        fragment.output("return \(method.callName)Impl(\(method.parameters.map { $0.name }.joined(separator: ", ")))")
                    } else {
                        fragment.output("let env = try! _javaWitness.currentThreadEnv()")
                        fragment.outputBlock("return try! \(resolvedReturn.converterType.name).fromJava(") {
                            fragment.outputBlock("env.Call\(resolvedReturn.jniType.valueType)Method(", closeWith: "),") {
                                fragment.output("_javaWitness.object,")
                                fragment.output("Self._\(method.callName)MethodID", newLineTerminated: false)
                                var unnamedParamCnt = 1
                                for param in method.parameters {
                                    var name = param.name
                                    if name.isEmpty {
                                        name = "_\(unnamedParamCnt)"
                                        unnamedParamCnt += 1
                                    }
                                    fragment.output(",")
                                    let resolved = context.resolve(type: param.type)
                                    fragment.output("jvalue(try \(resolved.converterType.name).toJava(\(name), env: env))", newLineTerminated: false)
                                }
                                fragment.output()
                            }
                            fragment.output("env: env")
                        }
                    }
                }
            }
        }

        fragment.output()

        for defaultMethod in defaultMethods {
            fragment.outputBlock("struct \(foreignProtocolType)_sans_\(defaultMethod.callName): \(sourceType.nonNamespacedName) {", closeWith: "}") {
                fragment.output("var wrapped: \(sourceType.nonNamespacedName)")

                for variable in computedVariables {
                    fragment.output()
                    let name = variable.name
                    let type = variable.typeName.better.name
                    let resolved = context.resolve(type: variable.typeName.better)
                    fragment.outputBlock("public var \(name): \(type) {") {
                        fragment.outputBlock("get {") {
                            fragment.output("wrapped.\(name)")
                        }
                        fragment.outputBlock("set {") {
                            fragment.output("wrapped.\(name) = newValue")
                        }
                    }
                }
                for method in methods {
                    guard method.name != defaultMethod.name else {
                        continue
                    }
                    fragment.output()
                    let returnSignature = "\(method.isThrowing ? " throws" : "") -> \(method.returnType.name)"
                    fragment.outputBlock("public func \(method.name)\(returnSignature) {", closeWith: "}") {
                        fragment.output("wrapped.\(method.callName)(\(method.parameters.map { "\($0.name): \($0.name)" }.joined(separator: ", ")))")
                    }
                }
            }
            fragment.output()
        }

        fragment.outputBlock("extension \(converterType.name): JavaMutator {") {
            fragment.output("public typealias CType = jobject?")

            fragment.output("public static var javaClass: jclass?")
            fragment.output("public static var externalWitnessClass: jclass?")

            fragment.output("public static var externalWitnessConstructor: jmethodID?")

            if !defaultMethods.isEmpty {
                fragment.output("public static var externalCompanionClass: jclass?")
            }

            fragment.outputBlock("public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {") {
                fragment.outputBlock("if env.IsInstanceOf(value, AnyBox.javaClass) {") {
                    fragment.output("return try Box<SwiftType>.fromJava(value, env: env).value")
                }
                fragment.output("return \(foreignProtocolType)(_javaWitness: try JavaReference(local: value, env: env))")
            }

            fragment.outputBlock("public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {") {
                fragment.outputBlock("try env.NewObject(") {
                    fragment.output("externalWitnessClass,")
                    fragment.output("externalWitnessConstructor,")
                    fragment.output("jvalue(j: jlong(UInt(bitPattern: Box(value).retainedOpaque())))")
                }
            }

            fragment.outputBlock("public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout SwiftType) throws -> R) throws -> R {") {
                fragment.output("try body(&Box<SwiftType>.fromJava(this, env: env).value)")
            }

            fragment.outputBlock("public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout SwiftType, inout Env) async throws -> R) async throws -> R {") {
                fragment.output("try await body(&Box<SwiftType>.fromJava(this, env: env).value, &env)")
            }

            fragment.outputBlock("public static func javaSetup(env: Env) throws {") {
                fragment.output("javaClass = try env.globalRef(env.FindClass(\"\(className)\"))")
                fragment.output("externalWitnessClass = try env.globalRef(env.FindClass(\"\(externalWitnessClassName)\"))")
                fragment.output("externalWitnessConstructor = try env.GetMethodID(externalWitnessClass, \"<init>\", \"(J)V\")")
                for computedVar in computedVariables {
                    let resolved = context.resolve(type: computedVar.typeName.better)
                    let jniSignature = resolved.jniType.asSignature
                    fragment.output("\(foreignProtocolType)._\(computedVar.name)GetMethodID = try env.GetMethodID(javaClass, \"get\(computedVar.name.capitalized)\", \"()\(jniSignature)\")")
                    if computedVar.isMutable {
                        fragment.output("\(foreignProtocolType)._\(computedVar.name)SetMethodID = try env.GetMethodID(javaClass, \"set\(computedVar.name.capitalized)\", \"(\(jniSignature))V\")")
                    }
                }
                for normalMethod in normalMethods {
                    let jniSignature = normalMethod.jniSignature(context: context)
                    fragment.output("\(foreignProtocolType)._\(normalMethod.callName)MethodID = try env.GetMethodID(javaClass, \"\(normalMethod.callName)\", \"\(jniSignature)\")")
                }
                if !defaultMethods.isEmpty {
                    fragment.output("externalCompanionClass = try env.globalRef(env.FindClass(\"\(className)$Companion\"))")
                    for defaultMethod in defaultMethods {
                        let jniSignature = defaultMethod.jniSignature(context: context)
                        fragment.output("\(foreignProtocolType)._\(defaultMethod.callName)MethodID = try env.GetMethodID(javaClass, \"\(defaultMethod.callName)\", \"\(jniSignature)\")")
                    }
                }
            }
        }

        context.add(
            kotlinClass: KotlinInterface(
                module: context.module,
                documentation: documentation,
                name: kotlinName,
                fieldsAndMethods:
                    computedVariables.compactMap { context.kotlin(field: $0, useNativeName: false) } +
                    methods.flatMap { method -> [KotlinClass.MethodOrVariable] in
                        guard let kotlinMethodOrVariable = context.kotlin(method: method) else { return [] }

                        guard !method.isStatic, method.implemented, case .method(var kotlinMethod) = kotlinMethodOrVariable else {
                            return [kotlinMethodOrVariable]
                        }

                        var defaultMethod = kotlinMethod
                        defaultMethod.name = "_default_\(defaultMethod.name)"
                        defaultMethod.parameters.insert((nil, "self", .named(package: nil, name: kotlinName), nil), at: 0)
                        defaultMethod.isStatic = true

                        var parameters = ["this"]
                        parameters.append(contentsOf: kotlinMethod.parameters.map(\.name))
                        kotlinMethod.body = "__jni_\(defaultMethod.name)(\(parameters.joined(separator: ", ")))"

                        return [.method(kotlinMethod), .method(defaultMethod)]
                    }
            ).conforming(to: conformances, context: context)
        )

        context.add(
            kotlinClass: KotlinProductClass(
                module: context.module,
                isPrivate: true,
                documentation: [],
                name: "_ExternalWitness_\(kotlinName)",
                constructor: .reference,
                fieldsAndMethods: {
                    let nonDefaultMethods = methods.filter { !$0.implemented }
                    var fAndM = computedVariables.compactMap { context.kotlin(field: $0, useNativeName: false)}
                    fAndM.append(contentsOf: nonDefaultMethods.compactMap { context.kotlin(method: $0) })
                    return fAndM
                }(),
                conformances: ["com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference)"]
            ).conforming(to: [sourceType.nonNamespacedName], context: context)
        )

        return [fragment]
    }
}

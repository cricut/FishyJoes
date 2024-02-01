import SourceryRuntime

struct TranslatedProtocol: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let neutralName: String
    var containedNamedTypes: [TranslatedType] { [self] }
    let kotlinPackage: String?
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let storedVariables: [Variable]
    let computedVariables: [Variable]
    let methods: [Method]
    let documentation: [String]
    let jniType: JNIType
    let isInhabited: Bool
    let definingModule: Module

    init(context: FishyJoesContext, type: Type) {
        guard let exportAnnotation = type.exportAnnotation else { fatalErr("export symbol not specified") }
        guard type.kind == "protocol" else { fatalErr("not a protocol") }
        let name = exportAnnotation.name

        self.sourceType = BetterType(named: type, context: context)
        self.nodeName = name
        self.kotlinName = name
        self.neutralName = "Protocol<TranslatedFrom=\(name)>"
        self.kotlinPackage = context.module.kotlinPackage
        self.cSharpType = .named(package: context.module.cSharpNamespace, name: exportAnnotation.cSharpName)
        self.dartType = .named(package: context.module.dartNamespace, name: context.dartTranslator.fakeNamespace(name))
        self.jniType = .object(context.kotlinTranslator.javaClassName(nodeName, in: context))

        self.storedVariables = type.storedVariables
        self.computedVariables =
            (type.computedVariables + type.staticVariables).filter { $0.exportAnnotation != nil }

        self.methods = type.methods.compactMap { Method($0, isProtocolMethod: true) }
        self.documentation = type.documentation
        self.isInhabited = type.isInhabited
        self.definingModule = context.module
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        return [
            nodeDefinitionFragment(in: context),
            jniDefinitionFragment(in: context),
            iotaDefinitionFragment(in: context),
        ] + neutralDefinitionFragments(in: context)
    }

    func neutralDefinitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        guard context.dumpDebugRepresentation else { return [] }

        let fragment = SourceFragment(
            sourceryDestination: "file:../../DebugGenerated/\(sourceType.name)+ProtocolInfo.txt"
        )
        fragment.outputBlock("TranslatedProtocol for \(sourceType.name) {") {
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
            "NodeInterface/\(sourceType.name)+node.swift",
            additionalImports: ["Foundation", "FishyJoesNodeRuntime"]
        )
        fragment.fixForEmptyProtocols()
        return fragment
    }

    func jniDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "JavaInterface/\(sourceType.name)+java.swift",
            additionalImports: ["Foundation", "FishyJoesJavaRuntime"]
        )
        fragment.fixForEmptyProtocols()
        return fragment
    }

    func cSharpSetupDelegates(in context: FishyJoesContext) -> [String] {
        var lines: [String] = []
        lines.append("delegate \(cSharpType.pInvokeCreatedName) _\(converterType.genericBaseName.mangledName)Constructor(")
        for storedVar in storedVariables {
            let resolved = context.resolve(type: storedVar.typeName.better)
            lines.append("    \(resolved.cSharpType.pInvokeConsumedName) \(CSharpClass.deforbidify(storedVar.name)),")
        }
        lines.append("    out CreatedRef exn")
        lines.append(");")
        for storedVar in storedVariables {
            let resolved = context.resolve(type: storedVar.typeName.better)
            let commonName = "_\(converterType.genericBaseName.mangledName)_\(storedVar.name)"
            lines.append("delegate \(resolved.cSharpType.pInvokeCreatedName) \(commonName)Getter(\(cSharpType.pInvokeUnownedName) obj, out CreatedRef exn);")
            if storedVar.isMutable {
                lines.append("delegate void \(commonName)Setter(\(cSharpType.pInvokeUnownedName) obj, \(resolved.cSharpType.pInvokeConsumedName) newValue, out CreatedRef exn);")
            }
        }
        return lines
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>] {
        let constructorType = "_\(converterType.genericBaseName.mangledName)Constructor"
        let constructorArgs = storedVariables.map { storedVar in
            let resolved = context.resolve(type: storedVar.typeName.better)
            return "\(resolved.cSharpType.pInvokeConsumedName) \(CSharpClass.deforbidify(storedVar.name)), "
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
        ] + storedVariables.flatMap { storedVar -> [ForeignSetupParameter] in
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
                }
            ] + (
                !storedVar.isPubliclyWritable ? [] : [
                    .value(
                        name: "set_\(storedVar.name)",
                        type: setType
                    ) { fragment in
                        fragment.outputBlock("bag<\(setType)>((\(cSharpType.pInvokeUnownedName) obj, \(resolved.cSharpType.pInvokeConsumedName) newValue, out CreatedRef exn) => Catching(out exn, () => {", closeWith: "})),") {
                            fragment.output("obj.Peek<\(cSharpType.name)>().\(CSharpClass.deforbidify(upperCaseFirst(storedVar.name))) = ", newLineTerminated: false)
                            fragment.output(resolved.cSharpType.isObject ? "newValue.Consume<\(resolved.cSharpType.name)>();" : "newValue;")
                        }
                    },
                ]
            )
        }
    }

    func dartSetupDelegates(in context: FishyJoesContext) -> [String] {
        return []
    }

    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>] {
        return []
    }

    func iotaDefinitionFragment(in context: FishyJoesContext) -> SourceFragment {
        let fragment = context.swiftFragment(
            "IotaInterface/\(sourceType.name)+iota-type.swift",
            additionalImports: ["Foundation", "FishyJoesIotaRuntime"]
        )

        registerCSharpClass(context: context)
        registerDartClass(context: context)
        
        fragment.fixForEmptyProtocols()

        return fragment
    }

    func registerCSharpClass(context: FishyJoesContext) {
        let fieldsAndMethods =
            computedVariables.compactMap { context.cSharp(field: $0, of: self, useNativeName: false) } +
            methods.compactMap { context.cSharp(method: $0, of: self) }

        context.add(
            cSharpClass: CSharpProductClass(
                module: context.module,
                documentation: documentation,
                name: cSharpType.name,
                constructor: .`public`(
                    fields: storedVariables.compactMap {
                        switch context.cSharp(field: $0, of: self, useNativeName: false) {
                        case .method: fatalErr("Can't export a stored variable `\(self.sourceType.name).\($0.name)` as a method")
                        case .variable(let field): return field
                        case nil: return nil
                        }
                    }
                ),
                fieldsAndMethods: fieldsAndMethods
            )
        )
    }

    func registerDartClass(context: FishyJoesContext) {
        let fieldsAndMethods =
            computedVariables.compactMap { context.dart(field: $0, of: self, useNativeName: false) } +
            storedVariables.compactMap { context.dart(field: $0, of: self, useNativeName: false) } +
            methods.compactMap { context.dart(method: $0, of: self) }

        context.add(
            dartClass: DartProtocolClass(
                module: context.module,
                documentation: documentation,
                name: dartType.name(),
                constructor: .`public`(
                    fields: storedVariables.compactMap {
                        switch context.dart(field: $0, of: self, useNativeName: false) {
                        case .method:
                            fatalErr("Can't export a stored variable `\(self.sourceType.name).\($0.name)` as a method")
                        case .variable(let field):
                            return field
                        case nil:
                            return nil
                        }
                    }
                ),
                fieldsAndMethods: fieldsAndMethods
            )
        )
    }
}

fileprivate extension SourceFragment {
    func fixForEmptyProtocols() {
        if stringBuilder.isEmpty {
            output("// This definition is empty. Comment's purpose is to avoid swiftlint errors for empty protocols i.e. protocols that have only static methods and/or static properties will be empty for Dart for example, even though Swift supports them.")
        }
    }
}

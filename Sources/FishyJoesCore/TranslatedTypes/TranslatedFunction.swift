import SourceryRuntime

struct TranslatedFunction: TranslatedType {
    let parameters: [TranslatedType]
    let returnType: TranslatedType
    let isAsync: Bool

    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String? = nil
    let jniType: JNIType
    let dartType: DartClass.DartType
    let definingModule = Module.runtime

    init(parameters: [TranslatedType], returnType: TranslatedType, isAsync: Bool, isThrowing: Bool, isEscaping: Bool) {
        self.parameters = parameters
        self.returnType = returnType
        self.isAsync = isAsync

        self.sourceType = .function(
            parameters.map(\.sourceType), returnType.sourceType,
            isAsync: isAsync,
            isThrowing: isThrowing,
            isEscaping: isEscaping
        )
        self.neutralName = "Function<ReturnType=\(returnType.neutralName), Params=[\(parameters.map { $0.neutralName }.joined(separator: ", "))]>"
        self.nodeName = "(\(parameters.enumerated().map { "_\($0.offset): \($0.element.nodeType)" }.joined(separator: ", "))) => \(isAsync ? "Promise<" : "")\(returnType.nodeType)\(isAsync ? ">" : "")"
        let kotlinArgs = parameters.map(\.kotlinPackageQualifiedName).joined(separator: ", ")
        self.kotlinName = "(\(isAsync ? "suspend " : "")(\(kotlinArgs)) -> \(returnType.kotlinPackageQualifiedName))"
        self.containedNamedTypes = parameters.map { $0.containedNamedTypes }.joined() + returnType.containedNamedTypes
        self.jniType = .object("kotlin/jvm/functions/Function\(parameters.count + (isAsync ? 1 : 0))")
        self.dartType = .function(
            args: parameters.map(\.dartType),
            return: isAsync ? .future(returnType.dartType) : returnType.dartType
        )
    }

    var cSharpType: CSharpClass.CSType {
        if isAsync {
            return translatedFutureFunction.cSharpType
        } else if returnType.sourceType == .void {
            return .named(
                package: "System",
                name: "Action" + (parameters.isEmpty ? "" : "<\(parameters.map(\.cSharpType.name).joined(separator: ", "))>")
            )
        } else {
            return .named(
                package: "System",
                name: "Func<\((parameters.map(\.cSharpType.name) + [returnType.cSharpType.name]).joined(separator: ", "))>"
            )
        }
    }

    var converterType: BetterType {
        .generic(
            base: .runtime("\(isAsync ? "Async" : "")Function\(parameters.count)Converter"),
            args: (parameters + [returnType]).map(\.converterType)
        )
    }

    var translatedFutureReturn: TranslatedType {
        TranslatedFuture(output: returnType)
    }

    var translatedFutureFunction: TranslatedType {
        if isAsync {
            return TranslatedFunction(
                parameters: parameters,
                returnType: translatedFutureReturn,
                isAsync: false,
                isThrowing: false,
                isEscaping: false
            )
        } else {
            return self
        }
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        // Since async functions depend on some converter types not present in the source, ensure they're properly registered and set up.
        context.addToTypeCache(translatedFutureReturn)
        context.addToTypeCache(translatedFutureFunction)
        return []
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>] {
        if isAsync {
            // All of the async setup is done in the translatedFutureFunction's setup
            return []
        }
        return (
            returnType.sourceType == .void ? [] : [
                .type(typeValue: returnType.cSharpType.name),
            ]
        ) + parameters.map { param in
            .type(typeValue: param.cSharpType.name)
        } + [
            .value(name: "typeName", type: "string") { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }

    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>] {
        if isAsync {
            // All of the async setup is done in the translatedFutureFunction's setup
            return []
        }
        return [
            .type(typeValue: returnType.dartType)
        ] + parameters.map { param in
            .type(typeValue: param.dartType)
        } + [
            .value(name: "typeName", type: .string) { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }
}

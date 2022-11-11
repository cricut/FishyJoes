import SourceryRuntime

struct TranslatedFunction: TranslatedType {
    let parameters: [TranslatedType]
    let returnType: TranslatedType

    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let cppName: String
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String? = nil
    let jniType: JNIType
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let definingModule = Module.runtime

    init(parameters: [TranslatedType], returnType: TranslatedType) {
        self.parameters = parameters
        self.returnType = returnType

        self.sourceType = .function(parameters.map(\.sourceType), returnType.sourceType)
        self.neutralName = "Function<ReturnType=\(returnType.neutralName), Params=[\(parameters.map { $0.neutralName }.joined(separator: ", "))]>"
        self.nodeName = "(\(parameters.enumerated().map { "_\($0.offset): \($0.element.nodeName)" }.joined(separator: ", "))) => \(returnType.nodeName)"
        self.kotlinName = "((\(parameters.map(\.kotlinName).joined(separator: ", "))) -> \(returnType.kotlinName))"
        self.cppName = "std::function<\(returnType.cppName)(\(parameters.map(\.cppName).joined(separator: ", "))>"
        self.containedNamedTypes = parameters.map { $0.containedNamedTypes }.joined() + returnType.containedNamedTypes
        self.jniType = .object("kotlin/jvm/functions/Function\(parameters.count)")
        self.dartType = .function(args: parameters.map(\.dartType), return: returnType.dartType)
        if returnType.sourceType == .void {
            self.cSharpType = .named(
                package: "System",
                name: "Action<\(parameters.map(\.cSharpType.name).joined(separator: ", "))>"
            )
        } else {
            self.cSharpType = .named(
                package: "System",
                name: "Func<\((parameters.map(\.cSharpType.name) + [returnType.cSharpType.name]).joined(separator: ", "))>"
            )
        }
    }

    var converterType: BetterType {
        .generic(
            base: .init(stringLiteral: "Function\(parameters.count)Converter"),
            args: (parameters + [returnType]).map(\.converterType)
        )
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter] {
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
}

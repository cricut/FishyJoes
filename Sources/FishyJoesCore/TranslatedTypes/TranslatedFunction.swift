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

    init(parameters: [TranslatedType], returnType: TranslatedType) {
        self.parameters = parameters
        self.returnType = returnType

        self.sourceType = .function(parameters.map(\.sourceType), returnType.sourceType)
        self.neutralName = "Function<ReturnType=\(returnType.neutralName), Params=[\(parameters.map { $0.neutralName }.joined(separator: ", "))]>"
        self.nodeName = "(\(parameters.map { "_: \($0.nodeName)" }.joined(separator: ", "))) => \(returnType.nodeName)"
        self.kotlinName = "(\(parameters.map(\.kotlinName).joined(separator: ", "))) -> \(returnType.kotlinName)"
        self.cppName = "std::function<\(returnType.cppName)(\(parameters.map(\.cppName).joined(separator: ", "))>"
        self.containedNamedTypes = parameters.map { $0.containedNamedTypes }.joined() + returnType.containedNamedTypes
        self.jniType = .object("kotlin/jvm/functions/Function\(parameters.count)")
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

    var cSharpSetupParameters: [CSharpSetupParameter] { [] }
}

import SourceryRuntime

struct TranslatedFunction: TranslatedType {
    let parameters: [TranslatedType]
    let returnType: TranslatedType

    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let kotlinPackage: String? = nil
    let jniType: JNIType
    let cSharpName: String
    let cSharpNamespace: String? = nil

    init(parameters: [TranslatedType], returnType: TranslatedType) {
        self.parameters = parameters
        self.returnType = returnType

        self.sourceType = .function(parameters.map(\.sourceType), returnType.sourceType)
        self.nodeName = "(\(parameters.map { "_: \($0.nodeName)" }.joined(separator: ", "))) => \(returnType.nodeName)"
        self.kotlinName = "(\(parameters.map(\.kotlinName).joined(separator: ", "))) -> \(returnType.kotlinName)"
        self.jniType = .object("kotlin/jvm/functions/Function\(parameters.count)")
        #warning("TODO C# Function Translation")
        self.cSharpName = ""
    }

    var converterType: BetterType {
        .generic(
            base: .init(stringLiteral: "Function\(parameters.count)Converter"),
            args: (parameters + [returnType]).map(\.converterType)
        )
    }

}

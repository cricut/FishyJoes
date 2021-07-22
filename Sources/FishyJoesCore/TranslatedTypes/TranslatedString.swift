import SourceryRuntime

struct TranslatedString: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Swift.String"))
    let nodeName = "string"
    let globalName = "Swift.String"
}

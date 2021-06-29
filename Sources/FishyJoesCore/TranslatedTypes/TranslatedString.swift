import SourceryRuntime

struct TranslatedString: TranslatedType {
    let sourceType = BetterType.unknown("String")
    let cName = "const char * _Nonnull"
    let nodeName = "string"
    let globalName = "Swift.String"
    let globalCName = "Swift.UnsafePointer<CChar>"
    // TODO: memory leak
    let asCAccessor = ".withCString({ $0 })"

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] { [] }

    func wrapAsSwift(expression: String) -> String {
        "String(cString: \(expression))"
    }
}

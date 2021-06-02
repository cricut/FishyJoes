import SourceryRuntime

struct TranslatedPrimitive: TranslatedType {
    let sourceType: BetterType
    let cName: String
    let nodeName: String
    let globalName: String
    let globalCName: String
    let asSwiftAccessor: String
    let asCAccessor: String
    let asNodeAccessor: String

    init(swift swiftName: String, c cName: String, node nodeName: String? = nil) {
        self.sourceType = .unknown(swiftName)
        self.cName = cName
        self.nodeName = nodeName ?? cName
        self.globalName = "Swift.\(swiftName)"
        self.globalCName = globalName
        self.asSwiftAccessor = ""
        self.asCAccessor = ""
        self.asNodeAccessor = "fatalError()"
    }

    func definitionFragments(in context: CDeclareContext) -> [SourceFragment] { [] }
}

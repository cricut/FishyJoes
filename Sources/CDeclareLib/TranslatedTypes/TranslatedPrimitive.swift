import SourceryRuntime

struct TranslatedPrimitive: TranslatedType {
    let sourceType: BetterType
    let cName: String
    let globalName: String
    let globalCName: String
    let asSwiftAccessor: String
    let asCAccessor: String
    let asNodeAccessor: String

    init(swift swiftName: String, c cName: String) {
        self.sourceType = .unknown(swiftName)
        self.cName = cName
        self.globalName = "Swift.\(swiftName)"
        self.globalCName = globalName
        self.asSwiftAccessor = ""
        self.asCAccessor = ""
        self.asNodeAccessor = "fatalError()"
    }

    func definitionFragments(in context: CDeclareContext) -> [SourceFragment] { [] }
}

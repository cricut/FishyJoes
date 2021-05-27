import SourceryRuntime

struct TranslatedArray: TranslatedType {
    let sourceType: BetterType
    let cName: String
    let globalName: String
    let globalCName: String
    let asSwiftAccessor: String
    var asCAccessor: String { "" }
    var asNodeAccessor: String { ".fatalError()" }
    let cForwardDeclaration: String?

    init(element: TranslatedType) {
        self.sourceType = .array(element.sourceType)
        self.cName = "\(element.cName) * _Nonnull"
        self.globalName = "Swift.UnsafeMutablePointer<\(element.globalName)>"
        self.globalCName = "Swift.UnsafeMutablePointer<\(element.globalCName)>"
        self.asSwiftAccessor = ".pointee\(element.asSwiftAccessor)"
        self.cForwardDeclaration = element.cForwardDeclaration
    }

    func definitionFragments(in context: CDeclareContext) -> [SourceFragment] { [] }
}

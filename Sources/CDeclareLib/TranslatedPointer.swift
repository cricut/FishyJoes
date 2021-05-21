import SourceryRuntime

struct TranslatedPointer: TranslatedType {
    let pointee: TranslatedType

    let sourceType: BetterType
    let cName: String
    let globalName: String
    let globalCName: String
    var asCAccessor: String { fatalErr("unimplemented") }
    let cForwardDeclaration: String?

    init(pointee: TranslatedType) {
        self.pointee = pointee

        self.sourceType = .unsafeMutablePointer(pointee.sourceType)
        self.cName = "\(pointee.cName) *"
        self.globalName = "Swift.UnsafeMutablePointer<\(pointee.globalName)>"
        self.globalCName = "Swift.UnsafeMutablePointer<\(pointee.globalCName)>"
        self.cForwardDeclaration = pointee.cForwardDeclaration
    }

    func wrapAsSwift(expression: String) -> String {
        pointee.wrapAsSwift(expression: "\(expression).pointee")
    }

    func definitionFragments(in context: CDeclareContext) -> [SourceFragment] { [] }
}

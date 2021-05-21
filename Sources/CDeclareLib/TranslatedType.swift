import SourceryRuntime

protocol TranslatedType {
    var sourceType: BetterType { get }
    var cName: String { get }
    var globalName: String { get }
    var globalCName: String { get }
    var asSwiftAccessor: String { get }
    var asCAccessor: String { get }
    var cForwardDeclaration: String? { get }

    func definitionFragments(in context: CDeclareContext) -> [SourceFragment]
    func asFormals(label: String, name: String) -> (formals: [String], expression: String)
    func wrapAsSwift(expression: String) -> String
}

extension TranslatedType {
    var cForwardDeclaration: String? { nil }
    var asSwiftAccessor: String { fatalErr("asSwiftAccessor not implemented for \(Self.self)") }

    func asFormals(label: String, name: String) -> (formals: [String], expression: String) {
        let formalLabel = label == name ? "" : "\(label) "
        return (
            formals: ["\(formalLabel)\(name): \(globalCName)"],
            expression: wrapAsSwift(expression: name)
        )
    }

    func wrapAsSwift(expression: String) -> String {
        "\(expression)\(asSwiftAccessor)"
    }
}

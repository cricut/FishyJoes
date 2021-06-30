import SourceryRuntime

protocol TranslatedType {
    /// The original type from the exporting library
    var sourceType: BetterType { get }

    /// The name of the translated type as referred to by C
    var cName: String { get }

    /// The name of the translated type as referred to by node
    var nodeName: String { get }

    /// The name of the type swift sees when importing cName. e.g. CTypes.SomeStruct
    var globalCName: String { get }

    var asSwiftAccessor: String { get }
    var asCAccessor: String { get }
    var cForwardDeclaration: String? { get }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment]
    func asFormals(label: String, name: String) -> (formals: [CFacingFormal], expression: String)
    func wrapAsSwift(expression: String) -> String
}

extension TranslatedType {
    var cForwardDeclaration: String? { nil }
    var asSwiftAccessor: String { fatalErr("asSwiftAccessor not implemented for \(Self.self)") }

    func asFormals(label: String, name: String) -> (formals: [CFacingFormal], expression: String) {
        return (
            formals: [CFacingFormal(label: label, name: name, cType: globalCName)],
            expression: wrapAsSwift(expression: name)
        )
    }

    func wrapAsSwift(expression: String) -> String {
        "\(expression)\(asSwiftAccessor)"
    }

    var nodeType: TypeScriptAnnotations.TSType {
        if let opt = self as? TranslatedOptional {
            return .optional(opt.wrappedType.nodeType)
        } else {
            return .unknown(nodeName)
        }
    }
}

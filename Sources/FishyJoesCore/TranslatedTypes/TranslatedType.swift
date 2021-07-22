import SourceryRuntime

protocol TranslatedType {
    var sourceType: BetterType { get }
    var nodeName: String { get }
    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment]
}

extension TranslatedType {
    var cForwardDeclaration: String? { nil }
    var asSwiftAccessor: String { fatalErr("asSwiftAccessor not implemented for \(Self.self)") }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] { [] }

    var nodeType: TypeScriptAnnotations.TSType {
        if let opt = self as? TranslatedOptional {
            return .optional(opt.wrapped.nodeType)
        } else {
            return .named(nodeName)
        }
    }
}

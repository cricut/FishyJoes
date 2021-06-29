import SourceryRuntime

struct TranslatedTuple: TranslatedType {
    struct Element {
        let label: String
        let type: TranslatedType
    }
    let elements: [Element]

    let sourceType: BetterType
    var cName: String { fatalErr("unimplemented") }
    var nodeName: String { "[\(elements.map(\.type.nodeName).joined(separator: ", "))]" }
    var globalName: String {
        "(" + elements.map {
            if $0.label.allSatisfy(\.isNumber) {
                return $0.type.globalName
            } else {
                return "\($0.label): \($0.type.globalName)"
            }
        }.joined(separator: ", ") + ")"
    }
    var globalCName: String { fatalErr("unimplemented") }
    var asSwiftAccessor: String { fatalErr("unimplemented") }
    var asCAccessor: String { fatalErr("unimplemented") }

    init(elements: [Element]) {
        self.elements = elements
        sourceType = .tuple(elements.map { .init(label: $0.label, type: $0.type.sourceType) })
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] { [] }

    func asFormals(label: String, name: String) -> (formals: [CFacingFormal], expression: String) {
        let translated = elements.map { element -> (formals: [CFacingFormal], expression: String) in
            let elementLabel = label == "_" ? "_" : "\(label)_\(element.label)"
            let elementName = "\(name)_\(element.label)"
            return element.type.asFormals(label: elementLabel, name: elementName)
        }
        return (
            formals: translated.flatMap(\.formals),
            expression: "(\(translated.map(\.expression).joined(separator: ", ")))"
        )
    }
}

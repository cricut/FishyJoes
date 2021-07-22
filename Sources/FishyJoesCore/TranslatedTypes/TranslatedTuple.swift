import SourceryRuntime

struct TranslatedTuple: TranslatedType {
    struct Element {
        let label: String
        let type: TranslatedType
    }
    let elements: [Element]

    let sourceType: BetterType
    var nodeName: String { "[\(elements.map(\.type.nodeName).joined(separator: ", "))]" }

    init(elements: [Element]) {
        self.elements = elements
        sourceType = .tuple(elements.map { .init(label: $0.label, type: $0.type.sourceType) })
    }
}

import SourceryRuntime

struct TranslatedTuple: TranslatedType {
    struct Element {
        let label: String
        let type: TranslatedType
    }
    let elements: [Element]

    var sourceProxyType: BetterType? {
        .generic(
            base: .init(stringLiteral: "Tuple\(elements.count)"),
            args: elements.map {
                $0.type.sourceProxyType ?? $0.type.sourceType
            }
        )
    }

    let sourceType: BetterType
    var nodeName: String { "[\(elements.map(\.type.nodeName).joined(separator: ", "))]" }
    var kotlinName: String {
        precondition(elements.count == 2)
        return "Pair<\(elements.map(\.type.kotlinName).joined(separator: ", "))>"
    }

    init(elements: [Element]) {
        self.elements = elements
        sourceType = .tuple(elements.map { .init(label: $0.label, type: $0.type.sourceType) })
    }

    let jniType = JNIType.object("kotlin/Pair")
}

import SourceryRuntime

struct TranslatedDictionary: TranslatedType {
    let sourceType: BetterType
    let nodeName: String

    init(key: TranslatedType, value: TranslatedType) {
        self.sourceType = .generic(base: .init(name: "Dictionary"), args: [key.sourceType, value.sourceType])
        self.nodeName = "Map<\(key.nodeName), \(value.nodeName)>"
    }
}

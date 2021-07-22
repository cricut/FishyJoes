import SourceryRuntime

struct TranslatedSet: TranslatedType {
    let sourceType: BetterType
    let nodeName: String

    init(element: TranslatedType) {
        self.sourceType = .generic(base: .init(name: "Set"), args: [element.sourceType])
        self.nodeName = "Set<\(element.nodeName)>"
    }
}

import SourceryRuntime

struct TranslatedArray: TranslatedType {
    let sourceType: BetterType
    let nodeName: String

    init(element: TranslatedType) {
        self.sourceType = .array(element.sourceType)
        self.nodeName = "\(element.nodeName)[]"
    }
}

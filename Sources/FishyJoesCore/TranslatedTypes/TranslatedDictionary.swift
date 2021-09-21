import SourceryRuntime

struct TranslatedDictionary: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let jniType = JNIType.object("java/util/Map")

    init(key: TranslatedType, value: TranslatedType) {
        self.sourceType = .generic(base: .init(name: "Dictionary"), args: [key.sourceType, value.sourceType])
        self.nodeName = "Map<\(key.nodeName), \(value.nodeName)>"
        self.kotlinName = "Map<\(key.kotlinName), \(value.kotlinName)>"
    }
}

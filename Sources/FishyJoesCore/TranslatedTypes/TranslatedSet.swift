import SourceryRuntime

struct TranslatedSet: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let jniType = JNIType.object("java/util/Set")

    init(element: TranslatedType) {
        self.sourceType = .generic(base: .init(name: "Set"), args: [element.sourceType])
        self.nodeName = "Set<\(element.nodeName)>"
        self.kotlinName = "Set<\(element.kotlinName)>"
    }
}

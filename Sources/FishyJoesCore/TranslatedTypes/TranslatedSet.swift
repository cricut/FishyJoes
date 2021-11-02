import SourceryRuntime

struct TranslatedSet: TranslatedType {
    let sourceType: BetterType
    let converterType: BetterType
    let nodeName: String
    let kotlinName: String
    let jniType = JNIType.object("java/util/Set")

    init(element: TranslatedType) {
        self.sourceType = .generic(base: "Set", args: [element.sourceType])
        self.converterType = .generic(base: "SetConverter", args: [element.converterType])
        self.nodeName = "Set<\(element.nodeName)>"
        self.kotlinName = "Set<\(element.kotlinName)>"
    }
}

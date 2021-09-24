import SourceryRuntime

struct TranslatedArray: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let jniType: JNIType

    init(element: TranslatedType) {
        self.sourceType = .array(element.sourceType)
        self.nodeName = "\(element.nodeName)[]"
        self.kotlinName = "List<\(element.kotlinName)>"
        self.jniType = .object("java/util/List")
    }
}

import SourceryRuntime

struct TranslatedArray: TranslatedType {
    let sourceType: BetterType
    let converterType: BetterType
    let nodeName: String
    let kotlinName: String
    let kotlinPackage: String? = "kotlin.collections"
    let jniType = JNIType.object("java/util/List")

    init(element: TranslatedType) {
        self.sourceType = .array(element.sourceType)
        self.converterType = .generic(base: "ArrayConverter", args: [element.converterType])
        self.nodeName = "\(element.nodeName)[]"
        self.kotlinName = "List<\(element.kotlinName)>"
    }
}

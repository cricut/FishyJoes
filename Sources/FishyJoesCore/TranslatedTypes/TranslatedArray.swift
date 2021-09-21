import SourceryRuntime

struct TranslatedArray: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let jniType: JNIType

    init(element: TranslatedType) {
        self.sourceType = .array(element.sourceType)
        self.nodeName = "\(element.nodeName)[]"
        if element.jniType.isObject {
            self.kotlinName = "Array<\(element.kotlinName)>"
        } else {
            self.kotlinName = element.jniType.valueType + "Array"
        }
        self.jniType = .array(element.jniType)
    }
}

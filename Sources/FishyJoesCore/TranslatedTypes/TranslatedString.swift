import SourceryRuntime

struct TranslatedString: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Swift.String"))
    let nodeName = "string"
    let kotlinName = "String"
    let jniType = JNIType.object("java/lang/String")
}

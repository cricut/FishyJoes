import SourceryRuntime

struct TranslatedData: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.Data"))
    let nodeName = "ArrayBuffer"
    let kotlinName = "ByteArray"
    let kotlinPackage: String? = "kotlin"
    let jniType = JNIType.array(.byte)
}

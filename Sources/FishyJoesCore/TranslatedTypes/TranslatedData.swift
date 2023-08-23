import SourceryRuntime

struct TranslatedData: TranslatedType {
    let sourceType = BetterType.named(.foundation("Data"))
    let nodeName = "ArrayBuffer"
    let kotlinName = "ByteArray"
    let neutralName = "Data"
    let containedNamedTypes: [TranslatedType] = []
    let kotlinPackage: String? = "kotlin"
    let jniType = JNIType.array(.byte)
    let cSharpType: CSharpClass.CSType = .named(package: nil, name: "byte[]")
    let definingModule = Module.runtime
}

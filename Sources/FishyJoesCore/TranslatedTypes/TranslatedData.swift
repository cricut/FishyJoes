import SourceryRuntime

struct TranslatedData: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.Data"))
    let nodeName = "ArrayBuffer"
    let kotlinName = "ByteArray"
    let neutralName = "Data"
    let containedNamedTypes: [TranslatedType] = []
    let kotlinPackage: String? = "kotlin"
    let jniType = JNIType.array(.byte)
    let cSharpType: CSharpClass.CSType = .named(package: nil, name: "byte[]")
    let definingModule = Module.runtime
}

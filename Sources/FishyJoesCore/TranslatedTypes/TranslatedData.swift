import SourceryDataModel

struct TranslatedData: TranslatedType {
    let sourceType = BetterType.named(.foundation("Data"))
    let nodeName = "ArrayBuffer"
    let kotlinName = "ByteArray"
    let containedNamedTypes: [TranslatedType] = []
    let kotlinPackage: String? = "kotlin"
    let jniType = JNIType.array(.byte)
    let cSharpType: CSharpClass.CSType = .named(package: nil, name: "byte[]")
    let dartType: DartClass.DartType = .named(package: nil, name: "typed_data.Uint8List")
    let definingModule = Module.runtime
}

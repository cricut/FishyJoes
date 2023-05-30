import SourceryRuntime

struct TranslatedData: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.Data"))
    let nodeName = "ArrayBuffer"
    let kotlinName = "ByteArray"
    let cppName = "std::vector<uint8_t>"
    let neutralName = "Data"
    let containedNamedTypes: [TranslatedType] = []
    let kotlinPackage: String? = "kotlin"
    let jniType = JNIType.array(.byte)
    let cSharpType: CSharpClass.CSType = .named(package: nil, name: "byte[]")
    let dartType: DartClass.DartType = .named(package: nil, name: "typed_data.Uint8List")
    let definingModule = Module.runtime
}

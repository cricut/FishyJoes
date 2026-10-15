import SourceryDataModel

struct TranslatedData: TranslatedType {
    let sourceType = BetterType.named(.foundation("Data"))
    let nodeName = "ArrayBuffer"
    let kotlinName = "ByteArray"
    let containedNamedTypes: [TranslatedType] = []
    let kotlinPackage: String? = "kotlin"
    let jniType = JNIType.array(.byte)
    let iotaCTypes = IotaCTypes.hostRef
    let cSharpType: CSharpClass.CSType = .named(package: nil, name: "byte[]")
    let dartType: DartClass.DartType = .named(package: nil, name: "typed_data.Uint8List")
    let pythonType: PythonClass2.PythonType = .class(module: nil, qualifiedName: "bytes")
    let definingModule = Module.runtime
}

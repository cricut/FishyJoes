import SourceryDataModel

struct TranslatedVoid: TranslatedType {
    let sourceType = BetterType.void
    let converterType = BetterType.named(.runtime("VoidConverter"))
    let nodeName = "void"
    let containedNamedTypes: [TranslatedType] = []
    let kotlinName = "Unit"
    let kotlinPackage: String? = "kotlin"
    let jniType = JNIType.void
    let iotaCTypes = IotaCTypes(created: "void", consumed: "void", unowned: "void")
    var cSharpType: CSharpClass.CSType = .unit
    var dartType: DartClass.DartType = .void
    let pythonType: PythonType = .none
    let definingModule = Module.runtime
}

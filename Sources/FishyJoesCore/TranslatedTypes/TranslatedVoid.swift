import SourceryDataModel

struct TranslatedVoid: TranslatedType {
    let sourceType = BetterType.void
    let converterType = BetterType.named(.runtime("VoidConverter"))
    let cName = "void"
    let nodeName = "void"
    let neutralName = "Void"
    let containedNamedTypes: [TranslatedType] = []
    let kotlinName = "Unit"
    let kotlinPackage: String? = "kotlin"
    let jniType = JNIType.void
    var cSharpType: CSharpClass.CSType = .unit
    var dartType: DartClass.DartType = .void
    let definingModule = Module.runtime
}

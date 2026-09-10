import SourceryDataModel

struct TranslatedVoid: TranslatedType {
    let sourceType = BetterType.void
    let converterType = BetterType.named(.runtime("VoidConverter"))
    let cName = "void"
    let nodeName = "void"
    let containedNamedTypes: [TranslatedType] = []
    let kotlinName = "Unit"
    let kotlinPackage: String? = "kotlin"
    let jniType = JNIType.void
    var cSharpType: CSharpClass.CSType = .unit
    var dartType: DartClass.DartType = .void
    let pythonType: PythonClass2.PythonType = .none
    let definingModule = Module.runtime

    func pythonRepresentation(in context: PythonTranslationContext) -> PythonRepresentation? {
        PythonRepresentation(
            annotation: PythonType(annotation: "None"),
            cType: "void",
            conversion: "_native.VOID"
        )
    }
}

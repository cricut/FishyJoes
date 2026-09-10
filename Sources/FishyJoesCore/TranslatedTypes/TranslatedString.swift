import SourceryDataModel

struct TranslatedString: TranslatedType {
    let sourceType = BetterType.named(.swift("String"))
    let nodeName = "string"
    let kotlinName = "String"
    let containedNamedTypes: [TranslatedType] = []
    let kotlinPackage: String? = "kotlin"
    let jniType = JNIType.object("java/lang/String")
    let cSharpType: CSharpClass.CSType = .named(package: nil, name: "string")
    let dartType: DartClass.DartType = .named(package: nil, name: "String")
    let pythonType: PythonClass2.PythonType = .class(module: nil, name: "str")
    let definingModule = Module.runtime

    func pythonRepresentation(in context: PythonTranslationContext) -> PythonRepresentation? {
        PythonRepresentation(
            annotation: PythonType(annotation: "str"),
            cType: "HostObject",
            conversion: "_native.STRING"
        )
    }
}

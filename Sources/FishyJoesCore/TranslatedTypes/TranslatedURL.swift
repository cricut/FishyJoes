import SourceryDataModel

struct TranslatedURL: TranslatedType {
    let sourceType = BetterType.named(.foundation("URL"))
    let nodeName = "URL"
    let kotlinPackage: String? = "java.net"
    let kotlinName = "URI"
    let jniType = JNIType.object("java/net/URI")
    let cSharpType: CSharpClass.CSType = .named(package: "System", name: "Uri")
    let dartType: DartClass.DartType = .named(package: nil, name: "Uri")
    let containedNamedTypes: [TranslatedType] = []
    let definingModule = Module.runtime

    func pythonRepresentation(in context: PythonTranslationContext) -> PythonRepresentation? {
        // The Python annotation for a URL is `str` (matching the old switch).
        PythonRepresentation(
            annotation: PythonType(annotation: "str"),
            cType: "HostObject",
            conversion: "_native.URL"
        )
    }
}

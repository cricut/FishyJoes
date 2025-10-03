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
}

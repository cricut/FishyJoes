import SourceryDataModel

struct TranslatedURL: TranslatedType {
    let sourceType = BetterType.named(.foundation("URL"))
    let neutralName = "URL"
    let nodeName = "URL"
    let kotlinPackage: String? = "java.net"
    let kotlinName = "URL"
    let jniType = JNIType.object("java/net/URL")
    let cSharpType: CSharpClass.CSType = .named(package: "System", name: "Uri")
    let dartType: DartClass.DartType = .named(package: nil, name: "Uri")
    let containedNamedTypes: [TranslatedType] = []
    let definingModule = Module.runtime
}

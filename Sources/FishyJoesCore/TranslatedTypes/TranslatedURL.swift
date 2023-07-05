import SourceryRuntime

struct TranslatedURL: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Foundation.URL"))
    let nodeName = "URL"
    let kotlinName = "URL"
    let cppName = "URL"
    let neutralName = "URL"
    let containedNamedTypes: [TranslatedType] = []
    let kotlinPackage: String? = "java.net"
    let jniType = JNIType.object("java/net/URL")
    let cSharpType: CSharpClass.CSType = .named(package: "System", name: "Uri")
    let definingModule = Module.runtime
}

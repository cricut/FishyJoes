import SourceryRuntime

struct TranslatedString: TranslatedType {
    let sourceType = BetterType.named(.init(name: "Swift.String"))
    let nodeName = "string"
    let kotlinName = "String"
    let cppName = "std::string"
    let neutralName = "String"
    let containedNamedTypes: [TranslatedType] = []
    let kotlinPackage: String? = "kotlin"
    let jniType = JNIType.object("java/lang/String")
    let cSharpType: CSharpClass.CSType = .named(package: nil, name: "string")
    let definingModule = Module.runtime
}

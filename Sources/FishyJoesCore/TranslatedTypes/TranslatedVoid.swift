import SourceryRuntime

struct TranslatedVoid: TranslatedType {
    let sourceType = BetterType.void
    let converterType = BetterType.named("VoidConverter")
    let cName = "void"
    let nodeName = "void"
    let kotlinName = "Unit"
    let kotlinPackage: String? = "kotlin"
    let jniType = JNIType.void
    var cSharpName: String = "void"
    var cSharpNamespace: String?
}

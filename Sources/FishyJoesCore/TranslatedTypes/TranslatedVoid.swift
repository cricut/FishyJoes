import SourceryRuntime

struct TranslatedVoid: TranslatedType {
    let sourceType = BetterType.void
    let converterType = BetterType.named("VoidConverter")
    let cName = "void"
    let nodeName = "void"
    let cppName = "void"
    let neutralName = "Void"
    let containedNamedTypes: [TranslatedType] = []
    let kotlinName = "Unit"
    let kotlinPackage: String? = "kotlin"
    let jniType = JNIType.void
    var cSharpType: CSharpClass.CSType = .void
    let definingModule = Module.runtime
}

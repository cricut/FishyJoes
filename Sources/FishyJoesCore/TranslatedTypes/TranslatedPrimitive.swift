import SourceryRuntime

struct TranslatedPrimitive: TranslatedType {
    let sourceType: BetterType
    let cName: String
    let nodeName: String
    let kotlinName: String
    let globalName: String
    let jniType: JNIType

    init(
        swift swiftName: BetterType.Name,
        c cName: String,
        node nodeName: String? = nil,
        jni jniType: JNIType
    ) {
        self.sourceType = .named(swiftName)
        self.cName = cName
        self.nodeName = nodeName ?? cName
        self.globalName = swiftName.globalName
        self.jniType = jniType
        self.kotlinName = jniType.valueType
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] { [] }
}

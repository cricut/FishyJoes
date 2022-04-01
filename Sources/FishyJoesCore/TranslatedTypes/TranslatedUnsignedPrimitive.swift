import SourceryRuntime

struct TranslatedUnsignedPrimitive: TranslatedType {
    let sourceType: BetterType
    let cName: String
    let nodeName: String
    let kotlinName: String
    let cppName: String
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String?
    let jniType: JNIType
    var jvmToKotlin: String { ".toU\(jniType.valueType)()" }
    var kotlinToJVM: String { ".to\(jniType.valueType)()" }

    init(
        swift swiftName: BetterType.Name,
        c cName: String,
        node nodeName: String,
        jni jniType: JNIType
    ) {
        self.sourceType = .named(swiftName)
        self.cName = cName
        self.nodeName = nodeName
        self.kotlinName = "U" + jniType.valueType
        self.cppName = cName
        self.neutralName = "UnsignedPrimitive<\(cName)>"
        self.containedNamedTypes = []
        self.kotlinPackage = nil
        self.jniType = jniType
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] { [] }
}

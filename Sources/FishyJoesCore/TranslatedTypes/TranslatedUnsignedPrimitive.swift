import SourceryRuntime

struct TranslatedUnsignedPrimitive: TranslatedType {
    let sourceType: BetterType
    let cName: String
    let nodeName: String
    let kotlinName: String
    let kotlinPackage: String?
    let cSharpName: String
    let cSharpNamespace: String?
    let jniType: JNIType
    var jvmToKotlin: String { ".toU\(jniType.valueType)()" }
    var kotlinToJVM: String { ".to\(jniType.valueType)()" }
    
    init(
        swift swiftName: BetterType.Name,
        typeNames: FishyJoesContext.TypeNames
    ) {
        self.init(
            swift: swiftName,
            c: typeNames.c,
            node: typeNames.ts,
            jni: typeNames.jni,
            cSharp: typeNames.cSharp
        )
    }

    init(
        swift swiftName: BetterType.Name,
        c cName: String,
        node nodeName: String? = nil,
        jni jniType: JNIType,
        cSharp cSharpName: String
    ) {
        self.sourceType = .named(swiftName)
        self.cName = cName
        self.nodeName = nodeName ?? cName
        self.kotlinName = "U" + jniType.valueType
        self.kotlinPackage = nil
        self.cSharpName = cSharpName
        self.cSharpNamespace = nil
        self.jniType = jniType
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] { [] }
}

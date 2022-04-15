import SourceryRuntime

struct TranslatedPrimitive: TranslatedType {
    let sourceType: BetterType
    let cName: String
    let nodeName: String
    let kotlinName: String
    let kotlinPackage: String?
    let jniType: JNIType
    let cSharpName: String
    let cSharpNamespace: String?
    
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
        self.kotlinName = jniType.valueType
        self.kotlinPackage = nil
        self.jniType = jniType
        self.cSharpName = cSharpName
        self.cSharpNamespace = nil
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] { [] }
}

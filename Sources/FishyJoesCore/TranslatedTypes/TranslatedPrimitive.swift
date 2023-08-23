import SourceryRuntime

struct TranslatedPrimitive: TranslatedType {
    let sourceType: BetterType
    let cName: String
    let nodeName: String
    let kotlinName: String
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String?
    let jniType: JNIType
    let cSharpType: CSharpClass.CSType
    let definingModule = Module.runtime

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
        node nodeName: String,
        jni jniType: JNIType,
        cSharp cSharpName: String
    ) {
        self.sourceType = .named(swiftName)
        self.cName = cName
        self.nodeName = nodeName
        self.kotlinName = jniType.valueType
        self.neutralName = "Primitive<\(cName)>"
        self.containedNamedTypes = []
        self.kotlinPackage = nil
        self.jniType = jniType
        self.cSharpType = .primitive(cSharpName)
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] { [] }
}

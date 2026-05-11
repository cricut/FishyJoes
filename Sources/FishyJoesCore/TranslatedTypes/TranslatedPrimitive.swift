import SourceryDataModel

struct TranslatedPrimitive: TranslatedType {
    let sourceType: BetterType
    let cName: String
    let nodeName: String
    let kotlinName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String?
    let jniType: JNIType
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let definingModule = Module.runtime

    init(
        swift swiftName: String,
        typeNames: FishyJoesContext.TypeNames
    ) {
        self.init(
            swift: swiftName,
            c: typeNames.c,
            node: typeNames.ts,
            jni: typeNames.jni,
            cSharp: typeNames.cSharp,
            dart: typeNames.dart,
            dartFFI: typeNames.dartFFI
        )
    }

    init(
        swift swiftName: String,
        c cName: String,
        node nodeName: String,
        jni jniType: JNIType,
        cSharp cSharpName: String,
        dart dartName: String,
        dartFFI dartFFIName: String
    ) {
        self.sourceType = .named(.swift(swiftName))
        self.cName = cName
        self.nodeName = nodeName
        self.kotlinName = jniType.valueType
        self.containedNamedTypes = []
        self.kotlinPackage = nil
        self.jniType = jniType
        self.cSharpType = .primitive(cSharpName)
        self.dartType = .primitive(dartName, ffiName: dartFFIName)
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] { [] }
}

import SourceryDataModel

struct TranslatedUnsignedPrimitive: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String?
    let iotaCTypes: IotaCTypes
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let pythonType: PythonType
    let jniType: JNIType
    var jvmToKotlin: String { ".toU\(jniType.valueType)()" }
    var kotlinToJVM: String { ".to\(jniType.valueType)()" }
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
        self.nodeName = nodeName
        self.kotlinName = "U" + jniType.valueType
        self.containedNamedTypes = []
        self.kotlinPackage = nil
        self.iotaCTypes = .init(created: cName, consumed: cName, unowned: cName)
        self.cSharpType = .primitive(cSharpName)
        self.dartType = .primitive(dartName, ffiName: dartFFIName)
        self.pythonType = .class(module: nil, qualifiedName: "int")
        self.jniType = jniType
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] { [] }
}

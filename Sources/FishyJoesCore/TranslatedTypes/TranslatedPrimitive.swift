import SourceryDataModel

struct TranslatedPrimitive: TranslatedType {
    let sourceType: BetterType
    let nodeName: String
    let kotlinName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String?
    let jniType: JNIType
    let iotaCTypes: IotaCTypes
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let pythonType: PythonClass2.PythonType
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
            dartFFI: typeNames.dartFFI,
            python: typeNames.python
        )
    }

    init(
        swift swiftName: String,
        c cName: String,
        node nodeName: String,
        jni jniType: JNIType,
        cSharp cSharpName: String,
        dart dartName: String,
        dartFFI dartFFIName: String,
        python pythonName: String
    ) {
        self.sourceType = .named(.swift(swiftName))
        self.nodeName = nodeName
        self.kotlinName = jniType.valueType
        self.containedNamedTypes = []
        self.kotlinPackage = nil
        self.jniType = jniType
        self.iotaCTypes = .init(created: cName, consumed: cName, unowned: cName)
        self.cSharpType = .primitive(cSharpName)
        self.dartType = .primitive(dartName, ffiName: dartFFIName)
        self.pythonType = .class(module: nil, qualifiedName: pythonName)
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] { [] }
}

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
        self.cName = cName
        self.nodeName = nodeName
        self.kotlinName = jniType.valueType
        self.containedNamedTypes = []
        self.kotlinPackage = nil
        self.jniType = jniType
        self.cSharpType = .primitive(cSharpName)
        self.dartType = .primitive(dartName, ffiName: dartFFIName)
        self.pythonType = .class(module: nil, name: pythonName)
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] { [] }

    func pythonRepresentation(in context: PythonTranslationContext) -> PythonRepresentation? {
        // R5: a primitive's conversion stays `nil` (the C scalar passes through
        // directly). B1: an unlisted primitive has no annotation and so returns
        // `nil` (fail loud) rather than degrading to `Any`.
        let annotation: String
        switch sourceType.name {
        case "Swift.Bool":
            annotation = "bool"
        case "Swift.Int", "Swift.Int8", "Swift.Int16", "Swift.Int32", "Swift.Int64":
            annotation = "int"
        case "Swift.Float", "Swift.Double":
            annotation = "float"
        default:
            return nil
        }
        return PythonRepresentation(
            annotation: PythonType(annotation: annotation),
            cType: cName,
            conversion: nil
        )
    }
}

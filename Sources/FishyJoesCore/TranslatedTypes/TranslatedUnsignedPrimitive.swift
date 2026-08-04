import SourceryDataModel

struct TranslatedUnsignedPrimitive: TranslatedType {
    let sourceType: BetterType
    let cName: String
    let nodeName: String
    let kotlinName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String?
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
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
        self.cName = cName
        self.nodeName = nodeName
        self.kotlinName = "U" + jniType.valueType
        self.containedNamedTypes = []
        self.kotlinPackage = nil
        self.cSharpType = .primitive(cSharpName)
        self.dartType = .primitive(dartName, ffiName: dartFFIName)
        self.jniType = jniType
    }

    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] { [] }

    func pythonRepresentation(in context: PythonTranslationContext) -> PythonRepresentation? {
        // R5: conversion stays `nil` (C scalar passes through). B1: an unlisted
        // unsigned primitive returns `nil` rather than degrading to `Any`.
        switch sourceType.name {
        case "Swift.UInt", "Swift.UInt8", "Swift.UInt16", "Swift.UInt32", "Swift.UInt64":
            return PythonRepresentation(
                annotation: PythonType(annotation: "int"),
                cType: cName,
                conversion: nil
            )
        default:
            return nil
        }
    }
}

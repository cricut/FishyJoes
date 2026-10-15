struct ExternalTranslatedType: Codable {
    var sourceType: BetterType
    var converterType: BetterType
    var nodeName: String
    var kotlinPackage: String?
    var kotlinName: String
    var jniType: JNIType
    var iotaCTypes: IotaCTypes
    var cSharpType: CSharpClass.CSType
    var dartType: DartClass.DartType
    var pythonType: PythonClass2.PythonType
    var isInhabited: Bool
    var definingModule: Module

    internal init(
        sourceType: BetterType,
        converterType: BetterType?,
        nodeName: String,
        kotlinPackage: String?,
        kotlinName: String,
        jniType: JNIType,
        iotaCTypes: IotaCTypes,
        cSharpType: CSharpClass.CSType,
        dartType: DartClass.DartType,
        pythonType: PythonClass2.PythonType,
        isInhabited: Bool,
        definingModule: Module
    ) {
        self.sourceType = sourceType
        self.converterType = converterType ?? sourceType
        self.nodeName = nodeName
        self.kotlinPackage = kotlinPackage
        self.kotlinName = kotlinName
        self.jniType = jniType
        self.iotaCTypes = iotaCTypes
        self.cSharpType = cSharpType
        self.dartType = dartType
        self.pythonType = pythonType
        self.isInhabited = isInhabited
        self.definingModule = definingModule
    }
}

extension ExternalTranslatedType: TranslatedType {
    var containedNamedTypes: [TranslatedType] { [] }
    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        []
    }
}

extension TranslatedType {
    var asExternal: ExternalTranslatedType {
        ExternalTranslatedType(
            sourceType: sourceType,
            converterType: converterType,
            nodeName: "\(definingModule.name).\(nodeName)",
            kotlinPackage: kotlinPackage,
            kotlinName: kotlinName,
            jniType: jniType,
            iotaCTypes: iotaCTypes,
            cSharpType: cSharpType,
            dartType: dartType,
            pythonType: pythonType,
            isInhabited: isInhabited,
            definingModule: definingModule
        )
    }
}

public struct ExternalTranslatedType: Codable {
    var sourceType: BetterType
    var converterType: BetterType
    var neutralName: String
    var nodeName: String
    var kotlinPackage: String?
    var kotlinName: String
    var jniType: JNIType
    var cSharpType: CSharpClass.CSType
    var dartType: DartClass.DartType
    var isInhabited: Bool
    public var definingModule: Module

    internal init(
        sourceType: BetterType,
        converterType: BetterType?,
        neutralName: String,
        nodeName: String,
        kotlinPackage: String?,
        kotlinName: String,
        jniType: JNIType,
        cSharpType: CSharpClass.CSType,
        dartType: DartClass.DartType,
        isInhabited: Bool,
        definingModule: Module
    ) {
        self.sourceType = sourceType
        self.converterType = converterType ?? sourceType
        self.neutralName = neutralName
        self.nodeName = nodeName
        self.kotlinPackage = kotlinPackage
        self.kotlinName = kotlinName
        self.jniType = jniType
        self.cSharpType = cSharpType
        self.dartType = dartType
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
            neutralName: "ExternalTranslatedType<of=\(neutralName)>",
            nodeName: "\(definingModule.name).\(nodeName)",
            kotlinPackage: kotlinPackage,
            kotlinName: kotlinName,
            jniType: jniType,
            cSharpType: cSharpType,
            dartType: dartType,
            isInhabited: isInhabited,
            definingModule: definingModule
        )
    }
}

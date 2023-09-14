struct ExternalTranslatedType: Codable {
    var sourceType: BetterType
    var converterType: BetterType
    var nodeName: String
    var neutralName: String
    var kotlinName: String
    var kotlinPackage: String?
    var cSharpType: CSharpClass.CSType
    var dartType: DartClass.DartType
    var jniType: JNIType
    var isInhabited: Bool
    var definingModule: Module
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
            neutralName: "ExternalTranslatedType<of=\(neutralName)>",
            kotlinName: kotlinName,
            kotlinPackage: kotlinPackage,
            cSharpType: cSharpType,
            dartType: dartType,
            jniType: jniType,
            isInhabited: isInhabited,
            definingModule: definingModule
        )
    }
}

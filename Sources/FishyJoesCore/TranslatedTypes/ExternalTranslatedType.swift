struct ExternalTranslatedType: Codable {
    var sourceType: BetterType
    var converterType: BetterType
    var nodeName: String
    var kotlinName: String
    var kotlinPackage: String?
    var cSharpName: String
    var cSharpNamespace: String?
    var jniType: JNIType
}

extension ExternalTranslatedType: TranslatedType {
    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        []
    }
}

extension TranslatedType {
    var asExternal: ExternalTranslatedType {
        ExternalTranslatedType(
            sourceType: sourceType,
            converterType: converterType,
            nodeName: nodeName,
            kotlinName: kotlinName,
            kotlinPackage: kotlinPackage,
            cSharpName: cSharpName,
            cSharpNamespace: cSharpNamespace,
            jniType: jniType
        )
    }
}

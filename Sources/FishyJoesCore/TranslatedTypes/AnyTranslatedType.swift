struct AnyTranslatedType: Codable {
    var sourceType: BetterType
    var converterType: BetterType
    var nodeName: String
    var kotlinName: String
    var kotlinPackage: String?
    var jniType: JNIType
}

extension AnyTranslatedType: TranslatedType {
    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        fatalErr("AnyTranslatedType doesn't support code generation")
    }
}

extension TranslatedType {
    var asAnyTranslatedType: AnyTranslatedType {
        AnyTranslatedType(
            sourceType: sourceType,
            converterType: converterType,
            nodeName: nodeName,
            kotlinName: kotlinName,
            kotlinPackage: kotlinPackage,
            jniType: jniType
        )
    }
}

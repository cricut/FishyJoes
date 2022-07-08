struct ExternalTranslatedType: Codable {
    var sourceType: BetterType
    var converterType: BetterType
    var nodeName: String
    var cppName: String
    var neutralName: String
    var kotlinName: String
    var kotlinPackage: String?
    var cSharpType: CSharpClass.CSType
    var jniType: JNIType
}

extension ExternalTranslatedType: TranslatedType {
    var containedNamedTypes: [TranslatedType] { [] }
    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        []
    }

    var cSharpSetupParameters: [CSharpSetupParameter] { [] }
}

extension TranslatedType {
    func asExternal(in module: Module) -> ExternalTranslatedType {
        ExternalTranslatedType(
            sourceType: sourceType,
            converterType: converterType,
            nodeName: "\(module.name).\(nodeName)",
            cppName: cppName,
            neutralName: "ExternalTranslatedType<of=\(neutralName)>",
            kotlinName: kotlinName,
            kotlinPackage: kotlinPackage,
            cSharpType: cSharpType,
            jniType: jniType
        )
    }
}

import SourceryRuntime

struct TranslatedDictionary: TranslatedType {
    let keyType: TranslatedType
    let valueType: TranslatedType

    let sourceType: BetterType
    let converterType: BetterType
    let nodeName: String
    let kotlinName: String
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String? = "kotlin.collections"
    let jniType = JNIType.object("java/util/Map")
    let cSharpType: CSharpClass.CSType
    let definingModule = Module.runtime

    init(key: TranslatedType, value: TranslatedType) {
        self.keyType = key
        self.valueType = value

        self.sourceType = .generic(base: "Dictionary", args: [key.sourceType, value.sourceType])
        self.converterType = .generic(base: "DictionaryConverter", args: [key.converterType, value.converterType])
        self.nodeName = "Map<\(key.nodeName), \(value.nodeName)>"
        self.kotlinName = "Map<\(key.kotlinPackageQualifiedName), \(value.kotlinPackageQualifiedName)>"
        self.neutralName = "Dictionary<K=\(key.neutralName), V=\(value.neutralName)>"
        self.containedNamedTypes = key.containedNamedTypes + value.containedNamedTypes
        self.cSharpType = .named(
            package: "System.Collections.Generic",
            name: "IDictionary<\(key.cSharpType.name), \(value.cSharpType.name)>"
        )
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [CSharpSetupParameter] {
        [
            .type(typeValue: keyType.cSharpType.name),
            .type(typeValue: valueType.cSharpType.name),
            .value(
                name: "typeName",
                type: "string"
            ) { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }
}

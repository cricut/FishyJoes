import SourceryRuntime

struct TranslatedDictionary: TranslatedType {
    let keyType: TranslatedType
    let valueType: TranslatedType

    let sourceType: BetterType
    let converterType: BetterType
    let nodeName: String
    let kotlinName: String
    var cppName: String
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String? = "kotlin.collections"
    let jniType = JNIType.object("java/util/Map")
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let definingModule = Module.runtime

    init(key: TranslatedType, value: TranslatedType) {
        self.keyType = key
        self.valueType = value

        self.sourceType = .generic(base: "Dictionary", args: [key.sourceType, value.sourceType])
        self.converterType = .generic(base: "DictionaryConverter", args: [key.converterType, value.converterType])
        self.nodeName = "Map<\(key.nodeName), \(value.nodeName)>"
        self.kotlinName = "Map<\(key.kotlinPackageQualifiedName), \(value.kotlinPackageQualifiedName)>"
        self.cppName = "std::unordered_map<\(key.cppName), \(value.cppName)>"
        self.neutralName = "Dictionary<K=\(key.neutralName), V=\(value.neutralName)>"
        self.containedNamedTypes = key.containedNamedTypes + value.containedNamedTypes
        self.cSharpType = .named(
            package: "System.Collections.Generic",
            name: "IDictionary<\(key.cSharpType.name), \(value.cSharpType.name)>"
        )
        self.dartType = .named(package: nil, name: "Map<\(key.dartType.name), \(value.dartType.name)>")
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter] {
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

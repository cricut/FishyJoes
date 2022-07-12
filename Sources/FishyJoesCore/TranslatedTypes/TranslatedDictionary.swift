import SourceryRuntime

struct TranslatedDictionary: TranslatedType {
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

    init(key: TranslatedType, value: TranslatedType) {
        self.sourceType = .generic(base: "Dictionary", args: [key.sourceType, value.sourceType])
        self.converterType = .generic(base: "DictionaryConverter", args: [key.converterType, value.converterType])
        self.nodeName = "Map<\(key.nodeName), \(value.nodeName)>"
        self.kotlinName = "Map<\(key.kotlinName), \(value.kotlinName)>"
        self.cppName = "std::unordered_map<\(key.cppName), \(value.cppName)>"
        self.neutralName = "Dictionary<K=\(key.neutralName), V=\(value.neutralName)>"
        self.containedNamedTypes = key.containedNamedTypes + value.containedNamedTypes
        self.cSharpType = .named(
            package: "System.Collections.Generic",
            name: "Dictionary<\(key.cSharpType.name), \(value.cSharpType.name)>"
        )
    }

    var cSharpSetupParameters: [CSharpSetupParameter] { [] }
}

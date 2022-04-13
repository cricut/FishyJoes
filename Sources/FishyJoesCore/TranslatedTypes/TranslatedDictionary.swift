import SourceryRuntime

struct TranslatedDictionary: TranslatedType {
    let sourceType: BetterType
    let converterType: BetterType
    let nodeName: String
    let kotlinName: String
    let kotlinPackage: String? = "kotlin.collections"
    let jniType = JNIType.object("java/util/Map")
    let cSharpName: String
    let cSharpNamespace: String? = "System.Collections.Generic"

    init(key: TranslatedType, value: TranslatedType) {
        self.sourceType = .generic(base: "Dictionary", args: [key.sourceType, value.sourceType])
        self.converterType = .generic(base: "DictionaryConverter", args: [key.converterType, value.converterType])
        self.nodeName = "Map<\(key.nodeName), \(value.nodeName)>"
        self.kotlinName = "Map<\(key.kotlinName), \(value.kotlinName)>"
        self.cSharpName = "Dictionary<\(key.cSharpName), \(value.cSharpName)>"
    }
}

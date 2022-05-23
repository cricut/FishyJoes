import SourceryRuntime

struct TranslatedSet: TranslatedType {
    let sourceType: BetterType
    let converterType: BetterType
    let nodeName: String
    let kotlinName: String
    let cppName: String
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String? = "kotlin.collections"
    let jniType = JNIType.object("java/util/Set")
    let cSharpName: String
    let cSharpNamespace: String? = "System.Collections.Generic"

    init(element: TranslatedType) {
        self.sourceType = .generic(base: "Set", args: [element.sourceType])
        self.converterType = .generic(base: "SetConverter", args: [element.converterType])
        self.nodeName = "Set<\(element.nodeName)>"
        self.kotlinName = "Set<\(element.kotlinName)>"
        self.cppName = "std::unordered_set<\(element.cppName)>"
        self.neutralName = "Set<K=\(element.neutralName)>"
        self.containedNamedTypes = element.containedNamedTypes
        self.cSharpName = "HashSet<\(element.cSharpName)>"
    }
}

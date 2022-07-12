import SourceryRuntime

struct TranslatedArray: TranslatedType {
    let sourceType: BetterType
    let converterType: BetterType
    let nodeName: String
    let kotlinName: String
    var cppName: String
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String? = "kotlin.collections"
    let jniType = JNIType.object("java/util/List")
    var cSharpType: CSharpClass.CSType

    init(element: TranslatedType) {
        self.sourceType = .array(element.sourceType)
        self.converterType = .generic(base: "ArrayConverter", args: [element.converterType])
        self.nodeName = "\(element.nodeName)[]"
        self.kotlinName = "List<\(element.kotlinName)>"
        self.cppName = "std::vector<\(element.cppName)>"
        self.neutralName = "List<V=\(element.neutralName)>"
        self.containedNamedTypes = element.containedNamedTypes
        self.cSharpType = .named(package: nil, name: "\(element.cSharpType.name)[]")
    }

    var cSharpSetupParameters: [CSharpSetupParameter] { [] }
}

import SourceryRuntime

struct TranslatedArray: TranslatedType {
    let elementType: TranslatedType

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
    var dartType: DartClass.DartType
    let definingModule = Module.runtime

    init(element: TranslatedType) {
        self.elementType = element
        self.sourceType = .array(element.sourceType)
        self.converterType = .generic(base: "ArrayConverter", args: [element.converterType])
        self.nodeName = "\(element.nodeName)[]"
        self.kotlinName = "List<\(element.kotlinPackageQualifiedName)>"
        self.cppName = "std::vector<\(element.cppName)>"
        self.neutralName = "List<V=\(element.neutralName)>"
        self.containedNamedTypes = element.containedNamedTypes
        self.cSharpType = .named(package: "System.Collections.Generic", name: "IList<\(element.cSharpType.name)>")
        self.dartType = .named(package: nil, name: "List<\(element.dartType.name)>")
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter] {
        [
            .type(typeValue: elementType.cSharpType.name),
            .value(name: "typeName", type: "string") { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }
}

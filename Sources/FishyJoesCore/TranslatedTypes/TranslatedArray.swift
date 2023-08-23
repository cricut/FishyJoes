import SourceryRuntime

struct TranslatedArray: TranslatedType {
    let elementType: TranslatedType

    let sourceType: BetterType
    let converterType: BetterType
    let nodeName: String
    let kotlinName: String
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String? = "kotlin.collections"
    let jniType = JNIType.object("java/util/List")
    var cSharpType: CSharpClass.CSType
    let definingModule = Module.runtime
    let definingTSNamespace: String? = nil

    init(element: TranslatedType) {
        self.elementType = element
        self.sourceType = .array(element.sourceType)
        self.converterType = .generic(base: "ArrayConverter", args: [element.converterType])
        self.nodeName = "\(element.nodeType)[]"
        self.kotlinName = "List<\(element.kotlinPackageQualifiedName)>"
        self.neutralName = "List<V=\(element.neutralName)>"
        self.containedNamedTypes = element.containedNamedTypes
        self.cSharpType = .named(package: "System.Collections.Generic", name: "IList<\(element.cSharpType.name)>")
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [CSharpSetupParameter] {
        [
            .type(typeValue: elementType.cSharpType.name),
            .value(name: "typeName", type: "string") { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }
}

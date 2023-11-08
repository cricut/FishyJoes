import SourceryRuntime

struct TranslatedSet: TranslatedType {
    let elementType: TranslatedType

    let sourceType: BetterType
    let converterType: BetterType
    let nodeName: String
    let kotlinName: String
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String? = "kotlin.collections"
    let jniType = JNIType.object("java/util/Set")
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let definingModule = Module.runtime

    init(element: TranslatedType) {
        self.elementType = element
        self.sourceType = .generic(base: .swift("Set"), args: [element.sourceType])
        self.converterType = .generic(base: .runtime("SetConverter"), args: [element.converterType])
        self.nodeName = "Set<\(element.definingTSNamespace.map { "\($0)." } ?? "")\(element.nodeName)>"
        self.kotlinName = "Set<\(element.kotlinPackageQualifiedName)>"
        self.neutralName = "Set<K=\(element.neutralName)>"
        self.containedNamedTypes = element.containedNamedTypes
        self.cSharpType = .named(package: "System.Collections.Generic", name: "ISet<\(element.cSharpType.name)>")
        self.dartType = .named(package: nil, name: "Set", genericArgs: [element.dartType])
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>] {
        [
            .type(typeValue: elementType.cSharpType.name),
            .value(
                name: "typeName",
                type: "string"
            ) { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }

    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>] {
        return [
            .type(typeValue: elementType.dartType),
            .value(name: "typeName", type: .string) { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }
}

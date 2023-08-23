struct TranslatedRange: TranslatedType {
    let bound: TranslatedType
    let containedNamedTypes: [TranslatedType]
    let neutralName: String
    let nodeName: String
    let kotlinPackage: String?
    let kotlinName: String
    let jniType: JNIType
    let cSharpType: CSharpClass.CSType
    let definingModule = Module.runtime

    init(bound: TranslatedType) {
        self.bound = bound
        self.containedNamedTypes = bound.containedNamedTypes
        self.neutralName = "Range<B=\(bound.neutralName)>"
        self.nodeName = "SwiftRange<\(bound.nodeName)>"
        self.kotlinPackage = "com.cricut.fishyjoes.runtime"
        self.kotlinName = "SwiftRange<\(bound.kotlinName)>"
        self.jniType = .object("com/cricut/fishyjoes/runtime/SwiftRange")
        self.cSharpType = .named(package: "Cricut.FishyJoesRuntime", name: "SwiftRange<\(bound.cSharpType.name)>")
    }

    var sourceType: BetterType {
        .generic(base: "Range", args: [bound.sourceType])
    }

    var converterType: BetterType {
        .generic(base: "RangeConverter", args: [bound.converterType])
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [CSharpSetupParameter] {
        [
            .type(typeValue: bound.cSharpType.name),
            .value(name: "typeName", type: "string") { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }
}

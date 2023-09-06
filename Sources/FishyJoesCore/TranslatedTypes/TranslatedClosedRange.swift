struct TranslatedClosedRange: TranslatedType {
    let bound: TranslatedType
    let containedNamedTypes: [TranslatedType]
    let neutralName: String
    let nodeName: String
    let kotlinPackage: String?
    let kotlinName: String
    let jniType: JNIType
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let definingModule = Module.runtime

    init(bound: TranslatedType) {
        self.bound = bound
        self.containedNamedTypes = bound.containedNamedTypes
        self.neutralName = "ClosedRange<B=\(bound.neutralName)>"
        self.nodeName = "SwiftClosedRange<\(bound.nodeName)>"
        self.kotlinPackage = "com.cricut.fishyjoes.runtime"
        self.kotlinName = "SwiftClosedRange<\(bound.kotlinName)>"
        self.jniType = .object("com/cricut/fishyjoes/runtime/SwiftClosedRange")
        self.cSharpType = .named(package: "Cricut.FishyJoesRuntime", name: "SwiftClosedRange<\(bound.cSharpType.name)>")
        self.dartType = .named(package: "FishyJoesRuntime", name: "SwiftClosedRange", genericArgs: [bound.dartType])
    }

    var sourceType: BetterType {
        .generic(base: .swift("ClosedRange"), args: [bound.sourceType])
    }

    var converterType: BetterType {
        .generic(base: .runtime("ClosedRangeConverter"), args: [bound.converterType])
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>] {
        [
            .type(typeValue: bound.cSharpType.name),
            .value(name: "typeName", type: "string") { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }
}

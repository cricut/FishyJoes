struct TranslatedResult: TranslatedType {
    let success: TranslatedType
    let failure: TranslatedType
    let nodeName: String
    let kotlinName: String
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let cSharpType: CSharpClass.CSType = .primitive("TODO")
    let dartType: DartClass.DartType
    let jniType = JNIType.object("com/cricut/fishyjoes/runtime/TypedResult")
    let definingModule = Module.runtime

    init(success: TranslatedType, failure: TranslatedType) {
        self.success = success
        self.failure = failure
        self.nodeName = "TODO"
        self.neutralName = "Result<success=\(success.neutralName), failure=\(failure.neutralName)>"
        self.containedNamedTypes = [success, failure]
        self.kotlinName = "TypedResult<\(success.kotlinPackageQualifiedName), \(failure.kotlinPackageQualifiedName)>"
        self.dartType = .result(success.dartType, failure.dartType)
    }

    var sourceType: BetterType {
        .result(success.sourceType, failure.sourceType)
    }

    var converterType: BetterType {
        .generic(base: .runtime("ResultConverter"), args: [success.converterType, failure.converterType])
    }

    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>] {
        [
            .type(typeValue: success.dartType),
            .type(typeValue: failure.dartType),
            .value(name: "typeName", type: .string) { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }

    var isInhabited: Bool { success.isInhabited || failure.isInhabited }
}

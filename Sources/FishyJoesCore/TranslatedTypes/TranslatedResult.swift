struct TranslatedResult: TranslatedType {
    let success: TranslatedType
    let failure: TranslatedType
    let nodeName: String
    let kotlinName: String
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let cppName: String = "TODO"
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let cSharpName: String = "TODO"
    let cSharpNamespace: String? = nil
    let jniType = JNIType.object("com/cricut/fishyjoes/runtime/TypedArray")

    init(success: TranslatedType, failure: TranslatedType) {
        self.success = success
        self.failure = failure
        self.nodeName = "TODO"
        self.neutralName = "Result<success=\(success.neutralName), failure=\(failure.neutralName)>"
        self.containedNamedTypes = [success, failure]
        self.kotlinName = "TypedResult<\(success.kotlinName), \(failure.kotlinName)>"
    }

    var sourceType: BetterType {
        .result(success.sourceType, failure.sourceType)
    }

    var converterType: BetterType {
        .generic(base: "ResultConverter", args: [success.converterType, failure.converterType])
    }
}

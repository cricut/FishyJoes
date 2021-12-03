struct TranslatedOptional: TranslatedType {
    let wrapped: TranslatedType
    let nodeName: String
    let kotlinName: String
    let kotlinPackage: String?
    let jniType: JNIType

    init(wrapped: TranslatedType) {
        self.wrapped = wrapped
        self.nodeName = wrapped.nodeName
        self.kotlinName = wrapped.kotlinName + "?"
        self.kotlinPackage = wrapped.kotlinPackage
        self.jniType = wrapped.jniType.asObjectType
    }

    var sourceType: BetterType {
        .optional(wrapped.sourceType)
    }
    var converterType: BetterType {
        .generic(base: "OptionalConverter", args: [wrapped.converterType])
    }
}

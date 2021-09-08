struct TranslatedOptional: TranslatedType {
    let wrapped: TranslatedType
    let nodeName: String
    let kotlinName: String
    let jniType: JNIType

    init(wrapped: TranslatedType) {
        self.wrapped = wrapped
        self.nodeName = wrapped.nodeName
        self.kotlinName = wrapped.kotlinName + "?"
        self.jniType = wrapped.jniType.asObjectType
    }

    var sourceType: BetterType {
        .optional(wrapped.sourceType)
    }
}

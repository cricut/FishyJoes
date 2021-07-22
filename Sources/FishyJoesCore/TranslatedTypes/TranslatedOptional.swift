struct TranslatedOptional: TranslatedType {
    let wrapped: TranslatedType
    let nodeName: String

    init(wrapped: TranslatedType) {
        self.wrapped = wrapped
        self.nodeName = wrapped.nodeName
    }

    var sourceType: BetterType {
        .optional(wrapped.sourceType)
    }
}

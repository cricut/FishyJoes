struct TranslatedOptional: TranslatedType {
    let wrapped: TranslatedType
    let nodeName: String
    let kotlinName: String
    let cppName: String
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String?
    let jniType: JNIType
    let cSharpName: String
    let cSharpNamespace: String?

    init(wrapped: TranslatedType) {
        self.wrapped = wrapped
        self.nodeName = wrapped.nodeName
        self.kotlinName = wrapped.kotlinName + "?"
        self.cppName = "std::optional<\(wrapped.cppName)>"
        self.neutralName = "Optional<\(wrapped.neutralName)>"
        self.containedNamedTypes = wrapped.containedNamedTypes
        self.kotlinPackage = wrapped.kotlinPackage
        self.jniType = wrapped.jniObjectType
        self.cSharpName = wrapped.cSharpName + "?"
        self.cSharpNamespace = nil
    }

    var sourceType: BetterType {
        .optional(wrapped.sourceType)
    }
    var converterType: BetterType {
        .generic(base: "OptionalConverter", args: [wrapped.converterType])
    }
}

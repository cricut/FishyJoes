struct TranslatedOptional: TranslatedType {
    let wrapped: TranslatedType
    let nodeName: String
    let kotlinName: String
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String?
    let jniType: JNIType
    let cSharpType: CSharpClass.CSType
    let definingModule = Module.runtime

    init(wrapped: TranslatedType) {
        self.wrapped = wrapped
        self.nodeName = wrapped.nodeName
        self.kotlinName = wrapped.kotlinName + "?"
        self.neutralName = "Optional<\(wrapped.neutralName)>"
        self.containedNamedTypes = wrapped.containedNamedTypes
        self.kotlinPackage = wrapped.kotlinPackage
        self.jniType = wrapped.jniObjectType
        self.cSharpType = .optional(wrapped.cSharpType)
    }

    var sourceType: BetterType {
        .optional(wrapped.sourceType)
    }
    var converterType: BetterType {
        .generic(base: "OptionalConverter", args: [wrapped.converterType])
    }
}

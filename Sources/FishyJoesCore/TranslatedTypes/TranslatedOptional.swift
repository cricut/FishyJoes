struct TranslatedOptional: TranslatedType {
    let wrapped: TranslatedType
    let nodeName: String
    let kotlinName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String?
    let jniType: JNIType
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let definingModule = Module.runtime

    init(wrapped: TranslatedType) {
        self.wrapped = wrapped
        self.nodeName = wrapped.nodeName
        self.kotlinName = wrapped.kotlinName + "?"
        self.containedNamedTypes = wrapped.containedNamedTypes
        self.kotlinPackage = wrapped.kotlinPackage
        self.jniType = wrapped.jniObjectType
        self.cSharpType = .optional(wrapped.cSharpType)
        self.dartType = .optional(wrapped.dartType)
    }

    var sourceType: BetterType {
        .optional(wrapped.sourceType)
    }
    var converterType: BetterType {
        .generic(base: .runtime("OptionalConverter"), args: [wrapped.converterType])
    }
}

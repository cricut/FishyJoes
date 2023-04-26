struct TranslatedClosedRange: TranslatedType {
    let bound: TranslatedType
    let nodeName: String
    let kotlinName: String
    let cppName: String
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String?
    let jniType: JNIType
    let cSharpType: CSharpClass.CSType
    let definingModule = Module.runtime

    init(bound: TranslatedType) {
        self.bound = bound
        self.nodeName = "TODO:athing"
        self.kotlinName = "ClosedRange<\(bound.kotlinName)>"
        self.cppName = "std::ranges::range<\(bound.cppName)>"
        self.neutralName = "ClosedRange<B=\(bound.neutralName)>"
        self.containedNamedTypes = bound.containedNamedTypes
        self.kotlinPackage = "kotlin.ranges"
        self.jniType = .object("kotlin/ranges/ClosedRange")
        self.cSharpType = .named(package: "TODO", name: "TODO")
    }

    var sourceType: BetterType {
        .generic(base: "ClosedRange", args: [bound.converterType])
    }
    var converterType: BetterType {
        .generic(base: "ClosedRangeConverter", args: [bound.converterType])
    }
}

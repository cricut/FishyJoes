struct TranslatedRange: TranslatedType {
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
        let allowedTypes = ["UInt8", "UInt16", "UInt32", "UInt64", "UInt", "Int8", "Int16", "Int32", "Int64", "Int"]
        guard allowedTypes.contains(bound.sourceType.name) else {
            fatalErr("Bound type \"\(bound.sourceType.name)\" unsupported for Range<Bound>. Use ClosedRange<Bound> instead. Must be one of: \(allowedTypes)")
        }

        self.bound = bound
        self.nodeName = "TODO:athing"
        self.kotlinName = "ClosedRange<\(bound.kotlinName)>"
        self.cppName = "std::ranges::range<\(bound.cppName)>"
        self.neutralName = "Range<B=\(bound.neutralName)>"
        self.containedNamedTypes = bound.containedNamedTypes
        self.kotlinPackage = "kotlin.ranges"
        self.jniType = .object("kotlin/ranges/ClosedRange")
        self.cSharpType = .named(package: "TODO", name: "TODO")
    }

    var sourceType: BetterType {
        .generic(base: "Range", args: [bound.converterType])
    }
    var converterType: BetterType {
        .generic(base: "RangeConverter", args: [bound.converterType])
    }
}

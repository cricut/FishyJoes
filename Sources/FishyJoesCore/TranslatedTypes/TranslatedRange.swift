struct TranslatedRange: TranslatedType {
    let bound: TranslatedType
    let containedNamedTypes: [TranslatedType]
    let neutralName: String
    let nodeName: String
    let kotlinPackage: String?
    let kotlinName: String
    let jniType: JNIType
    let cSharpType: CSharpClass.CSType
    let cppName: String
    let definingModule = Module.runtime

    init(bound: TranslatedType) {
        let allowedTypes = ["UInt8", "UInt16", "UInt32", "UInt64", "UInt", "Int8", "Int16", "Int32", "Int64", "Int"]
        guard allowedTypes.contains(bound.sourceType.name) else {
            fatalErr("Bound type \"\(bound.sourceType.name)\" unsupported for Range<Bound>. Use ClosedRange<Bound> instead. Must be one of: \(allowedTypes)")
        }

        self.bound = bound
        self.containedNamedTypes = bound.containedNamedTypes
        self.neutralName = "Range<B=\(bound.neutralName)>"
        self.nodeName = "{ start: \(bound.nodeName), endInclusive: \(bound.nodeName) }"
        self.kotlinName = "ClosedRange<\(bound.kotlinName)>"
        self.kotlinPackage = "kotlin.ranges"
        self.jniType = .object("kotlin/ranges/ClosedRange")
        self.cSharpType = .named(package: "Cricut.FishyJoesRuntime", name: "OpenRange<\(bound.cSharpType.name)>")
        self.cppName = "std::ranges::range<\(bound.cppName)>"
    }

    var sourceType: BetterType {
        .generic(base: "Range", args: [bound.converterType])
    }

    var converterType: BetterType {
        .generic(base: "RangeConverter", args: [bound.converterType])
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [CSharpSetupParameter] {
        [
            .type(typeValue: bound.cSharpType.name),
            .value(name: "typeName", type: "string") { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }
}

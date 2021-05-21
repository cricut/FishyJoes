struct TranslatedOptional: TranslatedType {
    let sourceType: BetterType
    let wrappedType: TranslatedType
    let cName: String
    let globalName: String
    let globalCName: String
    let asSwiftAccessor: String
    let asCAccessor: String

    init(wrapped: TranslatedType) {
        self.sourceType = .optional(wrapped.sourceType)
        self.wrappedType = wrapped
        self.cName = "Optional_\(wrapped.cName)"
        self.globalName = "Swift.Optional<\(wrapped.globalName)>"
        self.globalCName = "CTypes.\(cName)"
        self.asSwiftAccessor = ".asSwift"
        self.asCAccessor = ".asC"
    }

    var cForwardDeclaration: String? {
        "#include \"\(cName).h\""
    }

    func definitionFragments(in context: CDeclareContext) -> [SourceFragment] {
        let headerName = "CTypes/include/\(cName).h"
        let headerFragment = context.cHeaderFragment(headerName)

        wrappedType.cForwardDeclaration.map { headerFragment.output($0) }

        headerFragment.outputBlock("typedef struct \(cName) {", newLineTerminated: false) {
            headerFragment.outputBlock("union {", newLineTerminated: false) {
                headerFragment.output("struct {} none;")
                headerFragment.output("\(wrappedType.cName) some;")
            }
            headerFragment.output(" associatedValues;")
            headerFragment.outputBlock("enum: uint8_t {", newLineTerminated: false) {
                headerFragment.output("none = 0,")
                headerFragment.output("some = 1")
            }
            headerFragment.output(" tag;")
        }
        headerFragment.output(" \(cName);")

        let conversionFragment = context.swiftFragment("CInterface/\(cName).swift")
        conversionFragment.outputBlock("extension Swift.Optional where Wrapped == \(wrappedType.globalName) {") {
            conversionFragment.outputBlock("var asC: \(globalCName) {") {
                conversionFragment.outputBlock("get {") {
                    conversionFragment.outputBlock("switch self {") {
                        conversionFragment.output("case .none:")
                        conversionFragment.output("    return .init(associatedValues: .init(none: .init()), tag: 0)")
                        conversionFragment.output("case let .some(wrapped):")
                        conversionFragment.output("    return .init(associatedValues: .init(some: wrapped\(wrappedType.asCAccessor)), tag: 1)")
                    }
                }
                conversionFragment.output("set { self = newValue.asSwift }")
            }
        }

        conversionFragment.output()
        conversionFragment.outputBlock("extension \(globalCName) {") {
            conversionFragment.outputBlock("var asSwift: \(globalName) {") {
                conversionFragment.outputBlock("get {") {
                    conversionFragment.outputBlock("switch tag {") {
                        conversionFragment.output("case 0: return nil")
                        conversionFragment.output("case 1: return \(wrappedType.wrapAsSwift(expression: "associatedValues.some"))")
                        conversionFragment.output("default: fatalError(\"invalid tag \\(tag) for \(globalCName)\")")
                    }
                }
                conversionFragment.output("set { self = newValue.asC }")
            }
        }
        return [headerFragment, conversionFragment]
    }
}

struct TranslatedRange: TranslatedType {
    let isClosedRange: Bool

    private let name: String

    let bound: TranslatedType
    let containedNamedTypes: [TranslatedType]
    let nodeName: String
    let kotlinPackage: String?
    let kotlinName: String
    let jniType: JNIType
    let iotaCTypes = IotaCTypes.hostRef
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let pythonType: PythonType
    let definingTSNamespace: String?
    let definingModule = Module.runtime

    init(bound: TranslatedType, isClosedRange: Bool) {
        self.isClosedRange = isClosedRange
        self.name = isClosedRange ? "ClosedRange" : "Range"
        self.bound = bound
        self.containedNamedTypes = bound.containedNamedTypes
        self.nodeName = "Swift\(name)<\(bound.nodeName)>"
        self.kotlinPackage = "com.cricut.fishyjoes.runtime"
        self.kotlinName = "Swift\(name)<\(bound.kotlinPackageQualifiedName)>"
        self.jniType = .object("com/cricut/fishyjoes/runtime/Swift\(name)")
        self.cSharpType = .named(package: "Cricut.FishyJoesRuntime", name: "Swift\(name)<\(bound.cSharpType.name)>")
        self.dartType = .named(package: "FishyJoesRuntime", name: "Swift\(name)", genericArgs: [bound.dartType])
        self.pythonType = .class(module: "fishyjoes_runtime", qualifiedName: "Swift\(name)", genericArgs: [bound.pythonType.static])
        self.definingTSNamespace = "Runtime"
    }

    var sourceType: BetterType {
        .generic(base: .swift(name), args: [bound.sourceType])
    }

    var converterType: BetterType {
        .generic(base: .runtime("\(name)Converter"), args: [bound.converterType])
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>] {
        [
            .type(typeValue: bound.cSharpType.name),
            .value(name: "typeName", type: "string") { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }

    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>] {
        [
            .type(typeValue: bound.dartType),
            .value(name: "typeName", type: .string) { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }

    func pythonSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<PythonType>] {
        return [
            .value(name: "type_name", type: .str) { fragment in
                fragment.output("string_bag.utf16(\"\(converterType.name)\"),")
            },
            .value(name: "dyn_types", type: bound.pythonType.metaTypeTuple) { fragment in
                fragment.output("\(bound.pythonType.dynamicsStringAsTuple),")
            },
        ]
    }
}

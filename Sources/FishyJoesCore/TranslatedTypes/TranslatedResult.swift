struct TranslatedResult: TranslatedType {
    let success: TranslatedType
    let failure: TranslatedType
    let nodeName: String
    let kotlinName: String
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let containedNamedTypes: [TranslatedType]
    let iotaCTypes = IotaCTypes.hostRef
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let pythonType: PythonType
    let jniType = JNIType.object("com/cricut/fishyjoes/runtime/TypedResult")
    let definingModule = Module.runtime

    init(success: TranslatedType, failure: TranslatedType) {
        self.success = success
        self.failure = failure
        self.nodeName = "Runtime.Result<\(success.nodeName), \(failure.nodeName)>"
        self.containedNamedTypes = [success, failure]
        self.kotlinName = "TypedResult<\(success.kotlinPackageQualifiedName), \(failure.kotlinPackageQualifiedName)>"
        self.cSharpType = .named(
            package: "Cricut.FishyJoesRuntime",
            name: "Result<\(success.cSharpType.name), \(failure.cSharpType.name)>"
        )
        self.dartType = .result(success.dartType, failure.dartType)
        self.pythonType = .init(
            static: .named(module: "fishyjoes_runtime", namespaces: [], name: "Result", genericArgs: [success.pythonType.static, failure.pythonType.static]),
            dynamics: [
                .init(module: "fishyjoes_runtime", namespaces: [], name: "ResultSuccess"),
                .init(module: "fishyjoes_runtime", namespaces: [], name: "ResultFailure"),
            ]
        )
    }

    var sourceType: BetterType {
        .result(success.sourceType, failure.sourceType)
    }

    var converterType: BetterType {
        .generic(base: .runtime("ResultConverter"), args: [success.converterType, failure.converterType])
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>] {
        [
            .type(typeValue: success.cSharpType.name),
            .type(typeValue: failure.cSharpType.name),
            .value(name: "typeName", type: "string") { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }

    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>] {
        [
            .type(typeValue: success.dartType),
            .type(typeValue: failure.dartType),
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
            .value(name: "dyn_types", type: success.pythonType.metaTypeTuple) { fragment in
                fragment.output("\(success.pythonType.dynamicsStringAsTuple),")
            },
            .value(name: "dyn_types", type: failure.pythonType.metaTypeTuple) { fragment in
                fragment.output("\(failure.pythonType.dynamicsStringAsTuple),")
            },
        ]
    }

    var isInhabited: Bool { success.isInhabited || failure.isInhabited }
}

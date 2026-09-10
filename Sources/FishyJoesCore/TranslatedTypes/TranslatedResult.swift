struct TranslatedResult: TranslatedType {
    let success: TranslatedType
    let failure: TranslatedType
    let nodeName: String
    let kotlinName: String
    let kotlinPackage: String? = "com.cricut.fishyjoes.runtime"
    let containedNamedTypes: [TranslatedType]
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let pythonType: PythonClass2.PythonType
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
        self.pythonType = .class(
            module: "fishyjoes_runtime",
            name: "Result",
            genericArgs: [success.pythonType.static, failure.pythonType.static]
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

    var isInhabited: Bool { success.isInhabited || failure.isInhabited }

    func pythonRepresentation(in context: PythonTranslationContext) -> PythonRepresentation? {
        guard let successRepresentation = success.pythonRepresentation(in: context.recursingIntoChild()),
              let failureRepresentation = failure.pythonRepresentation(in: context.recursingIntoChild()),
              let successConversion = successRepresentation.conversionDescriptor,
              let failureConversion = failureRepresentation.conversionDescriptor else {
            return nil
        }
        return PythonRepresentation(
            annotation: context.pythonResultType(
                success: successRepresentation.annotation,
                failure: failureRepresentation.annotation
            ),
            cType: "HostObject",
            conversion: "_native.Result(\"\(converterType.name)\", \(successConversion), \(failureConversion))"
        )
    }
}

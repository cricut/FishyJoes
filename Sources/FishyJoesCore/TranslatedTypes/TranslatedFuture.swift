// This type lives in FishyJoesCommonRuntime, so it won't appear in user sources.
// It gets generated as part of translated async methods and by async `TranslatedFunction`s
struct TranslatedFuture: TranslatedType {
    let output: TranslatedType
    let nodeName: String
    let kotlinName: String
    let neutralName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String? = "kotlinx.coroutines"
    let jniType = JNIType.object("kotlinx/coroutines/Deferred")
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let definingModule = Module.runtime

    init(output: TranslatedType) {
        self.output = output
        self.nodeName = "Promise<\(output.nodeName)>"
        self.kotlinName = "Deferred<\(output.kotlinName)"
        self.neutralName = "Future<\(output.neutralName)>"
        self.containedNamedTypes = [output]
        self.cSharpType = .primitive("TODO")
        self.dartType = .future(output.dartType)
    }

    var sourceType: BetterType {
        .generic(base: .runtime("Future"), args: [output.sourceType])
    }

    var converterType: BetterType {
        .generic(base: .runtime("FutureConverter"), args: [output.converterType])
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>] {
        [
            .type(typeValue: output.cSharpType.name),
            .value(name: "typeName", type: "string") { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }

    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>] {
        return [
            .type(typeValue: output.dartType),
            .value(name: "typeName", type: .string) { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }
}

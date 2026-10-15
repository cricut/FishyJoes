import SourceryDataModel

struct TranslatedSet: TranslatedType {
    let elementType: TranslatedType

    let sourceType: BetterType
    let converterType: BetterType
    let nodeName: String
    let kotlinName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String? = "kotlin.collections"
    let jniType = JNIType.object("java/util/Set")
    let iotaCTypes = IotaCTypes.hostRef
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let pythonType: PythonClass2.PythonType
    let definingModule = Module.runtime

    init(element: TranslatedType) {
        self.elementType = element
        self.sourceType = .generic(base: .swift("Set"), args: [element.sourceType])
        self.converterType = .generic(base: .runtime("SetConverter"), args: [element.converterType])
        self.nodeName = "Set<\(element.nodeType)>"
        self.kotlinName = "Set<\(element.kotlinPackageQualifiedName)>"
        self.containedNamedTypes = element.containedNamedTypes
        self.cSharpType = .named(package: "System.Collections.Generic", name: "ISet<\(element.cSharpType.name)>")
        self.dartType = .named(package: nil, name: "Set", genericArgs: [element.dartType])
        self.pythonType = .class(module: nil, qualifiedName: "set", genericArgs: [element.pythonType.static])
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>] {
        [
            .type(typeValue: elementType.cSharpType.name),
            .value(
                name: "typeName",
                type: "string"
            ) { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }

    func dartSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<DartClass.DartType>] {
        return [
            .type(typeValue: elementType.dartType),
            .value(name: "typeName", type: .string) { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }

    func pythonSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<PythonClass2.PythonType>] {
        return [
            .value(name: "type_name", type: .str) { fragment in
                fragment.output("string_bag.utf16(\"\(converterType.name)\"),")
            },
            .value(name: "dyn_types", type: elementType.pythonType.metaTypeTuple) { fragment in
                fragment.output("\(elementType.pythonType.dynamicsStringAsTuple),")
            },
        ]
    }
}

import SourceryDataModel

struct TranslatedDictionary: TranslatedType {
    let keyType: TranslatedType
    let valueType: TranslatedType

    let sourceType: BetterType
    let converterType: BetterType
    let nodeName: String
    let kotlinName: String
    let containedNamedTypes: [TranslatedType]
    let kotlinPackage: String? = "kotlin.collections"
    let jniType = JNIType.object("java/util/Map")
    let iotaCTypes = IotaCTypes.hostRef
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let pythonType: PythonType
    let definingModule = Module.runtime

    init(key: TranslatedType, value: TranslatedType) {
        self.keyType = key
        self.valueType = value

        self.sourceType = .generic(base: .swift("Dictionary"), args: [key.sourceType, value.sourceType])
        self.converterType = .generic(base: .runtime("DictionaryConverter"), args: [key.converterType, value.converterType])
        self.nodeName = "Map<\(key.nodeType), \(value.nodeType)>"
        self.kotlinName = "Map<\(key.kotlinPackageQualifiedName), \(value.kotlinPackageQualifiedName)>"
        self.containedNamedTypes = key.containedNamedTypes + value.containedNamedTypes
        self.cSharpType = .named(
            package: "System.Collections.Generic",
            name: "IDictionary<\(key.cSharpType.name), \(value.cSharpType.name)>"
        )
        self.dartType = .named(package: nil, name: "Map", genericArgs: [key.dartType, value.dartType])
        self.pythonType = .class(module: nil, qualifiedName: "dict", genericArgs: [key.pythonType.static, value.pythonType.static])
    }

    func cSharpSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<String>] {
        [
            .type(typeValue: keyType.cSharpType.name),
            .type(typeValue: valueType.cSharpType.name),
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
            .type(typeValue: keyType.dartType),
            .type(typeValue: valueType.dartType),
            .value(name: "typeName", type: .string) { fragment in
                fragment.output("\"\(converterType.name)\",")
            },
        ]
    }

    func pythonSetupParameters(in context: FishyJoesContext) -> [ForeignSetupParameter<PythonType>] {
        return [
            .value(name: "typeName", type: .str) { fragment in
                fragment.output("string_bag.utf16(\"\(converterType.name)\"),")
            },
            .value(name: "dyn_type", type: keyType.pythonType.metaTypeTuple) { fragment in
                fragment.output("\(keyType.pythonType.dynamicsStringAsTuple),")
            },
            .value(name: "dyn_type", type: valueType.pythonType.metaTypeTuple) { fragment in
                fragment.output("\(valueType.pythonType.dynamicsStringAsTuple),")
            },
        ]
    }
}

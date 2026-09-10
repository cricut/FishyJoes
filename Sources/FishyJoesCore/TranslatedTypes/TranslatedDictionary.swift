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
    let cSharpType: CSharpClass.CSType
    let dartType: DartClass.DartType
    let pythonType: PythonClass2.PythonType
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
        self.pythonType = .class(module: nil, name: "dict", genericArgs: [key.pythonType.static, value.pythonType.static])
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

    func pythonRepresentation(in context: PythonTranslationContext) -> PythonRepresentation? {
        guard let key = keyType.pythonRepresentation(in: context.recursingIntoChild()),
              let value = valueType.pythonRepresentation(in: context.recursingIntoChild()),
              let keyConversion = key.conversionDescriptor,
              let valueConversion = value.conversionDescriptor else {
            return nil
        }
        return PythonRepresentation(
            annotation: .container("dict", [key.annotation, value.annotation]),
            cType: "HostObject",
            conversion: "_native.Dictionary(\"\(converterType.name)\", \(keyConversion), \(valueConversion))"
        )
    }
}

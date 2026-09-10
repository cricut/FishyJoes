struct ExternalTranslatedType: Codable {
    var sourceType: BetterType
    var converterType: BetterType
    var nodeName: String
    var kotlinPackage: String?
    var kotlinName: String
    var jniType: JNIType
    var cSharpType: CSharpClass.CSType
    var dartType: DartClass.DartType
    var pythonType: PythonClass2.PythonType
    var isInhabited: Bool
    var definingModule: Module

    internal init(
        sourceType: BetterType,
        converterType: BetterType?,
        nodeName: String,
        kotlinPackage: String?,
        kotlinName: String,
        jniType: JNIType,
        cSharpType: CSharpClass.CSType,
        dartType: DartClass.DartType,
        pythonType: PythonClass2.PythonType,
        isInhabited: Bool,
        definingModule: Module
    ) {
        self.sourceType = sourceType
        self.converterType = converterType ?? sourceType
        self.nodeName = nodeName
        self.kotlinPackage = kotlinPackage
        self.kotlinName = kotlinName
        self.jniType = jniType
        self.cSharpType = cSharpType
        self.dartType = dartType
        self.pythonType = pythonType
        self.isInhabited = isInhabited
        self.definingModule = definingModule
    }
}

extension ExternalTranslatedType: TranslatedType {
    var containedNamedTypes: [TranslatedType] { [] }
    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        []
    }

    func pythonRepresentation(in context: PythonTranslationContext) -> PythonRepresentation? {
        // B1: the annotation is only available for an inhabited external type
        // (the old `pythonType` external branch was gated on `isInhabited`). A
        // non-inhabited external type has no annotation, so it returns `nil`
        // (fail loud) rather than degrading to `Any`. The runtime conversion
        // uses `pythonRuntimeClassName`; the non-runtime conversion uses the
        // external type key — both matching the old `pythonCType`.
        guard isInhabited else {
            return nil
        }
        let conversion: String
        if definingModule == Module.runtime {
            conversion = "_native.ValueType(\"\(context.pythonRuntimeClassName(self))\")"
        } else {
            conversion = "_native.ValueType(\"\(context.pythonExternalTypeKey(self))\")"
        }
        return PythonRepresentation(
            annotation: context.pythonExternalClassType(self),
            cType: "HostObject",
            conversion: conversion
        )
    }
}

extension TranslatedType {
    var asExternal: ExternalTranslatedType {
        ExternalTranslatedType(
            sourceType: sourceType,
            converterType: converterType,
            nodeName: "\(definingModule.name).\(nodeName)",
            kotlinPackage: kotlinPackage,
            kotlinName: kotlinName,
            jniType: jniType,
            cSharpType: cSharpType,
            dartType: dartType,
            pythonType: pythonType,
            isInhabited: isInhabited,
            definingModule: definingModule
        )
    }
}

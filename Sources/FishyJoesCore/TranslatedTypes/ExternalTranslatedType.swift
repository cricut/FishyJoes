struct ExternalTranslatedType: Codable {
    var sourceType: BetterType
    var converterType: BetterType
    var nodeName: String
    var kotlinPackage: String?
    var kotlinName: String
    var jniType: JNIType
    var cSharpType: CSharpClass.CSType
    var dartType: DartClass.DartType
    /// Optional override of the default ``pythonType``.  Set for upstream
    /// runtime types (Foundation: ``AttributedString``,
    /// ``AttributeContainer``, etc.) so that per-module bindings emit
    /// ``from fishyjoes_python import AttributedString`` instead of the
    /// default sibling ``from .AttributedString import AttributedString``.
    /// Optional in Codable so older ``.fishyjoesmodule`` files (produced
    /// before this field existed) decode cleanly with ``nil``.
    var pythonTypeOverride: PythonClass.PyType?
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
        pythonTypeOverride: PythonClass.PyType? = nil,
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
        self.pythonTypeOverride = pythonTypeOverride
        self.isInhabited = isInhabited
        self.definingModule = definingModule
    }
}

extension ExternalTranslatedType: TranslatedType {
    var containedNamedTypes: [TranslatedType] { [] }
    func definitionFragments(in context: FishyJoesContext) -> [SourceFragment] {
        []
    }

    /// Override the protocol-extension default ``pythonType`` so upstream
    /// Foundation types render as ``namedExternal`` (top-of-file
    /// ``from <package> import <name>``) instead of falling through to
    /// the default sibling-import path.  When ``pythonTypeOverride`` is
    /// nil (every non-Foundation external type), use the same default
    /// the protocol extension would have produced.
    var pythonType: PythonClass.PyType {
        if let override = pythonTypeOverride {
            return override
        }
        return .named(module: nil, name: sourceType.name)
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
            pythonTypeOverride: nil,
            isInhabited: isInhabited,
            definingModule: definingModule
        )
    }
}

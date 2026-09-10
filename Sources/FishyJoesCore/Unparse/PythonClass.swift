/// Print out Python classes given inputs from Swift
///
/// The purpose of PythonClass is to be a pretty printer. Logic that could be extracted elsewhere perhaps should be

struct PythonClass {
    let originName: String
    let moduleName: String
    let fileName: String
    let className: String
    let setupName: String?
    let setupKind: SetupKind
    let equalsSymbol: String?
    let hashSymbol: String?
    let isValueHashable: Bool
    let storedFields: [StoredField]
    let enumCases: [EnumCase]
    let fields: [Field]
    let methods: [Method]
    let documentation: [String]

    struct StoredField {
        var pythonName: String
        let cName: String
        let cType: String
        let conversion: String
        let pythonType: PythonType
        let isMutable: Bool
        let documentation: [String]
    }

    enum SetupKind: String, Hashable {
        case `enum`, `protocol`, reference, emptyValue, value
    }

    struct EnumCase {
        var pythonName: String
        let cName: String
        let className: String
        var values: [EnumCaseValue]
        let documentation: [String]
    }

    struct EnumCaseValue {
        var pythonName: String
        let cName: String
        let cType: String
        let conversion: String?
        let pythonType: PythonType
    }

    struct Field {
        var pythonName: String
        /// True when `pythonName` came from a `python:` export attribute; the
        /// name is then emitted verbatim instead of being snake-cased.
        let isExplicitPythonName: Bool
        let cName: String
        let symbol: String
        let setterSymbol: String?
        let isStatic: Bool
        let asMethod: Bool
        let returnType: String
        let returnConversion: String?
        let pythonReturnType: PythonType
        let deprecationMessage: String?
        let originName: String
        let documentation: [String]
    }

    struct Parameter {
        var pythonName: String
        let cName: String
        let cType: String
        let conversion: String?
        let pythonType: PythonType
        let defaultValue: String?
        let defaultValueImports: Set<PythonImport>
    }

    struct DefaultValue {
        let expression: String
        let imports: Set<PythonImport>

        init(expression: String, imports: Set<PythonImport> = []) {
            self.expression = expression
            self.imports = imports
        }
    }

    struct Method {
        var pythonName: String
        /// True when `pythonName` came from a `python:` export attribute; the
        /// name is then emitted verbatim instead of being snake-cased.
        let isExplicitPythonName: Bool
        let cName: String
        let symbol: String
        let isStatic: Bool
        var parameters: [Parameter]
        let returnType: String
        let returnConversion: String?
        let pythonReturnType: PythonType
        let deprecationMessage: String?
        let originName: String
        let documentation: [String]
    }
}

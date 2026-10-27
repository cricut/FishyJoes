import Foundation

struct ModuleInfo: Codable {
    let types: [ExternalTranslatedType]
    let typeScriptAnnotations: TypeScriptAnnotations
    /// Exported typealiases, so that dependent modules can resolve them. Omitted when empty.
    let typealiases: [ExternalTypealias]?
}

struct ExternalTypealias: Codable {
    let name: String
    let type: BetterType
}

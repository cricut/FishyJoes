import Foundation

struct ModuleInfo: Codable {
    let types: [ExternalTranslatedType]
    let typeScriptAnnotations: TypeScriptAnnotations
}

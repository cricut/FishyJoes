import Foundation

public struct ModuleInfo: Codable {
    public let types: [ExternalTranslatedType]
    let typeScriptAnnotations: TypeScriptAnnotations
}

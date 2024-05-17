import Foundation
import SourceryRuntime

struct Field: Hashable {
    let name: String
    let exportAnnotation: ExportAnnotation?

    let type: BetterType

    let documentation: [String]

    var definedIn: BetterType?
    let isStatic: Bool
    let isMutable: Bool
    let isPubliclyWritable: Bool
    let isThrowing: Bool
    let isComputed: Bool
    var isOverride: Bool { exportAnnotation?.isOverride == true }
    let isAsync: Bool
    let deprecation: Deprecation?
    let isDefaultImplementation: Bool

    init?(_ variable: SourceryVariable, type: Type?) {
        self.name = variable.name
        self.exportAnnotation = variable.exportAnnotation
        self.type = variable.typeName.better
        self.documentation = variable.documentation
        self.definedIn = variable.definedInTypeName?.better
        self.isStatic = variable.isStatic
        self.isMutable = variable.isMutable
        self.isThrowing = variable.throws
        self.deprecation = variable.deprecation
        self.isPubliclyWritable =
            variable.isMutable && variable.accessLevel.write == .public
        self.isComputed = variable.isComputed
        self.isDefaultImplementation = variable.definedInType?.isExtension == true

        let isIsolated = type is Actor && !variable.isNonisolated
        self.isAsync = isIsolated || variable.isAsync
    }
}

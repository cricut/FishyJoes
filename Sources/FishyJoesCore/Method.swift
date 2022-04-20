import Foundation
import SourceryRuntime

struct Method: Hashable {
    let name: String
    let callName: String
    let exportAnnotation: ExportAnnotation

    let parameters: [SwiftFormal]
    let returnType: BetterType

    let documentation: [String]

    let definedIn: BetterType?
    let isStatic: Bool
    let isMutating: Bool
    let isInitializer: Bool
    let isThrowing: Bool

    init(
        name: String,
        callName: String? = nil,
        exportAnnotation: ExportAnnotation,
        parameters: [SwiftFormal],
        returnType: BetterType,
        documentation: [String] = [],
        definedIn: BetterType?,
        isStatic: Bool = false,
        isMutating: Bool = false,
        isInitializer: Bool = false,
        isThrowing: Bool = false
    ) {
        self.name = name
        self.callName = callName ?? name
        self.exportAnnotation = exportAnnotation
        self.parameters = parameters
        self.returnType = returnType
        self.documentation = documentation
        self.definedIn = definedIn
        self.isStatic = isStatic
        self.isMutating = isMutating
        self.isInitializer = isInitializer
        self.isThrowing = isThrowing
    }

    init?(_ method: SourceryMethod) {
        guard let exportAnnotation = method.exportAnnotation else { return nil }
        self.name = method.name
        self.callName = method.callName
        self.exportAnnotation = exportAnnotation
        self.returnType = method.returnTypeName.better
        self.documentation = method.documentation
        self.definedIn = method.definedInTypeName?.better
        self.isStatic = method.isStatic
        // SourceryMethod.isMutating seems to be a bit buggy...
        self.isMutating = method.isMutating || method.modifiers.contains(where: { $0.name == "mutating" })
        self.isInitializer = method.isInitializer
        self.isThrowing = method.throws || method.rethrows

        var parameters: [SwiftFormal] = []
        var omitParameters = Set(exportAnnotation.omitParameters)
        for parameter in method.parameters {
            if omitParameters.contains(parameter.name) {
                precondition(parameter.defaultValue != nil, "Can't omit non-default parameter")
                omitParameters.remove(parameter.name)
                continue
            }
            parameters.append(
                SwiftFormal(
                    label: parameter.argumentLabel,
                    name: parameter.name,
                    type: parameter.typeName.better
                )
            )
        }
        precondition(omitParameters.isEmpty, "Can't find parameters \(omitParameters) to omit")
        self.parameters = parameters
    }
}

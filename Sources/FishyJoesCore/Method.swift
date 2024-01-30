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
    let isThrowing: Bool
    let deprecation: Deprecation?

    enum SourceKind: Hashable {
        case method, initializer
        // May be useful in future
        // case getter, setter
    }
    let sourceKind: SourceKind

    init(
        name: String,
        callName: String? = nil,
        exportAnnotation: ExportAnnotation,
        parameters: [SwiftFormal],
        returnType: BetterType,
        documentation: [String] = [],
        definedIn: BetterType?,
        sourceKind: SourceKind = .method,
        isStatic: Bool = false,
        isMutating: Bool = false,
        isThrowing: Bool = false,
        deprecation: Deprecation? = nil
    ) {
        self.name = name
        self.callName = callName ?? name
        self.exportAnnotation = exportAnnotation
        self.parameters = parameters
        self.returnType = returnType
        self.documentation = documentation
        self.definedIn = definedIn
        self.sourceKind = sourceKind
        self.isStatic = isStatic
        self.isMutating = isMutating
        self.isThrowing = isThrowing
        self.deprecation = deprecation
    }

    init?(_ method: SourceryMethod) {
        self.init(method, isProtocolMethod: false)
    }

    init?(_ method: SourceryMethod, isProtocolMethod: Bool = false) {
        guard let exportAnnotation = method.exportAnnotation else { return nil }
        self.name = method.name
        self.callName = method.callName
        self.exportAnnotation = exportAnnotation
        self.returnType = method.returnTypeName.better
        self.documentation = method.documentation
        self.definedIn = method.definedInTypeName?.better
        self.sourceKind = method.isInitializer ? .initializer : .method
        self.isStatic = method.isStatic
        // SourceryMethod.isMutating seems to be a bit buggy...
        self.isMutating = method.isMutating || method.modifiers.contains { $0.name == "mutating" }
        self.isThrowing = method.throws || method.rethrows
        self.deprecation = method.deprecation

        var parameters: [SwiftFormal] = []
        var omitParameters = Set(exportAnnotation.omitParameters)
        var placeholderNum = 1
        for parameter in method.parameters {
            if omitParameters.contains(parameter.name) {
                precondition(parameter.defaultValue != nil, "Can't omit non-default parameter")
                omitParameters.remove(parameter.name)
                continue
            }
            var name = parameter.name
            // If param is for protocol method, we need to put in a placeholder name if the swift param is unnamed, because languages like Dart insist on parameter names for their abstract class methods.
            if isProtocolMethod,
                name.isEmpty {
                name = "placeholder\(placeholderNum)"
                placeholderNum += 1
            }
            parameters.append(
                SwiftFormal(
                    label: parameter.argumentLabel,
                    name: name,
                    type: parameter.typeName.better,
                    defaultValue: parameter.defaultValue
                )
            )
        }
        precondition(omitParameters.isEmpty, "Can't find parameters \(omitParameters) to omit")
        self.parameters = parameters
    }
}

extension Method: CustomStringConvertible {
    var description: String {
        let namespace = definedIn.map { "\($0.name)." } ?? ""
        let params = parameters.map { ($0.label ?? "_") + ":" }.joined()
        return "\(namespace)\(callName)(\(params))"
    }
}

import Foundation
import SourceryRuntime

struct Method: Hashable {
    let name: String
    let callName: String
    let exportAnnotation: ExportAnnotation

    let parameters: [SwiftFormal]
    let returnType: BetterType

    let documentation: [String]

    var definedIn: BetterType?
    let isStatic: Bool
    let isMutating: Bool
    let isThrowing: Bool
    let isAsync: Bool
    let deprecation: Deprecation?
    var implemented: Bool

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
        isAsync: Bool = false,
        deprecation: Deprecation? = nil,
        implemented: Bool = false
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
        self.isAsync = isAsync
        self.deprecation = deprecation
        self.implemented = implemented
    }

    init?(_ method: SourceryMethod, isProtocolDef: Bool) {
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
        self.isAsync = method.isAsync
        self.deprecation = method.deprecation

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
                    name: isProtocolDef ? (parameter.asSource.starts(with: "_ ") ? "" : parameter.name) : parameter.name,
                    type: parameter.typeName.better,
                    defaultValue: parameter.defaultValue
                )
            )
        }
        
        precondition(omitParameters.isEmpty, "Can't find parameters \(omitParameters) to omit")
        self.parameters = parameters
        self.implemented = method.definedInType?.isExtension ?? false
    }

    init?(_ method: SourceryMethod) {
        guard let inst = Method(method, isProtocolDef: false) else {
            return nil
        }
        self = inst
    }
}

extension Method: CustomStringConvertible {
    var description: String {
        let namespace = definedIn.map { "\($0.name)." } ?? ""
        let params = parameters.map { ($0.label ?? "_") + ":" }.joined()
        return "\(namespace)\(callName)(\(params))"
    }
}

extension Method {
    static func javaClassName(_ name: String, in context: FishyJoesContext) -> String {
        "com/cricut/\(context.module.name.lowercased())/\(name.replacingOccurrences(of: ".", with: "$"))"
    }

    func jniSignature(context: FishyJoesContext) -> String {
        var jniSignature = ""
        for parameter in parameters {
            let resolved = context.resolve(type: parameter.type, generics: exportAnnotation.genericOverrides)
            jniSignature += resolved.jniType.asSignature
        }
        let returnType = context.resolve(type: returnType, generics: exportAnnotation.genericOverrides)
        jniSignature = "(\(jniSignature))\(isAsync ? "Lkotlinx/coroutines/Deferred;" : returnType.jniType.asSignature)"
        return jniSignature
    }
}

extension Method {
    func swiftClosureSignature() -> String {
        "(\(parameters.map { $0.type.name}.joined(separator: ", "))) -> \(returnType.name)"
    }
}

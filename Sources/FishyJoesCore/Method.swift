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
    let protocolName: String?
    let isDefaultImplementation: Bool

    enum SourceKind: Hashable {
        case method, initializer
        // May be useful in future
        // case getter, setter
    }
    let sourceKind: SourceKind

    init?(_ method: SourceryMethod, type: Type?, isDefaultImplementation: Bool, protocolName: String?) {
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

        let isIsolated = type is Actor && !method.isNonisolated && !method.isInitializer
        self.isAsync = isIsolated || method.isAsync

        var parameters: [SwiftFormal] = []
        var omitParameters = Set(exportAnnotation.omitParameters)

        var unnamedParamCnt = 0
        for parameter in method.parameters {
            if omitParameters.contains(parameter.name) {
                precondition(parameter.defaultValue != nil, "Can't omit non-default parameter")
                omitParameters.remove(parameter.name)
                continue
            }
            var paramName = parameter.name
            if paramName.isEmpty {
                paramName = "_\(unnamedParamCnt)"
                unnamedParamCnt += 1
            }

            parameters.append(
                SwiftFormal(
                    label: parameter.argumentLabel,
                    name: paramName,
                    type: parameter.typeName.better,
                    defaultValue: parameter.defaultValue
                )
            )
        }

        precondition(omitParameters.isEmpty, "Can't find parameters \(omitParameters) to omit")
        self.parameters = parameters
        self.protocolName = protocolName
        self.isDefaultImplementation = isDefaultImplementation
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
    func isMostlyEqual(other: Method) -> Bool {
        name == other.name &&
        callName == other.callName &&
        exportAnnotation == other.exportAnnotation &&
        parameters == other.parameters &&
        returnType == other.returnType &&
        documentation == other.documentation &&
        definedIn == other.definedIn &&
        isStatic == other.isStatic &&
        isMutating == other.isMutating &&
        isThrowing == other.isThrowing &&
        isAsync == other.isAsync &&
        deprecation == other.deprecation
    }

    enum MethodTypePreference {
        case defaultImplementation
        case normal
    }

    static func methodsPreferring(_ preference: MethodTypePreference, methods: [Method]) -> [Method] {
        var preferredMethods = [Method]()
        for method in methods {
            let mostlyEqualMethods = preferredMethods.filter {
                return $0.isMostlyEqual(other: method)
            }
            if !mostlyEqualMethods.isEmpty {
                for mostlyEqualMethod in mostlyEqualMethods {
                    let useMostlyEqualMethod = preference == .defaultImplementation ? mostlyEqualMethod.isDefaultImplementation : !mostlyEqualMethod.isDefaultImplementation

                    if useMostlyEqualMethod {
                        guard let index = preferredMethods.firstIndex(of: method) else {
                            assertionFailure("method should exist in preferredMethods")
                            continue
                        }
                        preferredMethods.remove(at: index)
                        preferredMethods.insert(mostlyEqualMethod, at: index)
                    } else { // use method
                        guard let index = preferredMethods.firstIndex(of: mostlyEqualMethod) else {
                            assertionFailure("mostlyEqualMethod should exist in preferredMethods")
                            continue
                        }
                        preferredMethods.remove(at: index)
                        preferredMethods.insert(method, at: index)
                    }
                }
            } else {
                preferredMethods.append(method)
            }
        }
        return preferredMethods
    }

    static func methods(type: Type) -> [Method] {
        var defaultMethods = [Method]()
        let protocols = type.implements.values.compactMap { $0 as? SourceryProtocol }
        for prot in protocols {
            defaultMethods.append(contentsOf: prot.defaultMethods().compactMap { Method($0.sourceryMethod, type: prot, isDefaultImplementation: $0.isDefaultImplementation, protocolName: prot.name) })
        }

        let isDefinedInProtocol = type is SourceryProtocol
        let protocolName = isDefinedInProtocol ? type.name : nil
        let normalMethods = type.methods.map {
            SourceryMethodPlus(sourceryMethod: $0, isDefinedInProtocol: isDefinedInProtocol)
        }.compactMap {
            Method($0.sourceryMethod, type: type, isDefaultImplementation: $0.isDefaultImplementation, protocolName: protocolName)
        }

        let methods = Method.methodsPreferring(.normal, methods: normalMethods + defaultMethods)
        return methods
    }
}

extension Method {
    func swiftClosureSignature() -> String {
        "(\(parameters.map { $0.type.name}.joined(separator: ", ")))\(isAsync ? " async" : "")\(isThrowing ? " throws" : "") -> \(returnType.name)"
    }
}

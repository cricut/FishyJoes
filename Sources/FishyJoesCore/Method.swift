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
        // name may differ
        let callNameMatches = callName == other.callName
        // exportAnnotations may differ

        var parametersMatches = parameters.count == other.parameters.count
        zip(parameters, other.parameters).forEach {
            parametersMatches = parametersMatches && $0.isMostlyEqual(other: $1)
        }

        let returnTypeMatches = returnType == other.returnType
        // documentation may differ
        // definedIn may differ
        let isStaticMatches = isStatic == other.isStatic
        let isMutatingMatches = isMutating == other.isMutating
        let isThrowingMatches = isThrowing == other.isThrowing
        let isAsyncMatches = isAsync == other.isAsync
        // deprecation may differ
        
        return callNameMatches &&
        parametersMatches &&
        returnTypeMatches &&
        isStaticMatches &&
        isMutatingMatches &&
        isThrowingMatches &&
        isAsyncMatches
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
                    var useMostlyEqualMethod = preference == .defaultImplementation ? mostlyEqualMethod.isDefaultImplementation : !mostlyEqualMethod.isDefaultImplementation

                    if method.isDefaultImplementation && mostlyEqualMethod.isDefaultImplementation {
                        // Needed to handle case where we have two mostly equal methods but one of them has argument labels but no parameter names and the other does have parameter names; in this case we want to favor the method with the parameter names, which will necessarily have a longer name because it includes the argument labels and the parameter names.
                        // https://docs.swift.org/swift-book/documentation/the-swift-programming-language/functions#Function-Argument-Labels-and-Parameter-Names
                        // "Each function parameter has both an argument label and a parameter name. The argument label is used when calling the function; each argument is written in the function call with its argument label before it. The parameter name is used in the implementation of the function. By default, parameters use their parameter name as their argument label."
                        useMostlyEqualMethod = method.name.count < mostlyEqualMethod.name.count
                    }

                    if useMostlyEqualMethod {
                        guard let index = preferredMethods.firstIndex(of: method) else {
                            // method is not already in preferredMethods, therefore no need to replace it with mostlyEqualMethod. To get here, mostlyEqualMethod must already be part of preferredMethods.
                            continue
                        }
                        preferredMethods.remove(at: index)
                        preferredMethods.insert(mostlyEqualMethod, at: index)
                    } else { // use method
                        guard let index = preferredMethods.firstIndex(of: mostlyEqualMethod) else {
                            // mostlyEqualMethod is not already in preferredMethods, therefore no need to replace it with mostlyEqualMethod. To get here, method must already be part of preferredMethods.
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
            let protDefaultMethods = prot.rawMethods.compactMap {
                if $0.definedInType?.isExtension == true {
                    return Method($0, type: prot, isDefaultImplementation: true, protocolName: prot.name)
                } else {
                    return nil
                }
            }

            defaultMethods.append(contentsOf: protDefaultMethods)
        }

        // Needed because type.method.definedIn may not be a SourceryProtocol even when it ought to be, but type will be a SourceryProtocol so we can use that instead.
        let isDefinedInProtocol = type is SourceryProtocol
        let protocolName = isDefinedInProtocol ? type.name : nil
        let normalMethods = type.rawMethods.compactMap {
            let isDefaultImplementation = isDefinedInProtocol && ($0.definedInType?.isExtension == true)
            return Method($0, type: type, isDefaultImplementation: isDefaultImplementation, protocolName: protocolName)
        }

        let methods = Method.methodsPreferring(isDefinedInProtocol ? .defaultImplementation : .normal, methods: normalMethods + defaultMethods)
        return methods//.sorted(by: { $0.name < $1.name })
    }
}

extension Method {
    func swiftClosureSignature() -> String {
        "(\(parameters.map { $0.type.name}.joined(separator: ", ")))\(isAsync ? " async" : "")\(isThrowing ? " throws" : "") -> \(returnType.name)"
    }
}

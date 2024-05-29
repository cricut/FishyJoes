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

    init?(_ variable: SourceryVariable, type: Type?, isDefaultImplementation: Bool) {
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
        self.isDefaultImplementation = isDefaultImplementation

        let isIsolated = type is Actor && !variable.isNonisolated
        self.isAsync = isIsolated || variable.isAsync
    }
}

extension Field {
    func isMostlyEqual(other: Field) -> Bool {
        let nameMatches = name == other.name
        // exportAnnotation may differ
        let typeMatches = type == other.type
        // documentation may differ
        // definedIn may differ
        let isStaticMatches = isStatic == other.isStatic
        let isMutableMatches = isMutable == other.isMutable
        let isPubliclyWritableMatches = isPubliclyWritable == other.isPubliclyWritable
        let isThrowingMatches = isThrowing == other.isThrowing
        // isComputed may differ
        // isOverride may differ
        let isAsyncMatches = isAsync == other.isAsync
        // deprecation may differ
        // isDefaultImplementation may differ

        return nameMatches &&
        typeMatches &&
        isStaticMatches &&
        isMutableMatches &&
        isPubliclyWritableMatches &&
        isThrowingMatches &&
        isAsyncMatches
    }
    
    enum FieldTypePreference {
        case defaultImplementation
        case normal
    }
    
    static func fieldsPreferring(_ preference: FieldTypePreference, fields: [Field]) -> [Field] {
        var preferredFields = [Field]()
        for field in fields {
            let mostlyEqualFields = preferredFields.filter {
                return $0.isMostlyEqual(other: field)
            }
            if !mostlyEqualFields.isEmpty {
                for mostlyEqualField in mostlyEqualFields {
                    let useMostlyEqualField = preference == .defaultImplementation ? mostlyEqualField.isDefaultImplementation : !mostlyEqualField.isDefaultImplementation

                    if useMostlyEqualField {
                        guard let index = preferredFields.firstIndex(of: field) else {
                            assertionFailure("field should exist in preferredFields")
                            continue
                        }
                        preferredFields.remove(at: index)
                        preferredFields.insert(mostlyEqualField, at: index)
                    } else { // use field
                        guard let index = preferredFields.firstIndex(of: mostlyEqualField) else {
                            assertionFailure("mostlyEqualField should exist in preferredFields")
                            continue
                        }
                        preferredFields.remove(at: index)
                        preferredFields.insert(field, at: index)
                    }
                }
            } else {
                preferredFields.append(field)
            }
        }
        return preferredFields
    }

    static func fields(type: Type) -> [Field] {
        var defaultFields = [Field]()
        let protocols = type.implements.values.compactMap { $0 as? SourceryProtocol }
        for prot in protocols {
            let protDefaultFields = prot.rawVariables.compactMap {
                if $0.definedInType?.isExtension == true {
                    return Field($0, type: prot, isDefaultImplementation: true)
                } else {
                    return nil
                }
            }

            defaultFields.append(contentsOf: protDefaultFields)
        }

        let isDefinedInProtocol = type is SourceryProtocol
        let normalFields = type.variables.compactMap {
            let isDefaultImplementation = type is SourceryProtocol && $0.definedInType?.isExtension == true
            return Field($0, type: type, isDefaultImplementation: isDefaultImplementation)
        }

        let fields = Field.fieldsPreferring(.normal, fields: normalFields + defaultFields)
        return fields.sorted(by: { $0.name < $1.name })
    }
}

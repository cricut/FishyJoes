import Foundation
import SourceryDataModel

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

    init?(_ variable: SourceryVariable, inType containingType: SourceryType?, context: FishyJoesContext) {
        self.name = variable.name
        self.exportAnnotation = variable.exportAnnotation
        self.type = variable.typeName.better
        self.documentation = variable.documentation
        self.definedIn = variable.definedInTypeName?.better
        self.isStatic = variable.isStatic
        self.isMutable = variable.isMutable
        self.isThrowing = variable.isThrowing
        self.deprecation = variable.deprecation
        self.isPubliclyWritable =
            variable.isMutable && variable.writeAccessLevel == .public
        self.isComputed = variable.isComputed
        self.isDefaultImplementation =
            containingType?.kind == .protocol &&
            variable.definedInTypeName.flatMap { context.sourceryTypes[$0] }?.kind == .extension

        let isIsolated = containingType?.kind == .actor && !variable.isNonisolated
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
        // isMutable may differ
        // isPubliclyWritable may differ
        // isThrowing may differ
        // isComputed may differ
        // isOverride may differ
        let isAsyncMatches = isAsync == other.isAsync
        // deprecation may differ
        // isDefaultImplementation may differ

        return nameMatches &&
        typeMatches &&
        isStaticMatches &&
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
                            // field is not already in preferredFields, therefore no need to replace it with mostlyEqualField. To get here, mostlyEqualField must already be part of preferredFields.
                            continue
                        }
                        preferredFields.remove(at: index)
                        preferredFields.insert(mostlyEqualField, at: index)
                    } else { // use field
                        guard let index = preferredFields.firstIndex(of: mostlyEqualField) else {
                            // mostlyEqualField is not already in preferredFields, therefore no need to replace it with mostlyEqualField. To get here, field must already be part of preferredFields.
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

    static func fields(type: SourceryType, context: FishyJoesContext) -> [Field] {
        var defaultFields = [Field]()
        let protocols = type.implements
            .compactMap { context.sourceryTypes[$0] }
            .filter { $0.kind == .protocol }
        for prot in protocols {
            let protDefaultFields: [Field] = prot.rawVariables.compactMap { field in
                if field.definedInTypeName.flatMap({ context.sourceryTypes[$0]?.kind }) == .extension {
                    return Field(field, inType: prot, context: context)
                } else {
                    return nil
                }
            }

            defaultFields.append(contentsOf: protDefaultFields)
        }

        let normalFields = type.rawVariables.compactMap {
            return Field($0, inType: type, context: context)
        }

        let isDefinedInProtocol = type.kind == .protocol
        let fields = Field.fieldsPreferring(isDefinedInProtocol ? .defaultImplementation : .normal, fields: normalFields + defaultFields)
        return fields.sorted(by: { $0.name < $1.name })
    }
}

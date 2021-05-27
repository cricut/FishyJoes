struct SwiftFormal {
    let label: String?
    let name: String
    let type: TranslatedType

    // func someMethod(label name: CType, ...)
    //                 ^~~~~~~~~~~~~~~~~
    var asSwiftFormals: [String] {
        type.asFormals(label: label ?? "_", name: name).formals.map(\.asSwiftFormal)
    }

    // name.bridgeFromC.someMethod(...)
    // ^~~~~~~~~~~~~~~~
    var asSwiftExpression: String {
        type.asFormals(label: label ?? "_", name: name).expression
    }

    // someFunction(label: value.bridgeFromC, ...)
    //              ^~~~~~~~~~~~~~~~~~~~~~~~
    var asSwiftLabeledArgument: String {
        (label.map { "\($0): " } ?? "") + asSwiftExpression
    }

    var cFacingFormals: [CFacingFormal] {
        type.asFormals(label: label ?? "_", name: name).formals
    }
}

struct CFacingFormal {
    let label: String?
    let name: String
    let cType: String

    var asSwiftFormal: String {
        (name == label ? "" : "\(label ?? "_") ") + "\(name): \(cType)"
    }

    var asSwiftLabeledArgument: String {
        (label.map { "\($0): " } ?? "") + name
    }
}

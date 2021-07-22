struct SwiftFormal {
    let label: String?
    let name: String
    let type: TranslatedType

    // func someMethod(label name: CType, ...)
    //                 ^~~~~~~~~~~~~~~~~
    var asSwiftFormal: String {
        let labelText = label == name ? "" : ((label ?? "_") + " ")
        return "\(labelText)\(type.sourceType.name)"
    }
}

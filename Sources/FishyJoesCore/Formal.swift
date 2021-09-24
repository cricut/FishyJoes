struct SwiftFormal {
    let label: String?
    let name: String
    let type: BetterType
    let defaultValue: String?

    init(label: String?, name: String, type: BetterType, defaultValue: String? = nil) {
        self.label = label
        self.name = name
        self.type = type
        self.defaultValue = defaultValue
    }

    // func someMethod(label name: CType = default, ...)
    //                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
    var asSwiftFormal: String {
        let labelText = label == name ? "" : ((label ?? "_") + " ")
        let defaultText = defaultValue.map { " = \($0)" } ?? ""
        return "\(labelText)\(type.name)\(defaultText)"
    }
}

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
}

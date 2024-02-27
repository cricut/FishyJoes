struct SwiftFormal: Hashable {
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

extension SwiftFormal {
    var labelAndName: String {
        var paramStr = ""
        if let label = label {
            if label != name {
                paramStr += label + " "
            }
        } else {
            paramStr += "_ "
        }
        paramStr += name
        return paramStr
    }
}

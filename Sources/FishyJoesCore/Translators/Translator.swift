protocol Translator {
    func setupFragments(context: FishyJoesContext, generatedTypes: [BetterType]) -> [SourceFragment]
}

extension Translator {
    func literal(value: String) -> String? {
        if let int = Int(value) {
            return "\(int)"
        }
        if let double = Double(value) {
            return "\(double)"
        }
        switch value {
        case "Double.ulpOfOne.squareRoot()":
            return "1.4901161193847656E-8"
        case "Int8.min":
            return String(Int8.min)
        case "Int8.max":
            return String(Int8.max)
        case "Int16.min":
            return String(Int16.min)
        case "Int16.max":
            return String(Int16.max)
        case "Int32.min":
            return String(Int32.min)
        case "Int32.max":
            return String(Int32.max)
        case "Int64.min":
            return String(Int64.min)
        case "Int64.max":
            return String(Int64.max)
        case "Int.min":
            return String(Int.min)
        case "Int.max":
            return String(Int.max)
        case "UInt8.min":
            return String(UInt8.min)
        case "UInt8.max":
            return String(UInt8.max)
        case "UInt16.min":
            return String(UInt16.min)
        case "UInt16.max":
            return String(UInt16.max)
        case "UInt32.min":
            return String(UInt32.min)
        case "UInt32.max":
            return String(UInt32.max)
        case "UInt64.min":
            return String(UInt64.min)
        case "UInt64.max":
            return String(UInt64.max)
        case "UInt.min":
            return String(UInt.min)
        case "UInt.max":
            return String(UInt.max)
        case "true", "false":
            return value
        default:
            return nil
        }
    }
}

import Foundation

/// <!-- FishyJoes.export(EmptyEnum) -->
public enum EmptyEnum: Hashable {
    /// <!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->
    public static func notGoingToHappen() throws -> EmptyEnum {
        throw NotImportantError()
    }

    private struct NotImportantError: Error {}
}

/// <!-- FishyJoes.export(SimpleEnum) -->
public enum SimpleEnum: Int, Hashable {
    case red, green, blue

    /// <!-- FishyJoes.export(pickAColor) -->
    public static func pickAColor(_ rawValue: Int) -> SimpleEnum? {
        SimpleEnum(rawValue: rawValue)
    }

    /// <!-- FishyJoes.export(hex) -->
    public var hex: Int {
        switch self {
        case .red: return 0xff0000
        case .green: return 0x00ff00
        case .blue: return 0x0000ff
        }
    }
}

/// <!-- FishyJoes.export(AssociatedDataEnum) -->
public enum AssociatedDataEnum: Hashable {
    case thing(value: Int)
    case other(_ unnamed: String, Int)
    indirect case bar(named: String, AssociatedDataEnum)

    /// <!-- FishyJoes.export(intValue) -->
    public var intValue: Int {
        switch self {
        case .thing(let value), .other(_, let value):
            return value
        case .bar(named: _, let nested):
            return nested.intValue + 3
        }
    }

    /// <!-- FishyJoes.export(plus) -->
    public func plus(_ other: AssociatedDataEnum) -> AssociatedDataEnum {
        switch self {
        case .thing(let value):
            return .thing(value: value + other.intValue)
        case .other(let name, let value):
            return .other(name, value + other.intValue)
        case .bar(let name, let nested):
            return .bar(named: name, nested.plus(other))
        }
    }
}

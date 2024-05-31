import Foundation

/// <!-- FishyJoes.export(EmptyEnum) -->
public enum EmptyEnum: Hashable {
    /// <!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->
    public static func notGoingToHappen() throws -> EmptyEnum {
        throw NotImportantError()
    }

    private struct NotImportantError: Error {}

    /// <!-- FishyJoes.export(noot) -->
    public static var noot: Int {
        54546
    }
    /// <!-- FishyJoes.export(mies) -->
    public static func mies() throws -> Int {
        62645
    }
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

    /// <!-- FishyJoes.export(hexMethod) -->
    public func hexMethod() -> String {
        "\(hex)"
    }

    /// <!-- FishyJoes.export(favoriteColor) -->
    public static var favoriteColor = SimpleEnum.blue

    /// <!-- FishyJoes.export(resetFavoriteColor) -->
    public static func resetFavoriteColor() {
        favoriteColor = .blue
    }
}

/// <!-- FishyJoes.export(AssociatedDataEnum) -->
public enum AssociatedDataEnum: Hashable {
    case thing(value: Int)
    case other(_ unnamed: String, Int)
    indirect case bar(named: String, AssociatedDataEnum)
    case noValue
    case simpleEnum(value: SimpleEnum)

    /// <!-- FishyJoes.export(staticThing) -->
    public static let staticThing = AssociatedDataEnum.thing(value: 2)

    /// <!-- FishyJoes.export(intValue) -->
    public var intValue: Int {
        switch self {
        case .thing(let value), .other(_, let value):
            return value
        case .bar(named: _, let nested):
            return nested.intValue + 3
        case .noValue:
            return 42
        case .simpleEnum:
            return 1
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
        case .noValue:
            return .noValue
        case .simpleEnum(let value):
            return .simpleEnum(value: value)
        }
    }
}

import Foundation

/// <!-- FishyJoes.export(EmptyEnum) -->
public enum EmptyEnum: Hashable {
    /// <!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->
    public static func notGoingToHappen() throws -> EmptyEnum {
        throw NotImportantError()
    }

    private struct NotImportantError: Error {}

    /// <!-- FishyJoes.export(aStaticProperty) -->
    public static var aStaticProperty: Int {
        54546
    }

    /// <!-- FishyJoes.export(aStaticMethod) -->
    public static func aStaticMethod() throws -> Int {
        62645
    }
}

/// <!-- FishyJoes.export(ReferenceEmptyEnum) -->
public enum ReferenceEmptyEnum: Hashable {
    /// <!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->
    public static func notGoingToHappen() throws -> ReferenceEmptyEnum {
        throw NotImportantError()
    }

    private struct NotImportantError: Error {}

    /// <!-- FishyJoes.export(aStaticProperty) -->
    public static var aStaticProperty: Int {
        5
    }

    /// <!-- FishyJoes.export(aStaticMethod) -->
    public static func aStaticMethod() -> Int {
        6
    }
}

/// This is an enum with no associated values
/// <!-- FishyJoes.export(SimpleEnum) -->
public enum SimpleEnum: Int, Hashable {
    /// red is a nice color
    case red
    case green
    /// blue is less good
    /// opinions may vary
    case blue

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
    /// Documentation about thing
    case thing(value: Int)
    case other(_ unnamed: String, Int)
    /// Documentation about bar
    indirect case bar(named: String, AssociatedDataEnum, toggled: Bool)
    /// Documentation about noValue
    case noValue
    case none
    case simpleEnum(value: SimpleEnum)

    /// <!-- FishyJoes.export(staticThing) -->
    public static let staticThing = AssociatedDataEnum.thing(value: 2)

    /// <!-- FishyJoes.export(intValue) -->
    public var intValue: Int {
        switch self {
        case .thing(let value), .other(_, let value):
            return value
        case .bar(named: _, let nested, _):
            return nested.intValue + 3
        case .noValue, .none:
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
        case .bar(let name, let nested, let toggled):
            return .bar(named: name, nested.plus(other), toggled: toggled)
        case .noValue:
            return .noValue
        case .none:
            return .none
        case .simpleEnum(let value):
            return .simpleEnum(value: value)
        }
    }
}

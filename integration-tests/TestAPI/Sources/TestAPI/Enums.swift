import Foundation

/// <!-- FishyJoes.export(SimpleEnum) -->
public enum SimpleEnum {
    case red, blue

    /// <!-- FishyJoes.export(testFuncCall) -->
    public func testFuncCall(x: Int, y: Int) -> Int{
        print("does this print x:\(x) y:\(y) self: \(self)?")
        return x + y
    }
}

/// <!-- FishyJoes.export(AssociatedDataEnum) -->
public enum AssociatedDataEnum: Hashable {
    case thing(value: Int)
//    case other(_ unnamed: String, Int)
//    indirect case bar(named: String, AssociatedDataEnum)
    case noValue
//    case simpleEnum(value: SimpleEnum)

    /// <!-- FishyJoes.export(staticThing) -->
    public static let staticThing = AssociatedDataEnum.thing(value: 2)

    /// <!-- FishyJoes.export(intValue) -->
    public var intValue: Int {
        switch self {
        case .thing(let value):
            return value
//        case .thing(let value), .other(_, let value):
//            return value
//        case .bar(named: _, let nested):
//            return nested.intValue + 3
        case .noValue:
            return 42
//        case .simpleEnum:
//            return 1
        }
    }

    /// <!-- FishyJoes.export(plus) -->
    public func plus(_ other: AssociatedDataEnum) -> AssociatedDataEnum {
        switch self {
        case .thing(let value):
            return .thing(value: value + other.intValue)
//        case .other(let name, let value):
//            return .other(name, value + other.intValue)
//        case .bar(let name, let nested):
//            return .bar(named: name, nested.plus(other))
        case .noValue:
            return .noValue
//        case .simpleEnum(let value):
//            return .simpleEnum(value: value)
        }
    }
}

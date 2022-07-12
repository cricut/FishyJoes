public protocol Defaultable {
    static var `default`: Self { get }
}

extension Optional: Defaultable { public static var `default`: Self { nil } }

extension UInt: Defaultable { public static let `default`: Self = 0 }
extension Int: Defaultable { public static let `default`: Self = 0 }
extension UInt8: Defaultable { public static let `default`: Self = 0 }
extension Int8: Defaultable { public static let `default`: Self = 0 }
extension Int16: Defaultable { public static let `default`: Self = 0 }
extension UInt16: Defaultable { public static let `default`: Self = 0 }
extension Int32: Defaultable { public static let `default`: Self = 0 }
extension UInt32: Defaultable { public static let `default`: Self = 0 }
extension Int64: Defaultable { public static let `default`: Self = 0 }
extension UInt64: Defaultable { public static let `default`: Self = 0 }
extension Float: Defaultable { public static let `default`: Self = 0 }
extension Double: Defaultable { public static let `default`: Self = 0 }

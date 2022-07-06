public protocol Default {
    static var `default`: Self { get }
}

extension Optional: Default { public static var `default`: Self { nil } }

extension UInt: Default { public static let `default`: Self = 0 }
extension Int: Default { public static let `default`: Self = 0 }
extension UInt8: Default { public static let `default`: Self = 0 }
extension Int8: Default { public static let `default`: Self = 0 }
extension Int16: Default { public static let `default`: Self = 0 }
extension UInt16: Default { public static let `default`: Self = 0 }
extension Int32: Default { public static let `default`: Self = 0 }
extension UInt32: Default { public static let `default`: Self = 0 }
extension Int64: Default { public static let `default`: Self = 0 }
extension UInt64: Default { public static let `default`: Self = 0 }
extension Float: Default { public static let `default`: Self = 0 }
extension Double: Default { public static let `default`: Self = 0 }

public protocol Default {
    static var `default`: Self { get }
}

extension Int: Default { public static let `default`: Self = 0 }
extension Int32: Default { public static let `default`: Self = 0 }
extension UInt8: Default { public static let `default`: Self = 0 }
extension Double: Default { public static let `default`: Self = .nan }
extension Optional: Default { public static var `default`: Self { nil } }

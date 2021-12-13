public protocol Default {
    static var `default`: Self { get }
}

extension jboolean: Default { public static let `default`: Self = 0 }
extension jbyte: Default { public static let `default`: Self = 0 }
extension jshort: Default { public static let `default`: Self = 0 }
extension jint: Default { public static let `default`: Self = 0 }
extension jlong: Default { public static let `default`: Self = 0 }
extension jfloat: Default { public static let `default`: Self = 0 }
extension jdouble: Default { public static let `default`: Self = 0 }
extension Optional: Default { public static var `default`: Self { nil } }

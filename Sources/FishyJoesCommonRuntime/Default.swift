public protocol Default {
    static var `default`: Self { get }
}

extension Optional: Default { public static var `default`: Self { nil } }

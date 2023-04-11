import Foundation

public struct BoxTypeError: Error {
    public let message: String
}

public struct Box<T> {
    public let box: AnyBox

    @inline(__always)
    public var value: T {
        get {
            // This could fail, since we're providing a pointer interface
            box.value as! T
        }
        nonmutating set {
            box.value = newValue
        }
        nonmutating _modify {
            defer { _fixLifetime(self) }
            var value = withUnsafeMutablePointer(to: &box.value) { valuePointer in
                valuePointer.move() as! T
            }
            defer {
                withUnsafeMutablePointer(to: &box.value) { valuePointer in
                    valuePointer.initialize(to: value)
                }
            }
            yield &value
        }
    }

    public init(_ value: T) {
        box = AnyBox(value)
    }

    public init(inner box: AnyBox) throws {
        guard box.value is T else {
            throw BoxTypeError(message: "expected type \(T.self), got \(box.value) of type \(type(of: box.value))")
        }
        self.box = box
    }

    public func retainedOpaque() -> UnsafeMutableRawPointer {
        box.retainedOpaque()
    }

    public static func releaseOpaque(_ pointer: UnsafeMutableRawPointer?) {
        AnyBox.releaseOpaque(pointer)
    }

    public static func takeUnretainedOpaque(_ pointer: UnsafeMutableRawPointer) throws -> Box<T> {
        try Box(inner: AnyBox.takeUnretainedOpaque(pointer))
    }

    public static func takeRetainedOpaque(_ pointer: UnsafeMutableRawPointer) throws -> Box<T> {
        try Box(inner: AnyBox.takeRetainedOpaque(pointer))
    }

    public func callAsFunction<Argument, Result>(_ arg: Argument) throws -> Result where T == ((Argument) throws -> Result) {
        try value(arg)
    }
}

public final class AnyBox {
    public var value: Any
    public init(_ value: Any) {
        self.value = value
    }

    public func retainedOpaque() -> UnsafeMutableRawPointer {
        let pointer = Unmanaged<AnyBox>.passRetained(self).toOpaque()
        // print("retained: \(pointer)")
        return pointer
    }

    public static func releaseOpaque(_ pointer: UnsafeMutableRawPointer?) {
        guard let pointer = pointer else { return }
        // print("releasing: \(pointer)")
        Unmanaged<AnyBox>.fromOpaque(pointer).release()
    }

    public static func takeUnretainedOpaque(_ pointer: UnsafeMutableRawPointer) -> AnyBox {
        Unmanaged<AnyBox>.fromOpaque(pointer).takeUnretainedValue()
    }

    public static func takeRetainedOpaque(_ pointer: UnsafeMutableRawPointer) -> AnyBox {
        Unmanaged<AnyBox>.fromOpaque(pointer).takeRetainedValue()
    }
}

public struct UncheckedSendableBox<T>: @unchecked Sendable {
    public let box: Box<T>

    public var value: T {
        get {
            box.value
        }
        nonmutating set {
            box.value = newValue
        }
        nonmutating _modify {
            defer { _fixLifetime(self) }
            yield &box.value
        }
    }

    public init(_ value: T) {
        box = Box(value)
    }

    public init(inner box: Box<T>) {
        self.box = box
    }

    public init(inner box: AnyBox) throws {
        self.box = try Box(inner: box)
    }

    public func retainedOpaque() -> UnsafeMutableRawPointer {
        box.retainedOpaque()
    }

    public static func releaseOpaque(_ pointer: UnsafeMutableRawPointer?) {
        AnyBox.releaseOpaque(pointer)
    }

    public static func takeUnretainedOpaque(_ pointer: UnsafeMutableRawPointer) throws -> Box<T> {
        try Box(inner: AnyBox.takeUnretainedOpaque(pointer))
    }

    public static func takeRetainedOpaque(_ pointer: UnsafeMutableRawPointer) throws -> Box<T> {
        try Box(inner: AnyBox.takeRetainedOpaque(pointer))
    }

    public func callAsFunction<Argument, Result>(_ arg: Argument) throws -> Result where T == ((Argument) throws -> Result) {
        try value(arg)
    }
}

import Foundation

public struct BoxTypeError: Error {
    public let message: String
}

public struct Box<T> {
    public let box: AnyBox

    public var value: T {
        get {
            // This could fail, since we're providing a pointer interface
            box.value as! T
        }
        nonmutating set {
            box.value = newValue
        }
    }

    public init(_ value: T) {
        box = AnyBox(value)
    }

    public init(inner box: AnyBox) throws {
        guard box.value is T else {
            throw BoxTypeError(message: "expected \(T.self), got \(type(of: box.value)): \(box.value)")
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
}

public class AnyBox {
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
}

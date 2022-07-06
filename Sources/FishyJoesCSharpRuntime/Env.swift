@_exported import FishyJoesCommonRuntime
import Foundation

public typealias csObject = OpaquePointer?
public typealias csOutExn = UnsafeMutablePointer<csObject>

public struct CSharpException: Error {
    var exception: csObject
}

@_cdecl("FJRuntimeEnvSetup")
func Env_setupGCPin(
    pinFn: @escaping Env.PinFn,
    unpinFn: @escaping Env.UnpinFn,
    newErrorFn: @escaping Env.NewErrorFn
) {
    Env.pinFn = pinFn
    Env.unpinFn = unpinFn
    Env.newErrorFn = newErrorFn
}

public enum Env {
    public typealias PinFn = @convention(c) (csObject, _ exn: csOutExn) -> Void
    public typealias UnpinFn = @convention(c) (csObject, _ exn: csOutExn) -> Void
    public typealias NewErrorFn = @convention(c) (UnsafePointer<CChar>) -> csObject

    fileprivate static var pinFn: PinFn!
    fileprivate static var unpinFn: UnpinFn!
    fileprivate static var newErrorFn: NewErrorFn!

    public static func expectNull(_ object: csObject) throws {
        if let exception = object {
            throw CSharpException(exception: exception)
        }
    }

    public static func nonNull<R>(_ value: R?) throws -> R {
        guard let value = value else {
            throw NullPointerError()
        }
        return value
    }

    public static func pin(object: csObject) throws -> csObject {
        try check { exn in pinFn(object, exn) }
        return object
    }

    public static func unpin(object: csObject) throws -> csObject {
        try check { exn in pinFn(object, exn) }
        return object
    }

    public static func check<R>(_ body: (_ exn: csOutExn) throws -> R) throws -> R {
        var exn: csObject = nil
        let result = try body(&exn)
        if let exn = exn {
            throw CSharpException(exception: exn)
        }
        return result
    }

    public static func catching(to pointer: csOutExn, _ body: () throws -> Void) {
        do {
            try body()
        } catch let exception as CSharpException {
            pointer.pointee = exception.exception
        } catch let exception {
            pointer.pointee = "\(exception)".withCString(newErrorFn)
        }
    }

    public static func catching<R: Default>(to pointer: csOutExn, _ body: () throws -> R) -> R {
        var result: R?
        catching(to: pointer) {
            result = try body()
        }
        return result ?? .default
    }
}

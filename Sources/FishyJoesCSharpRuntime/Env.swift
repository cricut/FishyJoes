@_exported import FishyJoesCommonRuntime
import Foundation

public typealias csObject = OpaquePointer?

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
    typealias PinFn = @convention(c) (csObject, _ exn: UnsafeMutablePointer<csObject>) -> Void
    typealias UnpinFn = @convention(c) (csObject, _ exn: UnsafeMutablePointer<csObject>) -> Void
    typealias NewErrorFn = @convention(c) (UnsafePointer<CChar>) -> csObject

    fileprivate static var pinFn: PinFn!
    fileprivate static var unpinFn: UnpinFn!
    fileprivate static var newErrorFn: NewErrorFn!

    static func expectNull(_ object: csObject) throws {
        if let exception = object {
            throw CSharpException(exception: exception)
        }
    }

    static func nonNull<R>(_ value: R?) throws -> R {
        guard let value = value else {
            throw NullPointerError()
        }
        return value
    }

    static func pin(object: csObject) throws -> csObject {
        try check { exn in pinFn(object, exn) }
        return object
    }

    static func unpin(object: csObject) throws -> csObject {
        try check { exn in pinFn(object, exn) }
        return object
    }

    static func check<R>(_ body: (_ exn: UnsafeMutablePointer<csObject>) throws -> R) throws -> R {
        var exn: csObject = nil
        let result = try body(&exn)
        if let exn = exn {
            throw CSharpException(exception: exn)
        }
        return result
    }

    static func catching(to pointer: UnsafeMutablePointer<csObject>, _ body: () throws -> Void) {
        do {
            try body()
        } catch let exception as CSharpException {
            pointer.pointee = exception.exception
        } catch let exception {
            pointer.pointee = "\(exception)".withCString(newErrorFn)
        }
    }

    @_disfavoredOverload
    static func catching<R: Default>(to pointer: UnsafeMutablePointer<csObject>, _ body: () throws -> R) -> R {
        var result: R?
        catching(to: pointer) {
            result = try body()
        }
        return result ?? .default
    }
}

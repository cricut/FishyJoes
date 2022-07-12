@_exported import FishyJoesCommonRuntime
import Foundation

public typealias csObject = OpaquePointer?
public typealias csOutExn = UnsafeMutablePointer<csObject>

public struct CSharpException: Error {
    var exception: CSharpReference
}

@_cdecl("FJRuntimeEnvSetup")
func Env_setupGCPin(
    newRefFn: @escaping Env.NewRefFn,
    deleteRefFn: @escaping Env.DeleteRefFn,
    newErrorFn: @escaping Env.NewErrorFn
) {
    Env.newRefFn = newRefFn
    Env.deleteRefFn = deleteRefFn
    Env.newErrorFn = newErrorFn
}

public enum Env {
    public typealias NewRefFn = @convention(c) (csObject) -> csObject
    public typealias DeleteRefFn = @convention(c) (csObject) -> Void
    public typealias NewErrorFn = @convention(c) (UnsafePointer<CChar>) -> csObject

    fileprivate static var newRefFn: NewRefFn!
    fileprivate static var deleteRefFn: DeleteRefFn!
    fileprivate static var newErrorFn: NewErrorFn!

    public static func nonNull<R>(_ value: R?) throws -> R {
        guard let value = value else {
            throw NullPointerError()
        }
        return value
    }

    public static func newRef(_ object: csObject) -> csObject {
        newRefFn(object)
    }

    public static func deleteRef(_ object: csObject) {
        deleteRefFn(object)
    }

    public static func check<R>(_ body: (_ exn: csOutExn) throws -> R) throws -> R {
        var exn: csObject = nil
        let result = try body(&exn)
        if let exn = exn {
            throw CSharpException(exception: CSharpReference(take: exn))
        }
        return result
    }

    public static func catching(to pointer: csOutExn, _ body: () throws -> Void) {
        do {
            try body()
            pointer.pointee = nil
        } catch let exception as CSharpException {
            pointer.pointee = newRef(exception.exception.object)
        } catch let exception {
            pointer.pointee = "\(exception)".withCString(newErrorFn)
        }
    }

    public static func catching<R: Defaultable>(to pointer: csOutExn, _ body: () throws -> R) -> R {
        var result: R?
        catching(to: pointer) {
            result = try body()
        }
        return result ?? .default
    }
}

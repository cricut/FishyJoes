@_exported import FishyJoesCommonRuntime
import Foundation

public typealias csObject = OpaquePointer?
public typealias csOutExn = UnsafeMutablePointer<csObject>

public typealias TypeID = Int

public struct IotaException: Error {
    var exception: IotaReference
}

@_cdecl("FishyJoesRuntime_Env_setup")
public func Env_setupGCPin(
    newRefFn: @escaping Env.NewRefFn,
    deleteRefFn: @escaping Env.DeleteRefFn,
    newErrorFn: @escaping Env.NewErrorFn
) {
    Env.newRefFn = newRefFn
    Env.deleteRefFn = deleteRefFn
    Env.newErrorFn = newErrorFn
}

@_cdecl("FishyJoesRuntime_getTypeID")
public func Env_getTypeID(name: UnsafePointer<unichar>) -> TypeID {
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeIDsByName[name] else {
        fatalError("Couldn't find FishyJoes type id for '\(name)'")
    }
    return typeID
}

public enum Env {
    public typealias NewRefFn = @convention(c) (csObject) -> csObject
    public typealias DeleteRefFn = @convention(c) (csObject) -> Void
    public typealias NewErrorFn = @convention(c) (UnsafePointer<UInt16>) -> csObject

    fileprivate static var newRefFn: NewRefFn?
    fileprivate static var deleteRefFn: DeleteRefFn?
    fileprivate static var newErrorFn: NewErrorFn?

    fileprivate static var typeIDsByObject: [ObjectIdentifier: TypeID] = [:]
    public private(set) static var typeIDsByID: [TypeID: ObjectIdentifier] = [:]
    public private(set) static var typeIDsByName: [String: TypeID] = [:]

    private static var nextTypeID: TypeID = 0
    private static func newTypeID() -> TypeID {
        defer { nextTypeID += 1 }
        return nextTypeID
    }

    public static func registerType<T>(_ type: T.Type, as name: String) {
        let objectID = ObjectIdentifier(type)
        guard typeIDsByObject[objectID] == nil else { return }
        let typeID = newTypeID()
        typeIDsByObject[objectID] = typeID
        typeIDsByID[typeID] = objectID
        typeIDsByName[name] = typeID
    }

    public static func unwrap<R>(_ value: R?, file: StaticString = #file, line: UInt = #line) throws -> R {
        guard let value = value else {
            var message = ["\(file):\(line): Unexpected null"]
            Thread.callStackSymbols.forEach { message.append($0) }
            throw NullPointerError(message: message.joined(separator: "\n"))
        }
        return value
    }

    public static func newRef(_ object: csObject) -> csObject {
        newRefFn!(object)
    }

    public static func deleteRef(_ object: csObject) {
        deleteRefFn!(object)
    }

    public static func check<R>(_ body: (_ exn: csOutExn) throws -> R) throws -> R {
        var exn: csObject = nil
        let result = try body(&exn)
        if let exn = exn {
            throw IotaException(exception: IotaReference(take: exn))
        }
        return result
    }

    public static func catching(to pointer: csOutExn, _ body: () throws -> Void) {
        do {
            try body()
            pointer.pointee = nil
        } catch let exception as IotaException {
            pointer.pointee = newRef(exception.exception.object)
        } catch let exception {
            var utf16Message = Array("\(exception)".utf16)
            utf16Message.append(0)
            pointer.pointee = utf16Message.withUnsafeBufferPointer { newErrorFn!($0.baseAddress!) }
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

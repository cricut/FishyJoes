@_exported import FishyJoesCommonRuntime
import Foundation

public typealias foreignObject = OpaquePointer?
public typealias foreignOutExn = UnsafeMutablePointer<foreignObject>

public typealias TypeID = Int
public typealias EnvRef = UnsafeMutableRawPointer

public struct IotaException: Error {
    var exception: IotaReference
}

@_cdecl("FishyJoesCommonRuntime_Env_setup")
public func Env_setupGCPin(
    newRefFn: @escaping Env.NewRefFn,
    deleteRefFn: @escaping Env.DeleteRefFn,
    newErrorFn: @escaping Env.NewErrorFn
) -> EnvRef {
    let env = Env(
        newRefFn: newRefFn,
        deleteRefFn: deleteRefFn,
        newErrorFn: newErrorFn
    )

    // Register generic types that the runtime makes use of
    Env.registerType(RangeConverter<AttributedString.Index>.self, as: "RangeConverter<Foundation.AttributedString.Index>")
    Env.registerType(RangeConverter<AttributedString.Runs.Index>.self, as: "RangeConverter<Foundation.AttributedString.Runs.Index>")
    Env.registerType(ClosedRangeConverter<AttributedString.Index>.self, as: "ClosedRangeConverter<Foundation.AttributedString.Index>")
    Env.registerType(ClosedRangeConverter<AttributedString.Runs.Index>.self, as: "ClosedRangeConverter<Foundation.AttributedString.Runs.Index>")

    return env.id
}

@_cdecl("FishyJoesCommonRuntime_getTypeID")
public func Env_getTypeID(name: UnsafePointer<unichar>) -> TypeID {
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeID(name: name) else {
        fatalError("Couldn't find FishyJoes type id for '\(name)'")
    }
    return typeID
}

public struct Env {
    // A dummy pointer to uniquely identify each Dart isolate.
    // There should probably be only one of these in C#.
    public let id: EnvRef

    public init(_ id: EnvRef) {
        self.id = id
    }

    public typealias NewRefFn = @convention(c) (foreignObject) -> foreignObject
    public typealias DeleteRefFn = @convention(c) (foreignObject) -> Void
    public typealias NewErrorFn = @convention(c) (UnsafePointer<UInt16>) -> foreignObject

    public static let staticLock = NSRecursiveLock()

    public static var newRefHandle = CallbackMap<NewRefFn>()
    public static var deleteRefHandle = CallbackMap<DeleteRefFn>()
    public static var newErrorHandle = CallbackMap<NewErrorFn>()

    public static func withLock<R>(_ body: () throws -> R) rethrows -> R {
        staticLock.lock()
        defer { staticLock.unlock() }
        return try body()
    }

    fileprivate init(
        newRefFn: @escaping NewRefFn,
        deleteRefFn: @escaping DeleteRefFn,
        newErrorFn: @escaping NewErrorFn
    ) {
        Env.staticLock.lock()
        defer { Env.staticLock.unlock() }

        id = malloc(1)!
        Env.newRefHandle[self] = newRefFn
        Env.deleteRefHandle[self] = deleteRefFn
        Env.newErrorHandle[self] = newErrorFn
    }

    private static var _typeIDsByObject: [ObjectIdentifier: TypeID] = [:]
    private static var _objectIDsByID: [TypeID: ObjectIdentifier] = [:]
    private static var _typeIDsByName: [String: TypeID] = [:]

    public static func typeID(object: AnyObject) -> TypeID? {
        withLock {
            _typeIDsByObject[ObjectIdentifier(object)]
        }
    }
    public static func objectID(typeID: TypeID) -> ObjectIdentifier? {
        withLock {
            _objectIDsByID[typeID]
        }
    }
    public static func typeID(name: String) -> TypeID? {
        withLock {
            _typeIDsByName[name]
        }
    }

    private static var nextUniqueID: TypeID = 0
    private static func newUniqueID() -> Int {
        withLock {
            defer { nextUniqueID += 1 }
            return nextUniqueID
        }
    }

    public static func registerType<T>(_ type: T.Type, as name: String) {
        let typeID = newUniqueID()
        withLock {
            let objectID = ObjectIdentifier(type)
            guard _typeIDsByObject[objectID] == nil else { return }
            _typeIDsByObject[objectID] = typeID
            _objectIDsByID[typeID] = objectID
            _typeIDsByName[name] = typeID
        }
    }

    public static func unwrap<R>(_ value: R?, file: StaticString = #file, line: UInt = #line) throws -> R {
        guard let value = value else {
            var message = ["\(file):\(line): Unexpected null"]
            Thread.callStackSymbols.forEach { message.append($0) }
            throw NullPointerError(message: message.joined(separator: "\n"))
        }
        return value
    }

    public func newRef(_ object: foreignObject) -> foreignObject {
        Env.newRefHandle[self](object)
    }

    public func deleteRef(_ object: foreignObject) {
        Env.deleteRefHandle[self](object)
    }

    public func check<R>(_ body: (_ exn: foreignOutExn) throws -> R) throws -> R {
        var exn: foreignObject = nil
        let result = try body(&exn)
        if let exn = exn {
            throw IotaException(exception: IotaReference(take: exn, env: self))
        }
        return result
    }

    public func catching(to pointer: foreignOutExn, _ body: () throws -> Void) {
        do {
            try body()
            pointer.pointee = nil
        } catch let exception as IotaException {
            pointer.pointee = newRef(exception.exception.object)
        } catch let exception {
            var utf16Message = Array("\(exception)".utf16)
            utf16Message.append(0)
            pointer.pointee = utf16Message.withUnsafeBufferPointer { Env.newErrorHandle[self]($0.baseAddress!) }
        }
    }

    public func catching<R: Defaultable>(to pointer: foreignOutExn, _ body: () throws -> R) -> R {
        var result: R?
        catching(to: pointer) {
            result = try body()
        }
        return result ?? .default
    }
}

extension Env {
    public struct CallbackMap<T> {
        let debugLocation: String
        private let callbacks: Box<[EnvRef: T]> = Box([:])

        public init(file: StaticString = #file, line: UInt = #line) {
            debugLocation = "\(file):\(line)"
        }

        public subscript(env: Env) -> T! {
            _read {
                Env.staticLock.lock()
                defer { Env.staticLock.unlock() }
                yield callbacks.value[env.id]
            }
            nonmutating _modify {
                Env.staticLock.lock()
                defer { Env.staticLock.unlock() }
                yield &callbacks.value[env.id]
            }
        }

        public subscript(env: Env, default defaultValue: @autoclosure () -> T) -> T {
            _read {
                Env.staticLock.lock()
                defer { Env.staticLock.unlock() }
                yield callbacks.value[env.id, default: defaultValue()]
            }
            nonmutating _modify {
                Env.staticLock.lock()
                defer { Env.staticLock.unlock() }
                yield &callbacks.value[env.id, default: defaultValue()]
            }
        }

        public func isInitialized(_ env: Env) -> Bool {
            Env.staticLock.lock()
            defer { Env.staticLock.unlock() }
            return callbacks.value[env.id] != nil
        }
    }
}

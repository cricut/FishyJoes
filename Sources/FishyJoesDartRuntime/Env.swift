@_exported import FishyJoesCommonRuntime
import Foundation
import DartSDK

@_exported import FishyJoesCommonRuntime
import Foundation

public typealias foreignObject = OpaquePointer?
public typealias foreignOutExn = UnsafeMutablePointer<foreignObject>

public typealias TypeID = Int
public typealias EnvRef = UnsafeMutableRawPointer

public struct DartException: Error {
    var exception: DartReference
}

@_cdecl("FishyJoesRuntime_Env_setup")
public func Env_setupGCPin(
    newRefFn: @escaping Env.NewRefFn,
    deleteRefFn: @escaping Env.DeleteRefFn,
    newErrorFn: @escaping Env.NewErrorFn
) -> EnvRef {
    Env(
        newRefFn: newRefFn,
        deleteRefFn: deleteRefFn,
        newErrorFn: newErrorFn
    ).id
}

@_cdecl("FishyJoesRuntime_getTypeID")
public func Env_getTypeID(name: UnsafePointer<unichar>) -> TypeID {
    let name = String(decodingCString: name, as: Unicode.UTF16.self)
    guard let typeID = Env.typeID(name: name) else {
        fatalError("Couldn't find FishyJoes type id for '\(name)'")
    }
    return typeID
}

public struct Env {
    // A dummy pointer to uniquely identify each Dart isolate
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

    fileprivate init(
        newRefFn: NewRefFn,
        deleteRefFn: DeleteRefFn,
        newErrorFn: NewErrorFn
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
        staticLock.withLock {
            _typeIDsByObject[ObjectIdentifier(object)]
        }
    }
    public static func objectID(typeID: TypeID) -> ObjectIdentifier? {
        staticLock.withLock {
            _objectIDsByID[typeID]
        }
    }
    public static func typeID(name: String) -> TypeID? {
        staticLock.withLock {
            _typeIDsByName[name]
        }
    }

    private static var nextUniqueID: TypeID = 0
    private static func newUniqueID() -> Int {
        staticLock.withLock {
            defer { nextUniqueID += 1 }
            return nextUniqueID
        }
    }

    public static func registerType<T>(_ type: T.Type, as name: String) {
        let typeID = newUniqueID()
        staticLock.withLock {
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
            throw DartException(exception: DartReference(take: exn, env: self))
        }
        return result
    }

    public func catching(to pointer: foreignOutExn, _ body: () throws -> Void) {
        do {
            try body()
            pointer.pointee = nil
        } catch let exception as DartException {
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
    public struct SynchronizedDictionary<Key: Hashable, Value>: ExpressibleByDictionaryLiteral {
        private var _backing: [Key: Value]

        public init(dictionaryLiteral elements: (Key, Value)...) {
            _backing = Dictionary(uniqueKeysWithValues: elements)
        }

        public subscript(key: Key) -> Value? {
            _read {
                Env.staticLock.lock()
                defer { Env.staticLock.unlock() }
                yield _backing[key]
            }
            _modify {
                Env.staticLock.lock()
                defer { Env.staticLock.unlock() }
                yield &_backing[key]
            }
        }

        public subscript(key: Key, default defaultValue: @autoclosure () -> Value) -> Value {
            _read {
                Env.staticLock.lock()
                defer { Env.staticLock.unlock() }
                yield _backing[key, default: defaultValue()]
            }
            _modify {
                Env.staticLock.lock()
                defer { Env.staticLock.unlock() }
                yield &_backing[key, default: defaultValue()]
            }
        }
    }

    public struct CallbackMap<T> {
        let debugLocation: String
        private var callbacks: Dictionary<EnvRef, T> = [:]

        public init(file: StaticString = #file, line: UInt = #line) {
            debugLocation = "\(file):\(line)"
        }

        public subscript(env: Env) -> T! {
            _read {
                Env.staticLock.lock()
                defer { Env.staticLock.unlock() }
                yield callbacks[env.id]
            }
            _modify {
                Env.staticLock.lock()
                defer { Env.staticLock.unlock() }
                yield &callbacks[env.id]
            }
        }

        public func isInitialized(_ env: Env) -> Bool {
            Env.staticLock.lock()
            defer { Env.staticLock.unlock() }
            return callbacks[env.id] != nil
        }
    }
}

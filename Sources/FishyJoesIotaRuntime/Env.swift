@_exported import FishyJoesCommonRuntime
import Foundation

// TODO (refactor): capitalize these types
public typealias foreignObject = OpaquePointer?
public typealias foreignOutExn = UnsafeMutablePointer<foreignObject>

public typealias TypeID = Int
public typealias EnvRef = UnsafeMutableRawPointer

public struct IotaException: Error {
    public let description: String
    public let exception: IotaReference

    public init(consuming exception: foreignObject, env: Env) {
        self.description = env.describe(iota: exception)
        self.exception = IotaReference(take: exception, env: env)
    }
}

@_cdecl("FishyJoesCommonRuntime_Env_setup")
public func Env_setupGCPin(
    newRefFn: @escaping Env.NewRefFn,
    deleteRefFn: @escaping Env.DeleteRefFn,
    newErrorFn: @escaping Env.NewErrorFn,
    describeFn: @escaping Env.DescribeFn,
    scheduleThreadWorkFn: @escaping Env.ScheduleThreadWorkFn
) -> EnvRef {
    let env = Env(
        newRefFn: newRefFn,
        deleteRefFn: deleteRefFn,
        newErrorFn: newErrorFn,
        describeFn: describeFn,
        scheduleThreadWorkFn: scheduleThreadWorkFn
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

@_cdecl("FishyJoesCommonRuntime_runScheduledWork")
public func Env_runScheduledWork(
    envRef: EnvRef,
    context: UnsafeMutableRawPointer,
    exn: foreignOutExn
) {
    let env = Env(envRef)
    env.catching(to: exn) {
        let thunkBox = try Box<() -> Void>.takeRetainedOpaque(context)
        thunkBox.value()
    }
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
    public typealias DescribeFn = @convention(c) (foreignObject) -> UnsafeMutableRawPointer?
    public typealias ScheduleThreadWorkFn = @convention(c) (EnvRef, UnsafeMutableRawPointer) -> Void

    public static let staticLock = NSRecursiveLock()

    public static var newRefHandle = CallbackMap<NewRefFn>()
    public static var deleteRefHandle = CallbackMap<DeleteRefFn>()
    public static var newErrorHandle = CallbackMap<NewErrorFn>()
    public static var describeHandle = CallbackMap<DescribeFn>()
    public static var scheduleThreadWorkHandle = CallbackMap<ScheduleThreadWorkFn>()

    public static var dartSendPort = CallbackMap<Int64>()

    public static func withLock<R>(_ body: () throws -> R) rethrows -> R {
        staticLock.lock()
        defer { staticLock.unlock() }
        return try body()
    }

    static let envThreadDictionaryKey = "fishyjoes_iotaEnv"

    fileprivate init(
        newRefFn: @escaping NewRefFn,
        deleteRefFn: @escaping DeleteRefFn,
        newErrorFn: @escaping NewErrorFn,
        describeFn: @escaping DescribeFn,
        scheduleThreadWorkFn: @escaping ScheduleThreadWorkFn
    ) {
        Env.staticLock.lock()
        defer { Env.staticLock.unlock() }

        id = malloc(1)!
        Env.newRefHandle[self] = newRefFn
        Env.deleteRefHandle[self] = deleteRefFn
        Env.newErrorHandle[self] = newErrorFn
        Env.describeHandle[self] = describeFn
        Env.scheduleThreadWorkHandle[self] = scheduleThreadWorkFn
    }

    private static var _typeIDsByObject: [ObjectIdentifier: TypeID] = [:]
    private static var _objectIDsByID: [TypeID: ObjectIdentifier] = [:]
    private static var _typeIDsByName: [String: TypeID] = [:]

    public static func typeID(type: Any.Type) -> TypeID? {
        withLock {
            _typeIDsByObject[ObjectIdentifier(type)]
        }
    }
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

    public func newError(_ swiftError: Error) -> foreignObject {
        if let iotaException = swiftError as? IotaException {
            // print("rethrowing iota exception \(iotaException.description)")
            return newRef(iotaException.exception.object)
        } else {
            let utf16Message = Array("\(swiftError)".utf16) + [0]
            return utf16Message.withUnsafeBufferPointer {
                Env.newErrorHandle[self]($0.baseAddress!)
            }
        }
    }

    public func describe(iota obj: foreignObject) -> String {
        guard let utf8 = Env.describeHandle[self](obj) else { return "<null description>" }
        defer { free(utf8) }
        return String(cString: utf8.assumingMemoryBound(to: CChar.self))
    }

    public func check<R>(_ body: (_ exn: foreignOutExn) throws -> R) throws -> R {
        var exn: foreignObject = nil
        let result = try body(&exn)
        if let exn = exn {
            throw IotaException(consuming: exn, env: self)
        }
        return result
    }

    public func catching(to pointer: foreignOutExn, _ body: () throws -> Void) {
        // Stashing the environment in the thread dictionary isn't needed to catch errors, but it's a common entry point.
        // The environment is stored so that `syncOnThread` can know when it's safe to execute immediately
        let originalEnvOfThread = Thread.current.threadDictionary[Env.envThreadDictionaryKey]
        Thread.current.threadDictionary[Env.envThreadDictionaryKey] = self
        defer { Thread.current.threadDictionary[Env.envThreadDictionaryKey] = originalEnvOfThread }

        do {
            try body()
            pointer.pointee = nil
        } catch {
            pointer.pointee = newError(error)
        }
    }

    public func catching<R: Defaultable>(to pointer: foreignOutExn, _ body: () throws -> R) -> R {
        var result: R?
        catching(to: pointer) {
            result = try body()
        }
        return result ?? .default
    }

    private func dispatchToThread(body: @escaping () -> Void) {
        Env.scheduleThreadWorkHandle[self](id, Box(body).retainedOpaque())
    }

    public func onThread(body: @escaping () -> Void) {
        let envOfThread = Thread.current.threadDictionary[Env.envThreadDictionaryKey] as? Env
        if envOfThread?.id == self.id {
            body()
        } else {
            dispatchToThread(body: body)
        }
    }

    /// Perform an operation on the isolate thread and wait for the result.
    /// WARNING: easy to deadlock with this function. Prefer `onThread` whenever possible
    public func syncOnThread<R>(body: @escaping () throws -> R) throws -> R {
        let envOfThread = Thread.current.threadDictionary[Env.envThreadDictionaryKey] as? Env
        if envOfThread?.id == self.id {
            return try body()
        } else {
            let semaphore = DispatchSemaphore(value: 0)
            var result: Result<R, any Error>?
            dispatchToThread {
                do {
                    result = .success(try body())
                    semaphore.signal()
                } catch {
                    result = .failure(error)
                    semaphore.signal()
                }
            }
            semaphore.wait()
            return try result!.get()
        }
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

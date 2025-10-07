@_exported import FishyJoesCommonRuntime
import Foundation
#if canImport(Python)
import Python
#endif

// Python FFI types
public typealias PyObjectPtr = OpaquePointer?
public typealias PyOutExn = UnsafeMutablePointer<PyObjectPtr>

public typealias TypeID = Int
public typealias EnvRef = UnsafeMutableRawPointer

public struct PythonException: Error {
    public let description: String
    public let pythonObject: PythonReference

    public init(consuming pythonError: PyObjectPtr, env: Env) {
        self.description = env.describe(python: pythonError)
        self.pythonObject = PythonReference(take: pythonError, env: env)
    }
}

@_cdecl("FishyJoesPythonRuntime_Env_setup")
public func Env_setupPython(
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

@_cdecl("FishyJoesPythonRuntime_getTypeID")
public func Env_getTypeID(name: UnsafePointer<CChar>) -> TypeID {
    let name = String(cString: name)
    guard let typeID = Env.typeID(name: name) else {
        fatalError("Couldn't find FishyJoes type id for '\(name)'")
    }
    return typeID
}

@_cdecl("FishyJoesPythonRuntime_runScheduledWork")
public func Env_runScheduledWork(
    envRef: EnvRef,
    context: UnsafeMutableRawPointer,
    exn: PyOutExn
) {
    let env = Env(envRef)
    env.catching(to: exn) {
        let thunkBox = try Box<() -> Void>.takeRetainedOpaque(context)
        thunkBox.value()
    }
}

public struct Env {
    // A unique pointer to identify each Python interpreter/environment
    public let id: EnvRef

    public init(_ id: EnvRef) {
        self.id = id
    }

    public typealias NewRefFn = @convention(c) (PyObjectPtr) -> PyObjectPtr
    public typealias DeleteRefFn = @convention(c) (PyObjectPtr) -> Void
    public typealias NewErrorFn = @convention(c) (UnsafePointer<CChar>) -> PyObjectPtr
    public typealias DescribeFn = @convention(c) (PyObjectPtr) -> UnsafeMutableRawPointer?
    public typealias ScheduleThreadWorkFn = @convention(c) (EnvRef, UnsafeMutableRawPointer) -> Void

    public static let staticLock = NSRecursiveLock()

    public static var newRefHandle = CallbackMap<NewRefFn>()
    public static var deleteRefHandle = CallbackMap<DeleteRefFn>()
    public static var newErrorHandle = CallbackMap<NewErrorFn>()
    public static var describeHandle = CallbackMap<DescribeFn>()
    public static var scheduleThreadWorkHandle = CallbackMap<ScheduleThreadWorkFn>()

    public static func withLock<R>(_ body: () throws -> R) rethrows -> R {
        staticLock.lock()
        defer { staticLock.unlock() }
        return try body()
    }

    static let envThreadDictionaryKey = "fishyjoes_pythonEnv"

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

    public func newRef(_ object: PyObjectPtr) -> PyObjectPtr {
        Env.newRefHandle[self](object)
    }

    public func deleteRef(_ object: PyObjectPtr) {
        Env.deleteRefHandle[self](object)
    }

    public func newError(_ swiftError: Error) -> PyObjectPtr {
        if let pythonException = swiftError as? PythonException {
            return newRef(pythonException.pythonObject.object)
        } else {
            let errorMessage = "\(swiftError)"
            return errorMessage.withCString {
                Env.newErrorHandle[self]($0)
            }
        }
    }

    public func describe(python obj: PyObjectPtr) -> String {
        guard let utf8 = Env.describeHandle[self](obj) else { return "<null description>" }
        defer { free(utf8) }
        return String(cString: utf8.assumingMemoryBound(to: CChar.self))
    }

    public func check<R>(_ body: (_ exn: PyOutExn) throws -> R) throws -> R {
        var exn: PyObjectPtr = nil
        let result = try body(&exn)
        if let exn = exn {
            throw PythonException(consuming: exn, env: self)
        }
        return result
    }

    public func catching(to pointer: PyOutExn, _ body: () throws -> Void) {
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

    public func catching<R: Defaultable>(to pointer: PyOutExn, _ body: () throws -> R) -> R {
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

    /// Perform an operation on the Python thread and wait for the result.
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

import Foundation
import NodeAPI

public struct JSException: Error {
    public let message: String

    public init(message: String) {
        self.message = message
    }
}

public struct MalformedURLError: Error {
    public let message: String

    public init(message: String) {
        self.message = message
    }
}

// Node has already recorded an exception. Let it propigate.
public struct JSExceptionPending: Error {}

func debug(file: StaticString = #file, line: UInt = #line, _ msgs: Any? ...) {
    let message = "\(file):\(line): " + msgs.map { "\($0 ?? "<null>")" }.joined(separator: " ") + "\n" + "\n"
    _ = message.withCString { fputs($0, stderr) }
}

public func callbackBody(
    _ env: napi_env!,
    _ info: napi_callback_info!,
    name: String,
    expectedArgumentCount: Int,
    hasNamedOptions: Bool = false,
    _ body: (_ env: CallbackEnv) throws -> NAPI.Value?
) -> napi_value? {
    let env = CallbackEnv(
        env: NAPI.Env(ptr: env),
        napiInfo: .init(ptr: info),
        name: name,
        expectedArgumentCount: expectedArgumentCount,
        hasNamedOptions: hasNamedOptions
    )
    return rethrowToNode(env: env.env) {
        try body(env)
    }
}

public func rethrowToNode(env: NAPI.Env, _ body: () throws -> NAPI.Value?) -> napi_value? {
    do {
        return try body()?.ptr
    } catch is JSExceptionPending {
        // let js deal with the exception
        return nil
    } catch let e {
        debug("Caught swift error \(e). Re-throwing to node.")
        try? env.throw(String.toNode(e.localizedDescription, env: env))
        return nil
    }
}

/// Forward a callback through swift and javascript async/await.
///
/// - Important: This is for forwarding of callbacks and shouldn't be directly called in an async function body because it then cannot capture arguments before being invoked.
/// Instead ``callbackBody(_:_:name:expectedArgumentCount:hasNamedOptions:_:)`` should be used in main function bodies.
public func asyncCallbackBody(
    _ env: napi_env!,
    _ info: napi_callback_info!,
    name: String,
    expectedArgumentCount: Int,
    hasNamedOptions: Bool = false,
    _ body: @escaping (_ env: CallbackEnv) async throws -> NAPI.Value?
) -> napi_value? {
    let env = CallbackEnv(
        env: NAPI.Env(ptr: env),
        napiInfo: .init(ptr: info),
        name: name,
        expectedArgumentCount: expectedArgumentCount,
        hasNamedOptions: hasNamedOptions
    )
    return asyncRethrowToNode(env: env.env) {
        try await body(env)
    }
}

extension Result where Failure == any Error {
    static func `async`(catching: () async throws -> Success) async -> Self {
        do {
            return .success(try await catching())
        } catch {
            return .failure(error)
        }
    }
}

public func asyncRethrowToNode(env: NAPI.Env, _ body: @escaping () async throws -> NAPI.Value?) -> napi_value? {
    do {
        let (deferred, promise) = try env.createPromise()
        Task {
            let result = await Result.async { try await body() }
            try! onMainThread { env in
                do {
                    if let value = try result.get() {
                        try env.resolveDeferred(deferred, value)
                    } else {
                        try env.rejectDeferred(deferred, env.getUndefined())
                    }
                } catch is JSExceptionPending {
                    // let js deal with the exception
                    // is this right?
                    try env.rejectDeferred(deferred, env.getUndefined())
                } catch let e {
                    debug("Caught swift error \(e). Re-throwing to node.")
                    try? env.rejectDeferred(deferred, String.toNode(e.localizedDescription, env: env))
                }
            }
        }
        return promise.ptr
    } catch {
        try? env.throw(String.toNode(error.localizedDescription, env: env))
        return nil
    }
}

public func mergeDefinitionInto(env: NAPI.Env, module: NAPI.Value, path: String, nodeClass: NAPI.Value) throws {
    var namespace = path.split(separator: ".").map(String.init)
    let name = namespace.last!
    _ = namespace.popLast()

    func findNamespace<S: Collection>(object: NAPI.Value, parts: S) throws -> NAPI.Value where S.Element == String {
        guard let name = parts.first else {
            return object
        }
        var property = try env.getNamedProperty(object, name)

        if try nodeIsUndefiend(property, env: env) {
            property = try env.createObject()
            try env.setNamedProperty(object, name, property)
        }

        return try findNamespace(object: property, parts: parts.dropFirst())
    }
    let namespaceObject = try findNamespace(object: module, parts: namespace)

    let existingObject = try env.getNamedProperty(namespaceObject, name)
    if try !nodeIsUndefiend(existingObject, env: env) {
        // Object.assign(nodeClass, existingObject)
        let global = try env.getGlobal()
        let object = try env.getNamedProperty(global, "Object")
        let assign = try env.getNamedProperty(object, "assign")

        _ = try env.callFunction(global, assign, [nodeClass, existingObject])
    }

    try env.setNamedProperty(namespaceObject, name, nodeClass)
}

public func nodeDescribe(_ value: NAPI.Value?, env: NAPI.Env) throws -> String {
    guard let value = value else {
        return "<nil>"
    }
    return try String.fromNode(env.coerceToString(value), env: env)
}

public func nodeError(_ error: Error, env: NAPI.Env) throws -> NAPI.Value {
    let message: String
    if let error = error as? JSException {
        // TODO: store a napi_reference inside JSException and pass without stringifying
        message = error.message
    } else {
        message = error.localizedDescription
    }
    return try env.createError(NAPI.Value(ptr: nil), String.toNode(message, env: env))
}

public func nodeIsUndefiend(_ value: NAPI.Value, env: NAPI.Env) throws -> Bool {
    return try env.typeof(value) == napi_undefined
}

public func nodeIterate(_ iterator: NAPI.Value, env: NAPI.Env, _ body: (NAPI.Value) throws -> Void) throws {
    let nextMethod = try env.getNamedProperty(iterator, "next")
    while true {
        let result = try env.callFunction(iterator, nextMethod, [])
        guard try !env.getValueBool(env.getNamedProperty(result, "done")) else {
            return
        }
        try body(env.getNamedProperty(result, "value"))
    }
}

private enum JSMainThread {
    #if !os(WASI)
    static var thread: Thread?
    #endif
    static var env: NAPI.Env?
    static var dispatchFunction: NAPI.ThreadsafeFunction?

    static var envIfAlreadyOnMain: NAPI.Env? {
        #if !os(WASI)
        guard thread == Thread.current else { return nil }
        #endif
        return env
    }
}

public func setupOnMainThreadEntryPoint(env: NAPI.Env) throws {
    guard JSMainThread.dispatchFunction == nil else {
        return
    }
    #if !os(WASI)
    JSMainThread.thread = Thread.current
    #endif
    JSMainThread.env = env
    JSMainThread.dispatchFunction = try env.createThreadsafeFunction(
        asyncResourceName: String.toNode("_mainThreadFunction", env: env),
        callJavascriptCallback: { env, _, _, data in
            let env = NAPI.Env(ptr: env)
            _ = rethrowToNode(env: env) {
                let operation = try Box<(NAPI.Env) throws -> Void>.takeRetainedOpaque(data!)
                try operation.value(env)
                return nil
            }
        }
    )
}

/// Perform an operation on the main thread.
/// - Parameter operation: The function to execute on the main thread.
/// - Parameter env: The main thread NAPI.Env.
public func onMainThread(blocking callMode: NAPI.ThreadsafeFunction.CallMode = .nonblocking, _ operation: @escaping (_ env: NAPI.Env) throws -> Void) throws {
    let box = Box(operation)
    try JSMainThread.dispatchFunction!.dispatch(data: box.retainedOpaque(), callMode: callMode)
}

/// Perform an operation on the main thread and wait for the result.
/// WARNING: easy to deadlock with this function. Prefer `onMainThread` whenever possible
/// - Parameter operation: The function to execute on the main thread.
/// - Parameter env: The main thread NAPI.Env.
public func syncOnMainThread<R>(blocking callMode: NAPI.ThreadsafeFunction.CallMode = .nonblocking, _ operation: @escaping (_ env: NAPI.Env) throws -> R) throws -> R {
    #if os(WASI)
    return try operation(JSMainThread.env!)
    #else
    if let env = JSMainThread.envIfAlreadyOnMain {
        return try operation(env)
    } else {
        let semaphore = DispatchSemaphore(value: 0)
        var result: Result<R, any Error>?
        try onMainThread(blocking: callMode) { env in
            do {
                result = .success(try operation(env))
                semaphore.signal()
            } catch {
                result = .failure(error)
                semaphore.signal()
            }
        }
        semaphore.wait()
        return try result!.get()
    }
    #endif
}

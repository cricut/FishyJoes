import FishyJoesCommonRuntime
import Foundation
import NodeAPI

private enum NodeFutureImpl {
    static var promiseThenFunction: NodeReference!
    enum ContinuationError: Error {
        case nullData
    }

    typealias BindBox = Box<(_ success: Bool, _ resultOrError: NAPI.Value, NAPI.Env) throws -> Void>

    static let cThenCallback: napi_callback = { env, info in
        callbackBody(env, info, name: "FutureConverter.fromNode.thenCallback", expectedArgumentCount: 1) { env in
            guard let data = try env.data() else {
                throw ContinuationError.nullData
            }
            let promiseBox = try BindBox.takeRetainedOpaque(data)
            try promiseBox.value(true, env.argument(at: 0), env.env)
            return nil
        }
    }

    static let cCatchCallback: napi_callback = { env, info in
        callbackBody(env, info, name: "FutureConverter.fromNode.catchCallback", expectedArgumentCount: 1) { env in
            guard let data = try env.data() else {
                throw ContinuationError.nullData
            }
            let promiseBox = try BindBox.takeRetainedOpaque(data)
            try promiseBox.value(false, env.argument(at: 0), env.env)
            return nil
        }
    }
}

extension FutureConverter: NodeConverter where OutputConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        // Confusingly, "promise" is the consumer in swift, but the producer (and consumer) in js
        let (future, promise) = Future<OutputConverter.SwiftType>.make()

        let thenFunction = try NodeFutureImpl.promiseThenFunction.value(env: env)

        let bindBox = NodeFutureImpl.BindBox { success, resultOrError, env in
            let result: Result<OutputConverter.SwiftType, any Error>
            do {
                if success {
                    result = .success(try OutputConverter.fromNode(resultOrError, env: env))
                } else {
                    result = .failure(JSException(message: try nodeDescribe(resultOrError, env: env)))
                }
            } catch {
                result = .failure(error)
            }
            promise.handle(result)
        }
        let bindBoxPtr = bindBox.retainedOpaque()

        // TODO: GC hooks. Potential leaks here if promises get dropped without being fulfilled
        let thenCallback = try! env.createFunction(
            "FutureConverter.fromNode.thenCallback",
            NodeFutureImpl.cThenCallback,
            bindBoxPtr
        )
        let catchCallback = try! env.createFunction(
            "FutureConverter.fromNode.catchCallback",
            NodeFutureImpl.cCatchCallback,
            bindBoxPtr
        )
        _ = try env.callFunction(value, thenFunction, [thenCallback, catchCallback])

        return future
    }

    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let (deferred, promise) = try env.createPromise()
        value.sink { result in
            try! onMainThread { env in
                // Any errors before `resolution` will be passed to the promise.
                // Any errors inside `resolution` are fatal, as the promise is potentially used-up.
                let resolution: () throws -> Void
                do {
                    let jsSuccess = try OutputConverter.toNode(result.get(), env: env)
                    resolution = { try env.resolveDeferred(deferred, jsSuccess) }
                } catch {
                    let jsError = try nodeError(error, env: env)
                    resolution = { try env.rejectDeferred(deferred, jsError) }
                }
                do {
                    try resolution()
                } catch {
                    fatalError("Error while resolving promise, unrecoverable. \(error)")
                }
            }
        }
        return promise
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        guard NodeFutureImpl.promiseThenFunction == nil else { return }
        let global = try env.getGlobal()
        let promise = try env.getNamedProperty(global, "Promise")
        let prototype = try env.getNamedProperty(promise, "prototype")
        let thenFunction = try env.getNamedProperty(prototype, "then")
        NodeFutureImpl.promiseThenFunction = try env.reference(thenFunction)
    }
}

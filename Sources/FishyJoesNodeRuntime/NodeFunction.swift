import FishyJoesCommonRuntime
import Foundation

protocol AnyFunction {
    static var cInvoke: NAPI.Callback { get }
}

private var promiseThenFunction: NodeReference?
private var promiseCatchFunction: NodeReference?
private enum ContinuationError: Error {
    case nullData
}

extension CheckedContinuation {
    func bind<C>(to promise: inout NAPI.Value, env: NAPI.Env, converter _: C.Type, contextName: String) throws where C: NodeConverter, C.SwiftType == T, E == any Error {
        typealias BindBox = Box<(catching: (NAPI.Value, NAPI.Env) -> Void, throwing: (NAPI.Value, NAPI.Env) -> Void)>
        let continuationBoxPointer = BindBox(
            (
                catching: { value, env in
                    self.resume(
                        with: .init(catching:) {
                            do {
                                return try C.fromNode(value, env: env)
                            } catch {
                                _ = try? env.getAndClearLastException()
                                throw error
                            }
                        }
                    )
                }, throwing: { error, env in
                    _ = try? env.getAndClearLastException()
                    self.resume(
                        throwing: try! JSException(message: nodeDescribe(error, env: env))
                    )
                }
            )
        ).retainedOpaque()

        let thenFunction = try promiseThenFunction?.value(env: env) ?? {
            let thenFunction = try env.getNamedProperty(promise, "then")
            promiseThenFunction = try NodeReference(env: env, value: thenFunction)
            return thenFunction
        }()
        let thenCallback = try env.createFunction(
            "\(contextName)Then", { env, info in
                callbackBody(env, info, name: "CheckedContinuation.Bind.CallbackBody.Then", expectedArgumentCount: 1) { env in
                    guard let data = try env.data() else {
                        throw ContinuationError.nullData
                    }
                    let continuationBox = try BindBox.takeRetainedOpaque(data)
                    let value = try env.argument(at: 0)
                    continuationBox.value.catching(value, env.env)
                    return nil
                }
            },
            continuationBoxPointer
        )
        promise = try env.callFunction(promise, thenFunction, [thenCallback])

        let catchFunction = try promiseCatchFunction?.value(env: env) ?? {
            let catchFunction = try env.getNamedProperty(promise, "catch")
            promiseCatchFunction = try NodeReference(env: env, value: catchFunction)
            return catchFunction
        }()
        let catchCallback = try env.createFunction(
            "\(contextName)Catch", { env, info in
                callbackBody(env, info, name: "CheckedContinuation.Bind.CallbackBody.Catch", expectedArgumentCount: 1) { env in
                    guard let data = try env.data() else {
                        throw ContinuationError.nullData
                    }
                    let continuationBox = try BindBox.takeRetainedOpaque(data)
                    let value = try env.argument(at: 0)
                    continuationBox.value.throwing(value, env.env)
                    return nil
                }
            },
            continuationBoxPointer
        )
        promise = try env.callFunction(promise, catchFunction, [catchCallback])
    }
}

private enum PromiseConverter<R>: Converter where R: NodeConverter {
    static func fromNode(value promise: NAPI.Value, env: NAPI.Env, continuation: CheckedContinuation<R.SwiftType, Error>) throws {
    }
}

private struct AnyFunction0: AnyFunction {
    let invoke: (CallbackEnv) throws -> NAPI.Value?

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<Function0>", expectedArgumentCount: 0) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env)
        }
    }
}

 private struct AnyAsyncFunction0: AnyFunction {
     let invoke: (CallbackEnv) async throws -> NAPI.Value?

     static let cInvoke: NAPI.Callback = { env, info in
         callbackBody(env, info, name: "<AsyncFunction0>", expectedArgumentCount: 0) { env in
             try await Box<Self>.takeUnretainedOpaque(env.data()!).value
                 .invoke(env)
         }
     }
 }

private struct AnyFunction1: AnyFunction {
    let invoke: (CallbackEnv, NAPI.Value) throws -> NAPI.Value

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<Function1>", expectedArgumentCount: 1) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0))
        }
    }
}

private struct AnyAsyncFunction1: AnyFunction {
    let invoke: (CallbackEnv, NAPI.Value) async throws -> NAPI.Value?

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<AsyncFunction1>", expectedArgumentCount: 1) { env in
            try await Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0))
        }
    }
}

private struct AnyFunction2: AnyFunction {
    let invoke: (CallbackEnv, NAPI.Value, NAPI.Value) throws -> NAPI.Value

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<Function2>", expectedArgumentCount: 2) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0), env.argument(at: 1))
        }
    }
}

private struct AnyAsyncFunction2: AnyFunction {
    let invoke: (CallbackEnv, NAPI.Value, NAPI.Value) async throws -> NAPI.Value?

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<AsyncFunction2>", expectedArgumentCount: 2) { env in
            try await Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0), env.argument(at: 1))
        }
    }
}

private struct AnyFunction3: AnyFunction {
    let invoke: (CallbackEnv, NAPI.Value, NAPI.Value, NAPI.Value) throws -> NAPI.Value

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<Function3>", expectedArgumentCount: 3) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0), env.argument(at: 1), env.argument(at: 2))
        }
    }
}

private struct AnyAsyncFunction3: AnyFunction {
    let invoke: (CallbackEnv, NAPI.Value, NAPI.Value, NAPI.Value) async throws -> NAPI.Value?

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<AsyncFunction3>", expectedArgumentCount: 3) { env in
            try await Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0), env.argument(at: 1), env.argument(at: 2))
        }
    }
}

private struct AnyFunction4: AnyFunction {
    let invoke: (CallbackEnv, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value) throws -> NAPI.Value

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<Function4>", expectedArgumentCount: 4) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0), env.argument(at: 1), env.argument(at: 2), env.argument(at: 3))
        }
    }
}

private struct AnyAsyncFunction4: AnyFunction {
    let invoke: (CallbackEnv, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value) async throws -> NAPI.Value?

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<AsyncFunction4>", expectedArgumentCount: 4) { env in
            try await Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0), env.argument(at: 1), env.argument(at: 2), env.argument(at: 3))
        }
    }
}

private struct AnyFunction5: AnyFunction {
    let invoke: (CallbackEnv, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value) throws -> NAPI.Value

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<Function5>", expectedArgumentCount: 5) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0), env.argument(at: 1), env.argument(at: 2), env.argument(at: 3), env.argument(at: 4))
        }
    }
}

private struct AnyAsyncFunction5: AnyFunction {
    let invoke: (CallbackEnv, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value) async throws -> NAPI.Value?

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<AsyncFunction5>", expectedArgumentCount: 5) { env in
            try await Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0), env.argument(at: 1), env.argument(at: 2), env.argument(at: 3), env.argument(at: 4))
        }
    }
}

private struct AnyFunction6: AnyFunction {
    let invoke: (CallbackEnv, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value) throws -> NAPI.Value

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<Function6>", expectedArgumentCount: 6) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0), env.argument(at: 1), env.argument(at: 2), env.argument(at: 3), env.argument(at: 4), env.argument(at: 5))
        }
    }
}

private struct AnyAsyncFunction6: AnyFunction {
    let invoke: (CallbackEnv, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value) async throws -> NAPI.Value?

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<AsyncFunction6>", expectedArgumentCount: 6) { env in
            try await Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0), env.argument(at: 1), env.argument(at: 2), env.argument(at: 3), env.argument(at: 4), env.argument(at: 5))
        }
    }
}

extension AnyFunction {
    func toNode(env: NAPI.Env) throws -> NAPI.Value {
        let ptr = Box(self).retainedOpaque()
        let result = try env.createFunction("<swift lambda>", Self.cInvoke, ptr)
        try env.addFinalizerWithoutRef(result, ptr, AnyBox.boxFinalize, nil)
        return result
    }
}

private func nodeCall(_ ref: NodeReference, _ args: [NAPI.Value], env: NAPI.Env) throws -> NAPI.Value {
    return try env.callFunction(env.getUndefined(), ref.value(env: env), args)
}

extension Function0Converter: NodeConverter where R: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return {
            try R.fromNode(nodeCall(escapingRef, [], env: env), env: env)
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws 	-> NAPI.Value {
        try AnyFunction0 { env in
            return try R.toNode(value(), env: env.env)
        }.toNode(env: env)
    }
}

extension AsyncFunction0Converter: NodeConverter where R: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return {
            try await withCheckedThrowingContinuation { continuation in
                do {
                    try onMainThread { env in
                        do {
                            var promise = try nodeCall(escapingRef, [], env: env)
                            try continuation.bind(to: &promise, env: env, converter: R.self, contextName: "AsyncFunction0Converter")
                        } catch {
                            _ = try? env.getAndClearLastException()
                            continuation.resume(throwing: error)
                        }
                    }
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyAsyncFunction0 { env in
            return try await R.toNode(value(), env: env.env)
        }.toNode(env: env)
    }
}

extension Function1Converter: NodeConverter where R: NodeConverter, P0: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0 in
            let args = try [
                P0.toNode(p0, env: env),
            ]
            return try R.fromNode(nodeCall(escapingRef, args, env: env), env: env)
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyFunction1 { env, p0 in
            let v0 = try P0.fromNode(p0, env: env.env)
            return try R.toNode(value(v0), env: env.env)
        }.toNode(env: env)
    }
}

extension AsyncFunction1Converter: NodeConverter where R: NodeConverter, P0: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0 in
            try await withCheckedThrowingContinuation { continuation in
                do {
                    try onMainThread { env in
                        do {
                            let args = try [
                                P0.toNode(p0, env: env),
                            ]
                            var promise = try nodeCall(escapingRef, args, env: env)
                            try continuation.bind(to: &promise, env: env, converter: R.self, contextName: "AsyncFunction1Converter")
                        } catch {
                            _ = try? env.getAndClearLastException()
                            continuation.resume(throwing: error)
                        }
                    }
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyAsyncFunction1 { env, p0 in
            let v0 = try P0.fromNode(p0, env: env.env)
            return try await R.toNode(value(v0), env: env.env)
        }.toNode(env: env)
    }
}

extension Function2Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1 in
            let args = try [
                P0.toNode(p0, env: env),
                P1.toNode(p1, env: env),
            ]
            return try R.fromNode(nodeCall(escapingRef, args, env: env), env: env)
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyFunction2 { env, p0, p1 in
            let v0 = try P0.fromNode(p0, env: env.env)
            let v1 = try P1.fromNode(p1, env: env.env)
            return try R.toNode(value(v0, v1), env: env.env)
        }.toNode(env: env)
    }
}

extension AsyncFunction2Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1 in
            try await withCheckedThrowingContinuation { continuation in
                do {
                    try onMainThread { env in
                        do {
                            let args = try [
                                P0.toNode(p0, env: env),
                                P1.toNode(p1, env: env),
                            ]
                            var promise = try nodeCall(escapingRef, args, env: env)
                            try continuation.bind(to: &promise, env: env, converter: R.self, contextName: "AsyncFunction2Converter")
                        } catch {
                            _ = try? env.getAndClearLastException()
                            continuation.resume(throwing: error)
                        }
                    }
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyAsyncFunction2 { env, p0, p1 in
            let v0 = try P0.fromNode(p0, env: env.env)
            let v1 = try P1.fromNode(p1, env: env.env)
            return try await R.toNode(value(v0, v1), env: env.env)
        }.toNode(env: env)
    }
}

extension Function3Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1, p2 in
            let args = try [
                P0.toNode(p0, env: env),
                P1.toNode(p1, env: env),
                P2.toNode(p2, env: env),
            ]
            return try R.fromNode(nodeCall(escapingRef, args, env: env), env: env)
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyFunction3 { env, p0, p1, p2 in
            let v0 = try P0.fromNode(p0, env: env.env)
            let v1 = try P1.fromNode(p1, env: env.env)
            let v2 = try P2.fromNode(p2, env: env.env)
            return try R.toNode(value(v0, v1, v2), env: env.env)
        }.toNode(env: env)
    }
}

extension AsyncFunction3Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1, p2 in
            try await withCheckedThrowingContinuation { continuation in
                do {
                    try onMainThread { env in
                        do {
                            let args = try [
                                P0.toNode(p0, env: env),
                                P1.toNode(p1, env: env),
                                P2.toNode(p2, env: env),
                            ]
                            var promise = try nodeCall(escapingRef, args, env: env)
                            try continuation.bind(to: &promise, env: env, converter: R.self, contextName: "AsyncFunction3Converter")
                        } catch {
                            _ = try? env.getAndClearLastException()
                            continuation.resume(throwing: error)
                        }
                    }
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyAsyncFunction3 { env, p0, p1, p2 in
            let v0 = try P0.fromNode(p0, env: env.env)
            let v1 = try P1.fromNode(p1, env: env.env)
            let v2 = try P2.fromNode(p2, env: env.env)
            return try await R.toNode(value(v0, v1, v2), env: env.env)
        }.toNode(env: env)
    }
}

extension Function4Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter, P3: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1, p2, p3 in
            let args = try [
                P0.toNode(p0, env: env),
                P1.toNode(p1, env: env),
                P2.toNode(p2, env: env),
                P3.toNode(p3, env: env),
            ]
            return try R.fromNode(nodeCall(escapingRef, args, env: env), env: env)
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyFunction4 { env, p0, p1, p2, p3 in
            let v0 = try P0.fromNode(p0, env: env.env)
            let v1 = try P1.fromNode(p1, env: env.env)
            let v2 = try P2.fromNode(p2, env: env.env)
            let v3 = try P3.fromNode(p3, env: env.env)
            return try R.toNode(value(v0, v1, v2, v3), env: env.env)
        }.toNode(env: env)
    }
}

extension AsyncFunction4Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter, P3: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1, p2, p3 in
            try await withCheckedThrowingContinuation { continuation in
                do {
                    try onMainThread { env in
                        do {
                            let args = try [
                                P0.toNode(p0, env: env),
                                P1.toNode(p1, env: env),
                                P2.toNode(p2, env: env),
                                P3.toNode(p3, env: env),
                            ]
                            var promise = try nodeCall(escapingRef, args, env: env)
                            try continuation.bind(to: &promise, env: env, converter: R.self, contextName: "AsyncFunction4Converter")
                        } catch {
                            _ = try? env.getAndClearLastException()
                            continuation.resume(throwing: error)
                        }
                    }
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyAsyncFunction4 { env, p0, p1, p2, p3 in
            let v0 = try P0.fromNode(p0, env: env.env)
            let v1 = try P1.fromNode(p1, env: env.env)
            let v2 = try P2.fromNode(p2, env: env.env)
            let v3 = try P3.fromNode(p3, env: env.env)
            return try await R.toNode(value(v0, v1, v2, v3), env: env.env)
        }.toNode(env: env)
    }
}

extension Function5Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter, P3: NodeConverter, P4: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1, p2, p3, p4 in
            let args = try [
                P0.toNode(p0, env: env),
                P1.toNode(p1, env: env),
                P2.toNode(p2, env: env),
                P3.toNode(p3, env: env),
                P4.toNode(p4, env: env),
            ]
            return try R.fromNode(nodeCall(escapingRef, args, env: env), env: env)
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyFunction5 { env, p0, p1, p2, p3, p4 in
            let v0 = try P0.fromNode(p0, env: env.env)
            let v1 = try P1.fromNode(p1, env: env.env)
            let v2 = try P2.fromNode(p2, env: env.env)
            let v3 = try P3.fromNode(p3, env: env.env)
            let v4 = try P4.fromNode(p4, env: env.env)
            return try R.toNode(value(v0, v1, v2, v3, v4), env: env.env)
        }.toNode(env: env)
    }
}

extension AsyncFunction5Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter, P3: NodeConverter, P4: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1, p2, p3, p4 in
            try await withCheckedThrowingContinuation { continuation in
                do {
                    try onMainThread { env in
                        do {
                            let args = try [
                                P0.toNode(p0, env: env),
                                P1.toNode(p1, env: env),
                                P2.toNode(p2, env: env),
                                P3.toNode(p3, env: env),
                                P4.toNode(p4, env: env),
                            ]
                            var promise = try nodeCall(escapingRef, args, env: env)
                            try continuation.bind(to: &promise, env: env, converter: R.self, contextName: "AsyncFunction5Converter")
                        } catch {
                            _ = try? env.getAndClearLastException()
                            continuation.resume(throwing: error)
                        }
                    }
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyAsyncFunction5 { env, p0, p1, p2, p3, p4 in
            let v0 = try P0.fromNode(p0, env: env.env)
            let v1 = try P1.fromNode(p1, env: env.env)
            let v2 = try P2.fromNode(p2, env: env.env)
            let v3 = try P3.fromNode(p3, env: env.env)
            let v4 = try P4.fromNode(p4, env: env.env)
            return try await R.toNode(value(v0, v1, v2, v3, v4), env: env.env)
        }.toNode(env: env)
    }
}

extension Function6Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter, P3: NodeConverter, P4: NodeConverter, P5: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1, p2, p3, p4, p5 in
            let args = try [
                P0.toNode(p0, env: env),
                P1.toNode(p1, env: env),
                P2.toNode(p2, env: env),
                P3.toNode(p3, env: env),
                P4.toNode(p4, env: env),
                P5.toNode(p5, env: env),
            ]
            return try R.fromNode(nodeCall(escapingRef, args, env: env), env: env)
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyFunction6 { env, p0, p1, p2, p3, p4, p5 in
            let v0 = try P0.fromNode(p0, env: env.env)
            let v1 = try P1.fromNode(p1, env: env.env)
            let v2 = try P2.fromNode(p2, env: env.env)
            let v3 = try P3.fromNode(p3, env: env.env)
            let v4 = try P4.fromNode(p4, env: env.env)
            let v5 = try P5.fromNode(p5, env: env.env)
            return try R.toNode(value(v0, v1, v2, v3, v4, v5), env: env.env)
        }.toNode(env: env)
    }
}

extension AsyncFunction6Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter, P3: NodeConverter, P4: NodeConverter, P5: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1, p2, p3, p4, p5 in
            try await withCheckedThrowingContinuation { continuation in
                do {
                    try onMainThread { env in
                        do {
                            let args = try [
                                P0.toNode(p0, env: env),
                                P1.toNode(p1, env: env),
                                P2.toNode(p2, env: env),
                                P3.toNode(p3, env: env),
                                P4.toNode(p4, env: env),
                                P5.toNode(p5, env: env),
                            ]
                            var promise = try nodeCall(escapingRef, args, env: env)
                            try continuation.bind(to: &promise, env: env, converter: R.self, contextName: "AsyncFunction6Converter")
                        } catch {
                            _ = try? env.getAndClearLastException()
                            continuation.resume(throwing: error)
                        }
                    }
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyAsyncFunction6 { env, p0, p1, p2, p3, p4, p5 in
            let v0 = try P0.fromNode(p0, env: env.env)
            let v1 = try P1.fromNode(p1, env: env.env)
            let v2 = try P2.fromNode(p2, env: env.env)
            let v3 = try P3.fromNode(p3, env: env.env)
            let v4 = try P4.fromNode(p4, env: env.env)
            let v5 = try P5.fromNode(p5, env: env.env)
            return try await R.toNode(value(v0, v1, v2, v3, v4, v5), env: env.env)
        }.toNode(env: env)
    }
}

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

private struct AnyFunction0: AnyFunction {
    let invoke: (CallbackEnv) throws -> NAPI.Value?

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<Function0>", expectedArgumentCount: 0) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
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

private struct AnyFunction2: AnyFunction {
    let invoke: (CallbackEnv, NAPI.Value, NAPI.Value) throws -> NAPI.Value

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<Function2>", expectedArgumentCount: 2) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
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

private struct AnyFunction4: AnyFunction {
    let invoke: (CallbackEnv, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value) throws -> NAPI.Value

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<Function4>", expectedArgumentCount: 4) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
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

private struct AnyFunction6: AnyFunction {
    let invoke: (CallbackEnv, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value, NAPI.Value) throws -> NAPI.Value

    static let cInvoke: NAPI.Callback = { env, info in
        callbackBody(env, info, name: "<Function6>", expectedArgumentCount: 6) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
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
            try syncOnMainThread { env in
                try R.fromNode(nodeCall(escapingRef, [], env: env), env: env)
            }
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyFunction0 { env in
            return try R.toNode(value(), env: env.env)
        }.toNode(env: env)
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try R.nodeSetup(env: env, module: module)
    }
}

extension AsyncFunction0Converter: NodeConverter where R: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let futureFunc = try FutureFunctionConverter.fromNode(value, env: env)
        return fromFutureFunction(futureFunc)
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let futureFunc = toFutureFunction(value)
        return try FutureFunctionConverter.toNode(futureFunc, env: env)
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try FutureFunctionConverter.nodeSetup(env: env, module: module)
    }
}

extension Function1Converter: NodeConverter where R: NodeConverter, P0: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0 in
            try syncOnMainThread { env in
                let args = try [
                    P0.toNode(p0, env: env),
                ]
                return try R.fromNode(nodeCall(escapingRef, args, env: env), env: env)
            }
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyFunction1 { env, p0 in
            let v0 = try P0.fromNode(p0, env: env.env)
            return try R.toNode(value(v0), env: env.env)
        }.toNode(env: env)
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try R.nodeSetup(env: env, module: module)
        try P0.nodeSetup(env: env, module: module)
    }
}

extension AsyncFunction1Converter: NodeConverter where R: NodeConverter, P0: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let futureFunc = try FutureFunctionConverter.fromNode(value, env: env)
        return fromFutureFunction(futureFunc)
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let futureFunc = toFutureFunction(value)
        return try FutureFunctionConverter.toNode(futureFunc, env: env)
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try FutureFunctionConverter.nodeSetup(env: env, module: module)
    }
}

extension Function2Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1 in
            try syncOnMainThread { env in
                let args = try [
                    P0.toNode(p0, env: env),
                    P1.toNode(p1, env: env),
                ]
                return try R.fromNode(nodeCall(escapingRef, args, env: env), env: env)
            }
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        try AnyFunction2 { env, p0, p1 in
            let v0 = try P0.fromNode(p0, env: env.env)
            let v1 = try P1.fromNode(p1, env: env.env)
            return try R.toNode(value(v0, v1), env: env.env)
        }.toNode(env: env)
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try R.nodeSetup(env: env, module: module)
        try P0.nodeSetup(env: env, module: module)
        try P1.nodeSetup(env: env, module: module)
    }
}

extension AsyncFunction2Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let futureFunc = try FutureFunctionConverter.fromNode(value, env: env)
        return fromFutureFunction(futureFunc)
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let futureFunc = toFutureFunction(value)
        return try FutureFunctionConverter.toNode(futureFunc, env: env)
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try FutureFunctionConverter.nodeSetup(env: env, module: module)
    }
}

extension Function3Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1, p2 in
            try syncOnMainThread { env in
                let args = try [
                    P0.toNode(p0, env: env),
                    P1.toNode(p1, env: env),
                    P2.toNode(p2, env: env),
                ]
                return try R.fromNode(nodeCall(escapingRef, args, env: env), env: env)
            }
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

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try R.nodeSetup(env: env, module: module)
        try P0.nodeSetup(env: env, module: module)
        try P1.nodeSetup(env: env, module: module)
        try P2.nodeSetup(env: env, module: module)
    }
}

extension AsyncFunction3Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let futureFunc = try FutureFunctionConverter.fromNode(value, env: env)
        return fromFutureFunction(futureFunc)
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let futureFunc = toFutureFunction(value)
        return try FutureFunctionConverter.toNode(futureFunc, env: env)
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try FutureFunctionConverter.nodeSetup(env: env, module: module)
    }
}

extension Function4Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter, P3: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1, p2, p3 in
            try syncOnMainThread { env in
                let args = try [
                    P0.toNode(p0, env: env),
                    P1.toNode(p1, env: env),
                    P2.toNode(p2, env: env),
                    P3.toNode(p3, env: env),
                ]
                return try R.fromNode(nodeCall(escapingRef, args, env: env), env: env)
            }
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

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try R.nodeSetup(env: env, module: module)
        try P0.nodeSetup(env: env, module: module)
        try P1.nodeSetup(env: env, module: module)
        try P2.nodeSetup(env: env, module: module)
        try P3.nodeSetup(env: env, module: module)
    }
}

extension AsyncFunction4Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter, P3: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let futureFunc = try FutureFunctionConverter.fromNode(value, env: env)
        return fromFutureFunction(futureFunc)
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let futureFunc = toFutureFunction(value)
        return try FutureFunctionConverter.toNode(futureFunc, env: env)
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try FutureFunctionConverter.nodeSetup(env: env, module: module)
    }
}

extension Function5Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter, P3: NodeConverter, P4: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1, p2, p3, p4 in
            try syncOnMainThread { env in
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

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try R.nodeSetup(env: env, module: module)
        try P0.nodeSetup(env: env, module: module)
        try P1.nodeSetup(env: env, module: module)
        try P2.nodeSetup(env: env, module: module)
        try P3.nodeSetup(env: env, module: module)
        try P4.nodeSetup(env: env, module: module)
    }
}

extension AsyncFunction5Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter, P3: NodeConverter, P4: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let futureFunc = try FutureFunctionConverter.fromNode(value, env: env)
        return fromFutureFunction(futureFunc)
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let futureFunc = toFutureFunction(value)
        return try FutureFunctionConverter.toNode(futureFunc, env: env)
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try FutureFunctionConverter.nodeSetup(env: env, module: module)
    }
}

extension Function6Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter, P3: NodeConverter, P4: NodeConverter, P5: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1, p2, p3, p4, p5 in
            try syncOnMainThread { env in
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

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try R.nodeSetup(env: env, module: module)
        try P0.nodeSetup(env: env, module: module)
        try P1.nodeSetup(env: env, module: module)
        try P2.nodeSetup(env: env, module: module)
        try P3.nodeSetup(env: env, module: module)
        try P4.nodeSetup(env: env, module: module)
        try P5.nodeSetup(env: env, module: module)
    }
}

extension AsyncFunction6Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter, P3: NodeConverter, P4: NodeConverter, P5: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        let futureFunc = try FutureFunctionConverter.fromNode(value, env: env)
        return fromFutureFunction(futureFunc)
    }

    public static func toNode(_ value: @escaping SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let futureFunc = toFutureFunction(value)
        return try FutureFunctionConverter.toNode(futureFunc, env: env)
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        try FutureFunctionConverter.nodeSetup(env: env, module: module)
    }
}

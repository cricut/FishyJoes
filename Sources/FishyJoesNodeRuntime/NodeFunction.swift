import Foundation
import NodeAPI
import FishyJoesCommonRuntime

protocol AnyFunction {
    static var cInvoke: napi_callback { get }
}

private struct AnyFunction0: AnyFunction {
    let invoke: (CallbackEnv) throws -> napi_value?

    static let cInvoke: napi_callback = { env, info in
        callbackBody(env, info, name: "<Function0>", expectedArgumentCount: 0) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env)
        }
    }
}

private struct AnyFunction1: AnyFunction {
    let invoke: (CallbackEnv, napi_value?) throws -> napi_value?

    static let cInvoke: napi_callback = { env, info in
        callbackBody(env, info, name: "<Function0>", expectedArgumentCount: 0) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0))
        }
    }
}

private struct AnyFunction2: AnyFunction {
    let invoke: (CallbackEnv, napi_value?, napi_value?) throws -> napi_value?

    static let cInvoke: napi_callback = { env, info in
        callbackBody(env, info, name: "<Function2>", expectedArgumentCount: 2) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0), env.argument(at: 1))
        }
    }
}

private struct AnyFunction3: AnyFunction {
    let invoke: (CallbackEnv, napi_value?, napi_value?, napi_value?) throws -> napi_value?

    static let cInvoke: napi_callback = { env, info in
        callbackBody(env, info, name: "<Function3>", expectedArgumentCount: 3) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0), env.argument(at: 1), env.argument(at: 2))
        }
    }
}

private struct AnyFunction4: AnyFunction {
    let invoke: (CallbackEnv, napi_value?, napi_value?, napi_value?, napi_value?) throws -> napi_value?

    static let cInvoke: napi_callback = { env, info in
        callbackBody(env, info, name: "<Function4>", expectedArgumentCount: 4) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0), env.argument(at: 1), env.argument(at: 2), env.argument(at: 3))
        }
    }
}

private struct AnyFunction5: AnyFunction {
    let invoke: (CallbackEnv, napi_value?, napi_value?, napi_value?, napi_value?, napi_value?) throws -> napi_value?

    static let cInvoke: napi_callback = { env, info in
        callbackBody(env, info, name: "<Function5>", expectedArgumentCount: 5) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0), env.argument(at: 1), env.argument(at: 2), env.argument(at: 3), env.argument(at: 4))
        }
    }
}

private struct AnyFunction6: AnyFunction {
    let invoke: (CallbackEnv, napi_value?, napi_value?, napi_value?, napi_value?, napi_value?, napi_value?) throws -> napi_value?

    static let cInvoke: napi_callback = { env, info in
        callbackBody(env, info, name: "<Function6>", expectedArgumentCount: 6) { env in
            try Box<Self>.takeUnretainedOpaque(env.data()!).value
                .invoke(env, env.argument(at: 0), env.argument(at: 1), env.argument(at: 2), env.argument(at: 3), env.argument(at: 4), env.argument(at: 5))
        }
    }
}

extension AnyFunction {
    func toNode(env: napi_env) throws -> napi_value? {
        var result: napi_value?
        let ptr = Box(self).retainedOpaque()
        try check(napi_create_function(env, "<swift lambda>", -1, Self.cInvoke, ptr, &result))
        try check(napi_add_finalizer(env, result, ptr, AnyBox.boxFinalize, nil, nil))
        return result
    }
}

fileprivate func nodeCall(_ ref: NodeReference, _ args: [napi_value?], env: napi_env) throws -> napi_value? {
    var undefined: napi_value?
    try check(napi_get_undefined(env, &undefined))
    var result: napi_value?
    try napi_call_function(env, undefined, ref.value(env: env), args.count, args, &result)
    return result
}

extension Function0Converter: NodeConverter where R: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return {
            try R.fromNode(nodeCall(escapingRef, [], env: env), env: env)
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: napi_env) throws -> napi_value? {
        try AnyFunction0 { env in
            return try R.toNode(value(), env: env.env)
        }.toNode(env: env)
    }
}

extension Function1Converter: NodeConverter where R: NodeConverter, P0: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0 in
            let args = try [
                P0.toNode(p0, env: env),
            ]
            return try R.fromNode(nodeCall(escapingRef, args, env: env), env: env)
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: napi_env) throws -> napi_value? {
        try AnyFunction1 { env, p0 in
            let v0 = try P0.fromNode(p0, env: env.env)
            return try R.toNode(value(v0), env: env.env)
        }.toNode(env: env)
    }
}

extension Function2Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
        let escapingRef = try NodeReference(env: env, value: value)
        return { p0, p1 in
            let args = try [
                P0.toNode(p0, env: env),
                P1.toNode(p1, env: env),
            ]
            return try R.fromNode(nodeCall(escapingRef, args, env: env), env: env)
        }
    }

    public static func toNode(_ value: @escaping SwiftType, env: napi_env) throws -> napi_value? {
        try AnyFunction2 { env, p0, p1 in
            let v0 = try P0.fromNode(p0, env: env.env)
            let v1 = try P1.fromNode(p1, env: env.env)
            return try R.toNode(value(v0, v1), env: env.env)
        }.toNode(env: env)
    }
}

extension Function3Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
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

    public static func toNode(_ value: @escaping SwiftType, env: napi_env) throws -> napi_value? {
        try AnyFunction3 { env, p0, p1, p2 in
            let v0 = try P0.fromNode(p0, env: env.env)
            let v1 = try P1.fromNode(p1, env: env.env)
            let v2 = try P2.fromNode(p2, env: env.env)
            return try R.toNode(value(v0, v1, v2), env: env.env)
        }.toNode(env: env)
    }
}

extension Function4Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter, P3: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
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

    public static func toNode(_ value: @escaping SwiftType, env: napi_env) throws -> napi_value? {
        try AnyFunction4 { env, p0, p1, p2, p3 in
            let v0 = try P0.fromNode(p0, env: env.env)
            let v1 = try P1.fromNode(p1, env: env.env)
            let v2 = try P2.fromNode(p2, env: env.env)
            let v3 = try P3.fromNode(p3, env: env.env)
            return try R.toNode(value(v0, v1, v2, v3), env: env.env)
        }.toNode(env: env)
    }
}

extension Function5Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter, P3: NodeConverter, P4: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
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

    public static func toNode(_ value: @escaping SwiftType, env: napi_env) throws -> napi_value? {
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

extension Function6Converter: NodeConverter where R: NodeConverter, P0: NodeConverter, P1: NodeConverter, P2: NodeConverter, P3: NodeConverter, P4: NodeConverter, P5: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
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

    public static func toNode(_ value: @escaping SwiftType, env: napi_env) throws -> napi_value? {
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

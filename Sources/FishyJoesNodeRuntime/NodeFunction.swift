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

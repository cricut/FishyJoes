// Generated using Sourcery 1.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Bytes: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        var pointer: UnsafeMutableRawPointer?
        try check(napi_unwrap(env, value, &pointer))
        guard let nonNilPointer = pointer else {
            throw JSException(message: "expected Bytes, got nil")
        }
        return try Box<Bytes>.takeUnretainedOpaque(nonNilPointer).value
    }
    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: "Bytes", env: env)
        var args: napi_value? = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        var result: napi_value?
        try check(napi_new_instance(env, constructor, 1, &args, &result))
        return result
    }
    public static func mutateNode(_ value: Self, this: napi_value?, env: napi_env) throws {
        var pointer: UnsafeMutableRawPointer?
        try check(napi_unwrap(env, this, &pointer))
        guard let nonNilPointer = pointer else {
            throw JSException(message: "expected Bytes, got nil")
        }
        try Box<Bytes>.takeUnretainedOpaque(nonNilPointer).value = value
    }
    public static func nodeSetup(env: napi_env, module: napi_value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Bytes",
            properties: [
                "echoBytes": (
                    .method(
                        { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "echoBytes", expectedArgumentCount: 1) { env in
                                let result = try ArrayConverter<UInt8>.toNode(
                                    Bytes.echo(
                                        bytes: try env.argument(at: 0, converter: ArrayConverter<UInt8>.self)
                                    ),
                                    env: env.env
                                )
                                return result
                            }
                        }
                    ),
                    isStatic: true
                ),
                "echoData": (
                    .method(
                        { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "echoData", expectedArgumentCount: 1) { env in
                                let result = try Foundation.Data.toNode(
                                    Bytes.echo(
                                        data: try env.argument(at: 0, converter: Foundation.Data.self)
                                    ),
                                    env: env.env
                                )
                                return result
                            }
                        }
                    ),
                    isStatic: true
                ),
                "bytes": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "bytes", expectedArgumentCount: 0) { env in
                                try ArrayConverter<UInt8>.toNode(Bytes.bytes, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "data": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "data", expectedArgumentCount: 0) { env in
                                try Foundation.Data.toNode(Bytes.data, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Bytes_constructor", expectedArgumentCount: 1) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    let selfValue = try env.argument(at: 0)
                    let boxed = try FishyJoesNodeRuntime.Box<Bytes>.takeUnretained(selfValue, env: env.env)
                    let finalizer: napi_finalize = { env, data, _ in
                        FishyJoesNodeRuntime.Box<Bytes>.releaseOpaque(data)
                    }
                    try check(env: env.env, napi_wrap(env.env, this, boxed.retainedOpaque(), finalizer, nil, nil))
                    return this
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Bytes",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// Generated using Sourcery 1.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Structs.ReferenceStruct: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        var pointer: UnsafeMutableRawPointer?
        try check(napi_unwrap(env, value, &pointer))
        guard let nonNilPointer = pointer else {
            throw JSException(message: "expected Structs.ReferenceStruct, got nil")
        }
        return try Box<Structs.ReferenceStruct>.takeUnretainedOpaque(nonNilPointer).value
    }
    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: "Structs.ReferenceStruct", env: env)
        var args: napi_value? = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        var result: napi_value?
        try check(napi_new_instance(env, constructor, 1, &args, &result))
        return result
    }
    public static func mutateNode(_ value: Self, this: napi_value?, env: napi_env) throws {
        var pointer: UnsafeMutableRawPointer?
        try check(napi_unwrap(env, this, &pointer))
        guard let nonNilPointer = pointer else {
            throw JSException(message: "expected Structs.ReferenceStruct, got nil")
        }
        try Box<Structs.ReferenceStruct>.takeUnretainedOpaque(nonNilPointer).value = value
    }
    public static func nodeSetup(env: napi_env, module: napi_value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Structs.ReferenceStruct",
            properties: [
                "create": (
                    .method(
                        { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0) { env in
                                let result = try Structs.ReferenceStruct.toNode(
                                    Structs.ReferenceStruct(
                                    ),
                                    env: env.env
                                )
                                return result
                            }
                        }
                    ),
                    isStatic: true
                ),
                "immutable": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "immutable", expectedArgumentCount: 0) { env in
                                try Swift.String.toNode(env.this(converter: Structs.ReferenceStruct.self).immutable, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "mutable": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "mutable", expectedArgumentCount: 0) { env in
                                try Swift.String.toNode(env.this(converter: Structs.ReferenceStruct.self).mutable, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Structs.ReferenceStruct_constructor", expectedArgumentCount: 1) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    let selfValue = try env.argument(at: 0)
                    let boxed = try FishyJoesNodeRuntime.Box<Structs.ReferenceStruct>.takeUnretained(selfValue, env: env.env)
                    let finalizer: napi_finalize = { env, data, _ in
                        FishyJoesNodeRuntime.Box<Structs.ReferenceStruct>.releaseOpaque(data)
                    }
                    try check(env: env.env, napi_wrap(env.env, this, boxed.retainedOpaque(), finalizer, nil, nil))
                    return this
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Structs.ReferenceStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

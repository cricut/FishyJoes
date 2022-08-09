// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Structs.ReferenceStruct: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected Structs.ReferenceStruct, got nil")
        }
        return try Box<Structs.ReferenceStruct>.takeUnretainedOpaque(nonNilPointer).value
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: "Structs.ReferenceStruct", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected Structs.ReferenceStruct, got nil")
        }
        try Box<Structs.ReferenceStruct>.takeUnretainedOpaque(pointer).value = value
    }
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Structs.ReferenceStruct",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Structs.ReferenceStruct.toNode(
                                Structs.ReferenceStruct(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
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
                    try FishyJoesNodeRuntime.Box<Structs.ReferenceStruct>.construct(env: env)
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

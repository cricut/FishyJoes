// Generated using Sourcery 1.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.Structs.MemberwiseStruct: NodeMutator {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        Self(
            immutable: try { () -> Swift.String in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "immutable", &fieldValue))
                return try Swift.String.fromNode(fieldValue, env: env)
            }(),
            mutable: try { () -> Swift.String in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "mutable", &fieldValue))
                return try Swift.String.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        let constructor = try InstanceData.data(for: env).constructor(for: "Structs.MemberwiseStruct", env: env)
        let args: [napi_value?] = [
            try Swift.String.toNode(value.immutable, env: env),
            try Swift.String.toNode(value.mutable, env: env),
        ]
        var result: napi_value?
        try check(napi_new_instance(env, constructor, args.count, args, &result))
        return result
    }
    public static func mutateNode(_ value: Self, this: napi_value?, env: napi_env) throws {
        try check(napi_set_named_property(env, this, "immutable", Swift.String.toNode(value.immutable, env: env)))
        try check(napi_set_named_property(env, this, "mutable", Swift.String.toNode(value.mutable, env: env)))
    }
    public static func nodeSetup(env: napi_env, module: napi_value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Structs.MemberwiseStruct",
            properties: [
                "create": (
                    .method(
                        { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0) { env in
                                let result = try Structs.MemberwiseStruct.toNode(
                                    Structs.MemberwiseStruct(
                                    ),
                                    env: env.env
                                )
                                return result
                            }
                        }
                    ),
                    isStatic: true
                ),
                "immutable": (.stored(mutable: true), isStatic: false),
                "mutable": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "Structs.MemberwiseStruct_constructor", expectedArgumentCount: 2) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try check(napi_set_named_property(env.env, this, "immutable", env.argument(at: 0)))
                    try check(napi_set_named_property(env.env, this, "mutable", env.argument(at: 1)))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "Structs.MemberwiseStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// Generated using Sourcery 1.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.AProtocolImplementation: NodeMutator {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        Self(
            foo: try { () -> Swift.String in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "foo", &fieldValue))
                return try Swift.String.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        let constructor = try InstanceData.data(for: env).constructor(for: "AProtocolImplementation", env: env)
        let args: [napi_value?] = [
            try Swift.String.toNode(value.foo, env: env),
        ]
        var result: napi_value?
        try check(napi_new_instance(env, constructor, args.count, args, &result))
        return result
    }
    public static func mutateNode(_ value: Self, this: napi_value?, env: napi_env) throws {
        try check(napi_set_named_property(env, this, "foo", Swift.String.toNode(value.foo, env: env)))
    }
    public static func nodeSetup(env: napi_env, module: napi_value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AProtocolImplementation",
            properties: [
                "bar": (
                    .method(
                        { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "bar", expectedArgumentCount: 2) { env in
                                let result = try _AProtocolConverter.toNode(
                                    env.this(converter: AProtocolImplementation.self).bar(
                                        x: try env.argument(at: 0, converter: Int.self),
                                        y: try env.argument(at: 1, converter: Int.self)
                                    ),
                                    env: env.env
                                )
                                return result
                            }
                        }
                    ),
                    isStatic: false
                ),
                "foo": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "AProtocolImplementation_constructor", expectedArgumentCount: 1) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try check(napi_set_named_property(env.env, this, "foo", env.argument(at: 0)))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "AProtocolImplementation",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

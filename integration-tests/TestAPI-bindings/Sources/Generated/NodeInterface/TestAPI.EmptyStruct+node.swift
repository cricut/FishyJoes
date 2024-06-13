// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.EmptyStruct: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "EmptyStruct", env: env)
        let args: [NAPI.Value] = [
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "EmptyStruct",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.EmptyStruct.toNode(
                                TestAPI.EmptyStruct(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "aap": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "aap", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.EmptyStruct.self).aap(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "zxccxz": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "zxccxz", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.EmptyStruct.self).zxc(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "tatiana": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tatiana", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.EmptyStruct.self).tata, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "tutu": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tutu", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(env.this(converter: TestAPI.EmptyStruct.self).tutu, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "EmptyStruct_constructor", expectedArgumentCount: 0) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "EmptyStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.EmptyClass2: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> TestAPI.EmptyClass2 {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected TestAPI.EmptyClass2, got nil")
        }
        return try Box<TestAPI.EmptyClass2>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: TestAPI.EmptyClass2, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "EmptyClass2", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: TestAPI.EmptyClass2, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected TestAPI.EmptyClass2, got nil")
        }
        try Box<TestAPI.EmptyClass2>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "EmptyClass2",
            properties: [
                "make": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "make", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.EmptyClass2.toNode(
                                TestAPI.EmptyClass2(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "shmee": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "shmee", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.EmptyClass2.self).shme(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "gorp": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "gorp", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.EmptyClass2.self).gorp(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "blorg": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "blorg", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.EmptyClass2.self).blarg, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "wibble": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "wibble", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.EmptyClass2.self).wibble, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "EmptyClass2_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.EmptyClass2>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "EmptyClass2",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

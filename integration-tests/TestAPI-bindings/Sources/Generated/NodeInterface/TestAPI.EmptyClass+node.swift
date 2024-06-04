// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.EmptyClass: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> TestAPI.EmptyClass {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected TestAPI.EmptyClass, got nil")
        }
        return try Box<TestAPI.EmptyClass>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: TestAPI.EmptyClass, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "EmptyClass1", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: TestAPI.EmptyClass, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected TestAPI.EmptyClass, got nil")
        }
        try Box<TestAPI.EmptyClass>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "EmptyClass1",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.EmptyClass.toNode(
                                TestAPI.EmptyClass(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "shme": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "shme", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.EmptyClass.self).shme(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "Gorpers": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "Gorpers", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.EmptyClass.self).gorp(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "blarg": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "blarg", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.EmptyClass.self).blarg, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "wibbledyWobbledyTimeyWhimey": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "wibbledyWobbledyTimeyWhimey", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.EmptyClass.self).wibble, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "EmptyClass1_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.EmptyClass>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "EmptyClass1",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

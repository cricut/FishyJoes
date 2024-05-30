// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.TestDefaultComputedPropertiesClass: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> TestAPI.TestDefaultComputedPropertiesClass {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected TestAPI.TestDefaultComputedPropertiesClass, got nil")
        }
        return try Box<TestAPI.TestDefaultComputedPropertiesClass>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: TestAPI.TestDefaultComputedPropertiesClass, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "TestDefaultComputedPropertiesReference", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: TestAPI.TestDefaultComputedPropertiesClass, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected TestAPI.TestDefaultComputedPropertiesClass, got nil")
        }
        try Box<TestAPI.TestDefaultComputedPropertiesClass>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestDefaultComputedPropertiesReference",
            properties: [
                "init": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "init", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try TestAPI.TestDefaultComputedPropertiesClass.toNode(
                                TestAPI.TestDefaultComputedPropertiesClass(
                                    spam: try env.argument(at: 0, converter: Swift.Bool.self),
                                    noot: try env.argument(at: 1, converter: Swift.Int.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "noot": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "noot", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(env.this(converter: TestAPI.TestDefaultComputedPropertiesClass.self).noot, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "noot", expectedArgumentCount: 1) { env in
                                var mutatingSelf = try env.this(converter: TestAPI.TestDefaultComputedPropertiesClass.self)
                                mutatingSelf.noot = try env.argument(at: 0, converter: Swift.Int.self)
                                try TestAPI.TestDefaultComputedPropertiesClass.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                                return nil
                            }
                        }),
                    isStatic: false
                ),
                "plutonic": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "plutonic", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(env.this(converter: TestAPI.TestDefaultComputedPropertiesClass.self).pluto, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "spam": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "spam", expectedArgumentCount: 0) { env in
                                return try Swift.Bool.toNode(env.this(converter: TestAPI.TestDefaultComputedPropertiesClass.self).spam, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "spam", expectedArgumentCount: 1) { env in
                                var mutatingSelf = try env.this(converter: TestAPI.TestDefaultComputedPropertiesClass.self)
                                mutatingSelf.spam = try env.argument(at: 0, converter: Swift.Bool.self)
                                try TestAPI.TestDefaultComputedPropertiesClass.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                                return nil
                            }
                        }),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "TestDefaultComputedPropertiesReference_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.TestDefaultComputedPropertiesClass>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestDefaultComputedPropertiesReference",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

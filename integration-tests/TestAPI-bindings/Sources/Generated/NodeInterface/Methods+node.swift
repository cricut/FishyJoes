// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Methods: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Methods {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected Methods, got nil")
        }
        return try Box<Methods>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: Methods, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: "Methods", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: Methods, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected Methods, got nil")
        }
        try Box<Methods>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Methods",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Methods.toNode(
                                Methods.create(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "staticGet": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticGet", expectedArgumentCount: 0) { env in
                                try Int.toNode(Methods.staticGet, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "staticGetMethod": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticGetMethod", expectedArgumentCount: 0) { env in
                                try Int.toNode(Methods.staticGetMethod, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "staticModifiable": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticModifiable", expectedArgumentCount: 0) { env in
                                try Int.toNode(Methods.staticModifiable, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticModifiable", expectedArgumentCount: 1) { env in
                                Methods.staticModifiable = try env.argument(at: 0, converter: Int.self)
                                return nil
                            }
                        }),
                    isStatic: true
                ),
                "staticStored": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticStored", expectedArgumentCount: 0) { env in
                                try Int.toNode(Methods.staticStored, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticStored", expectedArgumentCount: 1) { env in
                                Methods.staticStored = try env.argument(at: 0, converter: Int.self)
                                return nil
                            }
                        }),
                    isStatic: true
                ),
                "instanceGet": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceGet", expectedArgumentCount: 0) { env in
                                try Int.toNode(env.this(converter: Methods.self).instanceGet, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "instanceGetMethod": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceGetMethod", expectedArgumentCount: 0) { env in
                                try Int.toNode(env.this(converter: Methods.self).instanceGetMethod, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "instanceModifiable": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceModifiable", expectedArgumentCount: 0) { env in
                                try Int.toNode(env.this(converter: Methods.self).instanceModifiable, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceModifiable", expectedArgumentCount: 1) { env in
                                var mutatingSelf = try env.this(converter: Methods.self)
                                mutatingSelf.instanceModifiable = try env.argument(at: 0, converter: Int.self)
                                try Methods.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                                return nil
                            }
                        }),
                    isStatic: false
                ),
                "instanceStored": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceStored", expectedArgumentCount: 0) { env in
                                try Int.toNode(env.this(converter: Methods.self).instanceStored, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceStored", expectedArgumentCount: 1) { env in
                                var mutatingSelf = try env.this(converter: Methods.self)
                                mutatingSelf.instanceStored = try env.argument(at: 0, converter: Int.self)
                                try Methods.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                                return nil
                            }
                        }),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Methods_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<Methods>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Methods",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

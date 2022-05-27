// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Functions: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected Functions, got nil")
        }
        return try Box<Functions>.takeUnretainedOpaque(nonNilPointer).value
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: "Functions", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected Functions, got nil")
        }
        try Box<Functions>.takeUnretainedOpaque(pointer).value = value
    }
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Functions",
            properties: [
                "exercise0": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise0", expectedArgumentCount: 1) { env in
                            let result = try Swift.String.toNode(
                                Functions.exercise0(
                                    try env.argument(at: 0, converter: Function0Converter<Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "exercise1": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise1", expectedArgumentCount: 1) { env in
                            let result = try Swift.String.toNode(
                                Functions.exercise1(
                                    try env.argument(at: 0, converter: Function1Converter<Int, Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "exercise2": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise2", expectedArgumentCount: 1) { env in
                            let result = try Swift.String.toNode(
                                Functions.exercise2(
                                    try env.argument(at: 0, converter: Function2Converter<Function1Converter<Int, Int>, Function1Converter<Int, Int>, Function1Converter<Int, Int>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "exercise3": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise3", expectedArgumentCount: 1) { env in
                            let result = try Swift.String.toNode(
                                Functions.exercise3(
                                    try env.argument(at: 0, converter: Function3Converter<Float, Double, Int, Double>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "exercise4": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise4", expectedArgumentCount: 1) { env in
                            let result = try Swift.String.toNode(
                                Functions.exercise4(
                                    try env.argument(at: 0, converter: Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "exercise5": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise5", expectedArgumentCount: 1) { env in
                            let result = try Swift.String.toNode(
                                Functions.exercise5(
                                    try env.argument(at: 0, converter: Function5Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Function0Converter<Int>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "exercise6": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise6", expectedArgumentCount: 1) { env in
                            let result = try Swift.String.toNode(
                                Functions.exercise6(
                                    try env.argument(at: 0, converter: Function6Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Int, Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "willThrow": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "willThrow", expectedArgumentCount: 0) { env in
                            let result = try Swift.String.toNode(
                                Functions.willThrow(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "const42": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "const42", expectedArgumentCount: 0) { env in
                                try Function0Converter<Int>.toNode(Functions.const42, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "abs": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "abs", expectedArgumentCount: 0) { env in
                                try Function1Converter<Int, Int>.toNode(Functions.iabs, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "intCompose": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "intCompose", expectedArgumentCount: 0) { env in
                                try Function2Converter<Function1Converter<Int, Int>, Function1Converter<Int, Int>, Function1Converter<Int, Int>>.toNode(Functions.intCompose, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "add3Things": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "add3Things", expectedArgumentCount: 0) { env in
                                try Function3Converter<Float, Double, Int, Double>.toNode(Functions.add3Things, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "makeList": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "makeList", expectedArgumentCount: 0) { env in
                                try Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toNode(Functions.makeList, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "fifthThing": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "fifthThing", expectedArgumentCount: 0) { env in
                                try Function5Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Function0Converter<Int>>.toNode(Functions.fifthThing, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "sixthThing": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "sixthThing", expectedArgumentCount: 0) { env in
                                try Function6Converter<Swift.String, Int, Double, Swift.String, Function0Converter<Int>, Int, Int>.toNode(Functions.six, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Functions_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<Functions>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Functions",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

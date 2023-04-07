// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Functions: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for Functions")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Functions",
            properties: [
                "exercise0": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise0", expectedArgumentCount: 1, hasNamedOptions: false) { env in
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
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise1", expectedArgumentCount: 1, hasNamedOptions: false) { env in
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
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise2", expectedArgumentCount: 1, hasNamedOptions: false) { env in
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
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise3", expectedArgumentCount: 1, hasNamedOptions: false) { env in
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
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise4", expectedArgumentCount: 1, hasNamedOptions: false) { env in
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
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise5", expectedArgumentCount: 1, hasNamedOptions: false) { env in
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
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise6", expectedArgumentCount: 1, hasNamedOptions: false) { env in
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
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "willThrow", expectedArgumentCount: 0, hasNamedOptions: false) { env in
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
                "async42Func": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "async42Func", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let thenFunction = try env.env.getNamedProperty(promise, "then")
                            let thenCallback: NAPI.Callback = { env, callbackInfo in
                                callbackBody(env, callbackInfo, name: "_async42Func_then", expectedArgumentCount: 1) { env in
                                    return try env.argument(at: 0)
                                }
                            }
                            let thenCallbackFunction = try env.env.createFunction(nil, thenCallback, nil)
                            _ = try env.env.callFunction(promise, thenFunction, [thenCallbackFunction])
                            let envBox = UncheckedSendableBox(env.env)
                            Task {
                                let result: Int = try (
                                    await Functions.async42Func(
                                    )
                                )
                                try envBox.value.resolveDeferred(deferred, Int.toNode(result, env: envBox.value))
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "asyncYieldFunc": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncYieldFunc", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let thenFunction = try env.env.getNamedProperty(promise, "then")
                            let thenCallback: NAPI.Callback = { env, callbackInfo in
                                callbackBody(env, callbackInfo, name: "_asyncYieldFunc_then", expectedArgumentCount: 1) { env in
                                    return try env.argument(at: 0)
                                }
                            }
                            let thenCallbackFunction = try env.env.createFunction(nil, thenCallback, nil)
                            _ = try env.env.callFunction(promise, thenFunction, [thenCallbackFunction])
                            let envBox = UncheckedSendableBox(env.env)
                            Task {
                                let result: Int = try (
                                    await Functions.asyncYieldFunc(
                                    )
                                )
                                try envBox.value.resolveDeferred(deferred, Int.toNode(result, env: envBox.value))
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "asyncSleepFunc": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncSleepFunc", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let thenFunction = try env.env.getNamedProperty(promise, "then")
                            let thenCallback: NAPI.Callback = { env, callbackInfo in
                                callbackBody(env, callbackInfo, name: "_asyncSleepFunc_then", expectedArgumentCount: 1) { env in
                                    return try env.argument(at: 0)
                                }
                            }
                            let thenCallbackFunction = try env.env.createFunction(nil, thenCallback, nil)
                            _ = try env.env.callFunction(promise, thenFunction, [thenCallbackFunction])
                            let envBox = UncheckedSendableBox(env.env)
                            Task {
                                let result: Int = try (
                                    await Functions.asyncSleepFunc(
                                    )
                                )
                                try envBox.value.resolveDeferred(deferred, Int.toNode(result, env: envBox.value))
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "asyncVoidFunc": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncVoidFunc", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let thenFunction = try env.env.getNamedProperty(promise, "then")
                            let thenCallback: NAPI.Callback = { env, callbackInfo in
                                callbackBody(env, callbackInfo, name: "_asyncVoidFunc_then", expectedArgumentCount: 1) { env in
                                    return try env.argument(at: 0)
                                }
                            }
                            let thenCallbackFunction = try env.env.createFunction(nil, thenCallback, nil)
                            _ = try env.env.callFunction(promise, thenFunction, [thenCallbackFunction])
                            let envBox = UncheckedSendableBox(env.env)
                            Task {
                                let result: Void = try (
                                    await Functions.asyncVoidFunc(
                                    )
                                )
                                try envBox.value.resolveDeferred(deferred, VoidConverter.toNode(result, env: envBox.value))
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "asyncCallbackFunc": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncCallbackFunc", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let thenFunction = try env.env.getNamedProperty(promise, "then")
                            let thenCallback: NAPI.Callback = { env, callbackInfo in
                                callbackBody(env, callbackInfo, name: "_asyncCallbackFunc_then", expectedArgumentCount: 1) { env in
                                    return try env.argument(at: 0)
                                }
                            }
                            let thenCallbackFunction = try env.env.createFunction(nil, thenCallback, nil)
                            _ = try env.env.callFunction(promise, thenFunction, [thenCallbackFunction])
                            let envBox = UncheckedSendableBox(env.env)
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Function0Converter<VoidConverter>.self))
                            Task {
                                let result: Void = try (
                                    await Functions.asyncCallbackFunc(
                                        arg0.value
                                    )
                                )
                                try envBox.value.resolveDeferred(deferred, VoidConverter.toNode(result, env: envBox.value))
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "asyncDoubleFunc": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncDoubleFunc", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let thenFunction = try env.env.getNamedProperty(promise, "then")
                            let thenCallback: NAPI.Callback = { env, callbackInfo in
                                callbackBody(env, callbackInfo, name: "_asyncDoubleFunc_then", expectedArgumentCount: 1) { env in
                                    return try env.argument(at: 0)
                                }
                            }
                            let thenCallbackFunction = try env.env.createFunction(nil, thenCallback, nil)
                            _ = try env.env.callFunction(promise, thenFunction, [thenCallbackFunction])
                            let envBox = UncheckedSendableBox(env.env)
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Double.self))
                            Task {
                                let result: Double = try (
                                    await Functions.asyncDoubleFunc(
                                        arg0.value
                                    )
                                )
                                try envBox.value.resolveDeferred(deferred, Double.toNode(result, env: envBox.value))
                            }
                            return promise
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
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "Functions_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Functions",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.Functions: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Functions")
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
                                TestAPI.Functions.exercise0(
                                    try env.argument(at: 0, converter: Function0Converter<Swift.Int>.self)
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
                                TestAPI.Functions.exercise1(
                                    try env.argument(at: 0, converter: Function1Converter<Swift.Int, Swift.Int>.self)
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
                                TestAPI.Functions.exercise2(
                                    try env.argument(at: 0, converter: Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>.self)
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
                                TestAPI.Functions.exercise3(
                                    try env.argument(at: 0, converter: Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.self)
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
                                TestAPI.Functions.exercise4(
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
                                TestAPI.Functions.exercise5(
                                    try env.argument(at: 0, converter: Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>.self)
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
                                TestAPI.Functions.exercise6(
                                    try env.argument(at: 0, converter: Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>.self)
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
                                TestAPI.Functions.willThrow(
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
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Functions.async42Func(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch let error as JSException {
                                    try onMainThread { env in
                                        let error = try env.createError(NAPI.Value(ptr: nil), String.toNode(error.message, env: env))
                                        try env.rejectDeferred(deferred, error)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                    }
                                }
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
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Functions.asyncYieldFunc(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch let error as JSException {
                                    try onMainThread { env in
                                        let error = try env.createError(NAPI.Value(ptr: nil), String.toNode(error.message, env: env))
                                        try env.rejectDeferred(deferred, error)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                    }
                                }
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
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Functions.asyncSleepFunc(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch let error as JSException {
                                    try onMainThread { env in
                                        let error = try env.createError(NAPI.Value(ptr: nil), String.toNode(error.message, env: env))
                                        try env.rejectDeferred(deferred, error)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                    }
                                }
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
                            Task {
                                do {
                                    let taskResult: Void = try await TestAPI.Functions.asyncVoidFunc(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try FishyJoesCommonRuntime.VoidConverter.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch let error as JSException {
                                    try onMainThread { env in
                                        let error = try env.createError(NAPI.Value(ptr: nil), String.toNode(error.message, env: env))
                                        try env.rejectDeferred(deferred, error)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "asyncCallbackFunc0": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncCallbackFunc0", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction0Converter<Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Functions.asyncCallbackFunc0(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch let error as JSException {
                                    try onMainThread { env in
                                        let error = try env.createError(NAPI.Value(ptr: nil), String.toNode(error.message, env: env))
                                        try env.rejectDeferred(deferred, error)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "asyncCallbackFunc1": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncCallbackFunc1", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction1Converter<Swift.Int, Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Functions.asyncCallbackFunc1(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch let error as JSException {
                                    try onMainThread { env in
                                        let error = try env.createError(NAPI.Value(ptr: nil), String.toNode(error.message, env: env))
                                        try env.rejectDeferred(deferred, error)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "asyncCallbackFunc2": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncCallbackFunc2", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction2Converter<Swift.Int, Swift.Int, Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Functions.asyncCallbackFunc2(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch let error as JSException {
                                    try onMainThread { env in
                                        let error = try env.createError(NAPI.Value(ptr: nil), String.toNode(error.message, env: env))
                                        try env.rejectDeferred(deferred, error)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "asyncCallbackFunc3": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncCallbackFunc3", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction3Converter<Swift.Int, Swift.Int, Swift.Int, Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Functions.asyncCallbackFunc3(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch let error as JSException {
                                    try onMainThread { env in
                                        let error = try env.createError(NAPI.Value(ptr: nil), String.toNode(error.message, env: env))
                                        try env.rejectDeferred(deferred, error)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "asyncCallbackFunc4": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncCallbackFunc4", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction4Converter<Swift.Int, Swift.Int, Swift.Int, Swift.Int, Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Functions.asyncCallbackFunc4(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch let error as JSException {
                                    try onMainThread { env in
                                        let error = try env.createError(NAPI.Value(ptr: nil), String.toNode(error.message, env: env))
                                        try env.rejectDeferred(deferred, error)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "asyncCallbackFunc5": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncCallbackFunc5", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction5Converter<Swift.Int, Swift.Int, Swift.Int, Swift.Int, Swift.Int, Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Functions.asyncCallbackFunc5(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch let error as JSException {
                                    try onMainThread { env in
                                        let error = try env.createError(NAPI.Value(ptr: nil), String.toNode(error.message, env: env))
                                        try env.rejectDeferred(deferred, error)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "asyncCallbackFunc6": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncCallbackFunc6", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction6Converter<Swift.Int, Swift.Int, Swift.Int, Swift.Int, Swift.Int, Swift.Int, Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Functions.asyncCallbackFunc6(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch let error as JSException {
                                    try onMainThread { env in
                                        let error = try env.createError(NAPI.Value(ptr: nil), String.toNode(error.message, env: env))
                                        try env.rejectDeferred(deferred, error)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                    }
                                }
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
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Swift.Double.self))
                            Task {
                                do {
                                    let taskResult: Double = try await TestAPI.Functions.asyncDoubleFunc(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Double.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch let error as JSException {
                                    try onMainThread { env in
                                        let error = try env.createError(NAPI.Value(ptr: nil), String.toNode(error.message, env: env))
                                        try env.rejectDeferred(deferred, error)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "asyncMultipleArgs": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncMultipleArgs", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Swift.Int.self))
                            let arg1 = UncheckedSendableBox(try env.argument(at: 1, converter: AsyncFunction0Converter<Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Functions.asyncMultipleArgs(
                                        arg0.value,
                                        j: arg1.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch let error as JSException {
                                    try onMainThread { env in
                                        let error = try env.createError(NAPI.Value(ptr: nil), String.toNode(error.message, env: env))
                                        try env.rejectDeferred(deferred, error)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "asyncThrowingFunc": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncThrowingFunc", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            Task {
                                do {
                                    let taskResult: Void = try await TestAPI.Functions.asyncThrowingFunc(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try FishyJoesCommonRuntime.VoidConverter.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch let error as JSException {
                                    try onMainThread { env in
                                        let error = try env.createError(NAPI.Value(ptr: nil), String.toNode(error.message, env: env))
                                        try env.rejectDeferred(deferred, error)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, String.toNode(error.localizedDescription, env: env))
                                    }
                                }
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
                                try Function0Converter<Swift.Int>.toNode(TestAPI.Functions.const42, env: env.env)
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
                                try Function1Converter<Swift.Int, Swift.Int>.toNode(TestAPI.Functions.iabs, env: env.env)
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
                                try Function2Converter<Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>, Function1Converter<Swift.Int, Swift.Int>>.toNode(TestAPI.Functions.intCompose, env: env.env)
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
                                try Function3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toNode(TestAPI.Functions.add3Things, env: env.env)
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
                                try Function4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toNode(TestAPI.Functions.makeList, env: env.env)
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
                                try Function5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Function0Converter<Swift.Int>>.toNode(TestAPI.Functions.fifthThing, env: env.env)
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
                                try Function6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, Function0Converter<Swift.Int>, Swift.Int, Swift.Int>.toNode(TestAPI.Functions.six, env: env.env)
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

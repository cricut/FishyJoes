// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.AsyncFunctions: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.AsyncFunctions")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "AsyncFunctions",
            properties: [
                "exercise0": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise0", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction0Converter<Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: String = try await TestAPI.AsyncFunctions.exercise0(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "exercise1": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise1", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction1Converter<Swift.Int, Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: String = try await TestAPI.AsyncFunctions.exercise1(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "exercise2": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise2", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.self))
                            Task {
                                do {
                                    let taskResult: String = try await TestAPI.AsyncFunctions.exercise2(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "exercise3": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise3", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.self))
                            Task {
                                do {
                                    let taskResult: String = try await TestAPI.AsyncFunctions.exercise3(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "exercise4": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise4", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.self))
                            Task {
                                do {
                                    let taskResult: String = try await TestAPI.AsyncFunctions.exercise4(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "exercise5": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise5", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.self))
                            Task {
                                do {
                                    let taskResult: String = try await TestAPI.AsyncFunctions.exercise5(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "exercise6": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise6", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: String = try await TestAPI.AsyncFunctions.exercise6(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: true
                ),
                "thunkTwiceMaker": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "thunkTwiceMaker", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.toNode(
                                TestAPI.AsyncFunctions.thunkTwiceMaker(
                                    thunk: try env.argument(at: 0, converter: AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.self)
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
                                try AsyncFunction0Converter<Swift.Int>.toNode(TestAPI.AsyncFunctions.const42, env: env.env)
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
                                try AsyncFunction1Converter<Swift.Int, Swift.Int>.toNode(TestAPI.AsyncFunctions.iabs, env: env.env)
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
                                try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toNode(TestAPI.AsyncFunctions.intCompose, env: env.env)
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
                                try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toNode(TestAPI.AsyncFunctions.add3Things, env: env.env)
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
                                try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toNode(TestAPI.AsyncFunctions.makeList, env: env.env)
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
                                try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toNode(TestAPI.AsyncFunctions.fifthThing, env: env.env)
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
                                try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toNode(TestAPI.AsyncFunctions.six, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "willThrow": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "willThrow", expectedArgumentCount: 0) { env in
                                try AsyncFunction0Converter<Swift.Int>.toNode(TestAPI.AsyncFunctions.willThrow, env: env.env)
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
                    name: "AsyncFunctions_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AsyncFunctions",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

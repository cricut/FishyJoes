// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _NodeTestAsyncFunctions: TestAPI.TestAsyncFunctions {
    let _nodeWitness: NodeReference

    var const42: () async throws -> Int
    var iabs: (Int) async throws -> Int
    var intCompose: (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int
    var add3Things: (Float, Double, Int) async throws -> Double
    var makeList: (String, String, String, String) async throws -> Array<String>
    var fifthThing: (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int
    var six: (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int
    var willThrow: () async throws -> Int
    var exercise0Impl: (() -> String)?
    public func exercise0(_ fn: @escaping () async throws -> Int) throws -> String {
        exercise0Impl!()
    }
    var exercise1Impl: (() -> String)?
    public func exercise1(_ fn: @escaping (Int) async throws -> Int) throws -> String {
        exercise1Impl!()
    }
    var exercise2Impl: (() -> String)?
    public func exercise2(_ fn: @escaping (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int) throws -> String {
        exercise2Impl!()
    }
    var exercise3Impl: (() -> String)?
    public func exercise3(_ fn: @escaping (Float, Double, Int) async throws -> Double) throws -> String {
        exercise3Impl!()
    }
    var exercise4Impl: (() -> String)?
    public func exercise4(_ fn: @escaping (String, String, String, String) async throws -> Array<String>) throws -> String {
        exercise4Impl!()
    }
    var exercise5Impl: (() -> String)?
    public func exercise5(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int) throws -> String {
        exercise5Impl!()
    }
    var exercise6Impl: (() -> String)?
    public func exercise6(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) throws -> String {
        exercise6Impl!()
    }
    var thunkTwiceMakerImpl: (() -> () async throws -> Void)?
    public func thunkTwiceMaker(thunk: @escaping () async throws -> Void) throws -> () async throws -> Void {
        thunkTwiceMakerImpl!()
    }
    var defaultExercise6Impl: (() -> String)?
    public func defaultExercise6(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) throws -> String {
        defaultExercise6Impl!()
    }
    var witnessImpl: (() -> TestAsyncFunctions)?
    public func witness() throws -> TestAsyncFunctions {
        witnessImpl!()
    }
}

extension TestAPI_CommonInterface._TestAsyncFunctionsConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            return try Box<SwiftType>.takeUnretained(value, env: env).value
        } catch {
            return _NodeTestAsyncFunctions(
                _nodeWitness: try NodeReference(env: env, value: value),
                const42: AsyncFunctions.const42,
                iabs: AsyncFunctions.iabs,
                intCompose: AsyncFunctions.intCompose,
                add3Things: AsyncFunctions.add3Things,
                makeList: AsyncFunctions.makeList,
                fifthThing: AsyncFunctions.fifthThing,
                six: AsyncFunctions.six,
                willThrow: AsyncFunctions.willThrow
            )
        }
    }
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestAsyncFunctions", env: env)
        let args: [NAPI.Value] = [
            try AsyncFunction0Converter<Swift.Int>.toNode(value.const42, env: env),
            try AsyncFunction1Converter<Swift.Int, Swift.Int>.toNode(value.iabs, env: env),
            try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toNode(value.intCompose, env: env),
            try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toNode(value.add3Things, env: env),
            try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toNode(value.makeList, env: env),
            try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toNode(value.fifthThing, env: env),
            try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toNode(value.six, env: env),
            try AsyncFunction0Converter<Swift.Int>.toNode(value.willThrow, env: env),
        ]
        return try env.newInstance(constructor, args)
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestAsyncFunctions",
            properties: [
                "exercise0": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise0", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction0Converter<Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise0(
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
                    isStatic: false
                ),
                "exercise1": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise1", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction1Converter<Swift.Int, Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise1(
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
                    isStatic: false
                ),
                "exercise2": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise2", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise2(
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
                    isStatic: false
                ),
                "exercise3": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise3", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise3(
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
                    isStatic: false
                ),
                "exercise4": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise4", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise4(
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
                    isStatic: false
                ),
                "exercise5": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise5", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise5(
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
                    isStatic: false
                ),
                "exercise6": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise6", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.exercise6(
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
                    isStatic: false
                ),
                "thunkTwiceMaker": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "thunkTwiceMaker", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).thunkTwiceMaker(
                                    thunk: try env.argument(at: 0, converter: AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "defaultExercise6": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "defaultExercise6", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                            Task {
                                do {
                                    let taskResult: String = try await swiftSelf.value.defaultExercise6(
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
                    isStatic: false
                ),
                "witness": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "witness", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI_CommonInterface._TestAsyncFunctionsConverter.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).witness(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "const42": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "const42", expectedArgumentCount: 0) { env in
                                try AsyncFunction0Converter<Swift.Int>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).const42, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "iabs": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "iabs", expectedArgumentCount: 0) { env in
                                try AsyncFunction1Converter<Swift.Int, Swift.Int>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).iabs, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "intCompose": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "intCompose", expectedArgumentCount: 0) { env in
                                try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).intCompose, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "add3Things": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "add3Things", expectedArgumentCount: 0) { env in
                                try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).add3Things, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "makeList": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "makeList", expectedArgumentCount: 0) { env in
                                try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).makeList, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "fifthThing": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "fifthThing", expectedArgumentCount: 0) { env in
                                try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).fifthThing, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "six": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "six", expectedArgumentCount: 0) { env in
                                try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).six, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "willThrow": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "willThrow", expectedArgumentCount: 0) { env in
                                try AsyncFunction0Converter<Swift.Int>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).willThrow, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "TestAsyncFunctions_constructor", expectedArgumentCount: 8) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "const42", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "iabs", env.argument(at: 1))
                    try env.env.setNamedProperty(this, "intCompose", env.argument(at: 2))
                    try env.env.setNamedProperty(this, "add3Things", env.argument(at: 3))
                    try env.env.setNamedProperty(this, "makeList", env.argument(at: 4))
                    try env.env.setNamedProperty(this, "fifthThing", env.argument(at: 5))
                    try env.env.setNamedProperty(this, "six", env.argument(at: 6))
                    try env.env.setNamedProperty(this, "willThrow", env.argument(at: 7))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestAsyncFunctions",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

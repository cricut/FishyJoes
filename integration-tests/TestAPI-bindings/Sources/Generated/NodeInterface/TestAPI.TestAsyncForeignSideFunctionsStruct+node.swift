// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.TestAsyncForeignSideFunctionsStruct: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            const42: try { () -> () async throws -> Int in
                let fieldValue = try env.getNamedProperty(value, "const42")
                return try AsyncFunction0Converter<Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            iabs: try { () -> (Int) async throws -> Int in
                let fieldValue = try env.getNamedProperty(value, "iabs")
                return try AsyncFunction1Converter<Swift.Int, Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            intCompose: try { () -> (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int in
                let fieldValue = try env.getNamedProperty(value, "intCompose")
                return try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.fromNode(fieldValue, env: env)
            }(),
            add3Things: try { () -> (Float, Double, Int) async throws -> Double in
                let fieldValue = try env.getNamedProperty(value, "add3Things")
                return try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.fromNode(fieldValue, env: env)
            }(),
            makeList: try { () -> (String, String, String, String) async throws -> [String] in
                let fieldValue = try env.getNamedProperty(value, "makeList")
                return try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.fromNode(fieldValue, env: env)
            }(),
            fifthThing: try { () -> (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int in
                let fieldValue = try env.getNamedProperty(value, "fifthThing")
                return try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.fromNode(fieldValue, env: env)
            }(),
            six: try { () -> (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int in
                let fieldValue = try env.getNamedProperty(value, "six")
                return try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            willThrow: try { () -> () async throws -> Int in
                let fieldValue = try env.getNamedProperty(value, "willThrow")
                return try AsyncFunction0Converter<Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            exercise0Fun: try { () -> (@escaping AsyncFunctions.AFun0) async throws -> String in
                let fieldValue = try env.getNamedProperty(value, "exercise0Fun")
                return try AsyncFunction1Converter<AsyncFunction0Converter<Swift.Int>, Swift.String>.fromNode(fieldValue, env: env)
            }(),
            exercise1Fun: try { () -> (@escaping AsyncFunctions.AFun1) async throws -> String in
                let fieldValue = try env.getNamedProperty(value, "exercise1Fun")
                return try AsyncFunction1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, Swift.String>.fromNode(fieldValue, env: env)
            }(),
            exercise2Fun: try { () -> (@escaping AsyncFunctions.AFun2) async throws -> String in
                let fieldValue = try env.getNamedProperty(value, "exercise2Fun")
                return try AsyncFunction1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, Swift.String>.fromNode(fieldValue, env: env)
            }(),
            exercise3Fun: try { () -> (@escaping AsyncFunctions.AFun3) async throws -> String in
                let fieldValue = try env.getNamedProperty(value, "exercise3Fun")
                return try AsyncFunction1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, Swift.String>.fromNode(fieldValue, env: env)
            }(),
            exercise4Fun: try { () -> (@escaping AsyncFunctions.AFun4) async throws -> String in
                let fieldValue = try env.getNamedProperty(value, "exercise4Fun")
                return try AsyncFunction1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, Swift.String>.fromNode(fieldValue, env: env)
            }(),
            exercise5Fun: try { () -> (@escaping AsyncFunctions.AFun5) async throws -> String in
                let fieldValue = try env.getNamedProperty(value, "exercise5Fun")
                return try AsyncFunction1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, Swift.String>.fromNode(fieldValue, env: env)
            }(),
            exercise6Fun: try { () -> (@escaping AsyncFunctions.AFun6) async throws -> String in
                let fieldValue = try env.getNamedProperty(value, "exercise6Fun")
                return try AsyncFunction1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, Swift.String>.fromNode(fieldValue, env: env)
            }(),
            thunkTwiceMakerFun: try { () -> (@escaping () async throws -> Void) throws -> () async throws -> Void in
                let fieldValue = try env.getNamedProperty(value, "thunkTwiceMakerFun")
                return try Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestAsyncForeignSideFunctionsStruct", env: env)
        let args: [NAPI.Value] = [
            try AsyncFunction0Converter<Swift.Int>.toNode(value.const42, env: env),
            try AsyncFunction1Converter<Swift.Int, Swift.Int>.toNode(value.iabs, env: env),
            try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toNode(value.intCompose, env: env),
            try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toNode(value.add3Things, env: env),
            try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toNode(value.makeList, env: env),
            try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toNode(value.fifthThing, env: env),
            try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toNode(value.six, env: env),
            try AsyncFunction0Converter<Swift.Int>.toNode(value.willThrow, env: env),
            try AsyncFunction1Converter<AsyncFunction0Converter<Swift.Int>, Swift.String>.toNode(value.exercise0Fun, env: env),
            try AsyncFunction1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, Swift.String>.toNode(value.exercise1Fun, env: env),
            try AsyncFunction1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, Swift.String>.toNode(value.exercise2Fun, env: env),
            try AsyncFunction1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, Swift.String>.toNode(value.exercise3Fun, env: env),
            try AsyncFunction1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, Swift.String>.toNode(value.exercise4Fun, env: env),
            try AsyncFunction1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, Swift.String>.toNode(value.exercise5Fun, env: env),
            try AsyncFunction1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, Swift.String>.toNode(value.exercise6Fun, env: env),
            try Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>.toNode(value.thunkTwiceMakerFun, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestAsyncForeignSideFunctionsStruct",
            properties: [
                "exercise0": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "exercise0", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction0Converter<Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self))
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
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self))
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
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self))
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
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self))
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
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self))
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
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self))
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
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self))
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
                                env.this(converter: TestAPI.TestAsyncForeignSideFunctionsStruct.self).thunkTwiceMaker(
                                    thunk: try env.argument(at: 0, converter: AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "const42": (.stored(mutable: true), isStatic: false),
                "iabs": (.stored(mutable: true), isStatic: false),
                "intCompose": (.stored(mutable: true), isStatic: false),
                "add3Things": (.stored(mutable: true), isStatic: false),
                "makeList": (.stored(mutable: true), isStatic: false),
                "fifthThing": (.stored(mutable: true), isStatic: false),
                "six": (.stored(mutable: true), isStatic: false),
                "willThrow": (.stored(mutable: true), isStatic: false),
                "exercise0Fun": (.stored(mutable: true), isStatic: false),
                "exercise1Fun": (.stored(mutable: true), isStatic: false),
                "exercise2Fun": (.stored(mutable: true), isStatic: false),
                "exercise3Fun": (.stored(mutable: true), isStatic: false),
                "exercise4Fun": (.stored(mutable: true), isStatic: false),
                "exercise5Fun": (.stored(mutable: true), isStatic: false),
                "exercise6Fun": (.stored(mutable: true), isStatic: false),
                "thunkTwiceMakerFun": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "TestAsyncForeignSideFunctionsStruct_constructor", expectedArgumentCount: 16) { env in
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
                    try env.env.setNamedProperty(this, "exercise0Fun", env.argument(at: 8))
                    try env.env.setNamedProperty(this, "exercise1Fun", env.argument(at: 9))
                    try env.env.setNamedProperty(this, "exercise2Fun", env.argument(at: 10))
                    try env.env.setNamedProperty(this, "exercise3Fun", env.argument(at: 11))
                    try env.env.setNamedProperty(this, "exercise4Fun", env.argument(at: 12))
                    try env.env.setNamedProperty(this, "exercise5Fun", env.argument(at: 13))
                    try env.env.setNamedProperty(this, "exercise6Fun", env.argument(at: 14))
                    try env.env.setNamedProperty(this, "thunkTwiceMakerFun", env.argument(at: 15))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestAsyncForeignSideFunctionsStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

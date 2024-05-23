// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import NodeAPI
import TestAPI
import TestAPI_CommonInterface

struct _NodeTestAsyncFunctions: TestAPI.TestAsyncFunctions {
    let _nodeWitness: NodeReference

    var add3Things: (Float, Double, Int) async throws -> Double {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let add3Things = try env.getNamedProperty(napiValue, "add3Things")
                return try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.fromNode(add3Things, env: env)
            }
        }
    }
    var const42: () async throws -> Int {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let const42 = try env.getNamedProperty(napiValue, "const42")
                return try AsyncFunction0Converter<Swift.Int>.fromNode(const42, env: env)
            }
        }
    }
    var fifthThing: (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let fifthThing = try env.getNamedProperty(napiValue, "fifthThing")
                return try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.fromNode(fifthThing, env: env)
            }
        }
    }
    var iabs: (Int) async throws -> Int {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let iabs = try env.getNamedProperty(napiValue, "iabs")
                return try AsyncFunction1Converter<Swift.Int, Swift.Int>.fromNode(iabs, env: env)
            }
        }
    }
    var intCompose: (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let intCompose = try env.getNamedProperty(napiValue, "intCompose")
                return try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.fromNode(intCompose, env: env)
            }
        }
    }
    var makeList: (String, String, String, String) async throws -> Array<String> {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let makeList = try env.getNamedProperty(napiValue, "makeList")
                return try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.fromNode(makeList, env: env)
            }
        }
    }
    var six: (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let six = try env.getNamedProperty(napiValue, "six")
                return try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.fromNode(six, env: env)
            }
        }
    }
    var willThrow: () async throws -> Int {
        get throws {
            try syncOnMainThread { env in
                let napiValue = try _nodeWitness.value(env: env)
                let willThrow = try env.getNamedProperty(napiValue, "willThrow")
                return try AsyncFunction0Converter<Swift.Int>.fromNode(willThrow, env: env)
            }
        }
    }
    public func exercise0(_ fn: @escaping () async throws -> Int) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let exercise0 = try env.getNamedProperty(napiValue, "exercise0")
            let result = try env.callFunction(napiValue, exercise0, [try AsyncFunction0Converter<Swift.Int>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func exercise1(_ fn: @escaping (Int) async throws -> Int) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let exercise1 = try env.getNamedProperty(napiValue, "exercise1")
            let result = try env.callFunction(napiValue, exercise1, [try AsyncFunction1Converter<Swift.Int, Swift.Int>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func exercise2(_ fn: @escaping (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let exercise2 = try env.getNamedProperty(napiValue, "exercise2")
            let result = try env.callFunction(napiValue, exercise2, [try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func exercise3(_ fn: @escaping (Float, Double, Int) async throws -> Double) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let exercise3 = try env.getNamedProperty(napiValue, "exercise3")
            let result = try env.callFunction(napiValue, exercise3, [try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func exercise4(_ fn: @escaping (String, String, String, String) async throws -> Array<String>) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let exercise4 = try env.getNamedProperty(napiValue, "exercise4")
            let result = try env.callFunction(napiValue, exercise4, [try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func exercise5(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let exercise5 = try env.getNamedProperty(napiValue, "exercise5")
            let result = try env.callFunction(napiValue, exercise5, [try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func exercise6(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let exercise6 = try env.getNamedProperty(napiValue, "exercise6")
            let result = try env.callFunction(napiValue, exercise6, [try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func thunkTwiceMaker(thunk: @escaping () async throws -> Void) throws -> () async throws -> Void {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let thunkTwiceMaker = try env.getNamedProperty(napiValue, "thunkTwiceMaker")
            let result = try env.callFunction(napiValue, thunkTwiceMaker, [try AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.toNode(thunk, env: env)])
            return try AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.fromNode(result, env: env)
        }
    }
    public func defaultExercise6(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let defaultExercise6 = try env.getNamedProperty(napiValue, "defaultExercise6")
            let result = try env.callFunction(napiValue, defaultExercise6, [try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toNode(fn, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func witness() throws -> TestAsyncFunctions {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let witness = try env.getNamedProperty(napiValue, "witness")
            let result = try env.callFunction(napiValue, witness, [])
            return try TestAPI_CommonInterface._TestAsyncFunctionsConverter.fromNode(result, env: env)
        }
    }
}

extension TestAPI_CommonInterface._TestAsyncFunctionsConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestAsyncFunctions", env: env)
            if try env.instanceof(value, constructor) {
                guard let nonNilPointer = try env.unwrap(value) else {
                    throw JSException(message: "expected TestAPI.TestAsyncFunctions, got nil")
                }
                return try Box<TestAPI.TestAsyncFunctions>.takeUnretainedOpaque(nonNilPointer).value
            } else {
                return _NodeTestAsyncFunctions(
                    _nodeWitness: try NodeReference(env: env, value: value)
                )
            }
        }}
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestAsyncFunctions", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let coreObject = try env.createObject()
        let fromCoreFunctionCallback: NAPI.Callback = { env, info in
            FishyJoesNodeRuntime.callbackBody(env, info, name: "fromCore", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                let coreArg = try env.argument(at: 0)

                let env = env.env
                let global = try env.getGlobal()
                let object = try env.getNamedProperty(global, "Object")
                let create = try env.getNamedProperty(object, "create")

                let result = try env.callFunction(object, create, [coreArg])

                let defaultExercise6FunctionCallback: NAPI.Callback = { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "defaultExercise6", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                        let (deferred, promise) = try env.env.createPromise()
                        let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.self))
                        let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self))
                        let _wrappedSwiftSelf = TestAPI_CommonInterface.TestAsyncFunctions_sans_defaultExercise6(wrapped: try swiftSelf.value)
                        Task {
                            do {
                                let taskResult: String = try await _wrappedSwiftSelf.defaultExercise6(
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
                }
                let defaultExercise6Function = try env.createFunction(
                    "defaultExercise6",
                    defaultExercise6FunctionCallback,
                    nil
                )
                if !(try env.hasNamedProperty(result, "defaultExercise6")) {
                    try env.setNamedProperty(result, "defaultExercise6", defaultExercise6Function)
                }

                return result
            }
        }
        let fromCoreFunction = try env.createFunction("fromCore", fromCoreFunctionCallback, nil)
        try env.setNamedProperty(fromCoreFunction, "static", env.getBoolean(true))
        try env.setNamedProperty(coreObject, "fromCore", fromCoreFunction)
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestAsyncFunctions",
            nodeClass: coreObject
        )

        let nodeClass = try NodeClass(
            env: env,
            name: "ExternalWitness_TestAsyncFunctions",
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
                            let _wrappedSwiftSelf = TestAPI_CommonInterface.TestAsyncFunctions_sans_defaultExercise6(wrapped: try swiftSelf.value)
                            Task {
                                do {
                                    let taskResult: String = try await _wrappedSwiftSelf.defaultExercise6(
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
                "add3Things": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "add3Things", expectedArgumentCount: 0) { env in
                                return try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).add3Things, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "const42": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "const42", expectedArgumentCount: 0) { env in
                                return try AsyncFunction0Converter<Swift.Int>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).const42, env: env.env)
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
                                return try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).fifthThing, env: env.env)
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
                                return try AsyncFunction1Converter<Swift.Int, Swift.Int>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).iabs, env: env.env)
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
                                return try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).intCompose, env: env.env)
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
                                return try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).makeList, env: env.env)
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
                                return try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).six, env: env.env)
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
                                return try AsyncFunction0Converter<Swift.Int>.toNode(env.this(converter: TestAPI_CommonInterface._TestAsyncFunctionsConverter.self).willThrow, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "ExternalWitness_TestAsyncFunctions_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.TestAsyncFunctions>.construct(env: env)
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "ExternalWitness_TestAsyncFunctions",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

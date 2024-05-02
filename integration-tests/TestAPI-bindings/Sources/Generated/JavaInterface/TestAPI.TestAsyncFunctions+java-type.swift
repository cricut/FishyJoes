// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _JavaTestAsyncFunctions: TestAPI.TestAsyncFunctions {
    let _javaWitness: JavaReference

    static var _add3ThingsGetMethodID: jmethodID?
    public var add3Things: (Float, Double, Int) async throws -> Double {
        get throws {
            let env = try Env.acquireJVMThread(on: _javaWitness.vm)
            defer {
                try? Env.relinquishJVMThread(on: _javaWitness.vm)
            }
            return try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.fromJava(
                env.CallObjectMethod(_javaWitness.object, Self._add3ThingsGetMethodID),
                env: env
            )
        }
    }

    static var _const42GetMethodID: jmethodID?
    public var const42: () async throws -> Int {
        get throws {
            let env = try Env.acquireJVMThread(on: _javaWitness.vm)
            defer {
                try? Env.relinquishJVMThread(on: _javaWitness.vm)
            }
            return try AsyncFunction0Converter<Swift.Int>.fromJava(
                env.CallObjectMethod(_javaWitness.object, Self._const42GetMethodID),
                env: env
            )
        }
    }

    static var _fifthThingGetMethodID: jmethodID?
    public var fifthThing: (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int {
        get throws {
            let env = try Env.acquireJVMThread(on: _javaWitness.vm)
            defer {
                try? Env.relinquishJVMThread(on: _javaWitness.vm)
            }
            return try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.fromJava(
                env.CallObjectMethod(_javaWitness.object, Self._fifthThingGetMethodID),
                env: env
            )
        }
    }

    static var _iabsGetMethodID: jmethodID?
    public var iabs: (Int) async throws -> Int {
        get throws {
            let env = try Env.acquireJVMThread(on: _javaWitness.vm)
            defer {
                try? Env.relinquishJVMThread(on: _javaWitness.vm)
            }
            return try AsyncFunction1Converter<Swift.Int, Swift.Int>.fromJava(
                env.CallObjectMethod(_javaWitness.object, Self._iabsGetMethodID),
                env: env
            )
        }
    }

    static var _intComposeGetMethodID: jmethodID?
    public var intCompose: (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int {
        get throws {
            let env = try Env.acquireJVMThread(on: _javaWitness.vm)
            defer {
                try? Env.relinquishJVMThread(on: _javaWitness.vm)
            }
            return try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.fromJava(
                env.CallObjectMethod(_javaWitness.object, Self._intComposeGetMethodID),
                env: env
            )
        }
    }

    static var _makeListGetMethodID: jmethodID?
    public var makeList: (String, String, String, String) async throws -> Array<String> {
        get throws {
            let env = try Env.acquireJVMThread(on: _javaWitness.vm)
            defer {
                try? Env.relinquishJVMThread(on: _javaWitness.vm)
            }
            return try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.fromJava(
                env.CallObjectMethod(_javaWitness.object, Self._makeListGetMethodID),
                env: env
            )
        }
    }

    static var _sixGetMethodID: jmethodID?
    public var six: (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int {
        get throws {
            let env = try Env.acquireJVMThread(on: _javaWitness.vm)
            defer {
                try? Env.relinquishJVMThread(on: _javaWitness.vm)
            }
            return try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.fromJava(
                env.CallObjectMethod(_javaWitness.object, Self._sixGetMethodID),
                env: env
            )
        }
    }

    static var _willThrowGetMethodID: jmethodID?
    public var willThrow: () async throws -> Int {
        get throws {
            let env = try Env.acquireJVMThread(on: _javaWitness.vm)
            defer {
                try? Env.relinquishJVMThread(on: _javaWitness.vm)
            }
            return try AsyncFunction0Converter<Swift.Int>.fromJava(
                env.CallObjectMethod(_javaWitness.object, Self._willThrowGetMethodID),
                env: env
            )
        }
    }

    static var _exercise0MethodID: jmethodID?
    public func exercise0(_ fn: @escaping () async throws -> Int) async throws -> String {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try Swift.String.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._exercise0MethodID,
                jvalue(try AsyncFunction0Converter<Swift.Int>.toJava(fn, env: env))
            ),
            env: env
        )
    }

    static var _exercise1MethodID: jmethodID?
    public func exercise1(_ fn: @escaping (Int) async throws -> Int) async throws -> String {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try Swift.String.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._exercise1MethodID,
                jvalue(try AsyncFunction1Converter<Swift.Int, Swift.Int>.toJava(fn, env: env))
            ),
            env: env
        )
    }

    static var _exercise2MethodID: jmethodID?
    public func exercise2(_ fn: @escaping (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int) async throws -> String {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try Swift.String.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._exercise2MethodID,
                jvalue(try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toJava(fn, env: env))
            ),
            env: env
        )
    }

    static var _exercise3MethodID: jmethodID?
    public func exercise3(_ fn: @escaping (Float, Double, Int) async throws -> Double) async throws -> String {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try Swift.String.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._exercise3MethodID,
                jvalue(try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toJava(fn, env: env))
            ),
            env: env
        )
    }

    static var _exercise4MethodID: jmethodID?
    public func exercise4(_ fn: @escaping (String, String, String, String) async throws -> Array<String>) async throws -> String {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try Swift.String.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._exercise4MethodID,
                jvalue(try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toJava(fn, env: env))
            ),
            env: env
        )
    }

    static var _exercise5MethodID: jmethodID?
    public func exercise5(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int) async throws -> String {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try Swift.String.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._exercise5MethodID,
                jvalue(try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toJava(fn, env: env))
            ),
            env: env
        )
    }

    static var _exercise6MethodID: jmethodID?
    public func exercise6(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) async throws -> String {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try Swift.String.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._exercise6MethodID,
                jvalue(try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toJava(fn, env: env))
            ),
            env: env
        )
    }

    static var _thunkTwiceMakerMethodID: jmethodID?
    public func thunkTwiceMaker(thunk: @escaping () async throws -> Void) throws -> () async throws -> Void {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._thunkTwiceMakerMethodID,
                jvalue(try AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.toJava(thunk, env: env))
            ),
            env: env
        )
    }

    static var _defaultExercise6MethodID: jmethodID?
    public func defaultExercise6(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) async throws -> String {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try Swift.String.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._defaultExercise6MethodID,
                jvalue(try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toJava(fn, env: env))
            ),
            env: env
        )
    }

    static var _witnessMethodID: jmethodID?
    public func witness() throws -> TestAsyncFunctions {
        let env = try Env.acquireJVMThread(on: _javaWitness.vm)
        defer {
            try? Env.relinquishJVMThread(on: _javaWitness.vm)
        }
        return try TestAPI_CommonInterface._TestAsyncFunctionsConverter.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._witnessMethodID
            ),
            env: env
        )
    }
}

extension TestAPI_CommonInterface._TestAsyncFunctionsConverter: JavaConverter {
    public typealias CType = jobject?
    public static var javaClass: jclass?
    public static var externalWitnessClass: jclass?
    public static var externalWitnessConstructor: jmethodID?
    public static var externalCompanionClass: jclass?
    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        if env.IsInstanceOf(value, AnyBox.javaClass) {
            return try Box<SwiftType>.fromJava(value, env: env).value
        }
        return _JavaTestAsyncFunctions(_javaWitness: try JavaReference(local: value, env: env))
    }
    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        try env.NewObject(
            externalWitnessClass,
            externalWitnessConstructor,
            jvalue(pointer: Box(value).retainedOpaque())
        )
    }
    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestAsyncFunctions"))
        externalWitnessClass = try env.globalRef(env.FindClass("com/cricut/testapi/_ExternalWitness_TestAsyncFunctions"))
        externalWitnessConstructor = try env.GetMethodID(externalWitnessClass, "<init>", "(J)V")
        _JavaTestAsyncFunctions._add3ThingsGetMethodID = try env.GetMethodID(javaClass, "getAdd3Things", "()Lkotlin/jvm/functions/Function4;")
        _JavaTestAsyncFunctions._const42GetMethodID = try env.GetMethodID(javaClass, "getConst42", "()Lkotlin/jvm/functions/Function1;")
        _JavaTestAsyncFunctions._fifthThingGetMethodID = try env.GetMethodID(javaClass, "getFifthThing", "()Lkotlin/jvm/functions/Function6;")
        _JavaTestAsyncFunctions._iabsGetMethodID = try env.GetMethodID(javaClass, "getIabs", "()Lkotlin/jvm/functions/Function2;")
        _JavaTestAsyncFunctions._intComposeGetMethodID = try env.GetMethodID(javaClass, "getIntCompose", "()Lkotlin/jvm/functions/Function2;")
        _JavaTestAsyncFunctions._makeListGetMethodID = try env.GetMethodID(javaClass, "getMakeList", "()Lkotlin/jvm/functions/Function5;")
        _JavaTestAsyncFunctions._sixGetMethodID = try env.GetMethodID(javaClass, "getSix", "()Lkotlin/jvm/functions/Function7;")
        _JavaTestAsyncFunctions._willThrowGetMethodID = try env.GetMethodID(javaClass, "getWillThrow", "()Lkotlin/jvm/functions/Function1;")
        externalCompanionClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestAsyncFunctions$Companion"))
        _JavaTestAsyncFunctions._thunkTwiceMakerMethodID = try env.GetMethodID(javaClass, "thunkTwiceMaker", "(Lkotlin/jvm/functions/Function1;)Lkotlin/jvm/functions/Function1;")
        _JavaTestAsyncFunctions._witnessMethodID = try env.GetMethodID(javaClass, "witness", "()Lcom/cricut/testapi/TestAsyncFunctions;")
        _JavaTestAsyncFunctions._exercise0MethodID = try env.GetMethodID(externalCompanionClass, "_deferred_exercise0", "(Lcom/cricut/testapi/TestAsyncFunctions;Lkotlin/jvm/functions/Function1;)Lkotlinx/coroutines/Deferred;")
        _JavaTestAsyncFunctions._exercise1MethodID = try env.GetMethodID(externalCompanionClass, "_deferred_exercise1", "(Lcom/cricut/testapi/TestAsyncFunctions;Lkotlin/jvm/functions/Function2;)Lkotlinx/coroutines/Deferred;")
        _JavaTestAsyncFunctions._exercise2MethodID = try env.GetMethodID(externalCompanionClass, "_deferred_exercise2", "(Lcom/cricut/testapi/TestAsyncFunctions;Lkotlin/jvm/functions/Function2;)Lkotlinx/coroutines/Deferred;")
        _JavaTestAsyncFunctions._exercise3MethodID = try env.GetMethodID(externalCompanionClass, "_deferred_exercise3", "(Lcom/cricut/testapi/TestAsyncFunctions;Lkotlin/jvm/functions/Function4;)Lkotlinx/coroutines/Deferred;")
        _JavaTestAsyncFunctions._exercise4MethodID = try env.GetMethodID(externalCompanionClass, "_deferred_exercise4", "(Lcom/cricut/testapi/TestAsyncFunctions;Lkotlin/jvm/functions/Function5;)Lkotlinx/coroutines/Deferred;")
        _JavaTestAsyncFunctions._exercise5MethodID = try env.GetMethodID(externalCompanionClass, "_deferred_exercise5", "(Lcom/cricut/testapi/TestAsyncFunctions;Lkotlin/jvm/functions/Function6;)Lkotlinx/coroutines/Deferred;")
        _JavaTestAsyncFunctions._exercise6MethodID = try env.GetMethodID(externalCompanionClass, "_deferred_exercise6", "(Lcom/cricut/testapi/TestAsyncFunctions;Lkotlin/jvm/functions/Function7;)Lkotlinx/coroutines/Deferred;")
        _JavaTestAsyncFunctions._defaultExercise6MethodID = try env.GetMethodID(externalCompanionClass, "_deferred_defaultExercise6", "(Lcom/cricut/testapi/TestAsyncFunctions;Lkotlin/jvm/functions/Function7;)Lkotlinx/coroutines/Deferred;")
    }
}

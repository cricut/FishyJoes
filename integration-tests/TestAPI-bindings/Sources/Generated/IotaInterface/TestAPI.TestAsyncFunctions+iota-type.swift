// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _IotaTestAsyncFunctions: TestAPI.TestAsyncFunctions {
    let _iotaWitness: IotaReference

    public var const42: () async throws -> Int {
        get throws {
            try AsyncFunction0Converter<Swift.Int>.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestAsyncFunctionsConverter._const42Getter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public var iabs: (Int) async throws -> Int {
        get throws {
            try AsyncFunction1Converter<Swift.Int, Swift.Int>.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestAsyncFunctionsConverter._iabsGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public var intCompose: (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int {
        get throws {
            try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestAsyncFunctionsConverter._intComposeGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public var add3Things: (Float, Double, Int) async throws -> Double {
        get throws {
            try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestAsyncFunctionsConverter._add3ThingsGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public var makeList: (String, String, String, String) async throws -> Array<String> {
        get throws {
            try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestAsyncFunctionsConverter._makeListGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public var fifthThing: (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int {
        get throws {
            try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestAsyncFunctionsConverter._fifthThingGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public var six: (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int {
        get throws {
            try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestAsyncFunctionsConverter._sixGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public var willThrow: () async throws -> Int {
        get throws {
            try AsyncFunction0Converter<Swift.Int>.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestAsyncFunctionsConverter._willThrowGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public func exercise0(_ fn: @escaping () async throws -> Int) async throws -> String {
        try Swift.String.consumeIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestAsyncFunctionsConverter._exercise0[_iotaWitness.env](
                    _iotaWitness.object,
                    try AsyncFunction0Converter<Swift.Int>.toIota(fn, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func exercise1(_ fn: @escaping (Int) async throws -> Int) async throws -> String {
        try Swift.String.consumeIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestAsyncFunctionsConverter._exercise1[_iotaWitness.env](
                    _iotaWitness.object,
                    try AsyncFunction1Converter<Swift.Int, Swift.Int>.toIota(fn, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func exercise2(_ fn: @escaping (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int) async throws -> String {
        try Swift.String.consumeIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestAsyncFunctionsConverter._exercise2[_iotaWitness.env](
                    _iotaWitness.object,
                    try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toIota(fn, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func exercise3(_ fn: @escaping (Float, Double, Int) async throws -> Double) async throws -> String {
        try Swift.String.consumeIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestAsyncFunctionsConverter._exercise3[_iotaWitness.env](
                    _iotaWitness.object,
                    try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toIota(fn, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func exercise4(_ fn: @escaping (String, String, String, String) async throws -> Array<String>) async throws -> String {
        try Swift.String.consumeIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestAsyncFunctionsConverter._exercise4[_iotaWitness.env](
                    _iotaWitness.object,
                    try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toIota(fn, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func exercise5(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int) async throws -> String {
        try Swift.String.consumeIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestAsyncFunctionsConverter._exercise5[_iotaWitness.env](
                    _iotaWitness.object,
                    try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toIota(fn, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func exercise6(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) async throws -> String {
        try Swift.String.consumeIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestAsyncFunctionsConverter._exercise6[_iotaWitness.env](
                    _iotaWitness.object,
                    try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toIota(fn, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func thunkTwiceMaker(thunk: @escaping () async throws -> Void) throws -> () async throws -> Void {
        try AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.consumeIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestAsyncFunctionsConverter._thunkTwiceMaker[_iotaWitness.env](
                    _iotaWitness.object,
                    try AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.toIota(thunk, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func defaultExercise6(_ fn: @escaping (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int) async throws -> String {
        try Swift.String.consumeIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestAsyncFunctionsConverter._defaultExercise6[_iotaWitness.env](
                    _iotaWitness.object,
                    try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toIota(fn, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func witness() throws -> TestAsyncFunctions {
        try TestAPI_CommonInterface._TestAsyncFunctionsConverter.consumeIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestAsyncFunctionsConverter._witness[_iotaWitness.env](
                    _iotaWitness.object,
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }
}

@_cdecl("TestAPI_CommonInterface__TestAsyncFunctionsConverter_setup")
public func TestAPI_CommonInterface__TestAsyncFunctionsConverter_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI_CommonInterface._TestAsyncFunctionsConverter._ConstructorMethod,
    _ const42Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction0Converter<Swift.Int>.CType,
    _ iabsGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction1Converter<Swift.Int, Swift.Int>.CType,
    _ intComposeGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.CType,
    _ add3ThingsGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.CType,
    _ makeListGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.CType,
    _ fifthThingGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.CType,
    _ sixGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.CType,
    _ willThrowGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction0Converter<Swift.Int>.CType,
    _ exercise0: @escaping @convention(c) (
        foreignObject,
        AsyncFunction0Converter<Swift.Int>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType,
    _ exercise1: @escaping @convention(c) (
        foreignObject,
        AsyncFunction1Converter<Swift.Int, Swift.Int>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType,
    _ exercise2: @escaping @convention(c) (
        foreignObject,
        Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType,
    _ exercise3: @escaping @convention(c) (
        foreignObject,
        AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType,
    _ exercise4: @escaping @convention(c) (
        foreignObject,
        AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType,
    _ exercise5: @escaping @convention(c) (
        foreignObject,
        AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType,
    _ exercise6: @escaping @convention(c) (
        foreignObject,
        AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType,
    _ thunkTwiceMaker: @escaping @convention(c) (
        foreignObject,
        AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.CType,
        _ exn: foreignOutExn
    ) -> AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.CType,
    _ defaultExercise6: @escaping @convention(c) (
        foreignObject,
        AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType,
    _ witness: @escaping @convention(c) (
        foreignObject,
        _ exn: foreignOutExn
    ) -> TestAPI_CommonInterface._TestAsyncFunctionsConverter.CType,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI_CommonInterface._TestAsyncFunctionsConverter._constructorMethod.isInitialized(env) { return }
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._constructorMethod[env] = constructorMethod
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._const42Getter[env] = const42Getter
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._iabsGetter[env] = iabsGetter
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._intComposeGetter[env] = intComposeGetter
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._add3ThingsGetter[env] = add3ThingsGetter
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._makeListGetter[env] = makeListGetter
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._fifthThingGetter[env] = fifthThingGetter
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._sixGetter[env] = sixGetter
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._willThrowGetter[env] = willThrowGetter
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._exercise0[env] = exercise0
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._exercise1[env] = exercise1
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._exercise2[env] = exercise2
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._exercise3[env] = exercise3
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._exercise4[env] = exercise4
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._exercise5[env] = exercise5
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._exercise6[env] = exercise6
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._thunkTwiceMaker[env] = thunkTwiceMaker
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._defaultExercise6[env] = defaultExercise6
    TestAPI_CommonInterface._TestAsyncFunctionsConverter._witness[env] = witness
}

extension TestAPI_CommonInterface._TestAsyncFunctionsConverter: IotaConverter {
    public typealias CType = foreignObject
    public typealias _ConstructorMethod = @convention(c) (
        _ ref: UnsafeMutableRawPointer,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()
    fileprivate static let _const42Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction0Converter<Swift.Int>.CType>()
    fileprivate static let _iabsGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction1Converter<Swift.Int, Swift.Int>.CType>()
    fileprivate static let _intComposeGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.CType>()
    fileprivate static let _add3ThingsGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.CType>()
    fileprivate static let _makeListGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.CType>()
    fileprivate static let _fifthThingGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.CType>()
    fileprivate static let _sixGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.CType>()
    fileprivate static let _willThrowGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction0Converter<Swift.Int>.CType>()
    fileprivate static let _exercise0 = Env.CallbackMap<@convention(c) (
        foreignObject,
        AsyncFunction0Converter<Swift.Int>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType>()
    fileprivate static let _exercise1 = Env.CallbackMap<@convention(c) (
        foreignObject,
        AsyncFunction1Converter<Swift.Int, Swift.Int>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType>()
    fileprivate static let _exercise2 = Env.CallbackMap<@convention(c) (
        foreignObject,
        Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType>()
    fileprivate static let _exercise3 = Env.CallbackMap<@convention(c) (
        foreignObject,
        AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType>()
    fileprivate static let _exercise4 = Env.CallbackMap<@convention(c) (
        foreignObject,
        AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType>()
    fileprivate static let _exercise5 = Env.CallbackMap<@convention(c) (
        foreignObject,
        AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType>()
    fileprivate static let _exercise6 = Env.CallbackMap<@convention(c) (
        foreignObject,
        AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType>()
    fileprivate static let _thunkTwiceMaker = Env.CallbackMap<@convention(c) (
        foreignObject,
        AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.CType,
        _ exn: foreignOutExn
    ) -> AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>.CType>()
    fileprivate static let _defaultExercise6 = Env.CallbackMap<@convention(c) (
        foreignObject,
        AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType>()
    fileprivate static let _witness = Env.CallbackMap<@convention(c) (
        foreignObject,
        _ exn: foreignOutExn
    ) -> TestAPI_CommonInterface._TestAsyncFunctionsConverter.CType>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        do {
            let box = try Box<SwiftType>.peekIota(value, env: env)
            return box.value
        } catch {
            let iotaWitness = try IotaReference(value, env: env)
            return _IotaTestAsyncFunctions(_iotaWitness: iotaWitness)
        }
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {
        try env.check { exn in
            // here's where we should make a new witness with witness constructor
            _constructorMethod[env](
                Box(value).retainedOpaque(),
                exn
            )
        }
    }
}

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

    public var intCompose: ((Int) async throws -> Int, (Int) async throws -> Int) throws -> (Int) async throws -> Int {
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

    public var fifthThing: (String, Int, Double, String, () async throws -> Int) async throws -> () async throws -> Int {
        get throws {
            try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestAsyncFunctionsConverter._fifthThingGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public var six: (String, Int, Double, String, () async throws -> Int, Int) async throws -> Int {
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

    public func exercise0(_ fn: () async throws -> Int) throws -> String {
        try Swift.String.peekIota(
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

    public func exercise1(_ fn: (Int) async throws -> Int) throws -> String {
        try Swift.String.peekIota(
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

    public func exercise2(_ fn: ((Int) async throws -> Int, (Int) async throws -> Int) throws -> (Int) async throws -> Int) throws -> String {
        try Swift.String.peekIota(
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

    public func exercise3(_ fn: (Float, Double, Int) async throws -> Double) throws -> String {
        try Swift.String.peekIota(
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
}

extension TestAPI_CommonInterface._TestAsyncFunctionsConverter: IotaMutator {
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

    public static func mutateIota(_ this: foreignObject, to value: SwiftType, env: Env) throws {
    }
}

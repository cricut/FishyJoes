// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_TestAsyncFunctionsStruct_setup")
public func TestAPI_TestAsyncFunctionsStruct_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI.TestAsyncFunctionsStruct._ConstructorMethod,
    _ const42Getter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction0Converter<Swift.Int>.CType,
    _ iabsGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction1Converter<Swift.Int, Swift.Int>.CType,
    _ intComposeGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.CType,
    _ add3ThingsGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.CType,
    _ makeListGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.CType,
    _ fifthThingGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.CType,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.TestAsyncFunctionsStruct._constructorMethod.isInitialized(env) { return }
    TestAPI.TestAsyncFunctionsStruct._constructorMethod[env] = constructorMethod
    TestAPI.TestAsyncFunctionsStruct._const42Getter[env] = const42Getter
    TestAPI.TestAsyncFunctionsStruct._iabsGetter[env] = iabsGetter
    TestAPI.TestAsyncFunctionsStruct._intComposeGetter[env] = intComposeGetter
    TestAPI.TestAsyncFunctionsStruct._add3ThingsGetter[env] = add3ThingsGetter
    TestAPI.TestAsyncFunctionsStruct._makeListGetter[env] = makeListGetter
    TestAPI.TestAsyncFunctionsStruct._fifthThingGetter[env] = fifthThingGetter
}

extension TestAPI.TestAsyncFunctionsStruct: IotaMutator {
    fileprivate static let _const42Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction0Converter<Swift.Int>.CType>()
    fileprivate static let _iabsGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction1Converter<Swift.Int, Swift.Int>.CType>()
    fileprivate static let _intComposeGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.CType>()
    fileprivate static let _add3ThingsGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.CType>()
    fileprivate static let _makeListGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.CType>()
    fileprivate static let _fifthThingGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.CType>()
    public typealias _ConstructorMethod = @convention(c) (
        AsyncFunction0Converter<Swift.Int>.CType,
        AsyncFunction1Converter<Swift.Int, Swift.Int>.CType,
        Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.CType,
        AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.CType,
        AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.CType,
        AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.CType,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            const42: try AsyncFunction0Converter<Swift.Int>.consumeIota(
                try env.check { exn in _const42Getter[env](value, exn) },
                env: env
            ),
            iabs: try AsyncFunction1Converter<Swift.Int, Swift.Int>.consumeIota(
                try env.check { exn in _iabsGetter[env](value, exn) },
                env: env
            ),
            intCompose: try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.consumeIota(
                try env.check { exn in _intComposeGetter[env](value, exn) },
                env: env
            ),
            add3Things: try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.consumeIota(
                try env.check { exn in _add3ThingsGetter[env](value, exn) },
                env: env
            ),
            makeList: try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.consumeIota(
                try env.check { exn in _makeListGetter[env](value, exn) },
                env: env
            ),
            fifthThing: try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.consumeIota(
                try env.check { exn in _fifthThingGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try AsyncFunction0Converter<Swift.Int>.toIota(value.const42, env: env),
                try AsyncFunction1Converter<Swift.Int, Swift.Int>.toIota(value.iabs, env: env),
                try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toIota(value.intCompose, env: env),
                try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toIota(value.add3Things, env: env),
                try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toIota(value.makeList, env: env),
                try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toIota(value.fifthThing, env: env),
                exn
            )
        }
    }

    public static func mutateIota(_ this: foreignObject, to value: Self, env: Env) throws {
    }
}

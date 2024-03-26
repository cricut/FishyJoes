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
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.TestAsyncFunctionsStruct._constructorMethod.isInitialized(env) { return }
    TestAPI.TestAsyncFunctionsStruct._constructorMethod[env] = constructorMethod
    TestAPI.TestAsyncFunctionsStruct._const42Getter[env] = const42Getter
    TestAPI.TestAsyncFunctionsStruct._iabsGetter[env] = iabsGetter
}

extension TestAPI.TestAsyncFunctionsStruct: IotaMutator {
    fileprivate static let _const42Getter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction0Converter<Swift.Int>.CType>()
    fileprivate static let _iabsGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> AsyncFunction1Converter<Swift.Int, Swift.Int>.CType>()
    public typealias _ConstructorMethod = @convention(c) (
        AsyncFunction0Converter<Swift.Int>.CType,
        AsyncFunction1Converter<Swift.Int, Swift.Int>.CType,
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
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try AsyncFunction0Converter<Swift.Int>.toIota(value.const42, env: env),
                try AsyncFunction1Converter<Swift.Int, Swift.Int>.toIota(value.iabs, env: env),
                exn
            )
        }
    }

    public static func mutateIota(_ this: foreignObject, to value: Self, env: Env) throws {
    }
}

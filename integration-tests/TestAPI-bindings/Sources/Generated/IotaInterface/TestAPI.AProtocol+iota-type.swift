// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

@_cdecl("TestAPI_CommonInterface__AProtocolConverter_setup")
public func TestAPI_CommonInterface__AProtocolConverter_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI_CommonInterface._AProtocolConverter._ConstructorMethod,
    _ fooGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI_CommonInterface._AProtocolConverter._constructorMethod.isInitialized(env) { return }
    TestAPI_CommonInterface._AProtocolConverter._constructorMethod[env] = constructorMethod
    TestAPI_CommonInterface._AProtocolConverter._fooGetter[env] = fooGetter
}

extension TestAPI_CommonInterface._AProtocolConverter: IotaMutator {
    public typealias CType = foreignObject
    fileprivate static let _fooGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType>()
    public typealias _ConstructorMethod = @convention(c) (
        Swift.String.CType,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            foo: try Swift.String.consumeIota(
                try env.check { exn in _fooGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try Swift.String.toIota(value.foo, env: env),
                exn
            )
        }
    }

    public static func mutateIota(_ this: foreignObject, to value: Self, env: Env) throws {
    }
}

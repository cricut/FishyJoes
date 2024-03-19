// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_MutatingCounter_setup")
public func TestAPI_MutatingCounter_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI.MutatingCounter._ConstructorMethod,
    _ countGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType,
    _ countSetter: @escaping @convention(c) (foreignObject, Swift.Int.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.MutatingCounter._constructorMethod.isInitialized(env) { return }
    TestAPI.MutatingCounter._constructorMethod[env] = constructorMethod
    TestAPI.MutatingCounter._countGetter[env] = countGetter
    TestAPI.MutatingCounter._countSetter[env] = countSetter
}

extension TestAPI.MutatingCounter: IotaMutator {
    fileprivate static let _countGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType>()
    fileprivate static let _countSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.Int.CType, _ exn: foreignOutExn) -> Void>()
    public typealias _ConstructorMethod = @convention(c) (
        Swift.Int.CType,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            count: try Swift.Int.consumeIota(
                try env.check { exn in _countGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try Swift.Int.toIota(value.count, env: env),
                exn
            )
        }
    }

    public static func mutateIota(_ this: foreignObject, to value: Self, env: Env) throws {
        do {
            let box = try Box<SwiftType>.peekIota(this, env: env)
            box.value = value
        } catch {
            try env.check { exn in _countSetter[env](
                this,
                try Swift.Int.toIota(value.count, env: env),
                exn
            )}
        }
    }
}

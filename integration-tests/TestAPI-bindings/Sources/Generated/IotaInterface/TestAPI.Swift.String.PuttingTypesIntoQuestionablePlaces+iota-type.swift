// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Swift_String_PuttingTypesIntoQuestionablePlaces_setup")
public func TestAPI_Swift_String_PuttingTypesIntoQuestionablePlaces_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI.Swift.String.PuttingTypesIntoQuestionablePlaces._ConstructorMethod,
    _ xGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ xSetter: @escaping @convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.Swift.String.PuttingTypesIntoQuestionablePlaces._constructorMethod.isInitialized(env) { return }
    TestAPI.Swift.String.PuttingTypesIntoQuestionablePlaces._constructorMethod[env] = constructorMethod
    TestAPI.Swift.String.PuttingTypesIntoQuestionablePlaces._xGetter[env] = xGetter
    TestAPI.Swift.String.PuttingTypesIntoQuestionablePlaces._xSetter[env] = xSetter
}

extension TestAPI.Swift.String.PuttingTypesIntoQuestionablePlaces: IotaMutator {
    fileprivate static let _xGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType>()
    fileprivate static let _xSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void>()
    public typealias _ConstructorMethod = @convention(c) (
        Swift.String.CType,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            x: try Swift.String.consumeIota(
                try env.check { exn in _xGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try Swift.String.toIota(value.x, env: env),
                exn
            )
        }
    }

    public static func mutateIota<R>(_ this: foreignObject, env: Env, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try peekIota(this, env: env)
        let result = try body(&mutatingSelf)
        try env.check { exn in _xSetter[env](
            this,
            try Swift.String.toIota(mutatingSelf.x, env: env),
            exn
        )}
        return result
    }
}

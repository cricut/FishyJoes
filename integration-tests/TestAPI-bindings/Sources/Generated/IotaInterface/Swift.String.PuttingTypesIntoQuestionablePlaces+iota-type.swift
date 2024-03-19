// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("Swift_String_PuttingTypesIntoQuestionablePlaces_setup")
public func Swift_String_PuttingTypesIntoQuestionablePlaces_setup(
    envRef: EnvRef,
    constructorMethod: @escaping Swift.String.PuttingTypesIntoQuestionablePlaces._ConstructorMethod,
    _ xGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if Swift.String.PuttingTypesIntoQuestionablePlaces._constructorMethod.isInitialized(env) { return }
    Swift.String.PuttingTypesIntoQuestionablePlaces._constructorMethod[env] = constructorMethod
    Swift.String.PuttingTypesIntoQuestionablePlaces._xGetter[env] = xGetter
}

extension Swift.String.PuttingTypesIntoQuestionablePlaces: IotaMutator {
    fileprivate static let _xGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType>()
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

    public static func mutateIota(_ this: foreignObject, to value: Self, env: Env) throws {
        // no mutable fields exist to mutate
    }
}

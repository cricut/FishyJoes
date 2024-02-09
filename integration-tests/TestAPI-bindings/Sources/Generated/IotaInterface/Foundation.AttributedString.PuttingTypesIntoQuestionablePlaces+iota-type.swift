// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup")
public func Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_setup(
    envRef: EnvRef,
    constructorMethod: @escaping Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces._ConstructorMethod,
    _ xGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces._constructorMethod.isInitialized(env) { return }
    Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces._constructorMethod[env] = constructorMethod
    Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces._xGetter[env] = xGetter
}

extension Foundation.AttributedString.PuttingTypesIntoQuestionablePlaces: IotaMutator {
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
    }
}

// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_TestLeadingUnderscoredPropStruct_setup")
public func TestAPI_TestLeadingUnderscoredPropStruct_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI.TestLeadingUnderscoredPropStruct._ConstructorMethod,
    _ _leadingUnderscorePropGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ _leadingUnderscorePropSetter: @escaping @convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.TestLeadingUnderscoredPropStruct._constructorMethod.isInitialized(env) { return }
    TestAPI.TestLeadingUnderscoredPropStruct._constructorMethod[env] = constructorMethod
    TestAPI.TestLeadingUnderscoredPropStruct.__leadingUnderscorePropGetter[env] = _leadingUnderscorePropGetter
    TestAPI.TestLeadingUnderscoredPropStruct.__leadingUnderscorePropSetter[env] = _leadingUnderscorePropSetter
}

extension TestAPI.TestLeadingUnderscoredPropStruct: IotaMutator {
    fileprivate static let __leadingUnderscorePropGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType>()
    fileprivate static let __leadingUnderscorePropSetter = Env.CallbackMap<@convention(c) (foreignObject, Swift.String.CType, _ exn: foreignOutExn) -> Void>()
    public typealias _ConstructorMethod = @convention(c) (
        Swift.String.CType,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            _leadingUnderscoreProp: try Swift.String.consumeIota(
                try env.check { exn in __leadingUnderscorePropGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try Swift.String.toIota(value._leadingUnderscoreProp, env: env),
                exn
            )
        }
    }

    public static func mutateIota(_ this: foreignObject, to value: Self, env: Env) throws {
        try env.check { exn in __leadingUnderscorePropSetter[env](
            this,
            try Swift.String.toIota(value._leadingUnderscoreProp, env: env),
            exn
        )}
    }
}

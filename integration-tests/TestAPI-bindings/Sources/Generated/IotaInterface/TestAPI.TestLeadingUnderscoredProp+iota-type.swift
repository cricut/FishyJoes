// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _IotaTestLeadingUnderscoredProp: TestAPI.TestLeadingUnderscoredProp {
    let _iotaWitness: IotaReference

    public var _leadingUnderscoreProp: String {
        get throws {
            try Swift.String.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter.__leadingUnderscorePropGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }
}

@_cdecl("TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter_setup")
public func TestAPI_CommonInterface__TestLeadingUnderscoredPropConverter_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter._ConstructorMethod,
    _ _leadingUnderscorePropGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter._constructorMethod.isInitialized(env) { return }
    TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter._constructorMethod[env] = constructorMethod
    TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter.__leadingUnderscorePropGetter[env] = _leadingUnderscorePropGetter
}

extension TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter: IotaConverter {
    public typealias CType = foreignObject
    public typealias _ConstructorMethod = @convention(c) (
        _ ref: UnsafeMutableRawPointer,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()
    fileprivate static let __leadingUnderscorePropGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        do {
            let box = try Box<SwiftType>.peekIota(value, env: env)
            return box.value
        } catch {
            let iotaWitness = try IotaReference(value, env: env)
            return _IotaTestLeadingUnderscoredProp(_iotaWitness: iotaWitness)
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

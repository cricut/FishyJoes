// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _IotaTestOptionalsProtocol: TestAPI.TestOptionalsProtocol {
    let _iotaWitness: IotaReference

    public var flarp: Optional<String> {
        get throws {
            try OptionalConverter<Swift.String>.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestOptionalsProtocolConverter._flarpGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public func wombat(zxc: Optional<Int>) throws -> Optional<Double> {
        try OptionalConverter<Swift.Double>.peekIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestOptionalsProtocolConverter._wombat[_iotaWitness.env](
                    _iotaWitness.object,
                    try OptionalConverter<Swift.Int>.toIota(zxc, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func spqr(_ pippo: AssociatedDataEnum) throws -> Int {
        try Swift.Int.peekIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestOptionalsProtocolConverter._spqr[_iotaWitness.env](
                    _iotaWitness.object,
                    try TestAPI.AssociatedDataEnum.toIota(pippo, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }
}

@_cdecl("TestAPI_CommonInterface__TestOptionalsProtocolConverter_setup")
public func TestAPI_CommonInterface__TestOptionalsProtocolConverter_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI_CommonInterface._TestOptionalsProtocolConverter._ConstructorMethod,
    _ flarpGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.String>.CType,
    _ wombat: @escaping @convention(c) (
        foreignObject,
        OptionalConverter<Swift.Int>.CType,
        _ exn: foreignOutExn
    ) -> OptionalConverter<Swift.Double>.CType,
    _ spqr: @escaping @convention(c) (
        foreignObject,
        TestAPI.AssociatedDataEnum.CType,
        _ exn: foreignOutExn
    ) -> Swift.Int.CType,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI_CommonInterface._TestOptionalsProtocolConverter._constructorMethod.isInitialized(env) { return }
    TestAPI_CommonInterface._TestOptionalsProtocolConverter._constructorMethod[env] = constructorMethod
    TestAPI_CommonInterface._TestOptionalsProtocolConverter._flarpGetter[env] = flarpGetter
    TestAPI_CommonInterface._TestOptionalsProtocolConverter._wombat[env] = wombat
    TestAPI_CommonInterface._TestOptionalsProtocolConverter._spqr[env] = spqr
}

extension TestAPI_CommonInterface._TestOptionalsProtocolConverter: IotaProtocolMutator {
    public typealias CType = foreignObject
    public typealias _ConstructorMethod = @convention(c) (
        _ ref: UnsafeMutableRawPointer,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()
    fileprivate static let _flarpGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> OptionalConverter<Swift.String>.CType>()
    fileprivate static let _wombat = Env.CallbackMap<@convention(c) (
        foreignObject,
        OptionalConverter<Swift.Int>.CType,
        _ exn: foreignOutExn
    ) -> OptionalConverter<Swift.Double>.CType>()
    fileprivate static let _spqr = Env.CallbackMap<@convention(c) (
        foreignObject,
        TestAPI.AssociatedDataEnum.CType,
        _ exn: foreignOutExn
    ) -> Swift.Int.CType>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        do {
            let box = try Box<SwiftType>.peekIota(value, env: env)
            return box.value
        } catch {
            let iotaWitness = try IotaReference(value, env: env)
            return _IotaTestOptionalsProtocol(_iotaWitness: iotaWitness)
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

// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _IotaTestPropertiesProtocol: TestAPI.TestPropertiesProtocol {
    let _iotaWitness: IotaReference

    public var corge: String {
        get throws {
            try Swift.String.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestPropertiesProtocolConverter._corgeGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public var frob: Array<Int> {
        get throws {
            try ArrayConverter<Swift.Int>.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestPropertiesProtocolConverter._frobGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }
}

@_cdecl("TestAPI_CommonInterface__TestPropertiesProtocolConverter_setup")
public func TestAPI_CommonInterface__TestPropertiesProtocolConverter_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI_CommonInterface._TestPropertiesProtocolConverter._ConstructorMethod,
    _ corgeGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ frobGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Swift.Int>.CType,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI_CommonInterface._TestPropertiesProtocolConverter._constructorMethod.isInitialized(env) { return }
    TestAPI_CommonInterface._TestPropertiesProtocolConverter._constructorMethod[env] = constructorMethod
    TestAPI_CommonInterface._TestPropertiesProtocolConverter._corgeGetter[env] = corgeGetter
    TestAPI_CommonInterface._TestPropertiesProtocolConverter._frobGetter[env] = frobGetter
}

extension TestAPI_CommonInterface._TestPropertiesProtocolConverter: IotaConverter {
    public typealias CType = foreignObject
    public typealias _ConstructorMethod = @convention(c) (
        _ ref: UnsafeMutableRawPointer,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()
    fileprivate static let _corgeGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType>()
    fileprivate static let _frobGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Swift.Int>.CType>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        do {
            let box = try Box<SwiftType>.peekIota(value, env: env)
            return box.value
        } catch {
            let iotaWitness = try IotaReference(value, env: env)
            return _IotaTestPropertiesProtocol(_iotaWitness: iotaWitness)
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

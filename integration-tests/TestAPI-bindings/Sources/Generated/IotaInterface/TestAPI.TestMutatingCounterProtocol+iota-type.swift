// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _IotaTestMutatingCounterProtocol: TestAPI.TestMutatingCounterProtocol {
    let _iotaWitness: IotaReference

    public var count: Int {
        get throws {
            try Swift.Int.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestMutatingCounterProtocolConverter._countGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public func tick() throws {
        try FishyJoesCommonRuntime.VoidConverter.peekIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestMutatingCounterProtocolConverter._tick[_iotaWitness.env](
                    _iotaWitness.object,
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func witness() throws -> TestMutatingCounterProtocol {
        try TestAPI_CommonInterface._TestMutatingCounterProtocolConverter.peekIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestMutatingCounterProtocolConverter._witness[_iotaWitness.env](
                    _iotaWitness.object,
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }
}

@_cdecl("TestAPI_CommonInterface__TestMutatingCounterProtocolConverter_setup")
public func TestAPI_CommonInterface__TestMutatingCounterProtocolConverter_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI_CommonInterface._TestMutatingCounterProtocolConverter._ConstructorMethod,
    _ countGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType,
    _ tick: @escaping @convention(c) (
        foreignObject,
        _ exn: foreignOutExn
    ) -> FishyJoesCommonRuntime.VoidConverter.CType,
    _ witness: @escaping @convention(c) (
        foreignObject,
        _ exn: foreignOutExn
    ) -> TestAPI_CommonInterface._TestMutatingCounterProtocolConverter.CType,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI_CommonInterface._TestMutatingCounterProtocolConverter._constructorMethod.isInitialized(env) { return }
    TestAPI_CommonInterface._TestMutatingCounterProtocolConverter._constructorMethod[env] = constructorMethod
    TestAPI_CommonInterface._TestMutatingCounterProtocolConverter._countGetter[env] = countGetter
    TestAPI_CommonInterface._TestMutatingCounterProtocolConverter._tick[env] = tick
    TestAPI_CommonInterface._TestMutatingCounterProtocolConverter._witness[env] = witness
}

extension TestAPI_CommonInterface._TestMutatingCounterProtocolConverter: IotaMutator {
    public typealias CType = foreignObject
    public typealias _ConstructorMethod = @convention(c) (
        _ ref: UnsafeMutableRawPointer,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()
    fileprivate static let _countGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType>()
    fileprivate static let _tick = Env.CallbackMap<@convention(c) (
        foreignObject,
        _ exn: foreignOutExn
    ) -> FishyJoesCommonRuntime.VoidConverter.CType>()
    fileprivate static let _witness = Env.CallbackMap<@convention(c) (
        foreignObject,
        _ exn: foreignOutExn
    ) -> TestAPI_CommonInterface._TestMutatingCounterProtocolConverter.CType>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        do {
            let box = try Box<SwiftType>.peekIota(value, env: env)
            return box.value
        } catch {
            let iotaWitness = try IotaReference(value, env: env)
            return _IotaTestMutatingCounterProtocol(_iotaWitness: iotaWitness)
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

    public static func mutateIota(_ this: foreignObject, to value: SwiftType, env: Env) throws {
    }
}

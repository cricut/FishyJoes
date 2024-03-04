// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _IotaAProtocol: TestAPI.AProtocol {
    let _iotaWitness: IotaReference

    public var foo: Int {
        get throws {
            try Int.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._AProtocolConverter._fooGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public func increment() throws {
        // call dart function here somehow. It's got to be assigned somehow in the setup
    }
}

@_cdecl("TestAPI_CommonInterface__AProtocolConverter_setup")
public func TestAPI_CommonInterface__AProtocolConverter_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI_CommonInterface._AProtocolConverter._ConstructorMethod,
    _ fooGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType,
    _ increment: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> FishyJoesCommonRuntime.VoidConverter.CType,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI_CommonInterface._AProtocolConverter._constructorMethod.isInitialized(env) { return }
    TestAPI_CommonInterface._AProtocolConverter._constructorMethod[env] = constructorMethod
    TestAPI_CommonInterface._AProtocolConverter._fooGetter[env] = fooGetter
    TestAPI_CommonInterface._AProtocolConverter._increment[env] = increment
}

extension TestAPI_CommonInterface._AProtocolConverter: IotaMutator {
    public typealias CType = foreignObject
    fileprivate static let _fooGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType>()
    public typealias _ConstructorMethod = @convention(c) (
        Swift.Int.CType,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        do {
            let box = try Box<SwiftType>.peekIota(value, env: env)
            return box.value
        } catch {
            guard error is BoxTypeError else {
                fatalError("Unexpected error: \(error)")
            }
            // The only error that peekIota can throw is a BoxTypeError, which happens when the box.value type is not our expected type of Box<SwiftType>, in which case we should use the IotaWitness
            let iotaWitness = try IotaReference(value, env: env)
            return _IotaAProtocol(_iotaWitness: iotaWitness)
        }
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {
        try env.check { exn in
            //here's where we should make a new witness with witness constructor
            _constructorMethod[env](
                try Swift.Int.toIota(value.foo, env: env),
                exn
            )
        }
    }

    public static func mutateIota(_ this: foreignObject, to value: SwiftType, env: Env) throws {
    }
}

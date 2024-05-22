// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _IotaTestDefaultComputedProperties: TestAPI.TestDefaultComputedProperties {
    let _iotaWitness: IotaReference

    public var noot: Int {
        get throws {
            try Swift.Int.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter._nootGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public var pluto: String {
        get throws {
            try Swift.String.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter._plutoGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }
}

@_cdecl("TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_setup")
public func TestAPI_CommonInterface__TestDefaultComputedPropertiesConverter_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter._ConstructorMethod,
    _ nootGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType,
    _ plutoGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter._constructorMethod.isInitialized(env) { return }
    TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter._constructorMethod[env] = constructorMethod
    TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter._nootGetter[env] = nootGetter
    TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter._plutoGetter[env] = plutoGetter
}

extension TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter: IotaConverter {
    public typealias CType = foreignObject
    public typealias _ConstructorMethod = @convention(c) (
        _ ref: UnsafeMutableRawPointer,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()
    fileprivate static let _nootGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType>()
    fileprivate static let _plutoGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        do {
            let box = try Box<SwiftType>.peekIota(value, env: env)
            return box.value
        } catch {
            let iotaWitness = try IotaReference(value, env: env)
            return _IotaTestDefaultComputedProperties(_iotaWitness: iotaWitness)
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

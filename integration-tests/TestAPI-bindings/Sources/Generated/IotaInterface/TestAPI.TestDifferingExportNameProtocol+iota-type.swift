// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _IotaTestDifferingExportNameProtocol: TestAPI.TestDifferingExportNameProtocol {
    let _iotaWitness: IotaReference

    public var tata: Int {
        get throws {
            try Swift.Int.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter._tataGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }
}

@_cdecl("TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter_setup")
public func TestAPI_CommonInterface__TestDifferingExportNameProtocolConverter_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter._ConstructorMethod,
    _ tataGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter._constructorMethod.isInitialized(env) { return }
    TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter._constructorMethod[env] = constructorMethod
    TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter._tataGetter[env] = tataGetter
}

extension TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter: IotaConverter {
    public typealias CType = foreignObject
    public typealias _ConstructorMethod = @convention(c) (
        _ ref: UnsafeMutableRawPointer,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()
    fileprivate static let _tataGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Int.CType>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        do {
            let box = try Box<SwiftType>.peekIota(value, env: env)
            return box.value
        } catch {
            let iotaWitness = try IotaReference(value, env: env)
            return _IotaTestDifferingExportNameProtocol(_iotaWitness: iotaWitness)
        }
    }

    public static func toIota(_ value: SwiftType, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                Box(value).retainedOpaque(),
                exn
            )
        }
    }
}

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

    public var foo: String {
        get throws {
            try Swift.String.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._AProtocolConverter._fooGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public var baz: Bool {
        get throws {
            try Swift.Bool.consumeIota(
                try _iotaWitness.env.check { exn in
                    TestAPI_CommonInterface._AProtocolConverter._bazGetter[_iotaWitness.env](_iotaWitness.object, exn)
                },
                env: _iotaWitness.env
            )
        }
    }

    public func bar(x: Int, y: Int) throws -> AProtocol {
        try TestAPI_CommonInterface._AProtocolConverter.peekIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._AProtocolConverter._bar[_iotaWitness.env](
                    _iotaWitness.object,
                    try Swift.Int.toIota(x, env: _iotaWitness.env),
                    try Swift.Int.toIota(y, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func hasADefaultImplementation(x: Int, y: Double) throws -> String {
        try Swift.String.peekIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._AProtocolConverter._hasADefaultImplementation[_iotaWitness.env](
                    _iotaWitness.object,
                    try Swift.Int.toIota(x, env: _iotaWitness.env),
                    try Swift.Double.toIota(y, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func hasADefaultImplementation2(_ a: String, b: Bool, _ c: Double) throws -> Double {
        try Swift.Double.peekIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._AProtocolConverter._hasADefaultImplementation2[_iotaWitness.env](
                    _iotaWitness.object,
                    try Swift.String.toIota(a, env: _iotaWitness.env),
                    try Swift.Bool.toIota(b, env: _iotaWitness.env),
                    try Swift.Double.toIota(c, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }
}

@_cdecl("TestAPI_CommonInterface__AProtocolConverter_setup")
public func TestAPI_CommonInterface__AProtocolConverter_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI_CommonInterface._AProtocolConverter._ConstructorMethod,
    _ fooGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType,
    _ bazGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Bool.CType,
    _ bar: @escaping @convention(c) (
        foreignObject,
        Swift.Int.CType,
        Swift.Int.CType,
        _ exn: foreignOutExn
    ) -> TestAPI_CommonInterface._AProtocolConverter.CType,
    _ hasADefaultImplementation: @escaping @convention(c) (
        foreignObject,
        Swift.Int.CType,
        Swift.Double.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType,
    _ hasADefaultImplementation2: @escaping @convention(c) (
        foreignObject,
        Swift.String.CType,
        Swift.Bool.CType,
        Swift.Double.CType,
        _ exn: foreignOutExn
    ) -> Swift.Double.CType,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI_CommonInterface._AProtocolConverter._constructorMethod.isInitialized(env) { return }
    TestAPI_CommonInterface._AProtocolConverter._constructorMethod[env] = constructorMethod
    TestAPI_CommonInterface._AProtocolConverter._fooGetter[env] = fooGetter
    TestAPI_CommonInterface._AProtocolConverter._bazGetter[env] = bazGetter
    TestAPI_CommonInterface._AProtocolConverter._bar[env] = bar
    TestAPI_CommonInterface._AProtocolConverter._hasADefaultImplementation[env] = hasADefaultImplementation
    TestAPI_CommonInterface._AProtocolConverter._hasADefaultImplementation2[env] = hasADefaultImplementation2
}

extension TestAPI_CommonInterface._AProtocolConverter: IotaMutator {
    public typealias CType = foreignObject
    public typealias _ConstructorMethod = @convention(c) (
        _ ref: UnsafeMutableRawPointer,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()
    fileprivate static let _fooGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.String.CType>()
    fileprivate static let _bazGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> Swift.Bool.CType>()
    fileprivate static let _bar = Env.CallbackMap<@convention(c) (
        foreignObject,
        Swift.Int.CType,
        Swift.Int.CType,
        _ exn: foreignOutExn
    ) -> TestAPI_CommonInterface._AProtocolConverter.CType>()
    fileprivate static let _hasADefaultImplementation = Env.CallbackMap<@convention(c) (
        foreignObject,
        Swift.Int.CType,
        Swift.Double.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType>()
    fileprivate static let _hasADefaultImplementation2 = Env.CallbackMap<@convention(c) (
        foreignObject,
        Swift.String.CType,
        Swift.Bool.CType,
        Swift.Double.CType,
        _ exn: foreignOutExn
    ) -> Swift.Double.CType>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        do {
            let box = try Box<SwiftType>.peekIota(value, env: env)
            return box.value
        } catch {
            let iotaWitness = try IotaReference(value, env: env)
            return _IotaAProtocol(_iotaWitness: iotaWitness)
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
        do {
            let box = try Box<SwiftType>.peekIota(this, env: env)
            box.value = value
        } catch {
            // no mutable fields exist to mutate
        }
    }
}

// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _IotaTestMethodsProtocol: TestAPI.TestMethodsProtocol {
    let _iotaWitness: IotaReference

    public func foo() throws {
        try FishyJoesCommonRuntime.VoidConverter.peekIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestMethodsProtocolConverter._foo[_iotaWitness.env](
                    _iotaWitness.object,
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func bar() throws -> Bool {
        try Swift.Bool.peekIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestMethodsProtocolConverter._bar[_iotaWitness.env](
                    _iotaWitness.object,
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func baz(qux: Bool) throws {
        try FishyJoesCommonRuntime.VoidConverter.peekIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestMethodsProtocolConverter._baz[_iotaWitness.env](
                    _iotaWitness.object,
                    try Swift.Bool.toIota(qux, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func garply(_ _0: String) throws -> String {
        try Swift.String.peekIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestMethodsProtocolConverter._garply[_iotaWitness.env](
                    _iotaWitness.object,
                    try Swift.String.toIota(_0, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func xyzzy(thud: Int, grault: Array<Double>) throws -> String {
        try Swift.String.peekIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestMethodsProtocolConverter._xyzzy[_iotaWitness.env](
                    _iotaWitness.object,
                    try Swift.Int.toIota(thud, env: _iotaWitness.env),
                    try ArrayConverter<Swift.Double>.toIota(grault, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }

    public func plugh(fred: (Bool, Double, Array<String>)) throws -> (Bool, Int, String) {
        try Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>.peekIota(
            try _iotaWitness.env.check { exn in
                TestAPI_CommonInterface._TestMethodsProtocolConverter._plugh[_iotaWitness.env](
                    _iotaWitness.object,
                    try Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>.toIota(fred, env: _iotaWitness.env),
                    exn
                )
            },
            env: _iotaWitness.env
        )
    }
}

@_cdecl("TestAPI_CommonInterface__TestMethodsProtocolConverter_setup")
public func TestAPI_CommonInterface__TestMethodsProtocolConverter_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI_CommonInterface._TestMethodsProtocolConverter._ConstructorMethod,
    _ foo: @escaping @convention(c) (
        foreignObject,
        _ exn: foreignOutExn
    ) -> FishyJoesCommonRuntime.VoidConverter.CType,
    _ bar: @escaping @convention(c) (
        foreignObject,
        _ exn: foreignOutExn
    ) -> Swift.Bool.CType,
    _ baz: @escaping @convention(c) (
        foreignObject,
        Swift.Bool.CType,
        _ exn: foreignOutExn
    ) -> FishyJoesCommonRuntime.VoidConverter.CType,
    _ garply: @escaping @convention(c) (
        foreignObject,
        Swift.String.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType,
    _ xyzzy: @escaping @convention(c) (
        foreignObject,
        Swift.Int.CType,
        ArrayConverter<Swift.Double>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType,
    _ plugh: @escaping @convention(c) (
        foreignObject,
        Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>.CType,
        _ exn: foreignOutExn
    ) -> Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>.CType,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI_CommonInterface._TestMethodsProtocolConverter._constructorMethod.isInitialized(env) { return }
    TestAPI_CommonInterface._TestMethodsProtocolConverter._constructorMethod[env] = constructorMethod
    TestAPI_CommonInterface._TestMethodsProtocolConverter._foo[env] = foo
    TestAPI_CommonInterface._TestMethodsProtocolConverter._bar[env] = bar
    TestAPI_CommonInterface._TestMethodsProtocolConverter._baz[env] = baz
    TestAPI_CommonInterface._TestMethodsProtocolConverter._garply[env] = garply
    TestAPI_CommonInterface._TestMethodsProtocolConverter._xyzzy[env] = xyzzy
    TestAPI_CommonInterface._TestMethodsProtocolConverter._plugh[env] = plugh
}

extension TestAPI_CommonInterface._TestMethodsProtocolConverter: IotaMutator {
    public typealias CType = foreignObject
    public typealias _ConstructorMethod = @convention(c) (
        _ ref: UnsafeMutableRawPointer,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()
    fileprivate static let _foo = Env.CallbackMap<@convention(c) (
        foreignObject,
        _ exn: foreignOutExn
    ) -> FishyJoesCommonRuntime.VoidConverter.CType>()
    fileprivate static let _bar = Env.CallbackMap<@convention(c) (
        foreignObject,
        _ exn: foreignOutExn
    ) -> Swift.Bool.CType>()
    fileprivate static let _baz = Env.CallbackMap<@convention(c) (
        foreignObject,
        Swift.Bool.CType,
        _ exn: foreignOutExn
    ) -> FishyJoesCommonRuntime.VoidConverter.CType>()
    fileprivate static let _garply = Env.CallbackMap<@convention(c) (
        foreignObject,
        Swift.String.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType>()
    fileprivate static let _xyzzy = Env.CallbackMap<@convention(c) (
        foreignObject,
        Swift.Int.CType,
        ArrayConverter<Swift.Double>.CType,
        _ exn: foreignOutExn
    ) -> Swift.String.CType>()
    fileprivate static let _plugh = Env.CallbackMap<@convention(c) (
        foreignObject,
        Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>.CType,
        _ exn: foreignOutExn
    ) -> Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>.CType>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> SwiftType {
        do {
            let box = try Box<SwiftType>.peekIota(value, env: env)
            return box.value
        } catch {
            let iotaWitness = try IotaReference(value, env: env)
            return _IotaTestMethodsProtocol(_iotaWitness: iotaWitness)
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

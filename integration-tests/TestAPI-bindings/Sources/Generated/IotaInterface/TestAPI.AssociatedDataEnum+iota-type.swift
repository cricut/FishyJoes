// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_AssociatedDataEnum_setup")
public func TestAPI_AssociatedDataEnum_setup(
    envRef: EnvRef,
    discriminator: @escaping TestAPI.AssociatedDataEnum.Discriminator,
    thing_constructor: @escaping TestAPI.AssociatedDataEnum.Thing_constructor,
    thing_extractor: @escaping TestAPI.AssociatedDataEnum.Thing_extractor
) {
    let env = Env(envRef)
    TestAPI.AssociatedDataEnum.discriminator[env] = discriminator
    TestAPI.AssociatedDataEnum.thing_constructor[env] = thing_constructor
    TestAPI.AssociatedDataEnum.thing_extractor[env] = thing_extractor
}

extension TestAPI.AssociatedDataEnum: IotaConverter {
    public typealias Discriminator = @convention(c) (
        foreignObject,
        foreignOutExn
    ) -> Int
    fileprivate static let discriminator = Env.CallbackMap<Discriminator>()
    public typealias Thing_constructor = @convention(c) (
        Swift.Int.CType,
        foreignOutExn
    ) -> foreignObject
    fileprivate static let thing_constructor = Env.CallbackMap<Thing_constructor>()
    public typealias Thing_extractor = @convention(c) (
        foreignObject,
        UnsafePointer<Swift.Int.CType>,
        foreignOutExn
    ) -> Void
    fileprivate static let thing_extractor = Env.CallbackMap<Thing_extractor>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        switch try env.check({ exn in discriminator[env](value, exn) }) {
        case 0:
            var _value = Swift.Int.CType.default
            try env.check { exn in thing_extractor[env](value, &_value, exn) }
            return Self.thing(
                value: try Swift.Int.peekIota(_value, env: env)
            )
        case let disc:
            fatalError("bad discriminator value \(disc) encountered for type \(self)")
        }
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        switch value {
        case let thing(value):
            return try env.check { exn in
                return thing_constructor[env](
                    try Swift.Int.toIota(value, env: env),
                    exn
                )
            }
        }
    }
}

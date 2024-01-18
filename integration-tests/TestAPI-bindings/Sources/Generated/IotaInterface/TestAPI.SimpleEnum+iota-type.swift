// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_SimpleEnum_setup")
public func TestAPI_SimpleEnum_setup(
    envRef: EnvRef,
    discriminator: @escaping TestAPI.SimpleEnum.Discriminator,
    red_constructor: @escaping TestAPI.SimpleEnum.Red_constructor,
    red_extractor: @escaping TestAPI.SimpleEnum.Red_extractor
) {
    let env = Env(envRef)
    TestAPI.SimpleEnum.discriminator[env] = discriminator
    TestAPI.SimpleEnum.red_constructor[env] = red_constructor
    TestAPI.SimpleEnum.red_extractor[env] = red_extractor
}

extension TestAPI.SimpleEnum: IotaConverter {
    public typealias Discriminator = @convention(c) (
        foreignObject,
        foreignOutExn
    ) -> Int
    fileprivate static let discriminator = Env.CallbackMap<Discriminator>()
    public typealias Red_constructor = @convention(c) (
        foreignOutExn
    ) -> foreignObject
    fileprivate static let red_constructor = Env.CallbackMap<Red_constructor>()
    public typealias Red_extractor = @convention(c) (
        foreignObject,
        foreignOutExn
    ) -> Void
    fileprivate static let red_extractor = Env.CallbackMap<Red_extractor>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        switch try env.check({ exn in discriminator[env](value, exn) }) {
        case 0:
            try env.check { exn in red_extractor[env](value, exn) }
            return Self.red
        case let disc:
            fatalError("bad discriminator value \(disc) encountered for type \(self)")
        }
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        switch value {
        case red:
            return try env.check { exn in
                return red_constructor[env](
                    exn
                )
            }
        }
    }
}

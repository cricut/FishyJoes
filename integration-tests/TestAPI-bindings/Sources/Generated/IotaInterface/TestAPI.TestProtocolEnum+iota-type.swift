// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_TestProtocolEnum_setup")
public func TestAPI_TestProtocolEnum_setup(
    envRef: EnvRef,
    discriminator: @escaping TestAPI.TestProtocolEnum.Discriminator,
    qux_constructor: @escaping TestAPI.TestProtocolEnum.Qux_constructor,
    qux_extractor: @escaping TestAPI.TestProtocolEnum.Qux_extractor
) {
    let env = Env(envRef)
    TestAPI.TestProtocolEnum.discriminator[env] = discriminator
    TestAPI.TestProtocolEnum.qux_constructor[env] = qux_constructor
    TestAPI.TestProtocolEnum.qux_extractor[env] = qux_extractor
}

extension TestAPI.TestProtocolEnum: IotaConverter {
    public typealias Discriminator = @convention(c) (
        foreignObject,
        foreignOutExn
    ) -> Int
    fileprivate static let discriminator = Env.CallbackMap<Discriminator>()
    public typealias Qux_constructor = @convention(c) (
        foreignOutExn
    ) -> foreignObject
    fileprivate static let qux_constructor = Env.CallbackMap<Qux_constructor>()
    public typealias Qux_extractor = @convention(c) (
        foreignObject,
        foreignOutExn
    ) -> Void
    fileprivate static let qux_extractor = Env.CallbackMap<Qux_extractor>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        switch try env.check({ exn in discriminator[env](value, exn) }) {
        case 0:
            try env.check { exn in qux_extractor[env](value, exn) }
            return Self.qux
        case let disc:
            fatalError("bad discriminator value \(disc) encountered for type \(self)")
        }
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        switch value {
        case qux:
            return try env.check { exn in
                return qux_constructor[env](
                    exn
                )
            }
        }
    }
}

// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_TestNonExportedProtocolEnum_setup")
public func TestAPI_TestNonExportedProtocolEnum_setup(
    envRef: EnvRef,
    discriminator: @escaping TestAPI.TestNonExportedProtocolEnum.Discriminator,
    hogehoge_constructor: @escaping TestAPI.TestNonExportedProtocolEnum.Hogehoge_constructor,
    hogehoge_extractor: @escaping TestAPI.TestNonExportedProtocolEnum.Hogehoge_extractor
) {
    let env = Env(envRef)
    TestAPI.TestNonExportedProtocolEnum.discriminator[env] = discriminator
    TestAPI.TestNonExportedProtocolEnum.hogehoge_constructor[env] = hogehoge_constructor
    TestAPI.TestNonExportedProtocolEnum.hogehoge_extractor[env] = hogehoge_extractor
}

extension TestAPI.TestNonExportedProtocolEnum: IotaConverter {
    public typealias Discriminator = @convention(c) (
        foreignObject,
        foreignOutExn
    ) -> Int
    fileprivate static let discriminator = Env.CallbackMap<Discriminator>()
    public typealias Hogehoge_constructor = @convention(c) (
        foreignOutExn
    ) -> foreignObject
    fileprivate static let hogehoge_constructor = Env.CallbackMap<Hogehoge_constructor>()
    public typealias Hogehoge_extractor = @convention(c) (
        foreignObject,
        foreignOutExn
    ) -> Void
    fileprivate static let hogehoge_extractor = Env.CallbackMap<Hogehoge_extractor>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        switch try env.check({ exn in discriminator[env](value, exn) }) {
        case 0:
            try env.check { exn in hogehoge_extractor[env](value, exn) }
            return Self.hogehoge
        case let disc:
            fatalError("bad discriminator value \(disc) encountered for type \(self)")
        }
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        switch value {
        case hogehoge:
            return try env.check { exn in
                return hogehoge_constructor[env](
                    exn
                )
            }
        }
    }
}

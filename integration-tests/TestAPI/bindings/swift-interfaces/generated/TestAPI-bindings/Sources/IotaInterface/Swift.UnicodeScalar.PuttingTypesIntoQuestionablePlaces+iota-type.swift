// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup")
public func Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup(
    envRef: EnvRef,
    discriminator: @escaping Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.Discriminator,
    thing_constructor: @escaping Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.Thing_constructor,
    thing_extractor: @escaping Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.Thing_extractor
) {
    let env = Env(envRef)
    Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.discriminator[env] = discriminator
    Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.thing_constructor[env] = thing_constructor
    Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.thing_extractor[env] = thing_extractor
}

extension Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces: IotaConverter {
    public typealias Discriminator = @convention(c) (
        foreignObject,
        foreignOutExn
    ) -> Int
    fileprivate static let discriminator = Env.CallbackMap<Discriminator>()
    public typealias Thing_constructor = @convention(c) (
        foreignOutExn
    ) -> foreignObject
    fileprivate static let thing_constructor = Env.CallbackMap<Thing_constructor>()
    public typealias Thing_extractor = @convention(c) (
        foreignObject,
        foreignOutExn
    ) -> Void
    fileprivate static let thing_extractor = Env.CallbackMap<Thing_extractor>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        switch try env.check({ exn in discriminator[env](value, exn) }) {
        case 0:
            try env.check { exn in thing_extractor[env](value, exn) }
            return Self.thing
        case let disc:
            fatalError("bad discriminator value \(disc) encountered for type \(self)")
        }
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        switch value {
        case thing:
            return try env.check { exn in
                return thing_constructor[env](
                    exn
                )
            }
        }
    }
}

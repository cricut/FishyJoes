// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup")
public func Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_setup(
    discriminator: @escaping Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.Discriminator,
    thing_constructor: @escaping Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.Thing_constructor,
    thing_extractor: @escaping Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.Thing_extractor
) {
    Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.discriminator = discriminator
    Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.thing_constructor = thing_constructor
    Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.thing_extractor = thing_extractor
}

extension Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces: CSharpConverter {
    public typealias Discriminator = @convention(c) (
        csObject,
        csOutExn
    ) -> Int
    fileprivate static var discriminator: Discriminator!
    public typealias Thing_constructor = @convention(c) (
        csOutExn
    ) -> csObject
    fileprivate static var thing_constructor: Thing_constructor!
    public typealias Thing_extractor = @convention(c) (
        csObject,
        csOutExn
    ) -> Void
    fileprivate static var thing_extractor: Thing_extractor!

    public static func peekCSharp(_ value: csObject) throws -> Self {
        switch try Env.check({ exn in discriminator(value, exn) }) {
        case 0:
            try Env.check { exn in thing_extractor(value, exn) }
            return Self.thing
        case let disc:
            fatalError("bad discriminator value \(disc) encountered for type \(self)")
        }
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        switch value {
        case thing:
            return try Env.check { exn in
                return thing_constructor(
                    exn
                )
            }
        }
    }
}

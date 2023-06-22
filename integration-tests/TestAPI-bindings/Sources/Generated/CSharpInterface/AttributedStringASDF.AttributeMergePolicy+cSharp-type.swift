// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_AttributedStringASDF_AttributeMergePolicy_setup")
public func TestAPI_AttributedStringASDF_AttributeMergePolicy_setup(
    discriminator: @escaping AttributedStringASDF.AttributeMergePolicy.Discriminator,
    keepNew_constructor: @escaping AttributedStringASDF.AttributeMergePolicy.KeepNew_constructor,
    keepNew_extractor: @escaping AttributedStringASDF.AttributeMergePolicy.KeepNew_extractor,
    keepCurrent_constructor: @escaping AttributedStringASDF.AttributeMergePolicy.KeepCurrent_constructor,
    keepCurrent_extractor: @escaping AttributedStringASDF.AttributeMergePolicy.KeepCurrent_extractor
) {
    AttributedStringASDF.AttributeMergePolicy.discriminator = discriminator
    AttributedStringASDF.AttributeMergePolicy.keepNew_constructor = keepNew_constructor
    AttributedStringASDF.AttributeMergePolicy.keepNew_extractor = keepNew_extractor
    AttributedStringASDF.AttributeMergePolicy.keepCurrent_constructor = keepCurrent_constructor
    AttributedStringASDF.AttributeMergePolicy.keepCurrent_extractor = keepCurrent_extractor
}

extension AttributedStringASDF.AttributeMergePolicy: CSharpConverter {
    public typealias Discriminator = @convention(c) (
        csObject,
        csOutExn
    ) -> Int
    fileprivate static var discriminator: Discriminator!
    public typealias KeepNew_constructor = @convention(c) (
        csOutExn
    ) -> csObject
    fileprivate static var keepNew_constructor: KeepNew_constructor!
    public typealias KeepNew_extractor = @convention(c) (
        csObject,
        csOutExn
    ) -> Void
    fileprivate static var keepNew_extractor: KeepNew_extractor!
    public typealias KeepCurrent_constructor = @convention(c) (
        csOutExn
    ) -> csObject
    fileprivate static var keepCurrent_constructor: KeepCurrent_constructor!
    public typealias KeepCurrent_extractor = @convention(c) (
        csObject,
        csOutExn
    ) -> Void
    fileprivate static var keepCurrent_extractor: KeepCurrent_extractor!

    public static func peekCSharp(_ value: csObject) throws -> Self {
        switch try Env.check({ exn in discriminator(value, exn) }) {
        case 0:
            try Env.check { exn in keepNew_extractor(value, exn) }
            return Self.keepNew
        case 1:
            try Env.check { exn in keepCurrent_extractor(value, exn) }
            return Self.keepCurrent
        case let disc:
            fatalError("bad discriminator value \(disc) encountered for type \(self)")
        }
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        switch value {
        case keepNew:
            return try Env.check { exn in
                return keepNew_constructor(
                    exn
                )
            }
        case keepCurrent:
            return try Env.check { exn in
                return keepCurrent_constructor(
                    exn
                )
            }
        }
    }
}

// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_AssociatedDataEnum_setup")
public func TestAPI_AssociatedDataEnum_setup(
    discriminator: @escaping AssociatedDataEnum.Discriminator,
    thing_constructor: @escaping AssociatedDataEnum.Thing_constructor,
    thing_extractor: @escaping AssociatedDataEnum.Thing_extractor,
    other_constructor: @escaping AssociatedDataEnum.Other_constructor,
    other_extractor: @escaping AssociatedDataEnum.Other_extractor,
    bar_constructor: @escaping AssociatedDataEnum.Bar_constructor,
    bar_extractor: @escaping AssociatedDataEnum.Bar_extractor,
    noValue_constructor: @escaping AssociatedDataEnum.NoValue_constructor,
    noValue_extractor: @escaping AssociatedDataEnum.NoValue_extractor
) {
    AssociatedDataEnum.discriminator = discriminator
    AssociatedDataEnum.thing_constructor = thing_constructor
    AssociatedDataEnum.thing_extractor = thing_extractor
    AssociatedDataEnum.other_constructor = other_constructor
    AssociatedDataEnum.other_extractor = other_extractor
    AssociatedDataEnum.bar_constructor = bar_constructor
    AssociatedDataEnum.bar_extractor = bar_extractor
    AssociatedDataEnum.noValue_constructor = noValue_constructor
    AssociatedDataEnum.noValue_extractor = noValue_extractor
}

extension AssociatedDataEnum: CSharpConverter {
    public typealias Discriminator = @convention(c) (
        csObject,
        csOutExn
    ) -> Int
    fileprivate static var discriminator: Discriminator!
    public typealias Thing_constructor = @convention(c) (
        Int.CType,
        csOutExn
    ) -> csObject
    fileprivate static var thing_constructor: Thing_constructor!
    public typealias Thing_extractor = @convention(c) (
        csObject,
        UnsafePointer<Int.CType>,
        csOutExn
    ) -> Void
    fileprivate static var thing_extractor: Thing_extractor!
    public typealias Other_constructor = @convention(c) (
        Swift.String.CType,
        Int.CType,
        csOutExn
    ) -> csObject
    fileprivate static var other_constructor: Other_constructor!
    public typealias Other_extractor = @convention(c) (
        csObject,
        UnsafePointer<Swift.String.CType>,
        UnsafePointer<Int.CType>,
        csOutExn
    ) -> Void
    fileprivate static var other_extractor: Other_extractor!
    public typealias Bar_constructor = @convention(c) (
        Swift.String.CType,
        AssociatedDataEnum.CType,
        csOutExn
    ) -> csObject
    fileprivate static var bar_constructor: Bar_constructor!
    public typealias Bar_extractor = @convention(c) (
        csObject,
        UnsafePointer<Swift.String.CType>,
        UnsafePointer<AssociatedDataEnum.CType>,
        csOutExn
    ) -> Void
    fileprivate static var bar_extractor: Bar_extractor!
    public typealias NoValue_constructor = @convention(c) (
        csOutExn
    ) -> csObject
    fileprivate static var noValue_constructor: NoValue_constructor!
    public typealias NoValue_extractor = @convention(c) (
        csObject,
        csOutExn
    ) -> Void
    fileprivate static var noValue_extractor: NoValue_extractor!

    public static func peekCSharp(_ value: csObject) throws -> Self {
        switch try Env.check({ exn in discriminator(value, exn) }) {
        case 0:
            var _value = Int.CType.default
            try Env.check { exn in thing_extractor(value, &_value, exn) }
            return Self.thing(
                value: try Int.peekCSharp(_value)
            )
        case 1:
            var _unnamed = Swift.String.CType.default
            var __1 = Int.CType.default
            try Env.check { exn in other_extractor(value, &_unnamed, &__1, exn) }
            defer {
                Env.deleteRef(_unnamed)
            }
            return Self.other(
                try Swift.String.peekCSharp(_unnamed),
                try Int.peekCSharp(__1)
            )
        case 2:
            var _named = Swift.String.CType.default
            var __1 = AssociatedDataEnum.CType.default
            try Env.check { exn in bar_extractor(value, &_named, &__1, exn) }
            defer {
                Env.deleteRef(_named)
                Env.deleteRef(__1)
            }
            return Self.bar(
                named: try Swift.String.peekCSharp(_named),
                try AssociatedDataEnum.peekCSharp(__1)
            )
        case 3:
            try Env.check { exn in noValue_extractor(value, exn) }
            return Self.noValue
        case let disc:
            fatalError("bad discriminator value \(disc) encountered for type \(self)")
        }
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        switch value {
        case let thing(value):
            return try Env.check { exn in
                return thing_constructor(
                    try Int.toCSharp(value),
                    exn
                )
            }
        case let other(unnamed, _1):
            return try Env.check { exn in
                return other_constructor(
                    try Swift.String.toCSharp(unnamed),
                    try Int.toCSharp(_1),
                    exn
                )
            }
        case let bar(named, _1):
            return try Env.check { exn in
                return bar_constructor(
                    try Swift.String.toCSharp(named),
                    try AssociatedDataEnum.toCSharp(_1),
                    exn
                )
            }
        case noValue:
            return try Env.check { exn in
                return noValue_constructor(
                    exn
                )
            }
        }
    }
}

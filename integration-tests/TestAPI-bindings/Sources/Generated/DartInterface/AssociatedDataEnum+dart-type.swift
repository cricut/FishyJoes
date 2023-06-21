// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesDartRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_AssociatedDataEnum_setup")
public func TestAPI_AssociatedDataEnum_setup(
    envRef: EnvRef,
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
    let env = Env(envRef)
    AssociatedDataEnum.discriminator[env] = discriminator
    AssociatedDataEnum.thing_constructor[env] = thing_constructor
    AssociatedDataEnum.thing_extractor[env] = thing_extractor
    AssociatedDataEnum.other_constructor[env] = other_constructor
    AssociatedDataEnum.other_extractor[env] = other_extractor
    AssociatedDataEnum.bar_constructor[env] = bar_constructor
    AssociatedDataEnum.bar_extractor[env] = bar_extractor
    AssociatedDataEnum.noValue_constructor[env] = noValue_constructor
    AssociatedDataEnum.noValue_extractor[env] = noValue_extractor
}

extension AssociatedDataEnum: DartConverter {
    public typealias Discriminator = @convention(c) (
        foreignObject,
        foreignOutExn
    ) -> Int
    fileprivate static let discriminator = Env.CallbackMap<Discriminator>()
    public typealias Thing_constructor = @convention(c) (
        Int.CType,
        foreignOutExn
    ) -> foreignObject
    fileprivate static let thing_constructor = Env.CallbackMap<Thing_constructor>()
    public typealias Thing_extractor = @convention(c) (
        foreignObject,
        UnsafePointer<Int.CType>,
        foreignOutExn
    ) -> Void
    fileprivate static let thing_extractor = Env.CallbackMap<Thing_extractor>()
    public typealias Other_constructor = @convention(c) (
        Swift.String.CType,
        Int.CType,
        foreignOutExn
    ) -> foreignObject
    fileprivate static let other_constructor = Env.CallbackMap<Other_constructor>()
    public typealias Other_extractor = @convention(c) (
        foreignObject,
        UnsafePointer<Swift.String.CType>,
        UnsafePointer<Int.CType>,
        foreignOutExn
    ) -> Void
    fileprivate static let other_extractor = Env.CallbackMap<Other_extractor>()
    public typealias Bar_constructor = @convention(c) (
        Swift.String.CType,
        AssociatedDataEnum.CType,
        foreignOutExn
    ) -> foreignObject
    fileprivate static let bar_constructor = Env.CallbackMap<Bar_constructor>()
    public typealias Bar_extractor = @convention(c) (
        foreignObject,
        UnsafePointer<Swift.String.CType>,
        UnsafePointer<AssociatedDataEnum.CType>,
        foreignOutExn
    ) -> Void
    fileprivate static let bar_extractor = Env.CallbackMap<Bar_extractor>()
    public typealias NoValue_constructor = @convention(c) (
        foreignOutExn
    ) -> foreignObject
    fileprivate static let noValue_constructor = Env.CallbackMap<NoValue_constructor>()
    public typealias NoValue_extractor = @convention(c) (
        foreignObject,
        foreignOutExn
    ) -> Void
    fileprivate static let noValue_extractor = Env.CallbackMap<NoValue_extractor>()

    public static func peekDart(_ value: foreignObject, env: Env) throws -> Self {
        switch try env.check({ exn in discriminator[env](value, exn) }) {
        case 0:
            var _value = Int.CType.default
            try env.check { exn in thing_extractor[env](value, &_value, exn) }
            return Self.thing(
                value: try Int.peekDart(_value, env: env)
            )
        case 1:
            var _unnamed = Swift.String.CType.default
            var __1 = Int.CType.default
            try env.check { exn in other_extractor[env](value, &_unnamed, &__1, exn) }
            defer {
                env.deleteRef(_unnamed)
            }
            return Self.other(
                try Swift.String.peekDart(_unnamed, env: env),
                try Int.peekDart(__1, env: env)
            )
        case 2:
            var _named = Swift.String.CType.default
            var __1 = AssociatedDataEnum.CType.default
            try env.check { exn in bar_extractor[env](value, &_named, &__1, exn) }
            defer {
                env.deleteRef(_named)
                env.deleteRef(__1)
            }
            return Self.bar(
                named: try Swift.String.peekDart(_named, env: env),
                try AssociatedDataEnum.peekDart(__1, env: env)
            )
        case 3:
            try env.check { exn in noValue_extractor[env](value, exn) }
            return Self.noValue
        case let disc:
            fatalError("bad discriminator value \(disc) encountered for type \(self)")
        }
    }

    public static func toDart(_ value: Self, env: Env) throws -> foreignObject {
        switch value {
        case let thing(value):
            return try env.check { exn in
                return thing_constructor[env](
                    try Int.toDart(value, env: env),
                    exn
                )
            }
        case let other(unnamed, _1):
            return try env.check { exn in
                return other_constructor[env](
                    try Swift.String.toDart(unnamed, env: env),
                    try Int.toDart(_1, env: env),
                    exn
                )
            }
        case let bar(named, _1):
            return try env.check { exn in
                return bar_constructor[env](
                    try Swift.String.toDart(named, env: env),
                    try AssociatedDataEnum.toDart(_1, env: env),
                    exn
                )
            }
        case noValue:
            return try env.check { exn in
                return noValue_constructor[env](
                    exn
                )
            }
        }
    }
}

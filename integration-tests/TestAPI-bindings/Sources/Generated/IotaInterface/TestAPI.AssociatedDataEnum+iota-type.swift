// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_AssociatedDataEnum_setup")
public func TestAPI_AssociatedDataEnum_setup(
    envRef: EnvRef,
    discriminator: @escaping TestAPI.AssociatedDataEnum.Discriminator,
    thing_constructor: @escaping TestAPI.AssociatedDataEnum.Thing_constructor,
    thing_extractor: @escaping TestAPI.AssociatedDataEnum.Thing_extractor,
    other_constructor: @escaping TestAPI.AssociatedDataEnum.Other_constructor,
    other_extractor: @escaping TestAPI.AssociatedDataEnum.Other_extractor,
    bar_constructor: @escaping TestAPI.AssociatedDataEnum.Bar_constructor,
    bar_extractor: @escaping TestAPI.AssociatedDataEnum.Bar_extractor,
    noValue_constructor: @escaping TestAPI.AssociatedDataEnum.NoValue_constructor,
    noValue_extractor: @escaping TestAPI.AssociatedDataEnum.NoValue_extractor,
    simpleEnum_constructor: @escaping TestAPI.AssociatedDataEnum.SimpleEnum_constructor,
    simpleEnum_extractor: @escaping TestAPI.AssociatedDataEnum.SimpleEnum_extractor
) {
    let env = Env(envRef)
    TestAPI.AssociatedDataEnum.discriminator[env] = discriminator
    TestAPI.AssociatedDataEnum.thing_constructor[env] = thing_constructor
    TestAPI.AssociatedDataEnum.thing_extractor[env] = thing_extractor
    TestAPI.AssociatedDataEnum.other_constructor[env] = other_constructor
    TestAPI.AssociatedDataEnum.other_extractor[env] = other_extractor
    TestAPI.AssociatedDataEnum.bar_constructor[env] = bar_constructor
    TestAPI.AssociatedDataEnum.bar_extractor[env] = bar_extractor
    TestAPI.AssociatedDataEnum.noValue_constructor[env] = noValue_constructor
    TestAPI.AssociatedDataEnum.noValue_extractor[env] = noValue_extractor
    TestAPI.AssociatedDataEnum.simpleEnum_constructor[env] = simpleEnum_constructor
    TestAPI.AssociatedDataEnum.simpleEnum_extractor[env] = simpleEnum_extractor
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
    public typealias Other_constructor = @convention(c) (
        Swift.String.CType,
        Swift.Int.CType,
        foreignOutExn
    ) -> foreignObject
    fileprivate static let other_constructor = Env.CallbackMap<Other_constructor>()
    public typealias Other_extractor = @convention(c) (
        foreignObject,
        UnsafePointer<Swift.String.CType>,
        UnsafePointer<Swift.Int.CType>,
        foreignOutExn
    ) -> Void
    fileprivate static let other_extractor = Env.CallbackMap<Other_extractor>()
    public typealias Bar_constructor = @convention(c) (
        Swift.String.CType,
        TestAPI.AssociatedDataEnum.CType,
        foreignOutExn
    ) -> foreignObject
    fileprivate static let bar_constructor = Env.CallbackMap<Bar_constructor>()
    public typealias Bar_extractor = @convention(c) (
        foreignObject,
        UnsafePointer<Swift.String.CType>,
        UnsafePointer<TestAPI.AssociatedDataEnum.CType>,
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
    public typealias SimpleEnum_constructor = @convention(c) (
        TestAPI.SimpleEnum.CType,
        foreignOutExn
    ) -> foreignObject
    fileprivate static let simpleEnum_constructor = Env.CallbackMap<SimpleEnum_constructor>()
    public typealias SimpleEnum_extractor = @convention(c) (
        foreignObject,
        UnsafePointer<TestAPI.SimpleEnum.CType>,
        foreignOutExn
    ) -> Void
    fileprivate static let simpleEnum_extractor = Env.CallbackMap<SimpleEnum_extractor>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        switch try env.check({ exn in discriminator[env](value, exn) }) {
        case 0:
            var _value = Swift.Int.CType.default
            try env.check { exn in thing_extractor[env](value, &_value, exn) }
            return Self.thing(
                value: try Swift.Int.peekIota(_value, env: env)
            )
        case 1:
            var _unnamed = Swift.String.CType.default
            var __1 = Swift.Int.CType.default
            try env.check { exn in other_extractor[env](value, &_unnamed, &__1, exn) }
            defer {
                env.deleteRef(_unnamed)
            }
            return Self.other(
                try Swift.String.peekIota(_unnamed, env: env),
                try Swift.Int.peekIota(__1, env: env)
            )
        case 2:
            var _named = Swift.String.CType.default
            var __1 = TestAPI.AssociatedDataEnum.CType.default
            try env.check { exn in bar_extractor[env](value, &_named, &__1, exn) }
            defer {
                env.deleteRef(_named)
                env.deleteRef(__1)
            }
            return Self.bar(
                named: try Swift.String.peekIota(_named, env: env),
                try TestAPI.AssociatedDataEnum.peekIota(__1, env: env)
            )
        case 3:
            try env.check { exn in noValue_extractor[env](value, exn) }
            return Self.noValue
        case 4:
            var _value = TestAPI.SimpleEnum.CType.default
            try env.check { exn in simpleEnum_extractor[env](value, &_value, exn) }
            defer {
                env.deleteRef(_value)
            }
            return Self.simpleEnum(
                value: try TestAPI.SimpleEnum.peekIota(_value, env: env)
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
        case let other(unnamed, _1):
            return try env.check { exn in
                return other_constructor[env](
                    try Swift.String.toIota(unnamed, env: env),
                    try Swift.Int.toIota(_1, env: env),
                    exn
                )
            }
        case let bar(named, _1):
            return try env.check { exn in
                return bar_constructor[env](
                    try Swift.String.toIota(named, env: env),
                    try TestAPI.AssociatedDataEnum.toIota(_1, env: env),
                    exn
                )
            }
        case noValue:
            return try env.check { exn in
                return noValue_constructor[env](
                    exn
                )
            }
        case let simpleEnum(value):
            return try env.check { exn in
                return simpleEnum_constructor[env](
                    try TestAPI.SimpleEnum.toIota(value, env: env),
                    exn
                )
            }
        }
    }
}

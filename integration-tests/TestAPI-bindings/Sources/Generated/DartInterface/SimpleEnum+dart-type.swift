// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesDartRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_SimpleEnum_setup")
public func TestAPI_SimpleEnum_setup(
    envRef: EnvRef,
    discriminator: @escaping SimpleEnum.Discriminator,
    red_constructor: @escaping SimpleEnum.Red_constructor,
    red_extractor: @escaping SimpleEnum.Red_extractor,
    green_constructor: @escaping SimpleEnum.Green_constructor,
    green_extractor: @escaping SimpleEnum.Green_extractor,
    blue_constructor: @escaping SimpleEnum.Blue_constructor,
    blue_extractor: @escaping SimpleEnum.Blue_extractor
) {
    let env = Env(envRef)
    SimpleEnum.discriminator[env] = discriminator
    SimpleEnum.red_constructor[env] = red_constructor
    SimpleEnum.red_extractor[env] = red_extractor
    SimpleEnum.green_constructor[env] = green_constructor
    SimpleEnum.green_extractor[env] = green_extractor
    SimpleEnum.blue_constructor[env] = blue_constructor
    SimpleEnum.blue_extractor[env] = blue_extractor
}

extension SimpleEnum: DartConverter {
    public typealias Discriminator = @convention(c) (
        foreignObject,
        foreignOutExn
    ) -> Int
    fileprivate static var discriminator = Env.CallbackMap<Discriminator>()
    public typealias Red_constructor = @convention(c) (
        foreignOutExn
    ) -> foreignObject
    fileprivate static var red_constructor = Env.CallbackMap<Red_constructor>()
    public typealias Red_extractor = @convention(c) (
        foreignObject,
        foreignOutExn
    ) -> Void
    fileprivate static var red_extractor = Env.CallbackMap<Red_extractor>()
    public typealias Green_constructor = @convention(c) (
        foreignOutExn
    ) -> foreignObject
    fileprivate static var green_constructor = Env.CallbackMap<Green_constructor>()
    public typealias Green_extractor = @convention(c) (
        foreignObject,
        foreignOutExn
    ) -> Void
    fileprivate static var green_extractor = Env.CallbackMap<Green_extractor>()
    public typealias Blue_constructor = @convention(c) (
        foreignOutExn
    ) -> foreignObject
    fileprivate static var blue_constructor = Env.CallbackMap<Blue_constructor>()
    public typealias Blue_extractor = @convention(c) (
        foreignObject,
        foreignOutExn
    ) -> Void
    fileprivate static var blue_extractor = Env.CallbackMap<Blue_extractor>()

    public static func peekDart(_ value: foreignObject, env: Env) throws -> Self {
        switch try env.check({ exn in discriminator[env](value, exn) }) {
        case 0:
            try env.check { exn in red_extractor[env](value, exn) }
            return Self.red
        case 1:
            try env.check { exn in green_extractor[env](value, exn) }
            return Self.green
        case 2:
            try env.check { exn in blue_extractor[env](value, exn) }
            return Self.blue
        case let disc:
            fatalError("bad discriminator value \(disc) encountered for type \(self)")
        }
    }

    public static func toDart(_ value: Self, env: Env) throws -> foreignObject {
        switch value {
        case red:
            return try env.check { exn in
                return red_constructor[env](
                    exn
                )
            }
        case green:
            return try env.check { exn in
                return green_constructor[env](
                    exn
                )
            }
        case blue:
            return try env.check { exn in
                return blue_constructor[env](
                    exn
                )
            }
        }
    }
}

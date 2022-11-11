// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_SimpleEnum_setup")
public func TestAPI_SimpleEnum_setup(
    discriminator: @escaping SimpleEnum.Discriminator,
    red_constructor: @escaping SimpleEnum.Red_constructor,
    red_extractor: @escaping SimpleEnum.Red_extractor,
    green_constructor: @escaping SimpleEnum.Green_constructor,
    green_extractor: @escaping SimpleEnum.Green_extractor,
    blue_constructor: @escaping SimpleEnum.Blue_constructor,
    blue_extractor: @escaping SimpleEnum.Blue_extractor
) {
    SimpleEnum.discriminator = discriminator
    SimpleEnum.red_constructor = red_constructor
    SimpleEnum.red_extractor = red_extractor
    SimpleEnum.green_constructor = green_constructor
    SimpleEnum.green_extractor = green_extractor
    SimpleEnum.blue_constructor = blue_constructor
    SimpleEnum.blue_extractor = blue_extractor
}

extension SimpleEnum: IotaConverter {
    public typealias Discriminator = @convention(c) (
        csObject,
        csOutExn
    ) -> Int
    fileprivate static var discriminator: Discriminator!
    public typealias Red_constructor = @convention(c) (
        csOutExn
    ) -> csObject
    fileprivate static var red_constructor: Red_constructor!
    public typealias Red_extractor = @convention(c) (
        csObject,
        csOutExn
    ) -> Void
    fileprivate static var red_extractor: Red_extractor!
    public typealias Green_constructor = @convention(c) (
        csOutExn
    ) -> csObject
    fileprivate static var green_constructor: Green_constructor!
    public typealias Green_extractor = @convention(c) (
        csObject,
        csOutExn
    ) -> Void
    fileprivate static var green_extractor: Green_extractor!
    public typealias Blue_constructor = @convention(c) (
        csOutExn
    ) -> csObject
    fileprivate static var blue_constructor: Blue_constructor!
    public typealias Blue_extractor = @convention(c) (
        csObject,
        csOutExn
    ) -> Void
    fileprivate static var blue_extractor: Blue_extractor!

    public static func peekIota(_ value: csObject) throws -> Self {
        switch try Env.check({ exn in discriminator(value, exn) }) {
        case 0:
            try Env.check { exn in red_extractor(value, exn) }
            return Self.red
        case 1:
            try Env.check { exn in green_extractor(value, exn) }
            return Self.green
        case 2:
            try Env.check { exn in blue_extractor(value, exn) }
            return Self.blue
        case let disc:
            fatalError("bad discriminator value \(disc) encountered for type \(self)")
        }
    }

    public static func toIota(_ value: Self) throws -> csObject {
        switch value {
        case red:
            return try Env.check { exn in
                return red_constructor(
                    exn
                )
            }
        case green:
            return try Env.check { exn in
                return green_constructor(
                    exn
                )
            }
        case blue:
            return try Env.check { exn in
                return blue_constructor(
                    exn
                )
            }
        }
    }
}

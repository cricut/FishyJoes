// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import Foundation
import TestAPI

public enum _AProtocolConverter {
    public typealias SwiftType = TestAPI.AProtocol
}

public struct AProtocol_sans_hasADefaultImplementation: TestAPI.AProtocol {
    public let wrapped: TestAPI.AProtocol

    public init(wrapped: TestAPI.AProtocol) {
        self.wrapped = wrapped
    }

    public var baz: Bool {
        get throws {
            try wrapped.baz
        }
    }

    public var foo: String {
        get throws {
            try wrapped.foo
        }
    }

    public func bar(x: Int, y: Int) throws -> AProtocol {
        try wrapped.bar(x: x, y: y)
    }

    public func hasADefaultImplementation2(_ a: String, b: Bool, _ c: Double) throws -> Double {
        try wrapped.hasADefaultImplementation2(a, b: b, c)
    }
}

public struct AProtocol_sans_hasADefaultImplementation2: TestAPI.AProtocol {
    public let wrapped: TestAPI.AProtocol

    public init(wrapped: TestAPI.AProtocol) {
        self.wrapped = wrapped
    }

    public var baz: Bool {
        get throws {
            try wrapped.baz
        }
    }

    public var foo: String {
        get throws {
            try wrapped.foo
        }
    }

    public func bar(x: Int, y: Int) throws -> AProtocol {
        try wrapped.bar(x: x, y: y)
    }

    public func hasADefaultImplementation(x: Int, y: Double) throws -> String {
        try wrapped.hasADefaultImplementation(x: x, y: y)
    }
}

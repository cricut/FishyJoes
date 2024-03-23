// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import Foundation
import TestAPI

public enum _TestMutatingCounterProtocolConverter {
    public typealias SwiftType = TestAPI.TestMutatingCounterProtocol
}

public struct TestMutatingCounterProtocol_sans_tickTwice: TestAPI.TestMutatingCounterProtocol {
    public var wrapped: TestAPI.TestMutatingCounterProtocol

    public init(wrapped: TestAPI.TestMutatingCounterProtocol) {
        self.wrapped = wrapped
    }

    public var count: Int {
        get throws {
            try wrapped.count
        }
    }

    public mutating func tick() throws {
        try wrapped.tick()
    }

    public func witness() throws -> TestMutatingCounterProtocol {
        try wrapped.witness()
    }
}

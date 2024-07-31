// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import Foundation
import TestAPI

public enum _TestDefaultComputedPropertiesConverter {
    public typealias SwiftType = TestAPI.TestDefaultComputedProperties
}

public struct TestDefaultComputedProperties_sans_noot: TestAPI.TestDefaultComputedProperties {
    public let wrapped: TestAPI.TestDefaultComputedProperties

    public init(wrapped: TestAPI.TestDefaultComputedProperties) {
        self.wrapped = wrapped
    }

    public var pluto: String {
        get throws {
            try wrapped.pluto
        }
    }
}

public struct TestDefaultComputedProperties_sans_pluto: TestAPI.TestDefaultComputedProperties {
    public let wrapped: TestAPI.TestDefaultComputedProperties

    public init(wrapped: TestAPI.TestDefaultComputedProperties) {
        self.wrapped = wrapped
    }

    public var noot: Int {
        get throws {
            try wrapped.noot
        }
    }
}

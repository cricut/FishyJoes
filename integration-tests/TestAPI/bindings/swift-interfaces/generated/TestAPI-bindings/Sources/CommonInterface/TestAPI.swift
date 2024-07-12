// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import Foundation
import TestAPI


// MARK: - CommonInterface/TestAPI_CommonInterface._AProtocolConverter.swift

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

    public func hasADefaultImplementation2(_ a: String, b: Bool, _ c: String) throws -> String {
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


// MARK: - CommonInterface/TestAPI_CommonInterface._TestAsyncFunctionsConverter.swift

public enum _TestAsyncFunctionsConverter {
    public typealias SwiftType = TestAPI.TestAsyncFunctions
}

public struct TestAsyncFunctions_sans_defaultExercise6: TestAPI.TestAsyncFunctions {
    public let wrapped: TestAPI.TestAsyncFunctions

    public init(wrapped: TestAPI.TestAsyncFunctions) {
        self.wrapped = wrapped
    }

    public var add3Things: (Float, Double, Int) async throws -> Double {
        get throws {
            try wrapped.add3Things
        }
    }

    public var const42: () async throws -> Int {
        get throws {
            try wrapped.const42
        }
    }

    public var fifthThing: (String, Int, Double, String, @escaping () async throws -> Int) async throws -> () async throws -> Int {
        get throws {
            try wrapped.fifthThing
        }
    }

    public var iabs: (Int) async throws -> Int {
        get throws {
            try wrapped.iabs
        }
    }

    public var intCompose: (@escaping (Int) async throws -> Int, @escaping (Int) async throws -> Int) throws -> (Int) async throws -> Int {
        get throws {
            try wrapped.intCompose
        }
    }

    public var makeList: (String, String, String, String) async throws -> Array<String> {
        get throws {
            try wrapped.makeList
        }
    }

    public var six: (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int {
        get throws {
            try wrapped.six
        }
    }

    public var willThrow: () async throws -> Int {
        get throws {
            try wrapped.willThrow
        }
    }

    public func exercise0(_ fn: @escaping AsyncFunctions.AFun0) async throws -> String {
        try await wrapped.exercise0(fn)
    }

    public func exercise1(_ fn: @escaping AsyncFunctions.AFun1) async throws -> String {
        try await wrapped.exercise1(fn)
    }

    public func exercise2(_ fn: @escaping AsyncFunctions.AFun2) async throws -> String {
        try await wrapped.exercise2(fn)
    }

    public func exercise3(_ fn: @escaping AsyncFunctions.AFun3) async throws -> String {
        try await wrapped.exercise3(fn)
    }

    public func exercise4(_ fn: @escaping AsyncFunctions.AFun4) async throws -> String {
        try await wrapped.exercise4(fn)
    }

    public func exercise5(_ fn: @escaping AsyncFunctions.AFun5) async throws -> String {
        try await wrapped.exercise5(fn)
    }

    public func exercise6(_ fn: @escaping AsyncFunctions.AFun6) async throws -> String {
        try await wrapped.exercise6(fn)
    }

    public func thunkTwiceMaker(thunk: @escaping () async throws -> Void) throws -> () async throws -> Void {
        try wrapped.thunkTwiceMaker(thunk: thunk)
    }

    public func witness() throws -> TestAsyncFunctions {
        try wrapped.witness()
    }
}


// MARK: - CommonInterface/TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter.swift

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


// MARK: - CommonInterface/TestAPI_CommonInterface._TestDifferingExportNameProtocolConverter.swift

public enum _TestDifferingExportNameProtocolConverter {
    public typealias SwiftType = TestAPI.TestDifferingExportNameProtocol
}


// MARK: - CommonInterface/TestAPI_CommonInterface._TestLeadingUnderscoredPropConverter.swift

public enum _TestLeadingUnderscoredPropConverter {
    public typealias SwiftType = TestAPI.TestLeadingUnderscoredProp
}


// MARK: - CommonInterface/TestAPI_CommonInterface._TestMethodsProtocolConverter.swift

public enum _TestMethodsProtocolConverter {
    public typealias SwiftType = TestAPI.TestMethodsProtocol
}


// MARK: - CommonInterface/TestAPI_CommonInterface._TestOptionalsProtocolConverter.swift

public enum _TestOptionalsProtocolConverter {
    public typealias SwiftType = TestAPI.TestOptionalsProtocol
}


// MARK: - CommonInterface/TestAPI_CommonInterface._TestPropertiesProtocolConverter.swift

public enum _TestPropertiesProtocolConverter {
    public typealias SwiftType = TestAPI.TestPropertiesProtocol
}

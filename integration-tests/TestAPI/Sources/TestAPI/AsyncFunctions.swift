import Foundation

/// <!-- FishyJoes.export(AsyncFunctions) -->
public enum AsyncFunctions {
    public typealias AFun0 = () async throws -> Int
    public typealias AFun1 = (Int) async throws -> Int
    public typealias AFun2 = (
        @escaping (Int) async throws -> Int,
        @escaping (Int) async throws -> Int
    ) throws -> ((Int) async throws -> Int)
    public typealias AFun3 = (Float, Double, Int) async throws -> Double
    public typealias AFun4 = (String, String, String, String) async throws -> [String]
    public typealias AFun5 = (String, Int, Double, String, @escaping () async throws -> Int) async throws -> (() async throws -> Int)
    public typealias AFun6 = (String, Int, Double, String, @escaping () async throws -> Int, Int) async throws -> Int

    /// <!-- FishyJoes.export(const42) -->
    public static let const42: AFun0 = { 42 }

    /// <!-- FishyJoes.export(abs) -->
    public static let iabs: AFun1 = { abs($0) }

    /// <!-- FishyJoes.export(intCompose) -->
    public static let intCompose: AFun2 = { f, g in { try await f(g($0)) } }

    /// <!-- FishyJoes.export(add3Things) -->
    public static let add3Things: AFun3 = { Double($0) + $1 + Double($2) }

    /// <!-- FishyJoes.export(makeList) -->
    public static let makeList: AFun4 = { [$0, $1, $2, $3] }

    /// <!-- FishyJoes.export(fifthThing) -->
    public static let fifthThing: AFun5 = { $4 }

    /// <!-- FishyJoes.export(sixthThing) -->
    public static let six: AFun6 = { $5 }

    /// <!-- FishyJoes.export(willThrow) -->
    public static let willThrow: AFun0 = { throw TheAsyncError() }

    public struct TheAsyncError: Error {}

    /// <!-- FishyJoes.export(exercise0) -->
    public static func exercise0(_ fn: AFun0) async rethrows -> String {
        try await "\(fn())"
    }

    /// <!-- FishyJoes.export(exercise1) -->
    public static func exercise1(_ fn: AFun1) async rethrows -> String {
        try await "\(fn(-3))"
    }

    /// <!-- FishyJoes.export(exercise2) -->
    public static func exercise2(_ fn: AFun2) async throws -> String {
        try await "\(fn({ $0 + 1 }, { $0 * 3 })(8))"
    }

    /// <!-- FishyJoes.export(exercise3) -->
    public static func exercise3(_ fn: AFun3) async rethrows -> String {
        try await "\(fn(1.0, 4.4, 2))"
    }

    /// <!-- FishyJoes.export(exercise4) -->
    public static func exercise4(_ fn: AFun4) async rethrows -> String {
        try await "\(fn("a", "b", "c", "d"))"
    }

    /// <!-- FishyJoes.export(exercise5) -->
    public static func exercise5(_ fn: AFun5) async throws -> String {
        try await "\(fn("hi", 6, 4.2, "bye", { 83 })())"
    }

    /// <!-- FishyJoes.export(exercise6) -->
    public static func exercise6(_ fn: AFun6) async rethrows -> String {
        try await "\(fn("hi", 6, 4.2, "bye", { 83 }, 42))"
    }

    // void -> void functions are an edge case in C#
    /// <!-- FishyJoes.export(thunkTwiceMaker) -->
    public static func thunkTwiceMaker(thunk: @escaping () async throws -> Void) -> () async throws -> Void {
        {
            try await thunk()
            try await thunk()
        }
    }
}

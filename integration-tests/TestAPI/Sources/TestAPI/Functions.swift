import Foundation

/// <!-- FishyJoes.export(Functions) -->
public enum Functions {
    public typealias Fun0 = () throws -> Int
    public typealias Fun1 = (Int) throws -> Int
    public typealias Fun2 = (
        @escaping (Int) throws -> Int,
        @escaping (Int) throws -> Int
    ) throws -> ((Int) throws -> Int)
    public typealias Fun3 = (Float, Double, Int) throws -> Double
    public typealias Fun4 = (String, String, String, String) throws -> [String]
    public typealias Fun5 = (String, Int, Double, String, @escaping () throws -> Int) throws -> (() throws -> Int)
    public typealias Fun6 = (String, Int, Double, String, @escaping () throws -> Int, Int) throws -> Int

    /// <!-- FishyJoes.export(const42) -->
    public static let const42: Fun0 = { 42 }

    /// <!-- FishyJoes.export(abs) -->
    public static let iabs: Fun1 = { abs($0) }

    /// <!-- FishyJoes.export(intCompose) -->
    public static let intCompose: Fun2 = { f, g in { try f(g($0)) } }

    /// <!-- FishyJoes.export(add3Things) -->
    public static let add3Things: Fun3 = { Double($0) + $1 + Double($2) }

    /// <!-- FishyJoes.export(makeList) -->
    public static let makeList: Fun4 = { [$0, $1, $2, $3] }

    /// <!-- FishyJoes.export(fifthThing) -->
    public static let fifthThing: Fun5 = { $4 }

    /// <!-- FishyJoes.export(sixthThing) -->
    public static let six: Fun6 = { $5 }

    /// <!-- FishyJoes.export(exercise0) -->
    public static func exercise0(_ fn: Fun0) rethrows -> String {
        try "\(fn())"
    }

    /// <!-- FishyJoes.export(exercise1) -->
    public static func exercise1(_ fn: Fun1) rethrows -> String {
        try "\(fn(-3))"
    }

    /// <!-- FishyJoes.export(exercise2) -->
    public static func exercise2(_ fn: Fun2) throws -> String {
        try "\(fn({ $0 + 1 }, {$0 * 3 })(8))"
    }

    /// <!-- FishyJoes.export(exercise3) -->
    public static func exercise3(_ fn: Fun3) rethrows -> String {
        try "\(fn(1.0, 4.4, 2))"
    }

    /// <!-- FishyJoes.export(exercise4) -->
    public static func exercise4(_ fn: Fun4) rethrows -> String {
        try "\(fn("a", "b", "c", "d"))"
    }

    /// <!-- FishyJoes.export(exercise5) -->
    public static func exercise5(_ fn: Fun5) throws -> String {
        try "\(fn("hi", 6, 4.2, "bye", { 83 })())"
    }

    /// <!-- FishyJoes.export(exercise6) -->
    public static func exercise6(_ fn: Fun6) rethrows -> String {
        try "\(fn("hi", 6, 4.2, "bye", { 83 }, 42))"
    }

    /// <!-- FishyJoes.export(willThrow) -->
    public static func willThrow() throws -> String {
        throw TheError()
    }

    /// <!-- FishyJoes.exportReference(Functions.TheError) -->
    public struct TheError: Error {}

    /// <!-- FishyJoes.export(async42Func) -->
    public static func async42Func() async throws -> Int {
        42
    }

    /// <!-- FishyJoes.export(asyncYieldFunc) -->
    public static func asyncYieldFunc() async throws -> Int {
        await Task.yield()
        return try await async42Func()
    }

    /// <!-- FishyJoes.export(asyncSleepFunc) -->
    public static func asyncSleepFunc() async throws -> Int {
        try await Task.sleep(nanoseconds: 100)
        return try await async42Func()
    }

    /// <!-- FishyJoes.export(asyncVoidFunc) -->
    public static func asyncVoidFunc() async throws {
    }

    /// <!-- FishyJoes.export(asyncCallbackFunc) -->
    public static func asyncCallbackFunc(_ callback: () throws -> Void) async throws {
        try callback()
    }

    /// <!-- FishyJoes.export(asyncDoubleFunc) -->
    public static func asyncDoubleFunc(_ d: Double) async throws -> Double {
        return d * 2
    }

    /// <!-- FishyJoes.export(asyncThrowingFunc) -->
    public static func asyncThrowingFunc() async throws {
        throw TheError()
    }
    
    func f2(a: @Sendable @escaping (A) -> Void) {
        
    }
    
    func _f2(a: @escaping (A) -> Void) {
        f2(a: { a($0) })
    }

    func f(_ foo: Foo) async {
    }

    func f2() async {
        Task.detached { @Sendable in
            await f(foo)
            foo = Foo()
        }
        await { @Sendable @MainActor in
            await f(foo)
        }()
    }
}

actor A {}

class Foo {
    var i = 1
}

var foo = Foo()

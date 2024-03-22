import Foundation

/// <!-- FishyJoes.exportReference(Methods) -->
public struct Methods {
    /// <!-- FishyJoes.export(create) -->
    public static func create() -> Methods { .init() }

    // static
    /// <!-- FishyJoes.export(staticGet) -->
    public static var staticGet: Int { 123 }

    /// <!-- FishyJoes.exportAsMethod(staticGetMethod) -->
    public static let staticGetMethod: Int = 234

    static var _staticModifyBacking = 345
    /// <!-- FishyJoes.export(staticModifiable) -->
    public static var staticModifiable: Int {
        get { _staticModifyBacking }
        set { _staticModifyBacking = newValue }
    }

    // Not supported, will be a generation-time error
    // /// <!-- FishyJoes.exportAsMethod(staticModifiableMethod) -->
    // public static var staticModifiableMethod: Int = 456

    /// <!-- FishyJoes.export(staticStored) -->
    public static var staticStored: Int = 567

    // instance

    /// <!-- FishyJoes.export(instanceGet) -->
    public var instanceGet: Int { 1234 }

    /// <!-- FishyJoes.export(garply) -->
    public var garply: Int { 42901 }

    public var wibble: Int { 10924 }

    /// <!-- FishyJoes.export(doublePlusGood) -->
    public func doublePlusGood(a: Int, b: Double) -> Int {
        2 * (a + Int(round(b)))
    }

    /// <!-- FishyJoes.exportAsMethod(instanceGetMethod) -->
    public let instanceGetMethod: Int = 2345

    var _instanceModifyBacking = 3456
    /// <!-- FishyJoes.export(instanceModifiable) -->
    public var instanceModifiable: Int {
        get { _instanceModifyBacking }
        set { _instanceModifyBacking = newValue }
    }

    // Not supported, will be a generation-time error
    // /// <!-- FishyJoes.exportAsMethod(instanceModifiableMethod) -->
    // public var instanceModifiableMethod: Int = 4567

    /// <!-- FishyJoes.export(instanceStored) -->
    public var instanceStored: Int = 5678

    /// <!-- FishyJoes.export(async42) -->
    public func async42() async -> Int {
        42
    }

    /// <!-- FishyJoes.export(asyncYield) -->
    public func asyncYield() async -> Int {
        await Task.yield()
        return await async42()
    }

    /// <!-- FishyJoes.export(asyncSleep) -->
    public func asyncSleep() async throws -> UInt {
        try await Task.sleep(nanoseconds: 100)
        return await UInt(async42())
    }

    /// <!-- FishyJoes.export(asyncVoid) -->
    public func asyncVoid() async {
    }

    /// <!-- FishyJoes.export(asyncDouble) -->
    public func asyncDouble(_ d: Double) async -> Double {
        return d * 2
    }

    /// <!-- FishyJoes.export(asyncMultipleArgs) -->
    public func asyncMultipleArgs(_ i: Int, j: () async throws -> Int) async rethrows -> Int {
        try await i + j()
    }

    /// <!-- FishyJoes.export(asyncThrowing) -->
    public func asyncThrowing() async throws {
        throw TheMethodError()
    }

    /// <!-- FishyJoes.export(asyncCallbackFunc0) -->
    public func asyncCallbackFunc0(_ callback: () async throws -> Int) async rethrows -> Int {
        try await callback()
    }

    /// <!-- FishyJoes.export(staticAsync42) -->
    public static func staticAsync42() async -> Int {
        42
    }

    /// <!-- FishyJoes.export(staticAsyncYield) -->
    public static func staticAsyncYield() async -> Int {
        await Task.yield()
        return await staticAsync42()
    }

    /// <!-- FishyJoes.export(staticAsyncSleep) -->
    public static func staticAsyncSleep() async throws -> UInt {
        try await Task.sleep(nanoseconds: 100)
        return await UInt(staticAsync42())
    }

    /// <!-- FishyJoes.export(staticAsyncVoid) -->
    public static func staticAsyncVoid() async {
    }

    /// <!-- FishyJoes.export(staticAsyncDouble) -->
    public static func staticAsyncDouble(_ d: Double) async -> Double {
        return d * 2
    }

    /// <!-- FishyJoes.export(staticAsyncMultipleArgs) -->
    public static func staticAsyncMultipleArgs(_ i: Int, j: () async throws -> Int) async rethrows -> Int {
        try await i + j()
    }

    /// <!-- FishyJoes.export(staticAsyncThrowing) -->
    public static func staticAsyncThrowing() async throws {
        throw TheMethodError()
    }

    /// <!-- FishyJoes.export(staticAsyncCallbackFunc0) -->
    public static func staticAsyncCallbackFunc0(_ callback: () async throws -> Int) async rethrows -> Int {
        try await callback()
    }

    public struct TheMethodError: Error {}
}

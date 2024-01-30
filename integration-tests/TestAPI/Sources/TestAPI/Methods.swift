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
    public static func async42() async throws -> Int {
        42
    }

    /// <!-- FishyJoes.export(asyncYield) -->
    public static func asyncYield() async throws -> Int {
        await Task.yield()
        return try await async42()
    }

    /// <!-- FishyJoes.export(asyncSleep) -->
    public static func asyncSleep() async throws -> Int {
        try await Task.sleep(nanoseconds: 100)
        return try await async42()
    }

    /// <!-- FishyJoes.export(asyncVoid) -->
    public static func asyncVoid() async throws {
    }

    /// <!-- FishyJoes.export(asyncDouble) -->
    public static func asyncDouble(_ d: Double) async throws -> Double {
        return d * 2
    }

    /// <!-- FishyJoes.export(asyncMultipleArgs) -->
    public static func asyncMultipleArgs(_ i: Int, j: () async throws -> Int) async throws -> Int {
        try await i + j()
    }

    /// <!-- FishyJoes.export(asyncThrowing) -->
    public static func asyncThrowing() async throws {
        throw Functions.TheError()
    }

    /// <!-- FishyJoes.export(asyncCallbackFunc0) -->
    public static func asyncCallbackFunc0(_ callback: () async throws -> Int) async throws -> Int {
        try await callback()
    }
}

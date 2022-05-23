// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Tuples: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        let instanceData = try FishyJoesNodeRuntime.InstanceData.data(for: env)
        fatalError("invalid enum for Tuples")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let instanceData = try FishyJoesNodeRuntime.InstanceData.data(for: env)
        switch value {
        }
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
    }
}

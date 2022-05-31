// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension SimpleEnum: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        switch try String.fromNode(value, env: env) {
        case "red": return .red
        case "green": return .green
        case "blue": return .blue
        case let unknown: fatalError("invalid enum string '\(unknown)' for SimpleEnum")
        }
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        switch value {
            case .red: return try String.toNode("red", env: env)
            case .green: return try String.toNode("green", env: env)
            case .blue: return try String.toNode("blue", env: env)
        }
    }
}

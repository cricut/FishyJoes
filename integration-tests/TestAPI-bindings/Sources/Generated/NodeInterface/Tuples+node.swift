// Generated using Sourcery 1.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Tuples: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        switch try String.fromNode(value, env: env) {
        case let unknown: fatalError("invalid enum string '\(unknown)' for Tuples")
        }
    }
    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        switch value {
        }
    }
}

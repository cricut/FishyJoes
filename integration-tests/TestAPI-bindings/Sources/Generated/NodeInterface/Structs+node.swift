// Generated using Sourcery 1.6.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Structs: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        switch try String.fromNode(value, env: env) {
            case let unknown: print("invalid enum string '\(unknown)' for Structs"); fatalError()
        }
    }
    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
    }
}

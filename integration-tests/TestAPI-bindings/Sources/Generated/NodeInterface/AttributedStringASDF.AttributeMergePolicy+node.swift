// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension AttributedStringASDF.AttributeMergePolicy: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        switch try String.fromNode(value, env: env) {
        case "keepNew": return Self.keepNew
        case "keepCurrent": return Self.keepCurrent
        case let unknown: fatalError("invalid enum string '\(unknown)' for AttributedStringASDF.AttributeMergePolicy")
        }
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        switch value {
        case .keepNew:
            return try String.toNode("keepNew", env: env)
        case .keepCurrent:
            return try String.toNode("keepCurrent", env: env)
        }
    }
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let object = try env.createObject()
        let props = try NodeClass.descriptorsFor(properties: [
            :
        ], env: env)
        try env.defineProperties(object, properties: props)
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedString.AttributeMergePolicy",
            nodeClass: object
        )
    }
}

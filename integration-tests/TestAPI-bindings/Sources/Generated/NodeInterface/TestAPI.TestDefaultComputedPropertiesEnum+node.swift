// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.TestDefaultComputedPropertiesEnum: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        switch try String.fromNode(value, env: env) {
        case "qux": return Self.qux
        case let unknown: fatalError("invalid enum string '\(unknown)' for TestAPI.TestDefaultComputedPropertiesEnum")
        }
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        switch value {
        case .qux:
            return try String.toNode("qux", env: env)
        }
    }
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let object = try env.createObject()
        let props = try NodeClass.descriptorsFor(properties: [
            "getNoot": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "noot", expectedArgumentCount: 1) { env in
                        return try Swift.Int.toNode(env.argument(at: 0, converter: TestAPI.TestDefaultComputedPropertiesEnum.self).noot, env: env.env)
                    }
                },
                isStatic: true
            ),
            "getPlutonic": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "plutonic", expectedArgumentCount: 1) { env in
                        return try Swift.String.toNode(env.argument(at: 0, converter: TestAPI.TestDefaultComputedPropertiesEnum.self).pluto, env: env.env)
                    }
                },
                isStatic: true
            ),
            "getSpam": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "spam", expectedArgumentCount: 1) { env in
                        return try Swift.Bool.toNode(env.argument(at: 0, converter: TestAPI.TestDefaultComputedPropertiesEnum.self).spam, env: env.env)
                    }
                },
                isStatic: true
            ),
        ], env: env)
        try env.defineProperties(object, properties: props)
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestDefaultComputedPropertiesEnum",
            nodeClass: object
        )
    }
}

// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.SimpleEnum: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        switch try String.fromNode(value, env: env) {
        case "red": return Self.red
        case "blue": return Self.blue
        case let unknown: fatalError("invalid enum string '\(unknown)' for TestAPI.SimpleEnum")
        }
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        switch value {
        case .red:
            return try String.toNode("red", env: env)
        case .blue:
            return try String.toNode("blue", env: env)
        }
    }
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let object = try env.createObject()
        let props = try NodeClass.descriptorsFor(properties: [
            "testFuncCall": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "testFuncCall", expectedArgumentCount: 3, hasNamedOptions: false) { env in
                        let result = try Swift.Int.toNode(
                            env.argument(at: 0, converter: TestAPI.SimpleEnum.self).testFuncCall(
                                x: try env.argument(at: 1, converter: Swift.Int.self),
                                y: try env.argument(at: 2, converter: Swift.Int.self)
                            ),
                            env: env.env
                        )
                        return result
                    }
                },
                isStatic: true
            ),
        ], env: env)
        try env.defineProperties(object, properties: props)
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "SimpleEnum",
            nodeClass: object
        )
    }
}

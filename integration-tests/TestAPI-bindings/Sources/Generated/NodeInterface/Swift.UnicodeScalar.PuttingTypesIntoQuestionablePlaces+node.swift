// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        switch try String.fromNode(value, env: env) {
        case "thing": return Self.thing
        case let unknown: fatalError("invalid enum string '\(unknown)' for Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces")
        }
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        switch value {
        case .thing:
            return try String.toNode("thing", env: env)
        }
    }
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let object = try env.createObject()
        let props = try NodeClass.descriptorsFor(properties: [
            "testCall": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "testCall", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                        let result = try Swift.Int.toNode(
                            env.argument(at: 0, converter: Swift.UnicodeScalar.PuttingTypesIntoQuestionablePlaces.self).testCall(
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
            path: "UnicodeScalar_PuttingTypesIntoQuestionablePlaces",
            nodeClass: object
        )
    }
}

// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension SimpleEnum: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        switch try String.fromNode(value, env: env) {
        case "red": return Self.red
        case "green": return Self.green
        case "blue": return Self.blue
        case let unknown: fatalError("invalid enum string '\(unknown)' for SimpleEnum")
        }
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        switch value {
        case .red:
            return try String.toNode("red", env: env)
        case .green:
            return try String.toNode("green", env: env)
        case .blue:
            return try String.toNode("blue", env: env)
        }
    }
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let object = try env.createObject()
        let props = try NodeClass.descriptorsFor(properties: [
            "pickAColor": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "pickAColor", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                        let result = try OptionalConverter<SimpleEnum>.toNode(
                            SimpleEnum.pickAColor(
                                try env.argument(at: 0, converter: Int.self)
                            ),
                            env: env.env
                        )
                        return result
                    }
                },
                isStatic: true
            ),
            "hexMethod": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "hexMethod", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                        let result = try Swift.String.toNode(
                            env.argument(at: 0, converter: SimpleEnum.self).hexMethod(
                            ),
                            env: env.env
                        )
                        return result
                    }
                },
                isStatic: true
            ),
            "resetFavoriteColor": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "resetFavoriteColor", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                        let result = try VoidConverter.toNode(
                            SimpleEnum.resetFavoriteColor(
                            ),
                            env: env.env
                        )
                        return result
                    }
                },
                isStatic: true
            ),
            "getHex": (
                .method { env, info in
                    FishyJoesNodeRuntime.callbackBody(env, info, name: "hex", expectedArgumentCount: 1) { env in
                        try Int.toNode(env.argument(at: 0, converter: SimpleEnum.self).hex, env: env.env)
                    }
                },
                isStatic: true
            ),
            "favoriteColor": (
                .accessor(
                    getter: { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "favoriteColor", expectedArgumentCount: 0) { env in
                            try SimpleEnum.toNode(SimpleEnum.favoriteColor, env: env.env)
                        }
                    },
                    setter: { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "favoriteColor", expectedArgumentCount: 1) { env in
                            SimpleEnum.favoriteColor = try env.argument(at: 0, converter: SimpleEnum.self)
                            return nil
                        }
                    }),
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

// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension DefaultArguments: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected DefaultArguments, got nil")
        }
        return try Box<DefaultArguments>.takeUnretainedOpaque(nonNilPointer).value
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        // Uninhabited
    }
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "DefaultArguments",
            properties: [
                "echoDefaults": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoDefaults", expectedArgumentCount: 1, hasNamedOptions: true) { env in
                            let result = try Swift.String.toNode(
                                DefaultArguments.echoDefaults(
                                    y: try env.argument(named: "y", default: nil, converter: OptionalConverter<Int>.self),
                                    x: try env.argument(at: 0, converter: OptionalConverter<Int>.self),
                                    z: try env.argument(named: "z", default: 3.14, converter: Double.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "DefaultArguments_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<DefaultArguments>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "DefaultArguments",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

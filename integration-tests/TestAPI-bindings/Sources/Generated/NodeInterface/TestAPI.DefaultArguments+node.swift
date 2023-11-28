// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.DefaultArguments: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.DefaultArguments")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "DefaultArguments",
            properties: [
                "echoDefaults": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoDefaults", expectedArgumentCount: 1, hasNamedOptions: true) { env in
                            let result = try Swift.String.toNode(
                                TestAPI.DefaultArguments.echoDefaults(
                                    y: try env.argument(named: "y", default: nil, converter: OptionalConverter<Swift.Int>.self),
                                    x: try env.argument(at: 0, converter: OptionalConverter<Swift.Int>.self),
                                    theLabelForZ: try env.argument(named: "theLabelForZ", default: 3.14, converter: Swift.Double.self)
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
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "DefaultArguments_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "DefaultArguments",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

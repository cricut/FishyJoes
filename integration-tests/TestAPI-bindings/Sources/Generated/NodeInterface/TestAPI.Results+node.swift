// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.Results: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Results")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Results",
            properties: [
                "processResult": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "processResult", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                TestAPI.Results.processResult(
                                    try env.argument(at: 0, converter: ResultConverter<Swift.String, TestAPI.Results.Error>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "aFailure": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "aFailure", expectedArgumentCount: 0) { env in
                                return try ResultConverter<Swift.Int, TestAPI.Results.Error>.toNode(TestAPI.Results.aFailure, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "aSuccess": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "aSuccess", expectedArgumentCount: 0) { env in
                                return try ResultConverter<Swift.Int, TestAPI.Results.Error>.toNode(TestAPI.Results.aSuccess, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "Results_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Results",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

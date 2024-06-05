// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.EmptyEnum: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.EmptyEnum")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "EmptyEnum",
            properties: [
                "notGoingToHappen": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "notGoingToHappen", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            try (
                                TestAPI.EmptyEnum.notGoingToHappen(
                                )
                            )
                        }
                    },
                    isStatic: true
                ),
                "mies": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "mies", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.Int.toNode(
                                TestAPI.EmptyEnum.mies(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "noot": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "noot", expectedArgumentCount: 0) { env in
                                return try Swift.Int.toNode(TestAPI.EmptyEnum.noot, env: env.env)
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
                    name: "EmptyEnum_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "EmptyEnum",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Deprecations: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected Deprecations, got nil")
        }
        return try Box<Deprecations>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited
    }

    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        // Uninhabited
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Deprecations",
            properties: [
                "deprecatedMethod": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "deprecatedMethod", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                Deprecations.deprecatedMethod(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "deprecatedVariable": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "deprecatedVariable", expectedArgumentCount: 0) { env in
                                try Int.toNode(Deprecations.deprecatedVariable, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Deprecations_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<Deprecations>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Deprecations",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

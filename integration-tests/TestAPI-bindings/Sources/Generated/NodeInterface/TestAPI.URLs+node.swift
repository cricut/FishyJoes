// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.URLs: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.URLs")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "URLs",
            properties: [
                "echo": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echo", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Foundation.URL.toNode(
                                TestAPI.URLs.echo(
                                    try env.argument(at: 0, converter: Foundation.URL.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "simple": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "simple", expectedArgumentCount: 0) { env in
                                try Foundation.URL.toNode(TestAPI.URLs.simple, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "remoteFile": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "remoteFile", expectedArgumentCount: 0) { env in
                                try Foundation.URL.toNode(TestAPI.URLs.remoteFile, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "localFile": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "localFile", expectedArgumentCount: 0) { env in
                                try Foundation.URL.toNode(TestAPI.URLs.localFile, env: env.env)
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
                    name: "URLs_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "URLs",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension AttributedStrings: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for AttributedStrings")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "AttributedStrings",
            properties: [
                "echo": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echo", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Foundation.AttributedString.toNode(
                                AttributedStrings.echo(
                                    try env.argument(at: 0, converter: Foundation.AttributedString.self)
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
                                try Foundation.AttributedString.toNode(AttributedStrings.simple, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "accent": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "accent", expectedArgumentCount: 0) { env in
                                try Foundation.AttributedString.toNode(AttributedStrings.accent, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "script": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "script", expectedArgumentCount: 0) { env in
                                try Foundation.AttributedString.toNode(AttributedStrings.script, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "chinese": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "chinese", expectedArgumentCount: 0) { env in
                                try Foundation.AttributedString.toNode(AttributedStrings.chinese, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "chineseBMP": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "chineseBMP", expectedArgumentCount: 0) { env in
                                try Foundation.AttributedString.toNode(AttributedStrings.chineseBMP, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "chineseSIP": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "chineseSIP", expectedArgumentCount: 0) { env in
                                try Foundation.AttributedString.toNode(AttributedStrings.chineseSIP, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "emoji": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "emoji", expectedArgumentCount: 0) { env in
                                try Foundation.AttributedString.toNode(AttributedStrings.emoji, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "emojiMulti": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "emojiMulti", expectedArgumentCount: 0) { env in
                                try Foundation.AttributedString.toNode(AttributedStrings.emojiMulti, env: env.env)
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
                    name: "AttributedStrings_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedStrings",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

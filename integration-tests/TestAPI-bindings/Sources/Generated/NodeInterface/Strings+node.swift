// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Strings: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected Strings, got nil")
        }
        return try Box<Strings>.takeUnretainedOpaque(nonNilPointer).value
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
            name: "Strings",
            properties: [
                "echo": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echo", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                Strings.echo(
                                    try env.argument(at: 0, converter: Swift.String.self)
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
                                try Swift.String.toNode(Strings.simple, env: env.env)
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
                                try Swift.String.toNode(Strings.accent, env: env.env)
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
                                try Swift.String.toNode(Strings.script, env: env.env)
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
                                try Swift.String.toNode(Strings.chinese, env: env.env)
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
                                try Swift.String.toNode(Strings.chineseBMP, env: env.env)
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
                                try Swift.String.toNode(Strings.chineseSIP, env: env.env)
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
                                try Swift.String.toNode(Strings.emoji, env: env.env)
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
                                try Swift.String.toNode(Strings.emojiMulti, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Strings_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<Strings>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Strings",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

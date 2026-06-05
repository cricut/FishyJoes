// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import EmojiFun
import EmojiFun_CommonInterface
import FishyJoesNodeRuntime
import Foundation

// MARK: - NodeInterface/EmojiFun.EmojiExplorer+node.swift

extension EmojiFun.EmojiExplorer: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> EmojiFun.EmojiExplorer {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected EmojiFun.EmojiExplorer, got nil")
        }
        return try Box<EmojiFun.EmojiExplorer>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: EmojiFun.EmojiExplorer, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "EmojiExplorer", module: "EmojiFun", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: EmojiFun.EmojiExplorer, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected EmojiFun.EmojiExplorer, got nil")
        }
        try Box<EmojiFun.EmojiExplorer>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            module: "EmojiFun",
            name: "EmojiExplorer",
            properties: [
                (
                    name: "create",
                    .method{ env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try EmojiFun.EmojiExplorer.toNode(
                                EmojiFun.EmojiExplorer(
                                    count: try env.argument(at: 0, converter: Swift.Int.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                (
                    name: "random",
                    .method{ env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "random", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: EmojiFun.EmojiExplorer.self).random(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                (
                    name: "randomUnique",
                    .method{ env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "randomUnique", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: EmojiFun.EmojiExplorer.self)
                            FishyJoesCommonRuntime.silenceMutationWarning(&mutatingSelf)
                            let result = try OptionalConverter<Swift.String>.toNode(
                                mutatingSelf.randomUnique(
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                (
                    name: "enumerateKnown",
                    .method{ env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "enumerateKnown", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                env.this(converter: EmojiFun.EmojiExplorer.self).enumerateKnown(
                                    try env.argument(at: 0, converter: Function1Converter<Swift.String, Swift.Bool>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                (
                    name: "hello",
                    .accessor(
                        getter:{ env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "hello", expectedArgumentCount: 0) { env in
                                return try Swift.String.toNode(EmojiFun.EmojiExplorer.hello, env: env.env)
                            }
                        },
                        setter:nil
                    ),
                    isStatic: true
                ),
                (
                    name: "known",
                    .accessor(
                        getter:{ env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "known", expectedArgumentCount: 0) { env in
                                return try SetConverter<Swift.String>.toNode(env.this(converter: EmojiFun.EmojiExplorer.self).known, env: env.env)
                            }
                        },
                        setter:nil
                    ),
                    isStatic: false
                ),
                (
                    name: "toString",
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "toString", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                "\(env.this(converter: EmojiFun.EmojiExplorer.self))",
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                )
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "EmojiExplorer_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<EmojiFun.EmojiExplorer>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "EmojiExplorer",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

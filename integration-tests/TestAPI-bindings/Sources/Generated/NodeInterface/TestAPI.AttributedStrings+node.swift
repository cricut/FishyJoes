// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.AttributedStrings: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.AttributedStrings")
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
                                TestAPI.AttributedStrings.echo(
                                    try env.argument(at: 0, converter: Foundation.AttributedString.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "firstIndex": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "firstIndex", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Foundation.AttributedString.Index.toNode(
                                TestAPI.AttributedStrings.firstIndex(
                                    of: try env.argument(at: 0, converter: Foundation.AttributedString.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "lastIndex": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "lastIndex", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Foundation.AttributedString.Index.toNode(
                                TestAPI.AttributedStrings.lastIndex(
                                    of: try env.argument(at: 0, converter: Foundation.AttributedString.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "fullRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "fullRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try RangeConverter<Foundation.AttributedString.Index>.toNode(
                                TestAPI.AttributedStrings.fullRange(
                                    of: try env.argument(at: 0, converter: Foundation.AttributedString.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "attributedCharacters": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "attributedCharacters", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ArrayConverter<Foundation.AttributedSubstring>.toNode(
                                TestAPI.AttributedStrings.attributedCharacters(
                                    of: try env.argument(at: 0, converter: Foundation.AttributedString.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "attributesPreferringDuplicatesNearerStart": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "attributesPreferringDuplicatesNearerStart", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Foundation.AttributeContainer.toNode(
                                TestAPI.AttributedStrings.attributesPreferringDuplicatesNearerStart(
                                    of: try env.argument(at: 0, converter: Foundation.AttributedString.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "emptyAttributeRuns": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "emptyAttributeRuns", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ArrayConverter<Foundation.AttributedString.Runs.Run>.toNode(
                                TestAPI.AttributedStrings.emptyAttributeRuns(
                                    of: try env.argument(at: 0, converter: Foundation.AttributedString.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "accent": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "accent", expectedArgumentCount: 0) { env in
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.accent, env: env.env)
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
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.chinese, env: env.env)
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
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.chineseBMP, env: env.env)
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
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.chineseSIP, env: env.env)
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
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.emoji, env: env.env)
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
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.emojiMulti, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "polyglot": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "polyglot", expectedArgumentCount: 0) { env in
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.polyglot, env: env.env)
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
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.script, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "simple": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "simple", expectedArgumentCount: 0) { env in
                                return try Foundation.AttributedString.toNode(TestAPI.AttributedStrings.simple, env: env.env)
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

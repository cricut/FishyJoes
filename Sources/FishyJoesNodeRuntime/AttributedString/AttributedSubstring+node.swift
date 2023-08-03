import Foundation

extension AttributedSubstring: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedSubstring {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedSubstring, got nil")
        }
        return try Box<AttributedSubstring>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedSubstring, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: "AttributedSubstring", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedSubstring, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedSubstring, got nil")
        }
        try Box<AttributedSubstring>.takeUnretainedOpaque(pointer).value = value
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributedSubstring",
            properties: [
                "base": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "base", expectedArgumentCount: 0) { env in
                                try AttributedString.toNode(env.this(converter: AttributedSubstring.self).base, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "string": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "string", expectedArgumentCount: 0) { env in
                                try Swift.String.toNode(String(env.this(converter: AttributedSubstring.self).characters), env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "runs": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "runs", expectedArgumentCount: 0) { env in
                                try AttributedString.Runs.toNode(env.this(converter: AttributedSubstring.self).runs, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "characters": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "characters", expectedArgumentCount: 0) { env in
                                try AttributedString.CharacterView.toNode(env.this(converter: AttributedSubstring.self).characters, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "unicodeScalars": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "unicodeScalars", expectedArgumentCount: 0) { env in
                                try AttributedString.UnicodeScalarView.toNode(env.this(converter: AttributedSubstring.self).unicodeScalars, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "startIndex": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "startIndex", expectedArgumentCount: 0) { env in
                                try AttributedString.Index.toNode(env.this(converter: AttributedSubstring.self).startIndex, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "endIndex": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "endIndex", expectedArgumentCount: 0) { env in
                                try AttributedString.Index.toNode(env.this(converter: AttributedSubstring.self).endIndex, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "substring": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "substring", expectedArgumentCount: 0) { env in
                                try AttributedSubstring.toNode(env.this(converter: AttributedSubstring.self), env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "substringForRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "substringForRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AttributedSubstring.toNode(
                                env.this(converter: AttributedSubstring.self)[
                                    try env.argument(at: 0, converter: RangeConverter<AttributedString.Index>.self)
                                ],
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "equals": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "equals", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            guard let lhs = try? env.this(converter: AttributedSubstring.self),
                                  let rhs = try? env.argument(at: 0, converter: AttributedSubstring.self) else {
                                return try Bool.toNode(false, env: env.env)
                            }
                            let equal = lhs == rhs
                            return try Bool.toNode(equal, env: env.env)
                        }
                    },
                    isStatic: false
                ),
                "hashCode": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "hashCode", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let hash = Int32(truncatingIfNeeded: try env.this(converter: AttributedSubstring.self).hashValue)
                            return try Int32.toNode(hash, env: env.env)
                        }
                    },
                    isStatic: false
                ),
                "createEmpty": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "createEmpty", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try AttributedSubstring.toNode(
                                AttributedSubstring(
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
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedSubstring_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributedSubstring>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedSubstring",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

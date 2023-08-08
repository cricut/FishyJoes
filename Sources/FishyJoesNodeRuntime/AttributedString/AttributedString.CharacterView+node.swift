import Foundation

extension AttributedString.CharacterView: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedString.CharacterView {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedString.CharacterView, got nil")
        }
        return try Box<AttributedString.CharacterView>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedString.CharacterView, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "AttributedString.CharacterView", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedString.CharacterView, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedString.CharacterView, got nil")
        }
        try Box<AttributedString.CharacterView>.takeUnretainedOpaque(pointer).value = value
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributedString.CharacterView",
            properties: [
                "startIndex": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "startIndex", expectedArgumentCount: 0) { env in
                                try AttributedString.Index.toNode(env.this(converter: AttributedString.CharacterView.self).startIndex, env: env.env)
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
                                try AttributedString.Index.toNode(env.this(converter: AttributedString.CharacterView.self).endIndex, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "indexBefore": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "indexBefore", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AttributedString.Index.toNode(
                                env.this(converter: AttributedString.CharacterView.self).index(
                                    before: try env.argument(at: 0, converter: AttributedString.Index.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "indexAfter": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "indexAfter", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AttributedString.Index.toNode(
                                env.this(converter: AttributedString.CharacterView.self).index(
                                    after: try env.argument(at: 0, converter: AttributedString.Index.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "elementAt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "elementAt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                String(
                                    env.this(converter: AttributedString.CharacterView.self)[
                                        try env.argument(at: 0, converter: AttributedString.Index.self)
                                    ]
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedString.CharacterView_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributedString.CharacterView>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedString.CharacterView",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

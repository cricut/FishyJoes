import Foundation

extension AttributedString.UnicodeScalarView: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedString.UnicodeScalarView {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedString.UnicodeScalarView, got nil")
        }
        return try Box<AttributedString.UnicodeScalarView>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedString.UnicodeScalarView, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "AttributedString.UnicodeScalarView", module: "FishyJoesCommonRuntime", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedString.UnicodeScalarView, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedString.UnicodeScalarView, got nil")
        }
        try Box<AttributedString.UnicodeScalarView>.takeUnretainedOpaque(pointer).value = value
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            module: "FishyJoesCommonRuntime",
            name: "AttributedString.UnicodeScalarView",
            properties: [
                "startIndex": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "startIndex", expectedArgumentCount: 0) { env in
                                try AttributedString.Index.toNode(env.this(converter: AttributedString.UnicodeScalarView.self).startIndex, env: env.env)
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
                                try AttributedString.Index.toNode(env.this(converter: AttributedString.UnicodeScalarView.self).endIndex, env: env.env)
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
                                env.this(converter: AttributedString.UnicodeScalarView.self).index(
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
                                env.this(converter: AttributedString.UnicodeScalarView.self).index(
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
                            let result = try UInt32.toNode(
                                env.this(converter: AttributedString.UnicodeScalarView.self)[
                                    try env.argument(at: 0, converter: AttributedString.Index.self)
                                ].value,
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedString.UnicodeScalarView_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributedString.UnicodeScalarView>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedString.UnicodeScalarView",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

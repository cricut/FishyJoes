import Foundation

extension AttributeContainer.FoundationAttributes: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributeContainer.FoundationAttributes {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributeContainer.FoundationAttributes, got nil")
        }
        return try Box<AttributeContainer.FoundationAttributes>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributeContainer.FoundationAttributes, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: "AttributeContainer.FoundationAttributes", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributeContainer.FoundationAttributes, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributeContainer.FoundationAttributes, got nil")
        }
        try Box<AttributeContainer.FoundationAttributes>.takeUnretainedOpaque(pointer).value = value
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributeContainer.FoundationAttributes",
            properties: [
                "createEmpty": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "createEmpty", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try AttributeContainer.FoundationAttributes.toNode(
                                AttributeContainer.FoundationAttributes(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "createFromContainer": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "createFromContainer", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AttributeContainer.FoundationAttributes.toNode(
                                AttributeContainer.FoundationAttributes(
                                    try env.argument(at: 0, converter: Foundation.AttributeContainer.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "link": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "link", expectedArgumentCount: 0) { env in
                                try OptionalConverter<Foundation.URL>.toNode(env.this(converter: AttributeContainer.FoundationAttributes.self).link, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "link", expectedArgumentCount: 1) { env in
                                var mutatingSelf = try env.this(converter: AttributeContainer.FoundationAttributes.self)
                                mutatingSelf.link = try env.argument(at: 0, converter: OptionalConverter<Foundation.URL>.self)
                                try AttributeContainer.FoundationAttributes.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                                return nil
                            }
                        }),
                    isStatic: false
                ),
                "languageIdentifier": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "languageIdentifier", expectedArgumentCount: 0) { env in
                                try OptionalConverter<Swift.String>.toNode(env.this(converter: AttributeContainer.FoundationAttributes.self).languageIdentifier, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "languageIdentifier", expectedArgumentCount: 1) { env in
                                var mutatingSelf = try env.this(converter: AttributeContainer.FoundationAttributes.self)
                                mutatingSelf.languageIdentifier = try env.argument(at: 0, converter: OptionalConverter<Swift.String>.self)
                                try AttributeContainer.FoundationAttributes.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                                return nil
                            }
                        }),
                    isStatic: false
                ),
                "asContainer": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asContainer", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try AttributeContainer.toNode(
                                AttributeContainer(
                                    env.this(converter: AttributeContainer.FoundationAttributes.self)
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
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributeContainer.FoundationAttributes_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributeContainer.FoundationAttributes>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributeContainer.FoundationAttributes",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

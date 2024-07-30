import Foundation

extension AttributedString: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedString {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedString, got nil")
        }
        return try Box<AttributedString>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedString, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "AttributedString", module: "FishyJoesCommonRuntime", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedString, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedString, got nil")
        }
        try Box<AttributedString>.takeUnretainedOpaque(pointer).value = value
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            module: "FishyJoesCommonRuntime",
            name: "AttributedString",
            properties: [
                "string": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "string", expectedArgumentCount: 0) { env in
                                try Swift.String.toNode(String(env.this(converter: AttributedString.self).characters), env: env.env)
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
                                try AttributedString.Runs.toNode(env.this(converter: AttributedString.self).runs, env: env.env)
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
                                try AttributedString.CharacterView.toNode(env.this(converter: AttributedString.self).characters, env: env.env)
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
                                try AttributedString.UnicodeScalarView.toNode(env.this(converter: AttributedString.self).unicodeScalars, env: env.env)
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
                                let attributedString = try env.this(converter: AttributedString.self)
                                return try AttributedSubstring.toNode(attributedString[attributedString.startIndex..<attributedString.endIndex], env: env.env)
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
                                env.this(converter: AttributedString.self)[
                                    try env.argument(at: 0, converter: RangeConverter<AttributedString.Index>.self)
                                ],
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "startIndex": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "startIndex", expectedArgumentCount: 0) { env in
                                try AttributedString.Index.toNode(env.this(converter: AttributedString.self).startIndex, env: env.env)
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
                                try AttributedString.Index.toNode(env.this(converter: AttributedString.self).endIndex, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "append": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "append", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.append(
                                    try env.argument(at: 0, converter: AttributedString.self)
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "appendSubstring": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "appendSubstring", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.append(
                                    try env.argument(at: 0, converter: AttributedSubstring.self)
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "insert": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "insert", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.insert(
                                    try env.argument(at: 0, converter: AttributedString.self),
                                    at: try env.argument(at: 1, converter: AttributedString.Index.self)
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "insertSubstring": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "insertSubstring", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.insert(
                                    try env.argument(at: 0, converter: AttributedSubstring.self),
                                    at: try env.argument(at: 1, converter: AttributedString.Index.self)
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "replaceSubrange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "replaceSubrange", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.replaceSubrange(
                                    try env.argument(at: 0, converter: RangeConverter<AttributedString.Index>.self),
                                    with: try env.argument(at: 1, converter: AttributedString.self)
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "replaceSubrangeWithSubstring": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "replaceSubrangeWithSubstring", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.replaceSubrange(
                                    try env.argument(at: 0, converter: RangeConverter<AttributedString.Index>.self),
                                    with: try env.argument(at: 1, converter: AttributedSubstring.self)
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "removeSubrange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "removeSubrange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.removeSubrange(
                                    try env.argument(at: 0, converter: RangeConverter<AttributedString.Index>.self)
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "setAttributes": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "setAttributes", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.setAttributes(
                                    try env.argument(at: 0, converter: AttributeContainer.self)
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "setAttributesForRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "setAttributesForRange", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.self)
                            let range = try env.argument(at: 0, converter: RangeConverter<AttributedString.Index>.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf[range].setAttributes(
                                    try env.argument(at: 1, converter: AttributeContainer.self)
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "mergeAttributes": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "mergeAttributes", expectedArgumentCount: 1, hasNamedOptions: true) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.self)
                            let keepCurrent = try env.argument(named: "keepCurrent", default: false, converter: Bool.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.mergeAttributes(
                                    try env.argument(at: 0, converter: AttributeContainer.self),
                                    mergePolicy: keepCurrent ? .keepCurrent : .keepNew
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "mergeAttributesForRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "mergeAttributesForRange", expectedArgumentCount: 2, hasNamedOptions: true) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.self)
                            let range = try env.argument(at: 0, converter: RangeConverter<AttributedString.Index>.self)
                            let keepCurrent = try env.argument(named: "keepCurrent", default: false, converter: Bool.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf[range].mergeAttributes(
                                    try env.argument(at: 1, converter: AttributeContainer.self),
                                    mergePolicy: keepCurrent ? .keepCurrent : .keepNew
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "replaceAttributes": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "replaceAttributes", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.replaceAttributes(
                                    try env.argument(at: 0, converter: AttributeContainer.self),
                                    with: try env.argument(at: 1, converter: AttributeContainer.self)
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "replaceAttributesForRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "replaceAttributesForRange", expectedArgumentCount: 3, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedString.self)
                            let range = try env.argument(at: 0, converter: RangeConverter<AttributedString.Index>.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf[range].replaceAttributes(
                                    try env.argument(at: 1, converter: AttributeContainer.self),
                                    with: try env.argument(at: 2, converter: AttributeContainer.self)
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "equals": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "equals", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            guard let lhs = try? env.this(converter: AttributedString.self),
                                  let rhs = try? env.argument(at: 0, converter: AttributedString.self) else {
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
                            let hash = Int32(truncatingIfNeeded: try env.this(converter: AttributedString.self).hashValue)
                            return try Int32.toNode(hash, env: env.env)
                        }
                    },
                    isStatic: false
                ),
                "createEmpty": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "createEmpty", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try AttributedString.toNode(
                                AttributedString(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 1, hasNamedOptions: true) { env in
                            let result = try AttributedString.toNode(
                                AttributedString(
                                    try env.argument(at: 0, converter: Swift.String.self),
                                    attributes: try env.argument(named: "attributes", default: nil, converter: OptionalConverter<AttributeContainer>.self) ?? .init()
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "createFromSubstring": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "createFromSubstring", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AttributedString.toNode(
                                AttributedString(
                                    try env.argument(at: 0, converter: AttributedSubstring.self)
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
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedString_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributedString>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AttributedString",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension AttributedSubstringASDF: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedSubstringASDF {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedSubstringASDF, got nil")
        }
        return try Box<AttributedSubstringASDF>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedSubstringASDF, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: "AttributedSubstring", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedSubstringASDF, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedSubstringASDF, got nil")
        }
        try Box<AttributedSubstringASDF>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributedSubstring",
            properties: [
                "createEmpty": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "createEmpty", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try AttributedSubstringASDF.toNode(
                                AttributedSubstringASDF(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "substringForRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "substringForRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AttributedSubstringASDF.toNode(
                                env.this(converter: AttributedSubstringASDF.self).substring(
                                    for: try env.argument(at: 0, converter: RangeConverter<AttributedStringASDF.Index>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "setAttributes": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "setAttributes", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedSubstringASDF.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.setAttributes(
                                    try env.argument(at: 0, converter: AttributeContainerASDF.self)
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
                            var mutatingSelf = try env.this(converter: AttributedSubstringASDF.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.mergeAttributes(
                                    try env.argument(at: 0, converter: AttributeContainerASDF.self),
                                    mergePolicy: try env.argument(named: "mergePolicy", default: nil, converter: OptionalConverter<AttributedStringASDF.AttributeMergePolicy>.self)
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
                            var mutatingSelf = try env.this(converter: AttributedSubstringASDF.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.replaceAttributes(
                                    try env.argument(at: 0, converter: AttributeContainerASDF.self),
                                    with: try env.argument(at: 1, converter: AttributeContainerASDF.self)
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "base": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "base", expectedArgumentCount: 0) { env in
                                try AttributedStringASDF.toNode(env.this(converter: AttributedSubstringASDF.self).base, env: env.env)
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
                                try AttributedStringASDF.Index.toNode(env.this(converter: AttributedSubstringASDF.self).startIndex, env: env.env)
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
                                try AttributedStringASDF.Index.toNode(env.this(converter: AttributedSubstringASDF.self).endIndex, env: env.env)
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
                                try AttributedStringASDF.UnicodeScalarView.toNode(env.this(converter: AttributedSubstringASDF.self).unicodeScalars, env: env.env)
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
                                try AttributedStringASDF.CharacterView.toNode(env.this(converter: AttributedSubstringASDF.self).characters, env: env.env)
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
                                try AttributedStringASDF.Runs.toNode(env.this(converter: AttributedSubstringASDF.self).runs, env: env.env)
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
                                try AttributedSubstringASDF.toNode(env.this(converter: AttributedSubstringASDF.self).substring, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "attributes": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "attributes", expectedArgumentCount: 0) { env in
                                try DictionaryConverter<Swift.String, Swift.String>.toNode(env.this(converter: AttributedSubstringASDF.self).attributes, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedSubstring_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributedSubstringASDF>.construct(env: env)
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

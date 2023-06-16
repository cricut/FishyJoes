// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension AttributedStringASDF.CharacterView: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> AttributedStringASDF.CharacterView {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected AttributedStringASDF.CharacterView, got nil")
        }
        return try Box<AttributedStringASDF.CharacterView>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: AttributedStringASDF.CharacterView, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: "AttributedString.CharacterView", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: AttributedStringASDF.CharacterView, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected AttributedStringASDF.CharacterView, got nil")
        }
        try Box<AttributedStringASDF.CharacterView>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AttributedString.CharacterView",
            properties: [
                "indexBefore": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "indexBefore", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AttributedStringASDF.Index.toNode(
                                env.this(converter: AttributedStringASDF.CharacterView.self).index(
                                    before: try env.argument(at: 0, converter: AttributedStringASDF.Index.self)
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
                            let result = try AttributedStringASDF.Index.toNode(
                                env.this(converter: AttributedStringASDF.CharacterView.self).index(
                                    after: try env.argument(at: 0, converter: AttributedStringASDF.Index.self)
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
                                env.this(converter: AttributedStringASDF.CharacterView.self).element(
                                    at: try env.argument(at: 0, converter: AttributedStringASDF.Index.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "replaceSubrange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "replaceSubrange", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: AttributedStringASDF.CharacterView.self)
                            let result = try VoidConverter.toNode(
                                mutatingSelf.replaceSubrange(
                                    try env.argument(at: 0, converter: RangeConverter<AttributedStringASDF.Index>.self),
                                    with: try env.argument(at: 1, converter: ArrayConverter<Swift.String>.self)
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "startIndex": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "startIndex", expectedArgumentCount: 0) { env in
                                try AttributedStringASDF.Index.toNode(env.this(converter: AttributedStringASDF.CharacterView.self).startIndex, env: env.env)
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
                                try AttributedStringASDF.Index.toNode(env.this(converter: AttributedStringASDF.CharacterView.self).endIndex, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "AttributedString.CharacterView_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<AttributedStringASDF.CharacterView>.construct(env: env)
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

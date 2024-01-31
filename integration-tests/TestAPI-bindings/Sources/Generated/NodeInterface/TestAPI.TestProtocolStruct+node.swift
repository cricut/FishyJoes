// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.TestProtocolStruct: NodeMutator {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            corge: try { () -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "corge")
                return try Swift.String.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestProtocolStruct", env: env)
        let args: [NAPI.Value] = [
            try Swift.String.toNode(value.corge, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "corge", Swift.String.toNode(value.corge, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestProtocolStruct",
            properties: [
                "foo": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "foo", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                env.this(converter: TestAPI.TestProtocolStruct.self).foo(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "bar": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "bar", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.Bool.toNode(
                                env.this(converter: TestAPI.TestProtocolStruct.self).bar(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "baz": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "baz", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                env.this(converter: TestAPI.TestProtocolStruct.self).baz(
                                    qux: try env.argument(at: 0, converter: Swift.Bool.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "garply": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "garply", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.TestProtocolStruct.self).garply(
                                    try env.argument(at: 0, converter: Swift.String.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "xyzzy": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "xyzzy", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.TestProtocolStruct.self).xyzzy(
                                    thud: try env.argument(at: 0, converter: Swift.Int.self),
                                    grault: try env.argument(at: 1, converter: ArrayConverter<Swift.Double>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "plugh": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "plugh", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>.toNode(
                                env.this(converter: TestAPI.TestProtocolStruct.self).plugh(
                                    fred: try env.argument(at: 0, converter: Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "wibble": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "wibble", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                TestAPI.TestProtocolStruct.wibble(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "frob": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "frob", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.Double>.toNode(env.this(converter: TestAPI.TestProtocolStruct.self).frob, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "blarg": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "blarg", expectedArgumentCount: 0) { env in
                                try Swift.String.toNode(TestAPI.TestProtocolStruct.blarg, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "corge": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "TestProtocolStruct_constructor", expectedArgumentCount: 1) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "corge", env.argument(at: 0))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestProtocolStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.TestProtocolStruct: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.TestProtocolStruct")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
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
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "TestProtocolStruct_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestProtocolStruct",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

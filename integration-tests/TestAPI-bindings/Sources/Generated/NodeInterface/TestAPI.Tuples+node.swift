// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.Tuples: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Tuples")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Tuples",
            properties: [
                "checkTuples": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "checkTuples", expectedArgumentCount: 5, hasNamedOptions: false) { env in
                            let result = try Swift.Bool.toNode(
                                TestAPI.Tuples.checkTuples(
                                    t2: try env.argument(at: 0, converter: Tuple2Converter<Swift.Int, Swift.String>.self),
                                    t3: try env.argument(at: 1, converter: Tuple3Converter<Swift.String, Swift.Double, Swift.String>.self),
                                    t4: try env.argument(at: 2, converter: Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>.self),
                                    t5: try env.argument(at: 3, converter: Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>.self),
                                    t6: try env.argument(at: 4, converter: Tuple6Converter<Swift.String, Swift.Int, Swift.Double, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>, Swift.Bool>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "tuple2": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tuple2", expectedArgumentCount: 0) { env in
                                try Tuple2Converter<Swift.Int, Swift.String>.toNode(TestAPI.Tuples.tuple2, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "tuple3": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tuple3", expectedArgumentCount: 0) { env in
                                try Tuple3Converter<Swift.String, Swift.Double, Swift.String>.toNode(TestAPI.Tuples.tuple3, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "tuple4": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tuple4", expectedArgumentCount: 0) { env in
                                try Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>.toNode(TestAPI.Tuples.tuple4, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "tuple5": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tuple5", expectedArgumentCount: 0) { env in
                                try Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>.toNode(TestAPI.Tuples.tuple5, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "tuple6": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "tuple6", expectedArgumentCount: 0) { env in
                                try Tuple6Converter<Swift.String, Swift.Int, Swift.Double, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple5Converter<Swift.String, Swift.UInt8, Tuple4Converter<Tuple2Converter<Swift.Int, Swift.String>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Swift.String, Swift.Bool>, Tuple3Converter<Swift.String, Swift.Double, Swift.String>, Tuple2Converter<Swift.Int, Swift.String>>, Swift.Bool>.toNode(TestAPI.Tuples.tuple6, env: env.env)
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
                    name: "Tuples_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Tuples",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

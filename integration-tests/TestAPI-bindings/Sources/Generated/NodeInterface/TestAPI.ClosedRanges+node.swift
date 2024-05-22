// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.ClosedRanges: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.ClosedRanges")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "ClosedRanges",
            properties: [
                "echoUInt8Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt8Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.UInt8>.toNode(
                                TestAPI.ClosedRanges.echoUInt8Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.UInt8>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt16Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt16Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.UInt16>.toNode(
                                TestAPI.ClosedRanges.echoUInt16Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.UInt16>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt32Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt32Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.UInt32>.toNode(
                                TestAPI.ClosedRanges.echoUInt32Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.UInt32>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt64Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt64Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.UInt64>.toNode(
                                TestAPI.ClosedRanges.echoUInt64Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.UInt64>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUIntRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUIntRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.UInt>.toNode(
                                TestAPI.ClosedRanges.echoUIntRange(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.UInt>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt8Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt8Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.Int8>.toNode(
                                TestAPI.ClosedRanges.echoInt8Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.Int8>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt16Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt16Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.Int16>.toNode(
                                TestAPI.ClosedRanges.echoInt16Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.Int16>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt32Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt32Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.Int32>.toNode(
                                TestAPI.ClosedRanges.echoInt32Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.Int32>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt64Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt64Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.Int64>.toNode(
                                TestAPI.ClosedRanges.echoInt64Range(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.Int64>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoIntRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoIntRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.Int>.toNode(
                                TestAPI.ClosedRanges.echoIntRange(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoFloatRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoFloatRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.Float>.toNode(
                                TestAPI.ClosedRanges.echoFloatRange(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.Float>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoDoubleRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoDoubleRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.Double>.toNode(
                                TestAPI.ClosedRanges.echoDoubleRange(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.Double>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoStringRange": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoStringRange", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ClosedRangeConverter<Swift.String>.toNode(
                                TestAPI.ClosedRanges.echoStringRange(
                                    try env.argument(at: 0, converter: ClosedRangeConverter<Swift.String>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "doubleRange": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "doubleRange", expectedArgumentCount: 0) { env in
                                try ClosedRangeConverter<Swift.Double>.toNode(TestAPI.ClosedRanges.doubleRange, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "floatRange": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "floatRange", expectedArgumentCount: 0) { env in
                                try ClosedRangeConverter<Swift.Float>.toNode(TestAPI.ClosedRanges.floatRange, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "int16Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "int16Range", expectedArgumentCount: 0) { env in
                                try ClosedRangeConverter<Swift.Int16>.toNode(TestAPI.ClosedRanges.int16Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "int32Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "int32Range", expectedArgumentCount: 0) { env in
                                try ClosedRangeConverter<Swift.Int32>.toNode(TestAPI.ClosedRanges.int32Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "int64Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "int64Range", expectedArgumentCount: 0) { env in
                                try ClosedRangeConverter<Swift.Int64>.toNode(TestAPI.ClosedRanges.int64Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "int8Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "int8Range", expectedArgumentCount: 0) { env in
                                try ClosedRangeConverter<Swift.Int8>.toNode(TestAPI.ClosedRanges.int8Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "intRange": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "intRange", expectedArgumentCount: 0) { env in
                                try ClosedRangeConverter<Swift.Int>.toNode(TestAPI.ClosedRanges.intRange, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "stringRange": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "stringRange", expectedArgumentCount: 0) { env in
                                try ClosedRangeConverter<Swift.String>.toNode(TestAPI.ClosedRanges.stringRange, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "uInt16Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "uInt16Range", expectedArgumentCount: 0) { env in
                                try ClosedRangeConverter<Swift.UInt16>.toNode(TestAPI.ClosedRanges.uInt16Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "uInt32Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "uInt32Range", expectedArgumentCount: 0) { env in
                                try ClosedRangeConverter<Swift.UInt32>.toNode(TestAPI.ClosedRanges.uInt32Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "uInt64Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "uInt64Range", expectedArgumentCount: 0) { env in
                                try ClosedRangeConverter<Swift.UInt64>.toNode(TestAPI.ClosedRanges.uInt64Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "uInt8Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "uInt8Range", expectedArgumentCount: 0) { env in
                                try ClosedRangeConverter<Swift.UInt8>.toNode(TestAPI.ClosedRanges.uInt8Range, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "uIntRange": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "uIntRange", expectedArgumentCount: 0) { env in
                                try ClosedRangeConverter<Swift.UInt>.toNode(TestAPI.ClosedRanges.uIntRange, env: env.env)
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
                    name: "ClosedRanges_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "ClosedRanges",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

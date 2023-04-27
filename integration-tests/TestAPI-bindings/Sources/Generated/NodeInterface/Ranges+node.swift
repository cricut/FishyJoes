// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Ranges: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for Ranges")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Ranges",
            properties: [
                "echoInt8Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt8Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try RangeConverter<Int8>.toNode(
                                Ranges.echoInt8Range(
                                    try env.argument(at: 0, converter: RangeConverter<Int8>.self)
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
                            let result = try RangeConverter<Int16>.toNode(
                                Ranges.echoInt16Range(
                                    try env.argument(at: 0, converter: RangeConverter<Int16>.self)
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
                            let result = try RangeConverter<Int32>.toNode(
                                Ranges.echoInt32Range(
                                    try env.argument(at: 0, converter: RangeConverter<Int32>.self)
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
                            let result = try RangeConverter<Int64>.toNode(
                                Ranges.echoInt64Range(
                                    try env.argument(at: 0, converter: RangeConverter<Int64>.self)
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
                            let result = try RangeConverter<Int>.toNode(
                                Ranges.echoIntRange(
                                    try env.argument(at: 0, converter: RangeConverter<Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt8Range": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt8Range", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try RangeConverter<UInt8>.toNode(
                                Ranges.echoUInt8Range(
                                    try env.argument(at: 0, converter: RangeConverter<UInt8>.self)
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
                            let result = try RangeConverter<UInt16>.toNode(
                                Ranges.echoUInt16Range(
                                    try env.argument(at: 0, converter: RangeConverter<UInt16>.self)
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
                            let result = try RangeConverter<UInt32>.toNode(
                                Ranges.echoUInt32Range(
                                    try env.argument(at: 0, converter: RangeConverter<UInt32>.self)
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
                            let result = try RangeConverter<UInt64>.toNode(
                                Ranges.echoUInt64Range(
                                    try env.argument(at: 0, converter: RangeConverter<UInt64>.self)
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
                            let result = try RangeConverter<UInt>.toNode(
                                Ranges.echoUIntRange(
                                    try env.argument(at: 0, converter: RangeConverter<UInt>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "int8Range": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "int8Range", expectedArgumentCount: 0) { env in
                                try RangeConverter<Int8>.toNode(Ranges.int8Range, env: env.env)
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
                                try RangeConverter<Int16>.toNode(Ranges.int16Range, env: env.env)
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
                                try RangeConverter<Int32>.toNode(Ranges.int32Range, env: env.env)
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
                                try RangeConverter<Int64>.toNode(Ranges.int64Range, env: env.env)
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
                                try RangeConverter<Int>.toNode(Ranges.intRange, env: env.env)
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
                                try RangeConverter<UInt8>.toNode(Ranges.uInt8Range, env: env.env)
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
                                try RangeConverter<UInt16>.toNode(Ranges.uInt16Range, env: env.env)
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
                                try RangeConverter<UInt32>.toNode(Ranges.uInt32Range, env: env.env)
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
                                try RangeConverter<UInt64>.toNode(Ranges.uInt64Range, env: env.env)
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
                                try RangeConverter<UInt>.toNode(Ranges.uIntRange, env: env.env)
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
                    name: "Ranges_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Ranges",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

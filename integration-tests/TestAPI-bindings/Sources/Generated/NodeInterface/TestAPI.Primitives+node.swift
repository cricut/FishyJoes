// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.Primitives: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Primitives")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Primitives",
            properties: [
                "echoBool": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoBool", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Bool.toNode(
                                TestAPI.Primitives.echoBool(
                                    value: try env.argument(at: 0, converter: Swift.Bool.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoDouble": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoDouble", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Double.toNode(
                                TestAPI.Primitives.echoDouble(
                                    value: try env.argument(at: 0, converter: Swift.Double.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoFloat": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoFloat", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Float.toNode(
                                TestAPI.Primitives.echoFloat(
                                    value: try env.argument(at: 0, converter: Swift.Float.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Int.toNode(
                                TestAPI.Primitives.echoInt(
                                    value: try env.argument(at: 0, converter: Swift.Int.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt16": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt16", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Int16.toNode(
                                TestAPI.Primitives.echoInt16(
                                    value: try env.argument(at: 0, converter: Swift.Int16.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt32": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt32", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Int32.toNode(
                                TestAPI.Primitives.echoInt32(
                                    value: try env.argument(at: 0, converter: Swift.Int32.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt64": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt64", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Int64.toNode(
                                TestAPI.Primitives.echoInt64(
                                    value: try env.argument(at: 0, converter: Swift.Int64.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoInt8": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoInt8", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Int8.toNode(
                                TestAPI.Primitives.echoInt8(
                                    value: try env.argument(at: 0, converter: Swift.Int8.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.UInt.toNode(
                                TestAPI.Primitives.echoUInt(
                                    value: try env.argument(at: 0, converter: Swift.UInt.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt16": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt16", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.UInt16.toNode(
                                TestAPI.Primitives.echoUInt16(
                                    value: try env.argument(at: 0, converter: Swift.UInt16.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt32": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt32", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.UInt32.toNode(
                                TestAPI.Primitives.echoUInt32(
                                    value: try env.argument(at: 0, converter: Swift.UInt32.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt64": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt64", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.UInt64.toNode(
                                TestAPI.Primitives.echoUInt64(
                                    value: try env.argument(at: 0, converter: Swift.UInt64.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoUInt8": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoUInt8", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.UInt8.toNode(
                                TestAPI.Primitives.echoUInt8(
                                    value: try env.argument(at: 0, converter: Swift.UInt8.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoBool": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoBool", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Bool>.toNode(
                                TestAPI.Primitives.maybeEchoBool(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Bool>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoDouble": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoDouble", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Double>.toNode(
                                TestAPI.Primitives.maybeEchoDouble(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Double>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoFloat": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoFloat", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Float>.toNode(
                                TestAPI.Primitives.maybeEchoFloat(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Float>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Int>.toNode(
                                TestAPI.Primitives.maybeEchoInt(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoInt16": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoInt16", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Int16>.toNode(
                                TestAPI.Primitives.maybeEchoInt16(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Int16>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoInt32": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoInt32", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Int32>.toNode(
                                TestAPI.Primitives.maybeEchoInt32(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Int32>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoInt64": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoInt64", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Int64>.toNode(
                                TestAPI.Primitives.maybeEchoInt64(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Int64>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoInt8": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoInt8", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Int8>.toNode(
                                TestAPI.Primitives.maybeEchoInt8(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.Int8>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoUInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoUInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.UInt>.toNode(
                                TestAPI.Primitives.maybeEchoUInt(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.UInt>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoUInt16": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoUInt16", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.UInt16>.toNode(
                                TestAPI.Primitives.maybeEchoUInt16(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.UInt16>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoUInt32": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoUInt32", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.UInt32>.toNode(
                                TestAPI.Primitives.maybeEchoUInt32(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.UInt32>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoUInt64": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoUInt64", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.UInt64>.toNode(
                                TestAPI.Primitives.maybeEchoUInt64(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.UInt64>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "maybeEchoUInt8": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeEchoUInt8", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.UInt8>.toNode(
                                TestAPI.Primitives.maybeEchoUInt8(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.UInt8>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "valueMapper": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "valueMapper", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.UInt8>.toNode(
                                TestAPI.Primitives.valueMapper(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Swift.UInt8>.self),
                                    try env.argument(at: 1, converter: Function1Converter<OptionalConverter<Swift.UInt8>, OptionalConverter<Swift.UInt8>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "bitCountInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "bitCountInt", expectedArgumentCount: 0) { env in
                                try Swift.Int.toNode(TestAPI.Primitives.bitCountInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "bitCountUInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "bitCountUInt", expectedArgumentCount: 0) { env in
                                try Swift.Int.toNode(TestAPI.Primitives.bitCountUInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "defaultPrimitiveHolder": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "defaultPrimitiveHolder", expectedArgumentCount: 0) { env in
                                try TestAPI.Primitives.PrimitiveHolder.toNode(TestAPI.Primitives.defaultPrimitiveHolder, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "falseBool": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "falseBool", expectedArgumentCount: 0) { env in
                                try Swift.Bool.toNode(TestAPI.Primitives.falseBool, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyBool": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyBool", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.Bool>.toNode(TestAPI.Primitives.manyBool, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyDouble": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyDouble", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.Double>.toNode(TestAPI.Primitives.manyDouble, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyFloat": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyFloat", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.Float>.toNode(TestAPI.Primitives.manyFloat, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyInt", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.Int>.toNode(TestAPI.Primitives.manyInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyInt16", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.Int16>.toNode(TestAPI.Primitives.manyInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyInt32", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.Int32>.toNode(TestAPI.Primitives.manyInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyInt64", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.Int64>.toNode(TestAPI.Primitives.manyInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyInt8", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.Int8>.toNode(TestAPI.Primitives.manyInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeBool": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeBool", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Swift.Bool>>.toNode(TestAPI.Primitives.manyMaybeBool, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeDouble": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeDouble", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Swift.Double>>.toNode(TestAPI.Primitives.manyMaybeDouble, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeFloat": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeFloat", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Swift.Float>>.toNode(TestAPI.Primitives.manyMaybeFloat, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeInt", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Swift.Int>>.toNode(TestAPI.Primitives.manyMaybeInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeInt16", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Swift.Int16>>.toNode(TestAPI.Primitives.manyMaybeInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeInt32", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Swift.Int32>>.toNode(TestAPI.Primitives.manyMaybeInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeInt64", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Swift.Int64>>.toNode(TestAPI.Primitives.manyMaybeInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeInt8", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Swift.Int8>>.toNode(TestAPI.Primitives.manyMaybeInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeUInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeUInt", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Swift.UInt>>.toNode(TestAPI.Primitives.manyMaybeUInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeUInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeUInt16", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Swift.UInt16>>.toNode(TestAPI.Primitives.manyMaybeUInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeUInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeUInt32", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Swift.UInt32>>.toNode(TestAPI.Primitives.manyMaybeUInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeUInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeUInt64", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Swift.UInt64>>.toNode(TestAPI.Primitives.manyMaybeUInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyMaybeUInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyMaybeUInt8", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Swift.UInt8>>.toNode(TestAPI.Primitives.manyMaybeUInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyUInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyUInt", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.UInt>.toNode(TestAPI.Primitives.manyUInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyUInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyUInt16", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.UInt16>.toNode(TestAPI.Primitives.manyUInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyUInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyUInt32", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.UInt32>.toNode(TestAPI.Primitives.manyUInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyUInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyUInt64", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.UInt64>.toNode(TestAPI.Primitives.manyUInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "manyUInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "manyUInt8", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.UInt8>.toNode(TestAPI.Primitives.manyUInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxDouble": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxDouble", expectedArgumentCount: 0) { env in
                                try Swift.Double.toNode(TestAPI.Primitives.maxDouble, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxFloat": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxFloat", expectedArgumentCount: 0) { env in
                                try Swift.Float.toNode(TestAPI.Primitives.maxFloat, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxInt", expectedArgumentCount: 0) { env in
                                try Swift.Int.toNode(TestAPI.Primitives.maxInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxInt16", expectedArgumentCount: 0) { env in
                                try Swift.Int16.toNode(TestAPI.Primitives.maxInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxInt32", expectedArgumentCount: 0) { env in
                                try Swift.Int32.toNode(TestAPI.Primitives.maxInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxInt64", expectedArgumentCount: 0) { env in
                                try Swift.Int64.toNode(TestAPI.Primitives.maxInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxInt8", expectedArgumentCount: 0) { env in
                                try Swift.Int8.toNode(TestAPI.Primitives.maxInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxUInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxUInt", expectedArgumentCount: 0) { env in
                                try Swift.UInt.toNode(TestAPI.Primitives.maxUInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxUInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxUInt16", expectedArgumentCount: 0) { env in
                                try Swift.UInt16.toNode(TestAPI.Primitives.maxUInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxUInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxUInt32", expectedArgumentCount: 0) { env in
                                try Swift.UInt32.toNode(TestAPI.Primitives.maxUInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxUInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxUInt64", expectedArgumentCount: 0) { env in
                                try Swift.UInt64.toNode(TestAPI.Primitives.maxUInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maxUInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maxUInt8", expectedArgumentCount: 0) { env in
                                try Swift.UInt8.toNode(TestAPI.Primitives.maxUInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minDouble": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minDouble", expectedArgumentCount: 0) { env in
                                try Swift.Double.toNode(TestAPI.Primitives.minDouble, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minFloat": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minFloat", expectedArgumentCount: 0) { env in
                                try Swift.Float.toNode(TestAPI.Primitives.minFloat, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minInt", expectedArgumentCount: 0) { env in
                                try Swift.Int.toNode(TestAPI.Primitives.minInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minInt16", expectedArgumentCount: 0) { env in
                                try Swift.Int16.toNode(TestAPI.Primitives.minInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minInt32", expectedArgumentCount: 0) { env in
                                try Swift.Int32.toNode(TestAPI.Primitives.minInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minInt64", expectedArgumentCount: 0) { env in
                                try Swift.Int64.toNode(TestAPI.Primitives.minInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minInt8", expectedArgumentCount: 0) { env in
                                try Swift.Int8.toNode(TestAPI.Primitives.minInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minUInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minUInt", expectedArgumentCount: 0) { env in
                                try Swift.UInt.toNode(TestAPI.Primitives.minUInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minUInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minUInt16", expectedArgumentCount: 0) { env in
                                try Swift.UInt16.toNode(TestAPI.Primitives.minUInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minUInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minUInt32", expectedArgumentCount: 0) { env in
                                try Swift.UInt32.toNode(TestAPI.Primitives.minUInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minUInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minUInt64", expectedArgumentCount: 0) { env in
                                try Swift.UInt64.toNode(TestAPI.Primitives.minUInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "minUInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "minUInt8", expectedArgumentCount: 0) { env in
                                try Swift.UInt8.toNode(TestAPI.Primitives.minUInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "trueBool": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "trueBool", expectedArgumentCount: 0) { env in
                                try Swift.Bool.toNode(TestAPI.Primitives.trueBool, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroDouble": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroDouble", expectedArgumentCount: 0) { env in
                                try Swift.Double.toNode(TestAPI.Primitives.zeroDouble, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroFloat": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroFloat", expectedArgumentCount: 0) { env in
                                try Swift.Float.toNode(TestAPI.Primitives.zeroFloat, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroInt", expectedArgumentCount: 0) { env in
                                try Swift.Int.toNode(TestAPI.Primitives.zeroInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroInt16", expectedArgumentCount: 0) { env in
                                try Swift.Int16.toNode(TestAPI.Primitives.zeroInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroInt32", expectedArgumentCount: 0) { env in
                                try Swift.Int32.toNode(TestAPI.Primitives.zeroInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroInt64", expectedArgumentCount: 0) { env in
                                try Swift.Int64.toNode(TestAPI.Primitives.zeroInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroInt8", expectedArgumentCount: 0) { env in
                                try Swift.Int8.toNode(TestAPI.Primitives.zeroInt8, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroUInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroUInt", expectedArgumentCount: 0) { env in
                                try Swift.UInt.toNode(TestAPI.Primitives.zeroUInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroUInt16": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroUInt16", expectedArgumentCount: 0) { env in
                                try Swift.UInt16.toNode(TestAPI.Primitives.zeroUInt16, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroUInt32": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroUInt32", expectedArgumentCount: 0) { env in
                                try Swift.UInt32.toNode(TestAPI.Primitives.zeroUInt32, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroUInt64": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroUInt64", expectedArgumentCount: 0) { env in
                                try Swift.UInt64.toNode(TestAPI.Primitives.zeroUInt64, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "zeroUInt8": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "zeroUInt8", expectedArgumentCount: 0) { env in
                                try Swift.UInt8.toNode(TestAPI.Primitives.zeroUInt8, env: env.env)
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
                    name: "Primitives_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Primitives",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

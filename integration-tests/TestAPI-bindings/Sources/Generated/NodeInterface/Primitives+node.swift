// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Primitives: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for Primitives")
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
                            let result = try Bool.toNode(
                                Primitives.echoBool(
                                    value: try env.argument(at: 0, converter: Bool.self)
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
                            let result = try UInt8.toNode(
                                Primitives.echoUInt8(
                                    value: try env.argument(at: 0, converter: UInt8.self)
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
                            let result = try UInt16.toNode(
                                Primitives.echoUInt16(
                                    value: try env.argument(at: 0, converter: UInt16.self)
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
                            let result = try UInt32.toNode(
                                Primitives.echoUInt32(
                                    value: try env.argument(at: 0, converter: UInt32.self)
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
                            let result = try UInt64.toNode(
                                Primitives.echoUInt64(
                                    value: try env.argument(at: 0, converter: UInt64.self)
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
                            let result = try Int8.toNode(
                                Primitives.echoInt8(
                                    value: try env.argument(at: 0, converter: Int8.self)
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
                            let result = try Int16.toNode(
                                Primitives.echoInt16(
                                    value: try env.argument(at: 0, converter: Int16.self)
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
                            let result = try Int32.toNode(
                                Primitives.echoInt32(
                                    value: try env.argument(at: 0, converter: Int32.self)
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
                            let result = try Int64.toNode(
                                Primitives.echoInt64(
                                    value: try env.argument(at: 0, converter: Int64.self)
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
                            let result = try Float.toNode(
                                Primitives.echoFloat(
                                    value: try env.argument(at: 0, converter: Float.self)
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
                            let result = try Double.toNode(
                                Primitives.echoDouble(
                                    value: try env.argument(at: 0, converter: Double.self)
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
                            let result = try OptionalConverter<Bool>.toNode(
                                Primitives.maybeEchoBool(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Bool>.self)
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
                            let result = try OptionalConverter<UInt8>.toNode(
                                Primitives.maybeEchoUInt8(
                                    value: try env.argument(at: 0, converter: OptionalConverter<UInt8>.self)
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
                            let result = try OptionalConverter<UInt16>.toNode(
                                Primitives.maybeEchoUInt16(
                                    value: try env.argument(at: 0, converter: OptionalConverter<UInt16>.self)
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
                            let result = try OptionalConverter<UInt32>.toNode(
                                Primitives.maybeEchoUInt32(
                                    value: try env.argument(at: 0, converter: OptionalConverter<UInt32>.self)
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
                            let result = try OptionalConverter<UInt64>.toNode(
                                Primitives.maybeEchoUInt64(
                                    value: try env.argument(at: 0, converter: OptionalConverter<UInt64>.self)
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
                            let result = try OptionalConverter<Int8>.toNode(
                                Primitives.maybeEchoInt8(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Int8>.self)
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
                            let result = try OptionalConverter<Int16>.toNode(
                                Primitives.maybeEchoInt16(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Int16>.self)
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
                            let result = try OptionalConverter<Int32>.toNode(
                                Primitives.maybeEchoInt32(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Int32>.self)
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
                            let result = try OptionalConverter<Int64>.toNode(
                                Primitives.maybeEchoInt64(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Int64>.self)
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
                            let result = try OptionalConverter<Float>.toNode(
                                Primitives.maybeEchoFloat(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Float>.self)
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
                            let result = try OptionalConverter<Double>.toNode(
                                Primitives.maybeEchoDouble(
                                    value: try env.argument(at: 0, converter: OptionalConverter<Double>.self)
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
                            let result = try OptionalConverter<UInt8>.toNode(
                                Primitives.valueMapper(
                                    value: try env.argument(at: 0, converter: OptionalConverter<UInt8>.self),
                                    try env.argument(at: 1, converter: Function1Converter<OptionalConverter<UInt8>, OptionalConverter<UInt8>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "falseBool": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "falseBool", expectedArgumentCount: 0) { env in
                                try Bool.toNode(Primitives.falseBool, env: env.env)
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
                                try Bool.toNode(Primitives.trueBool, env: env.env)
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
                                try UInt8.toNode(Primitives.zeroUInt8, env: env.env)
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
                                try UInt8.toNode(Primitives.minUInt8, env: env.env)
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
                                try UInt8.toNode(Primitives.maxUInt8, env: env.env)
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
                                try UInt16.toNode(Primitives.zeroUInt16, env: env.env)
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
                                try UInt16.toNode(Primitives.minUInt16, env: env.env)
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
                                try UInt16.toNode(Primitives.maxUInt16, env: env.env)
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
                                try UInt32.toNode(Primitives.zeroUInt32, env: env.env)
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
                                try UInt32.toNode(Primitives.minUInt32, env: env.env)
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
                                try UInt32.toNode(Primitives.maxUInt32, env: env.env)
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
                                try UInt64.toNode(Primitives.zeroUInt64, env: env.env)
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
                                try UInt64.toNode(Primitives.minUInt64, env: env.env)
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
                                try UInt64.toNode(Primitives.maxUInt64, env: env.env)
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
                                try Int8.toNode(Primitives.zeroInt8, env: env.env)
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
                                try Int8.toNode(Primitives.minInt8, env: env.env)
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
                                try Int8.toNode(Primitives.maxInt8, env: env.env)
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
                                try Int16.toNode(Primitives.zeroInt16, env: env.env)
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
                                try Int16.toNode(Primitives.minInt16, env: env.env)
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
                                try Int16.toNode(Primitives.maxInt16, env: env.env)
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
                                try Int32.toNode(Primitives.zeroInt32, env: env.env)
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
                                try Int32.toNode(Primitives.minInt32, env: env.env)
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
                                try Int32.toNode(Primitives.maxInt32, env: env.env)
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
                                try Int64.toNode(Primitives.zeroInt64, env: env.env)
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
                                try Int64.toNode(Primitives.minInt64, env: env.env)
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
                                try Int64.toNode(Primitives.maxInt64, env: env.env)
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
                                try Int.toNode(Primitives.zeroInt, env: env.env)
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
                                try Int.toNode(Primitives.minInt, env: env.env)
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
                                try Int.toNode(Primitives.maxInt, env: env.env)
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
                                try Float.toNode(Primitives.zeroFloat, env: env.env)
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
                                try Float.toNode(Primitives.minFloat, env: env.env)
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
                                try Float.toNode(Primitives.maxFloat, env: env.env)
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
                                try Double.toNode(Primitives.zeroDouble, env: env.env)
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
                                try Double.toNode(Primitives.minDouble, env: env.env)
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
                                try Double.toNode(Primitives.maxDouble, env: env.env)
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
                                try ArrayConverter<Bool>.toNode(Primitives.manyBool, env: env.env)
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
                                try ArrayConverter<UInt8>.toNode(Primitives.manyUInt8, env: env.env)
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
                                try ArrayConverter<UInt16>.toNode(Primitives.manyUInt16, env: env.env)
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
                                try ArrayConverter<UInt32>.toNode(Primitives.manyUInt32, env: env.env)
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
                                try ArrayConverter<UInt64>.toNode(Primitives.manyUInt64, env: env.env)
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
                                try ArrayConverter<Int8>.toNode(Primitives.manyInt8, env: env.env)
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
                                try ArrayConverter<Int16>.toNode(Primitives.manyInt16, env: env.env)
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
                                try ArrayConverter<Int32>.toNode(Primitives.manyInt32, env: env.env)
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
                                try ArrayConverter<Int64>.toNode(Primitives.manyInt64, env: env.env)
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
                                try ArrayConverter<Float>.toNode(Primitives.manyFloat, env: env.env)
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
                                try ArrayConverter<Double>.toNode(Primitives.manyDouble, env: env.env)
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
                                try ArrayConverter<OptionalConverter<Bool>>.toNode(Primitives.manyMaybeBool, env: env.env)
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
                                try ArrayConverter<OptionalConverter<UInt8>>.toNode(Primitives.manyMaybeUInt8, env: env.env)
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
                                try ArrayConverter<OptionalConverter<UInt16>>.toNode(Primitives.manyMaybeUInt16, env: env.env)
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
                                try ArrayConverter<OptionalConverter<UInt32>>.toNode(Primitives.manyMaybeUInt32, env: env.env)
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
                                try ArrayConverter<OptionalConverter<UInt64>>.toNode(Primitives.manyMaybeUInt64, env: env.env)
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
                                try ArrayConverter<OptionalConverter<Int8>>.toNode(Primitives.manyMaybeInt8, env: env.env)
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
                                try ArrayConverter<OptionalConverter<Int16>>.toNode(Primitives.manyMaybeInt16, env: env.env)
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
                                try ArrayConverter<OptionalConverter<Int32>>.toNode(Primitives.manyMaybeInt32, env: env.env)
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
                                try ArrayConverter<OptionalConverter<Int64>>.toNode(Primitives.manyMaybeInt64, env: env.env)
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
                                try ArrayConverter<OptionalConverter<Float>>.toNode(Primitives.manyMaybeFloat, env: env.env)
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
                                try ArrayConverter<OptionalConverter<Double>>.toNode(Primitives.manyMaybeDouble, env: env.env)
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
                                try Primitives.PrimitiveHolder.toNode(Primitives.defaultPrimitiveHolder, env: env.env)
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

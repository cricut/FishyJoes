// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Collections: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for Collections")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Collections",
            properties: [
                "echoArrayOfInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoArrayOfInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ArrayConverter<Int>.toNode(
                                Collections.echo(
                                    arrayOfInt: try env.argument(at: 0, converter: ArrayConverter<Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoSetOfInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoSetOfInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try SetConverter<Int>.toNode(
                                Collections.echo(
                                    setOfInt: try env.argument(at: 0, converter: SetConverter<Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoDictionaryOfIntToInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoDictionaryOfIntToInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try DictionaryConverter<Int, Int>.toNode(
                                Collections.echo(
                                    dictionaryOfIntToInt: try env.argument(at: 0, converter: DictionaryConverter<Int, Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoMaybeArrayOfMaybeInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoMaybeArrayOfMaybeInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<ArrayConverter<OptionalConverter<Int>>>.toNode(
                                Collections.echo(
                                    maybeArrayOfMaybeInt: try env.argument(at: 0, converter: OptionalConverter<ArrayConverter<OptionalConverter<Int>>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoMaybeSetOfMaybeInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoMaybeSetOfMaybeInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<SetConverter<OptionalConverter<Int>>>.toNode(
                                Collections.echo(
                                    maybeSetOfMaybeInt: try env.argument(at: 0, converter: OptionalConverter<SetConverter<OptionalConverter<Int>>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoMaybeDictionaryOfIntToMaybeInt": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoMaybeDictionaryOfIntToMaybeInt", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<DictionaryConverter<Int, OptionalConverter<Int>>>.toNode(
                                Collections.echo(
                                    maybeDictionaryOfIntToMaybeInt: try env.argument(at: 0, converter: OptionalConverter<DictionaryConverter<Int, OptionalConverter<Int>>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "collectionMapper": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "collectionMapper", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<ArrayConverter<OptionalConverter<Int>>>.toNode(
                                Collections.collectionMapper(
                                    collection: try env.argument(at: 0, converter: OptionalConverter<ArrayConverter<OptionalConverter<Int>>>.self),
                                    try env.argument(at: 1, converter: Function1Converter<OptionalConverter<ArrayConverter<OptionalConverter<Int>>>, OptionalConverter<ArrayConverter<OptionalConverter<Int>>>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "arrayOfInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "arrayOfInt", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Int>.toNode(Collections.arrayOfInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "setOfInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "setOfInt", expectedArgumentCount: 0) { env in
                                try SetConverter<Int>.toNode(Collections.setOfInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "dictionaryOfIntToInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "dictionaryOfIntToInt", expectedArgumentCount: 0) { env in
                                try DictionaryConverter<Int, Int>.toNode(Collections.dictionaryOfIntToInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maybeArrayOfInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeArrayOfInt", expectedArgumentCount: 0) { env in
                                try OptionalConverter<ArrayConverter<Int>>.toNode(Collections.maybeArrayOfInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maybeSetOfInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeSetOfInt", expectedArgumentCount: 0) { env in
                                try OptionalConverter<SetConverter<Int>>.toNode(Collections.maybeSetOfInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maybeDictionaryOfIntToInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeDictionaryOfIntToInt", expectedArgumentCount: 0) { env in
                                try OptionalConverter<DictionaryConverter<Int, Int>>.toNode(Collections.maybeDictionaryOfIntToInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maybeArrayOfMaybeInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeArrayOfMaybeInt", expectedArgumentCount: 0) { env in
                                try OptionalConverter<ArrayConverter<OptionalConverter<Int>>>.toNode(Collections.maybeArrayOfMaybeInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maybeSetOfMaybeInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeSetOfMaybeInt", expectedArgumentCount: 0) { env in
                                try OptionalConverter<SetConverter<OptionalConverter<Int>>>.toNode(Collections.maybeSetOfMaybeInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "maybeDictionaryOfIntToMaybeInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeDictionaryOfIntToMaybeInt", expectedArgumentCount: 0) { env in
                                try OptionalConverter<DictionaryConverter<Int, OptionalConverter<Int>>>.toNode(Collections.maybeDictionaryOfIntToMaybeInt, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "defaultCollectionHolder": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "defaultCollectionHolder", expectedArgumentCount: 0) { env in
                                try Collections.CollectionHolder.toNode(Collections.defaultCollectionHolder, env: env.env)
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
                    name: "Collections_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Collections",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

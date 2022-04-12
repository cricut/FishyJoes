// Generated using Sourcery 1.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Collections: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        var pointer: UnsafeMutableRawPointer?
        try check(napi_unwrap(env, value, &pointer))
        guard let nonNilPointer = pointer else {
            throw JSException(message: "expected Collections, got nil")
        }
        return try Box<Collections>.takeUnretainedOpaque(nonNilPointer).value
    }
    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        let constructor = try FishyJoesNodeRuntime.InstanceData.data(for: env).constructor(for: "Collections", env: env)
        var args: napi_value? = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        var result: napi_value?
        try check(napi_new_instance(env, constructor, 1, &args, &result))
        return result
    }
    public static func mutateNode(_ value: Self, this: napi_value?, env: napi_env) throws {
        var pointer: UnsafeMutableRawPointer?
        try check(napi_unwrap(env, this, &pointer))
        guard let nonNilPointer = pointer else {
            throw JSException(message: "expected Collections, got nil")
        }
        try Box<Collections>.takeUnretainedOpaque(nonNilPointer).value = value
    }
    public static func nodeSetup(env: napi_env, module: napi_value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Collections",
            properties: [
                "echoArrayOfInt": (
                    .method(
                        { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "echoArrayOfInt", expectedArgumentCount: 1) { env in
                                let result = try ArrayConverter<Int>.toNode(
                                    Collections.echo(
                                        arrayOfInt: try env.argument(at: 0, converter: ArrayConverter<Int>.self)
                                    ),
                                    env: env.env
                                )
                                return result
                            }
                        }
                    ),
                    isStatic: true
                ),
                "echoSetOfInt": (
                    .method(
                        { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "echoSetOfInt", expectedArgumentCount: 1) { env in
                                let result = try SetConverter<Int>.toNode(
                                    Collections.echo(
                                        setOfInt: try env.argument(at: 0, converter: SetConverter<Int>.self)
                                    ),
                                    env: env.env
                                )
                                return result
                            }
                        }
                    ),
                    isStatic: true
                ),
                "echoDictionaryOfIntToInt": (
                    .method(
                        { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "echoDictionaryOfIntToInt", expectedArgumentCount: 1) { env in
                                let result = try DictionaryConverter<Int, Int>.toNode(
                                    Collections.echo(
                                        dictionaryOfIntToInt: try env.argument(at: 0, converter: DictionaryConverter<Int, Int>.self)
                                    ),
                                    env: env.env
                                )
                                return result
                            }
                        }
                    ),
                    isStatic: true
                ),
                "echoMaybeArrayOfMaybeInt": (
                    .method(
                        { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "echoMaybeArrayOfMaybeInt", expectedArgumentCount: 1) { env in
                                let result = try OptionalConverter<ArrayConverter<OptionalConverter<Int>>>.toNode(
                                    Collections.echo(
                                        maybeArrayOfMaybeInt: try env.argument(at: 0, converter: OptionalConverter<ArrayConverter<OptionalConverter<Int>>>.self)
                                    ),
                                    env: env.env
                                )
                                return result
                            }
                        }
                    ),
                    isStatic: true
                ),
                "echoMaybeSetOfMaybeInt": (
                    .method(
                        { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "echoMaybeSetOfMaybeInt", expectedArgumentCount: 1) { env in
                                let result = try OptionalConverter<SetConverter<OptionalConverter<Int>>>.toNode(
                                    Collections.echo(
                                        maybeSetOfMaybeInt: try env.argument(at: 0, converter: OptionalConverter<SetConverter<OptionalConverter<Int>>>.self)
                                    ),
                                    env: env.env
                                )
                                return result
                            }
                        }
                    ),
                    isStatic: true
                ),
                "echoMaybeDictionaryOfMaybeIntToMaybeInt": (
                    .method(
                        { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "echoMaybeDictionaryOfMaybeIntToMaybeInt", expectedArgumentCount: 1) { env in
                                let result = try OptionalConverter<DictionaryConverter<OptionalConverter<Int>, OptionalConverter<Int>>>.toNode(
                                    Collections.echo(
                                        maybeDictionaryOfMaybeIntToMaybeInt: try env.argument(at: 0, converter: OptionalConverter<DictionaryConverter<OptionalConverter<Int>, OptionalConverter<Int>>>.self)
                                    ),
                                    env: env.env
                                )
                                return result
                            }
                        }
                    ),
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
                "maybeDictionaryOfMaybeIntToMaybeInt": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "maybeDictionaryOfMaybeIntToMaybeInt", expectedArgumentCount: 0) { env in
                                try OptionalConverter<DictionaryConverter<OptionalConverter<Int>, OptionalConverter<Int>>>.toNode(Collections.maybeDictionaryOfMaybeIntToMaybeInt, env: env.env)
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
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Collections_constructor", expectedArgumentCount: 1) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    let selfValue = try env.argument(at: 0)
                    let boxed = try FishyJoesNodeRuntime.Box<Collections>.takeUnretained(selfValue, env: env.env)
                    let finalizer: napi_finalize = { env, data, _ in
                        FishyJoesNodeRuntime.Box<Collections>.releaseOpaque(data)
                    }
                    try check(env: env.env, napi_wrap(env.env, this, boxed.retainedOpaque(), finalizer, nil, nil))
                    return this
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Collections",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

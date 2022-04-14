// Generated using Sourcery 1.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.Collections.CollectionHolder: NodeMutator {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        Self(
            boolArray: try { () -> Array<Bool> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "boolArray", &fieldValue))
                return try ArrayConverter<Bool>.fromNode(fieldValue, env: env)
            }(),
            boolSet: try { () -> Set<Bool> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "boolSet", &fieldValue))
                return try SetConverter<Bool>.fromNode(fieldValue, env: env)
            }(),
            boolDictionary: try { () -> Dictionary<Bool, Bool> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "boolDictionary", &fieldValue))
                return try DictionaryConverter<Bool, Bool>.fromNode(fieldValue, env: env)
            }(),
            integerArray: try { () -> Array<Int> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "integerArray", &fieldValue))
                return try ArrayConverter<Int>.fromNode(fieldValue, env: env)
            }(),
            integerSet: try { () -> Set<Int> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "integerSet", &fieldValue))
                return try SetConverter<Int>.fromNode(fieldValue, env: env)
            }(),
            integerDictionary: try { () -> Dictionary<Int, Int> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "integerDictionary", &fieldValue))
                return try DictionaryConverter<Int, Int>.fromNode(fieldValue, env: env)
            }(),
            stringArray: try { () -> Array<Swift.String> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "stringArray", &fieldValue))
                return try ArrayConverter<Swift.String>.fromNode(fieldValue, env: env)
            }(),
            stringSet: try { () -> Set<Swift.String> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "stringSet", &fieldValue))
                return try SetConverter<Swift.String>.fromNode(fieldValue, env: env)
            }(),
            stringDictionary: try { () -> Dictionary<Swift.String, Swift.String> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "stringDictionary", &fieldValue))
                return try DictionaryConverter<Swift.String, Swift.String>.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        let constructor = try InstanceData.data(for: env).constructor(for: "Collections.CollectionHolder", env: env)
        let args: [napi_value?] = [
            try ArrayConverter<Bool>.toNode(value.boolArray, env: env),
            try SetConverter<Bool>.toNode(value.boolSet, env: env),
            try DictionaryConverter<Bool, Bool>.toNode(value.boolDictionary, env: env),
            try ArrayConverter<Int>.toNode(value.integerArray, env: env),
            try SetConverter<Int>.toNode(value.integerSet, env: env),
            try DictionaryConverter<Int, Int>.toNode(value.integerDictionary, env: env),
            try ArrayConverter<Swift.String>.toNode(value.stringArray, env: env),
            try SetConverter<Swift.String>.toNode(value.stringSet, env: env),
            try DictionaryConverter<Swift.String, Swift.String>.toNode(value.stringDictionary, env: env),
        ]
        var result: napi_value?
        try check(napi_new_instance(env, constructor, args.count, args, &result))
        return result
    }
    public static func mutateNode(_ value: Self, this: napi_value?, env: napi_env) throws {
        try check(napi_set_named_property(env, this, "boolArray", ArrayConverter<Bool>.toNode(value.boolArray, env: env)))
        try check(napi_set_named_property(env, this, "boolSet", SetConverter<Bool>.toNode(value.boolSet, env: env)))
        try check(napi_set_named_property(env, this, "boolDictionary", DictionaryConverter<Bool, Bool>.toNode(value.boolDictionary, env: env)))
        try check(napi_set_named_property(env, this, "integerArray", ArrayConverter<Int>.toNode(value.integerArray, env: env)))
        try check(napi_set_named_property(env, this, "integerSet", SetConverter<Int>.toNode(value.integerSet, env: env)))
        try check(napi_set_named_property(env, this, "integerDictionary", DictionaryConverter<Int, Int>.toNode(value.integerDictionary, env: env)))
        try check(napi_set_named_property(env, this, "stringArray", ArrayConverter<Swift.String>.toNode(value.stringArray, env: env)))
        try check(napi_set_named_property(env, this, "stringSet", SetConverter<Swift.String>.toNode(value.stringSet, env: env)))
        try check(napi_set_named_property(env, this, "stringDictionary", DictionaryConverter<Swift.String, Swift.String>.toNode(value.stringDictionary, env: env)))
    }
    public static func nodeSetup(env: napi_env, module: napi_value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Collections.CollectionHolder",
            properties: [
                "staticPropery": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticPropery", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Int>>.toNode(Collections.CollectionHolder.staticPropery, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "staticMutablePropery": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticMutablePropery", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Int>>.toNode(Collections.CollectionHolder.staticMutablePropery, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticMutablePropery", expectedArgumentCount: 1) { env in
                                Collections.CollectionHolder.staticMutablePropery = try env.argument(at: 0, converter: ArrayConverter<OptionalConverter<Int>>.self)
                                return nil
                            }
                        }),
                    isStatic: true
                ),
                "boolArray": (.stored(mutable: true), isStatic: false),
                "boolSet": (.stored(mutable: true), isStatic: false),
                "boolDictionary": (.stored(mutable: true), isStatic: false),
                "integerArray": (.stored(mutable: true), isStatic: false),
                "integerSet": (.stored(mutable: true), isStatic: false),
                "integerDictionary": (.stored(mutable: true), isStatic: false),
                "stringArray": (.stored(mutable: true), isStatic: false),
                "stringSet": (.stored(mutable: true), isStatic: false),
                "stringDictionary": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "Collections.CollectionHolder_constructor", expectedArgumentCount: 9) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try check(napi_set_named_property(env.env, this, "boolArray", env.argument(at: 0)))
                    try check(napi_set_named_property(env.env, this, "boolSet", env.argument(at: 1)))
                    try check(napi_set_named_property(env.env, this, "boolDictionary", env.argument(at: 2)))
                    try check(napi_set_named_property(env.env, this, "integerArray", env.argument(at: 3)))
                    try check(napi_set_named_property(env.env, this, "integerSet", env.argument(at: 4)))
                    try check(napi_set_named_property(env.env, this, "integerDictionary", env.argument(at: 5)))
                    try check(napi_set_named_property(env.env, this, "stringArray", env.argument(at: 6)))
                    try check(napi_set_named_property(env.env, this, "stringSet", env.argument(at: 7)))
                    try check(napi_set_named_property(env.env, this, "stringDictionary", env.argument(at: 8)))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "Collections.CollectionHolder",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

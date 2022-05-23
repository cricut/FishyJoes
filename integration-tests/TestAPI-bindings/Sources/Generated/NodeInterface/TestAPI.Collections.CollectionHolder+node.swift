// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.Collections.CollectionHolder: NodeMutator {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            boolArray: try { () -> Array<Bool> in
                let fieldValue = try env.getNamedProperty(value, "boolArray")
                return try ArrayConverter<Bool>.fromNode(fieldValue, env: env)
            }(),
            boolSet: try { () -> Set<Bool> in
                let fieldValue = try env.getNamedProperty(value, "boolSet")
                return try SetConverter<Bool>.fromNode(fieldValue, env: env)
            }(),
            boolDictionary: try { () -> Dictionary<Bool, Bool> in
                let fieldValue = try env.getNamedProperty(value, "boolDictionary")
                return try DictionaryConverter<Bool, Bool>.fromNode(fieldValue, env: env)
            }(),
            integerArray: try { () -> Array<Int> in
                let fieldValue = try env.getNamedProperty(value, "integerArray")
                return try ArrayConverter<Int>.fromNode(fieldValue, env: env)
            }(),
            integerSet: try { () -> Set<Int> in
                let fieldValue = try env.getNamedProperty(value, "integerSet")
                return try SetConverter<Int>.fromNode(fieldValue, env: env)
            }(),
            integerDictionary: try { () -> Dictionary<Int, Int> in
                let fieldValue = try env.getNamedProperty(value, "integerDictionary")
                return try DictionaryConverter<Int, Int>.fromNode(fieldValue, env: env)
            }(),
            stringArray: try { () -> Array<Swift.String> in
                let fieldValue = try env.getNamedProperty(value, "stringArray")
                return try ArrayConverter<Swift.String>.fromNode(fieldValue, env: env)
            }(),
            stringSet: try { () -> Set<Swift.String> in
                let fieldValue = try env.getNamedProperty(value, "stringSet")
                return try SetConverter<Swift.String>.fromNode(fieldValue, env: env)
            }(),
            stringDictionary: try { () -> Dictionary<Swift.String, Swift.String> in
                let fieldValue = try env.getNamedProperty(value, "stringDictionary")
                return try DictionaryConverter<Swift.String, Swift.String>.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try InstanceData.data(for: env).constructor(for: "Collections.CollectionHolder", env: env)
        let args: [NAPI.Value] = [
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
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "boolArray", ArrayConverter<Bool>.toNode(value.boolArray, env: env))
        try env.setNamedProperty(this, "boolSet", SetConverter<Bool>.toNode(value.boolSet, env: env))
        try env.setNamedProperty(this, "boolDictionary", DictionaryConverter<Bool, Bool>.toNode(value.boolDictionary, env: env))
        try env.setNamedProperty(this, "integerArray", ArrayConverter<Int>.toNode(value.integerArray, env: env))
        try env.setNamedProperty(this, "integerSet", SetConverter<Int>.toNode(value.integerSet, env: env))
        try env.setNamedProperty(this, "integerDictionary", DictionaryConverter<Int, Int>.toNode(value.integerDictionary, env: env))
        try env.setNamedProperty(this, "stringArray", ArrayConverter<Swift.String>.toNode(value.stringArray, env: env))
        try env.setNamedProperty(this, "stringSet", SetConverter<Swift.String>.toNode(value.stringSet, env: env))
        try env.setNamedProperty(this, "stringDictionary", DictionaryConverter<Swift.String, Swift.String>.toNode(value.stringDictionary, env: env))
    }
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
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
                    try env.env.setNamedProperty(this, "boolArray", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "boolSet", env.argument(at: 1))
                    try env.env.setNamedProperty(this, "boolDictionary", env.argument(at: 2))
                    try env.env.setNamedProperty(this, "integerArray", env.argument(at: 3))
                    try env.env.setNamedProperty(this, "integerSet", env.argument(at: 4))
                    try env.env.setNamedProperty(this, "integerDictionary", env.argument(at: 5))
                    try env.env.setNamedProperty(this, "stringArray", env.argument(at: 6))
                    try env.env.setNamedProperty(this, "stringSet", env.argument(at: 7))
                    try env.env.setNamedProperty(this, "stringDictionary", env.argument(at: 8))
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

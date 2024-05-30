// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.Collections.CollectionHolder: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            boolArray: try { () -> Array<Swift.Bool> in
                let fieldValue = try env.getNamedProperty(value, "boolArray")
                return try ArrayConverter<Swift.Bool>.fromNode(fieldValue, env: env)
            }(),
            boolSet: try { () -> Set<Swift.Bool> in
                let fieldValue = try env.getNamedProperty(value, "boolSet")
                return try SetConverter<Swift.Bool>.fromNode(fieldValue, env: env)
            }(),
            boolDictionary: try { () -> Dictionary<Swift.Bool, Swift.Bool> in
                let fieldValue = try env.getNamedProperty(value, "boolDictionary")
                return try DictionaryConverter<Swift.Bool, Swift.Bool>.fromNode(fieldValue, env: env)
            }(),
            integerArray: try { () -> Array<Swift.Int> in
                let fieldValue = try env.getNamedProperty(value, "integerArray")
                return try ArrayConverter<Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            integerSet: try { () -> Set<Swift.Int> in
                let fieldValue = try env.getNamedProperty(value, "integerSet")
                return try SetConverter<Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            integerDictionary: try { () -> Dictionary<Swift.Int, Swift.Int> in
                let fieldValue = try env.getNamedProperty(value, "integerDictionary")
                return try DictionaryConverter<Swift.Int, Swift.Int>.fromNode(fieldValue, env: env)
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
        let constructor = try NodeClass.constructor(for: "Collections.CollectionHolder", env: env)
        let args: [NAPI.Value] = [
            try ArrayConverter<Swift.Bool>.toNode(value.boolArray, env: env),
            try SetConverter<Swift.Bool>.toNode(value.boolSet, env: env),
            try DictionaryConverter<Swift.Bool, Swift.Bool>.toNode(value.boolDictionary, env: env),
            try ArrayConverter<Swift.Int>.toNode(value.integerArray, env: env),
            try SetConverter<Swift.Int>.toNode(value.integerSet, env: env),
            try DictionaryConverter<Swift.Int, Swift.Int>.toNode(value.integerDictionary, env: env),
            try ArrayConverter<Swift.String>.toNode(value.stringArray, env: env),
            try SetConverter<Swift.String>.toNode(value.stringSet, env: env),
            try DictionaryConverter<Swift.String, Swift.String>.toNode(value.stringDictionary, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "boolArray", ArrayConverter<Swift.Bool>.toNode(value.boolArray, env: env))
        try env.setNamedProperty(this, "boolSet", SetConverter<Swift.Bool>.toNode(value.boolSet, env: env))
        try env.setNamedProperty(this, "boolDictionary", DictionaryConverter<Swift.Bool, Swift.Bool>.toNode(value.boolDictionary, env: env))
        try env.setNamedProperty(this, "integerArray", ArrayConverter<Swift.Int>.toNode(value.integerArray, env: env))
        try env.setNamedProperty(this, "integerSet", SetConverter<Swift.Int>.toNode(value.integerSet, env: env))
        try env.setNamedProperty(this, "integerDictionary", DictionaryConverter<Swift.Int, Swift.Int>.toNode(value.integerDictionary, env: env))
        try env.setNamedProperty(this, "stringArray", ArrayConverter<Swift.String>.toNode(value.stringArray, env: env))
        try env.setNamedProperty(this, "stringSet", SetConverter<Swift.String>.toNode(value.stringSet, env: env))
        try env.setNamedProperty(this, "stringDictionary", DictionaryConverter<Swift.String, Swift.String>.toNode(value.stringDictionary, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Collections.CollectionHolder",
            properties: [
                "staticMutableProperty": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticMutableProperty", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.Int>>.toNode(TestAPI.Collections.CollectionHolder.staticMutableProperty, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticMutableProperty", expectedArgumentCount: 1) { env in
                                TestAPI.Collections.CollectionHolder.staticMutableProperty = try env.argument(at: 0, converter: ArrayConverter<OptionalConverter<Swift.Int>>.self)
                                return nil
                            }
                        }),
                    isStatic: true
                ),
                "staticProperty": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticProperty", expectedArgumentCount: 0) { env in
                                return try ArrayConverter<OptionalConverter<Swift.Int>>.toNode(TestAPI.Collections.CollectionHolder.staticProperty, env: env.env)
                            }
                        },
                        setter: nil
                    ),
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

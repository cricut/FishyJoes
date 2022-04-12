// Generated using Sourcery 1.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.Primitives.PrimitiveHolder: NodeMutator {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> Self {
        Self(
            b: try { () -> Bool in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "b", &fieldValue))
                return try Bool.fromNode(fieldValue, env: env)
            }(),
            bq: try { () -> Optional<Bool> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "bq", &fieldValue))
                return try OptionalConverter<Bool>.fromNode(fieldValue, env: env)
            }(),
            ui8: try { () -> UInt8 in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "ui8", &fieldValue))
                return try UInt8.fromNode(fieldValue, env: env)
            }(),
            ui8q: try { () -> Optional<UInt8> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "ui8q", &fieldValue))
                return try OptionalConverter<UInt8>.fromNode(fieldValue, env: env)
            }(),
            ui16: try { () -> UInt16 in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "ui16", &fieldValue))
                return try UInt16.fromNode(fieldValue, env: env)
            }(),
            ui16q: try { () -> Optional<UInt16> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "ui16q", &fieldValue))
                return try OptionalConverter<UInt16>.fromNode(fieldValue, env: env)
            }(),
            ui32: try { () -> UInt32 in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "ui32", &fieldValue))
                return try UInt32.fromNode(fieldValue, env: env)
            }(),
            ui32q: try { () -> Optional<UInt32> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "ui32q", &fieldValue))
                return try OptionalConverter<UInt32>.fromNode(fieldValue, env: env)
            }(),
            ui64: try { () -> UInt64 in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "ui64", &fieldValue))
                return try UInt64.fromNode(fieldValue, env: env)
            }(),
            ui64q: try { () -> Optional<UInt64> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "ui64q", &fieldValue))
                return try OptionalConverter<UInt64>.fromNode(fieldValue, env: env)
            }(),
            i8: try { () -> Int8 in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "i8", &fieldValue))
                return try Int8.fromNode(fieldValue, env: env)
            }(),
            i8q: try { () -> Optional<Int8> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "i8q", &fieldValue))
                return try OptionalConverter<Int8>.fromNode(fieldValue, env: env)
            }(),
            i16: try { () -> Int16 in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "i16", &fieldValue))
                return try Int16.fromNode(fieldValue, env: env)
            }(),
            i16q: try { () -> Optional<Int16> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "i16q", &fieldValue))
                return try OptionalConverter<Int16>.fromNode(fieldValue, env: env)
            }(),
            i32: try { () -> Int32 in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "i32", &fieldValue))
                return try Int32.fromNode(fieldValue, env: env)
            }(),
            i32q: try { () -> Optional<Int32> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "i32q", &fieldValue))
                return try OptionalConverter<Int32>.fromNode(fieldValue, env: env)
            }(),
            i64: try { () -> Int64 in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "i64", &fieldValue))
                return try Int64.fromNode(fieldValue, env: env)
            }(),
            i64q: try { () -> Optional<Int64> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "i64q", &fieldValue))
                return try OptionalConverter<Int64>.fromNode(fieldValue, env: env)
            }(),
            f: try { () -> Float in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "f", &fieldValue))
                return try Float.fromNode(fieldValue, env: env)
            }(),
            fq: try { () -> Optional<Float> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "fq", &fieldValue))
                return try OptionalConverter<Float>.fromNode(fieldValue, env: env)
            }(),
            d: try { () -> Double in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "d", &fieldValue))
                return try Double.fromNode(fieldValue, env: env)
            }(),
            dq: try { () -> Optional<Double> in
                var fieldValue: napi_value?
                try check(napi_get_named_property(env, value, "dq", &fieldValue))
                return try OptionalConverter<Double>.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: napi_env) throws -> napi_value? {
        let constructor = try InstanceData.data(for: env).constructor(for: "Primitives.PrimitiveHolder", env: env)
        let args: [napi_value?] = [
            try Bool.toNode(value.b, env: env),
            try OptionalConverter<Bool>.toNode(value.bq, env: env),
            try UInt8.toNode(value.ui8, env: env),
            try OptionalConverter<UInt8>.toNode(value.ui8q, env: env),
            try UInt16.toNode(value.ui16, env: env),
            try OptionalConverter<UInt16>.toNode(value.ui16q, env: env),
            try UInt32.toNode(value.ui32, env: env),
            try OptionalConverter<UInt32>.toNode(value.ui32q, env: env),
            try UInt64.toNode(value.ui64, env: env),
            try OptionalConverter<UInt64>.toNode(value.ui64q, env: env),
            try Int8.toNode(value.i8, env: env),
            try OptionalConverter<Int8>.toNode(value.i8q, env: env),
            try Int16.toNode(value.i16, env: env),
            try OptionalConverter<Int16>.toNode(value.i16q, env: env),
            try Int32.toNode(value.i32, env: env),
            try OptionalConverter<Int32>.toNode(value.i32q, env: env),
            try Int64.toNode(value.i64, env: env),
            try OptionalConverter<Int64>.toNode(value.i64q, env: env),
            try Float.toNode(value.f, env: env),
            try OptionalConverter<Float>.toNode(value.fq, env: env),
            try Double.toNode(value.d, env: env),
            try OptionalConverter<Double>.toNode(value.dq, env: env),
        ]
        var result: napi_value?
        try check(napi_new_instance(env, constructor, args.count, args, &result))
        return result
    }
    public static func mutateNode(_ value: Self, this: napi_value?, env: napi_env) throws {
        try check(napi_set_named_property(env, this, "b", Bool.toNode(value.b, env: env)))
        try check(napi_set_named_property(env, this, "bq", OptionalConverter<Bool>.toNode(value.bq, env: env)))
        try check(napi_set_named_property(env, this, "ui8", UInt8.toNode(value.ui8, env: env)))
        try check(napi_set_named_property(env, this, "ui8q", OptionalConverter<UInt8>.toNode(value.ui8q, env: env)))
        try check(napi_set_named_property(env, this, "ui16", UInt16.toNode(value.ui16, env: env)))
        try check(napi_set_named_property(env, this, "ui16q", OptionalConverter<UInt16>.toNode(value.ui16q, env: env)))
        try check(napi_set_named_property(env, this, "ui32", UInt32.toNode(value.ui32, env: env)))
        try check(napi_set_named_property(env, this, "ui32q", OptionalConverter<UInt32>.toNode(value.ui32q, env: env)))
        try check(napi_set_named_property(env, this, "ui64", UInt64.toNode(value.ui64, env: env)))
        try check(napi_set_named_property(env, this, "ui64q", OptionalConverter<UInt64>.toNode(value.ui64q, env: env)))
        try check(napi_set_named_property(env, this, "i8", Int8.toNode(value.i8, env: env)))
        try check(napi_set_named_property(env, this, "i8q", OptionalConverter<Int8>.toNode(value.i8q, env: env)))
        try check(napi_set_named_property(env, this, "i16", Int16.toNode(value.i16, env: env)))
        try check(napi_set_named_property(env, this, "i16q", OptionalConverter<Int16>.toNode(value.i16q, env: env)))
        try check(napi_set_named_property(env, this, "i32", Int32.toNode(value.i32, env: env)))
        try check(napi_set_named_property(env, this, "i32q", OptionalConverter<Int32>.toNode(value.i32q, env: env)))
        try check(napi_set_named_property(env, this, "i64", Int64.toNode(value.i64, env: env)))
        try check(napi_set_named_property(env, this, "i64q", OptionalConverter<Int64>.toNode(value.i64q, env: env)))
        try check(napi_set_named_property(env, this, "f", Float.toNode(value.f, env: env)))
        try check(napi_set_named_property(env, this, "fq", OptionalConverter<Float>.toNode(value.fq, env: env)))
        try check(napi_set_named_property(env, this, "d", Double.toNode(value.d, env: env)))
        try check(napi_set_named_property(env, this, "dq", OptionalConverter<Double>.toNode(value.dq, env: env)))
    }
    public static func nodeSetup(env: napi_env, module: napi_value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Primitives.PrimitiveHolder",
            properties: [
                "staticPropery": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticPropery", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<UInt8>>.toNode(Primitives.PrimitiveHolder.staticPropery, env: env.env)
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
                                try ArrayConverter<OptionalConverter<UInt8>>.toNode(Primitives.PrimitiveHolder.staticMutablePropery, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticMutablePropery", expectedArgumentCount: 1) { env in
                                Primitives.PrimitiveHolder.staticMutablePropery = try env.argument(at: 0, converter: ArrayConverter<OptionalConverter<UInt8>>.self)
                                return nil
                            }
                        }),
                    isStatic: true
                ),
                "b": (.stored(mutable: true), isStatic: false),
                "bq": (.stored(mutable: true), isStatic: false),
                "ui8": (.stored(mutable: true), isStatic: false),
                "ui8q": (.stored(mutable: true), isStatic: false),
                "ui16": (.stored(mutable: true), isStatic: false),
                "ui16q": (.stored(mutable: true), isStatic: false),
                "ui32": (.stored(mutable: true), isStatic: false),
                "ui32q": (.stored(mutable: true), isStatic: false),
                "ui64": (.stored(mutable: true), isStatic: false),
                "ui64q": (.stored(mutable: true), isStatic: false),
                "i8": (.stored(mutable: true), isStatic: false),
                "i8q": (.stored(mutable: true), isStatic: false),
                "i16": (.stored(mutable: true), isStatic: false),
                "i16q": (.stored(mutable: true), isStatic: false),
                "i32": (.stored(mutable: true), isStatic: false),
                "i32q": (.stored(mutable: true), isStatic: false),
                "i64": (.stored(mutable: true), isStatic: false),
                "i64q": (.stored(mutable: true), isStatic: false),
                "f": (.stored(mutable: true), isStatic: false),
                "fq": (.stored(mutable: true), isStatic: false),
                "d": (.stored(mutable: true), isStatic: false),
                "dq": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "Primitives.PrimitiveHolder_constructor", expectedArgumentCount: 22) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try check(napi_set_named_property(env.env, this, "b", env.argument(at: 0)))
                    try check(napi_set_named_property(env.env, this, "bq", env.argument(at: 1)))
                    try check(napi_set_named_property(env.env, this, "ui8", env.argument(at: 2)))
                    try check(napi_set_named_property(env.env, this, "ui8q", env.argument(at: 3)))
                    try check(napi_set_named_property(env.env, this, "ui16", env.argument(at: 4)))
                    try check(napi_set_named_property(env.env, this, "ui16q", env.argument(at: 5)))
                    try check(napi_set_named_property(env.env, this, "ui32", env.argument(at: 6)))
                    try check(napi_set_named_property(env.env, this, "ui32q", env.argument(at: 7)))
                    try check(napi_set_named_property(env.env, this, "ui64", env.argument(at: 8)))
                    try check(napi_set_named_property(env.env, this, "ui64q", env.argument(at: 9)))
                    try check(napi_set_named_property(env.env, this, "i8", env.argument(at: 10)))
                    try check(napi_set_named_property(env.env, this, "i8q", env.argument(at: 11)))
                    try check(napi_set_named_property(env.env, this, "i16", env.argument(at: 12)))
                    try check(napi_set_named_property(env.env, this, "i16q", env.argument(at: 13)))
                    try check(napi_set_named_property(env.env, this, "i32", env.argument(at: 14)))
                    try check(napi_set_named_property(env.env, this, "i32q", env.argument(at: 15)))
                    try check(napi_set_named_property(env.env, this, "i64", env.argument(at: 16)))
                    try check(napi_set_named_property(env.env, this, "i64q", env.argument(at: 17)))
                    try check(napi_set_named_property(env.env, this, "f", env.argument(at: 18)))
                    try check(napi_set_named_property(env.env, this, "fq", env.argument(at: 19)))
                    try check(napi_set_named_property(env.env, this, "d", env.argument(at: 20)))
                    try check(napi_set_named_property(env.env, this, "dq", env.argument(at: 21)))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "Primitives.PrimitiveHolder",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

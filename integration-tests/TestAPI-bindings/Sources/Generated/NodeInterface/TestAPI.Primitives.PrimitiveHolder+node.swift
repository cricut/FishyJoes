// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.Primitives.PrimitiveHolder: NodeMutator {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            b: try { () -> Swift.Bool in
                let fieldValue = try env.getNamedProperty(value, "b")
                return try Swift.Bool.fromNode(fieldValue, env: env)
            }(),
            bq: try { () -> Optional<Swift.Bool> in
                let fieldValue = try env.getNamedProperty(value, "bq")
                return try OptionalConverter<Swift.Bool>.fromNode(fieldValue, env: env)
            }(),
            ui8: try { () -> Swift.UInt8 in
                let fieldValue = try env.getNamedProperty(value, "ui8")
                return try Swift.UInt8.fromNode(fieldValue, env: env)
            }(),
            ui8q: try { () -> Optional<Swift.UInt8> in
                let fieldValue = try env.getNamedProperty(value, "ui8q")
                return try OptionalConverter<Swift.UInt8>.fromNode(fieldValue, env: env)
            }(),
            ui16: try { () -> Swift.UInt16 in
                let fieldValue = try env.getNamedProperty(value, "ui16")
                return try Swift.UInt16.fromNode(fieldValue, env: env)
            }(),
            ui16q: try { () -> Optional<Swift.UInt16> in
                let fieldValue = try env.getNamedProperty(value, "ui16q")
                return try OptionalConverter<Swift.UInt16>.fromNode(fieldValue, env: env)
            }(),
            ui32: try { () -> Swift.UInt32 in
                let fieldValue = try env.getNamedProperty(value, "ui32")
                return try Swift.UInt32.fromNode(fieldValue, env: env)
            }(),
            ui32q: try { () -> Optional<Swift.UInt32> in
                let fieldValue = try env.getNamedProperty(value, "ui32q")
                return try OptionalConverter<Swift.UInt32>.fromNode(fieldValue, env: env)
            }(),
            ui64: try { () -> Swift.UInt64 in
                let fieldValue = try env.getNamedProperty(value, "ui64")
                return try Swift.UInt64.fromNode(fieldValue, env: env)
            }(),
            ui64q: try { () -> Optional<Swift.UInt64> in
                let fieldValue = try env.getNamedProperty(value, "ui64q")
                return try OptionalConverter<Swift.UInt64>.fromNode(fieldValue, env: env)
            }(),
            ui: try { () -> Swift.UInt in
                let fieldValue = try env.getNamedProperty(value, "ui")
                return try Swift.UInt.fromNode(fieldValue, env: env)
            }(),
            uiq: try { () -> Optional<Swift.UInt> in
                let fieldValue = try env.getNamedProperty(value, "uiq")
                return try OptionalConverter<Swift.UInt>.fromNode(fieldValue, env: env)
            }(),
            i8: try { () -> Swift.Int8 in
                let fieldValue = try env.getNamedProperty(value, "i8")
                return try Swift.Int8.fromNode(fieldValue, env: env)
            }(),
            i8q: try { () -> Optional<Swift.Int8> in
                let fieldValue = try env.getNamedProperty(value, "i8q")
                return try OptionalConverter<Swift.Int8>.fromNode(fieldValue, env: env)
            }(),
            i16: try { () -> Swift.Int16 in
                let fieldValue = try env.getNamedProperty(value, "i16")
                return try Swift.Int16.fromNode(fieldValue, env: env)
            }(),
            i16q: try { () -> Optional<Swift.Int16> in
                let fieldValue = try env.getNamedProperty(value, "i16q")
                return try OptionalConverter<Swift.Int16>.fromNode(fieldValue, env: env)
            }(),
            i32: try { () -> Swift.Int32 in
                let fieldValue = try env.getNamedProperty(value, "i32")
                return try Swift.Int32.fromNode(fieldValue, env: env)
            }(),
            i32q: try { () -> Optional<Swift.Int32> in
                let fieldValue = try env.getNamedProperty(value, "i32q")
                return try OptionalConverter<Swift.Int32>.fromNode(fieldValue, env: env)
            }(),
            i64: try { () -> Swift.Int64 in
                let fieldValue = try env.getNamedProperty(value, "i64")
                return try Swift.Int64.fromNode(fieldValue, env: env)
            }(),
            i64q: try { () -> Optional<Swift.Int64> in
                let fieldValue = try env.getNamedProperty(value, "i64q")
                return try OptionalConverter<Swift.Int64>.fromNode(fieldValue, env: env)
            }(),
            i: try { () -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "i")
                return try Swift.Int.fromNode(fieldValue, env: env)
            }(),
            iq: try { () -> Optional<Swift.Int> in
                let fieldValue = try env.getNamedProperty(value, "iq")
                return try OptionalConverter<Swift.Int>.fromNode(fieldValue, env: env)
            }(),
            f: try { () -> Swift.Float in
                let fieldValue = try env.getNamedProperty(value, "f")
                return try Swift.Float.fromNode(fieldValue, env: env)
            }(),
            fq: try { () -> Optional<Swift.Float> in
                let fieldValue = try env.getNamedProperty(value, "fq")
                return try OptionalConverter<Swift.Float>.fromNode(fieldValue, env: env)
            }(),
            d: try { () -> Swift.Double in
                let fieldValue = try env.getNamedProperty(value, "d")
                return try Swift.Double.fromNode(fieldValue, env: env)
            }(),
            dq: try { () -> Optional<Swift.Double> in
                let fieldValue = try env.getNamedProperty(value, "dq")
                return try OptionalConverter<Swift.Double>.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "Primitives.PrimitiveHolder", env: env)
        let args: [NAPI.Value] = [
            try Swift.Bool.toNode(value.b, env: env),
            try OptionalConverter<Swift.Bool>.toNode(value.bq, env: env),
            try Swift.UInt8.toNode(value.ui8, env: env),
            try OptionalConverter<Swift.UInt8>.toNode(value.ui8q, env: env),
            try Swift.UInt16.toNode(value.ui16, env: env),
            try OptionalConverter<Swift.UInt16>.toNode(value.ui16q, env: env),
            try Swift.UInt32.toNode(value.ui32, env: env),
            try OptionalConverter<Swift.UInt32>.toNode(value.ui32q, env: env),
            try Swift.UInt64.toNode(value.ui64, env: env),
            try OptionalConverter<Swift.UInt64>.toNode(value.ui64q, env: env),
            try Swift.UInt.toNode(value.ui, env: env),
            try OptionalConverter<Swift.UInt>.toNode(value.uiq, env: env),
            try Swift.Int8.toNode(value.i8, env: env),
            try OptionalConverter<Swift.Int8>.toNode(value.i8q, env: env),
            try Swift.Int16.toNode(value.i16, env: env),
            try OptionalConverter<Swift.Int16>.toNode(value.i16q, env: env),
            try Swift.Int32.toNode(value.i32, env: env),
            try OptionalConverter<Swift.Int32>.toNode(value.i32q, env: env),
            try Swift.Int64.toNode(value.i64, env: env),
            try OptionalConverter<Swift.Int64>.toNode(value.i64q, env: env),
            try Swift.Int.toNode(value.i, env: env),
            try OptionalConverter<Swift.Int>.toNode(value.iq, env: env),
            try Swift.Float.toNode(value.f, env: env),
            try OptionalConverter<Swift.Float>.toNode(value.fq, env: env),
            try Swift.Double.toNode(value.d, env: env),
            try OptionalConverter<Swift.Double>.toNode(value.dq, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "b", Swift.Bool.toNode(value.b, env: env))
        try env.setNamedProperty(this, "bq", OptionalConverter<Swift.Bool>.toNode(value.bq, env: env))
        try env.setNamedProperty(this, "ui8", Swift.UInt8.toNode(value.ui8, env: env))
        try env.setNamedProperty(this, "ui8q", OptionalConverter<Swift.UInt8>.toNode(value.ui8q, env: env))
        try env.setNamedProperty(this, "ui16", Swift.UInt16.toNode(value.ui16, env: env))
        try env.setNamedProperty(this, "ui16q", OptionalConverter<Swift.UInt16>.toNode(value.ui16q, env: env))
        try env.setNamedProperty(this, "ui32", Swift.UInt32.toNode(value.ui32, env: env))
        try env.setNamedProperty(this, "ui32q", OptionalConverter<Swift.UInt32>.toNode(value.ui32q, env: env))
        try env.setNamedProperty(this, "ui64", Swift.UInt64.toNode(value.ui64, env: env))
        try env.setNamedProperty(this, "ui64q", OptionalConverter<Swift.UInt64>.toNode(value.ui64q, env: env))
        try env.setNamedProperty(this, "ui", Swift.UInt.toNode(value.ui, env: env))
        try env.setNamedProperty(this, "uiq", OptionalConverter<Swift.UInt>.toNode(value.uiq, env: env))
        try env.setNamedProperty(this, "i8", Swift.Int8.toNode(value.i8, env: env))
        try env.setNamedProperty(this, "i8q", OptionalConverter<Swift.Int8>.toNode(value.i8q, env: env))
        try env.setNamedProperty(this, "i16", Swift.Int16.toNode(value.i16, env: env))
        try env.setNamedProperty(this, "i16q", OptionalConverter<Swift.Int16>.toNode(value.i16q, env: env))
        try env.setNamedProperty(this, "i32", Swift.Int32.toNode(value.i32, env: env))
        try env.setNamedProperty(this, "i32q", OptionalConverter<Swift.Int32>.toNode(value.i32q, env: env))
        try env.setNamedProperty(this, "i64", Swift.Int64.toNode(value.i64, env: env))
        try env.setNamedProperty(this, "i64q", OptionalConverter<Swift.Int64>.toNode(value.i64q, env: env))
        try env.setNamedProperty(this, "i", Swift.Int.toNode(value.i, env: env))
        try env.setNamedProperty(this, "iq", OptionalConverter<Swift.Int>.toNode(value.iq, env: env))
        try env.setNamedProperty(this, "f", Swift.Float.toNode(value.f, env: env))
        try env.setNamedProperty(this, "fq", OptionalConverter<Swift.Float>.toNode(value.fq, env: env))
        try env.setNamedProperty(this, "d", Swift.Double.toNode(value.d, env: env))
        try env.setNamedProperty(this, "dq", OptionalConverter<Swift.Double>.toNode(value.dq, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Primitives.PrimitiveHolder",
            properties: [
                "staticProperty": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticProperty", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Swift.UInt8>>.toNode(TestAPI.Primitives.PrimitiveHolder.staticProperty, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "staticMutableProperty": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticMutableProperty", expectedArgumentCount: 0) { env in
                                try ArrayConverter<OptionalConverter<Swift.UInt8>>.toNode(TestAPI.Primitives.PrimitiveHolder.staticMutableProperty, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticMutableProperty", expectedArgumentCount: 1) { env in
                                TestAPI.Primitives.PrimitiveHolder.staticMutableProperty = try env.argument(at: 0, converter: ArrayConverter<OptionalConverter<Swift.UInt8>>.self)
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
                "ui": (.stored(mutable: true), isStatic: false),
                "uiq": (.stored(mutable: true), isStatic: false),
                "i8": (.stored(mutable: true), isStatic: false),
                "i8q": (.stored(mutable: true), isStatic: false),
                "i16": (.stored(mutable: true), isStatic: false),
                "i16q": (.stored(mutable: true), isStatic: false),
                "i32": (.stored(mutable: true), isStatic: false),
                "i32q": (.stored(mutable: true), isStatic: false),
                "i64": (.stored(mutable: true), isStatic: false),
                "i64q": (.stored(mutable: true), isStatic: false),
                "i": (.stored(mutable: true), isStatic: false),
                "iq": (.stored(mutable: true), isStatic: false),
                "f": (.stored(mutable: true), isStatic: false),
                "fq": (.stored(mutable: true), isStatic: false),
                "d": (.stored(mutable: true), isStatic: false),
                "dq": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "Primitives.PrimitiveHolder_constructor", expectedArgumentCount: 26) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "b", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "bq", env.argument(at: 1))
                    try env.env.setNamedProperty(this, "ui8", env.argument(at: 2))
                    try env.env.setNamedProperty(this, "ui8q", env.argument(at: 3))
                    try env.env.setNamedProperty(this, "ui16", env.argument(at: 4))
                    try env.env.setNamedProperty(this, "ui16q", env.argument(at: 5))
                    try env.env.setNamedProperty(this, "ui32", env.argument(at: 6))
                    try env.env.setNamedProperty(this, "ui32q", env.argument(at: 7))
                    try env.env.setNamedProperty(this, "ui64", env.argument(at: 8))
                    try env.env.setNamedProperty(this, "ui64q", env.argument(at: 9))
                    try env.env.setNamedProperty(this, "ui", env.argument(at: 10))
                    try env.env.setNamedProperty(this, "uiq", env.argument(at: 11))
                    try env.env.setNamedProperty(this, "i8", env.argument(at: 12))
                    try env.env.setNamedProperty(this, "i8q", env.argument(at: 13))
                    try env.env.setNamedProperty(this, "i16", env.argument(at: 14))
                    try env.env.setNamedProperty(this, "i16q", env.argument(at: 15))
                    try env.env.setNamedProperty(this, "i32", env.argument(at: 16))
                    try env.env.setNamedProperty(this, "i32q", env.argument(at: 17))
                    try env.env.setNamedProperty(this, "i64", env.argument(at: 18))
                    try env.env.setNamedProperty(this, "i64q", env.argument(at: 19))
                    try env.env.setNamedProperty(this, "i", env.argument(at: 20))
                    try env.env.setNamedProperty(this, "iq", env.argument(at: 21))
                    try env.env.setNamedProperty(this, "f", env.argument(at: 22))
                    try env.env.setNamedProperty(this, "fq", env.argument(at: 23))
                    try env.env.setNamedProperty(this, "d", env.argument(at: 24))
                    try env.env.setNamedProperty(this, "dq", env.argument(at: 25))
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

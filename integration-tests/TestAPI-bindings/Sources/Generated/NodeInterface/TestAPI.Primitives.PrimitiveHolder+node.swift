// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.Primitives.PrimitiveHolder: NodeMutator {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            b: try { () -> Bool in
                let fieldValue = try env.getNamedProperty(value, "b")
                return try Bool.fromNode(fieldValue, env: env)
            }(),
            bq: try { () -> Optional<Bool> in
                let fieldValue = try env.getNamedProperty(value, "bq")
                return try OptionalConverter<Bool>.fromNode(fieldValue, env: env)
            }(),
            ui8: try { () -> UInt8 in
                let fieldValue = try env.getNamedProperty(value, "ui8")
                return try UInt8.fromNode(fieldValue, env: env)
            }(),
            ui8q: try { () -> Optional<UInt8> in
                let fieldValue = try env.getNamedProperty(value, "ui8q")
                return try OptionalConverter<UInt8>.fromNode(fieldValue, env: env)
            }(),
            ui16: try { () -> UInt16 in
                let fieldValue = try env.getNamedProperty(value, "ui16")
                return try UInt16.fromNode(fieldValue, env: env)
            }(),
            ui16q: try { () -> Optional<UInt16> in
                let fieldValue = try env.getNamedProperty(value, "ui16q")
                return try OptionalConverter<UInt16>.fromNode(fieldValue, env: env)
            }(),
            ui32: try { () -> UInt32 in
                let fieldValue = try env.getNamedProperty(value, "ui32")
                return try UInt32.fromNode(fieldValue, env: env)
            }(),
            ui32q: try { () -> Optional<UInt32> in
                let fieldValue = try env.getNamedProperty(value, "ui32q")
                return try OptionalConverter<UInt32>.fromNode(fieldValue, env: env)
            }(),
            ui64: try { () -> UInt64 in
                let fieldValue = try env.getNamedProperty(value, "ui64")
                return try UInt64.fromNode(fieldValue, env: env)
            }(),
            ui64q: try { () -> Optional<UInt64> in
                let fieldValue = try env.getNamedProperty(value, "ui64q")
                return try OptionalConverter<UInt64>.fromNode(fieldValue, env: env)
            }(),
            ui: try { () -> UInt in
                let fieldValue = try env.getNamedProperty(value, "ui")
                return try UInt.fromNode(fieldValue, env: env)
            }(),
            uiq: try { () -> Optional<UInt> in
                let fieldValue = try env.getNamedProperty(value, "uiq")
                return try OptionalConverter<UInt>.fromNode(fieldValue, env: env)
            }(),
            i8: try { () -> Int8 in
                let fieldValue = try env.getNamedProperty(value, "i8")
                return try Int8.fromNode(fieldValue, env: env)
            }(),
            i8q: try { () -> Optional<Int8> in
                let fieldValue = try env.getNamedProperty(value, "i8q")
                return try OptionalConverter<Int8>.fromNode(fieldValue, env: env)
            }(),
            i16: try { () -> Int16 in
                let fieldValue = try env.getNamedProperty(value, "i16")
                return try Int16.fromNode(fieldValue, env: env)
            }(),
            i16q: try { () -> Optional<Int16> in
                let fieldValue = try env.getNamedProperty(value, "i16q")
                return try OptionalConverter<Int16>.fromNode(fieldValue, env: env)
            }(),
            i32: try { () -> Int32 in
                let fieldValue = try env.getNamedProperty(value, "i32")
                return try Int32.fromNode(fieldValue, env: env)
            }(),
            i32q: try { () -> Optional<Int32> in
                let fieldValue = try env.getNamedProperty(value, "i32q")
                return try OptionalConverter<Int32>.fromNode(fieldValue, env: env)
            }(),
            i64: try { () -> Int64 in
                let fieldValue = try env.getNamedProperty(value, "i64")
                return try Int64.fromNode(fieldValue, env: env)
            }(),
            i64q: try { () -> Optional<Int64> in
                let fieldValue = try env.getNamedProperty(value, "i64q")
                return try OptionalConverter<Int64>.fromNode(fieldValue, env: env)
            }(),
            i: try { () -> Int in
                let fieldValue = try env.getNamedProperty(value, "i")
                return try Int.fromNode(fieldValue, env: env)
            }(),
            iq: try { () -> Optional<Int> in
                let fieldValue = try env.getNamedProperty(value, "iq")
                return try OptionalConverter<Int>.fromNode(fieldValue, env: env)
            }(),
            f: try { () -> Float in
                let fieldValue = try env.getNamedProperty(value, "f")
                return try Float.fromNode(fieldValue, env: env)
            }(),
            fq: try { () -> Optional<Float> in
                let fieldValue = try env.getNamedProperty(value, "fq")
                return try OptionalConverter<Float>.fromNode(fieldValue, env: env)
            }(),
            d: try { () -> Double in
                let fieldValue = try env.getNamedProperty(value, "d")
                return try Double.fromNode(fieldValue, env: env)
            }(),
            dq: try { () -> Optional<Double> in
                let fieldValue = try env.getNamedProperty(value, "dq")
                return try OptionalConverter<Double>.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try InstanceData.data(for: env).constructor(for: "Primitives.PrimitiveHolder", env: env)
        let args: [NAPI.Value] = [
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
            try UInt.toNode(value.ui, env: env),
            try OptionalConverter<UInt>.toNode(value.uiq, env: env),
            try Int8.toNode(value.i8, env: env),
            try OptionalConverter<Int8>.toNode(value.i8q, env: env),
            try Int16.toNode(value.i16, env: env),
            try OptionalConverter<Int16>.toNode(value.i16q, env: env),
            try Int32.toNode(value.i32, env: env),
            try OptionalConverter<Int32>.toNode(value.i32q, env: env),
            try Int64.toNode(value.i64, env: env),
            try OptionalConverter<Int64>.toNode(value.i64q, env: env),
            try Int.toNode(value.i, env: env),
            try OptionalConverter<Int>.toNode(value.iq, env: env),
            try Float.toNode(value.f, env: env),
            try OptionalConverter<Float>.toNode(value.fq, env: env),
            try Double.toNode(value.d, env: env),
            try OptionalConverter<Double>.toNode(value.dq, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "b", Bool.toNode(value.b, env: env))
        try env.setNamedProperty(this, "bq", OptionalConverter<Bool>.toNode(value.bq, env: env))
        try env.setNamedProperty(this, "ui8", UInt8.toNode(value.ui8, env: env))
        try env.setNamedProperty(this, "ui8q", OptionalConverter<UInt8>.toNode(value.ui8q, env: env))
        try env.setNamedProperty(this, "ui16", UInt16.toNode(value.ui16, env: env))
        try env.setNamedProperty(this, "ui16q", OptionalConverter<UInt16>.toNode(value.ui16q, env: env))
        try env.setNamedProperty(this, "ui32", UInt32.toNode(value.ui32, env: env))
        try env.setNamedProperty(this, "ui32q", OptionalConverter<UInt32>.toNode(value.ui32q, env: env))
        try env.setNamedProperty(this, "ui64", UInt64.toNode(value.ui64, env: env))
        try env.setNamedProperty(this, "ui64q", OptionalConverter<UInt64>.toNode(value.ui64q, env: env))
        try env.setNamedProperty(this, "ui", UInt.toNode(value.ui, env: env))
        try env.setNamedProperty(this, "uiq", OptionalConverter<UInt>.toNode(value.uiq, env: env))
        try env.setNamedProperty(this, "i8", Int8.toNode(value.i8, env: env))
        try env.setNamedProperty(this, "i8q", OptionalConverter<Int8>.toNode(value.i8q, env: env))
        try env.setNamedProperty(this, "i16", Int16.toNode(value.i16, env: env))
        try env.setNamedProperty(this, "i16q", OptionalConverter<Int16>.toNode(value.i16q, env: env))
        try env.setNamedProperty(this, "i32", Int32.toNode(value.i32, env: env))
        try env.setNamedProperty(this, "i32q", OptionalConverter<Int32>.toNode(value.i32q, env: env))
        try env.setNamedProperty(this, "i64", Int64.toNode(value.i64, env: env))
        try env.setNamedProperty(this, "i64q", OptionalConverter<Int64>.toNode(value.i64q, env: env))
        try env.setNamedProperty(this, "i", Int.toNode(value.i, env: env))
        try env.setNamedProperty(this, "iq", OptionalConverter<Int>.toNode(value.iq, env: env))
        try env.setNamedProperty(this, "f", Float.toNode(value.f, env: env))
        try env.setNamedProperty(this, "fq", OptionalConverter<Float>.toNode(value.fq, env: env))
        try env.setNamedProperty(this, "d", Double.toNode(value.d, env: env))
        try env.setNamedProperty(this, "dq", OptionalConverter<Double>.toNode(value.dq, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
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

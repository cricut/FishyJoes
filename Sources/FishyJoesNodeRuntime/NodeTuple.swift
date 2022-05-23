import FishyJoesCommonRuntime
import Foundation
import NodeAPI

extension Tuple2Converter: NodeConverter where T0: NodeConverter, T1: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        (
            try T0.fromNode(try env.getElement(value, 0), env: env),
            try T1.fromNode(try env.getElement(value, 1), env: env)
        )
    }

    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let array = try env.createArrayWithLength(2)
        try env.setElement(array, 0, T0.toNode(value.0, env: env))
        try env.setElement(array, 1, T1.toNode(value.1, env: env))
        return array
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
    }
}

extension Tuple3Converter: NodeConverter where T0: NodeConverter, T1: NodeConverter, T2: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        return (
            try T0.fromNode(try env.getElement(value, 0), env: env),
            try T1.fromNode(try env.getElement(value, 1), env: env),
            try T2.fromNode(try env.getElement(value, 2), env: env)
        )
    }

    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let array = try env.createArrayWithLength(3)
        try env.setElement(array, 0, T0.toNode(value.0, env: env))
        try env.setElement(array, 1, T1.toNode(value.1, env: env))
        try env.setElement(array, 2, T2.toNode(value.2, env: env))
        return array
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
    }
}

extension Tuple4Converter: NodeConverter where T0: NodeConverter, T1: NodeConverter, T2: NodeConverter, T3: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        return (
            try T0.fromNode(try env.getElement(value, 0), env: env),
            try T1.fromNode(try env.getElement(value, 1), env: env),
            try T2.fromNode(try env.getElement(value, 2), env: env),
            try T3.fromNode(try env.getElement(value, 3), env: env)
        )
    }

    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let array = try env.createArrayWithLength(4)
        try env.setElement(array, 0, T0.toNode(value.0, env: env))
        try env.setElement(array, 1, T1.toNode(value.1, env: env))
        try env.setElement(array, 2, T2.toNode(value.2, env: env))
        try env.setElement(array, 3, T3.toNode(value.3, env: env))
        return array
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
    }
}

extension Tuple5Converter: NodeConverter where T0: NodeConverter, T1: NodeConverter, T2: NodeConverter, T3: NodeConverter, T4: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        return (
            try T0.fromNode(try env.getElement(value, 0), env: env),
            try T1.fromNode(try env.getElement(value, 1), env: env),
            try T2.fromNode(try env.getElement(value, 2), env: env),
            try T3.fromNode(try env.getElement(value, 3), env: env),
            try T4.fromNode(try env.getElement(value, 4), env: env)
        )
    }

    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let array = try env.createArrayWithLength(5)
        try env.setElement(array, 0, T0.toNode(value.0, env: env))
        try env.setElement(array, 1, T1.toNode(value.1, env: env))
        try env.setElement(array, 2, T2.toNode(value.2, env: env))
        try env.setElement(array, 3, T3.toNode(value.3, env: env))
        try env.setElement(array, 4, T4.toNode(value.4, env: env))
        return array
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
    }
}

extension Tuple6Converter: NodeConverter where T0: NodeConverter, T1: NodeConverter, T2: NodeConverter, T3: NodeConverter, T4: NodeConverter, T5: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        return (
            try T0.fromNode(try env.getElement(value, 0), env: env),
            try T1.fromNode(try env.getElement(value, 1), env: env),
            try T2.fromNode(try env.getElement(value, 2), env: env),
            try T3.fromNode(try env.getElement(value, 3), env: env),
            try T4.fromNode(try env.getElement(value, 4), env: env),
            try T5.fromNode(try env.getElement(value, 5), env: env)
        )
    }

    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let array = try env.createArrayWithLength(6)
        try env.setElement(array, 0, T0.toNode(value.0, env: env))
        try env.setElement(array, 1, T1.toNode(value.1, env: env))
        try env.setElement(array, 2, T2.toNode(value.2, env: env))
        try env.setElement(array, 3, T3.toNode(value.3, env: env))
        try env.setElement(array, 4, T4.toNode(value.4, env: env))
        try env.setElement(array, 5, T5.toNode(value.5, env: env))
        return array
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
    }
}

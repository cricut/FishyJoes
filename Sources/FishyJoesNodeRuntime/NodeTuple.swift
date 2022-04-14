import Foundation
import NodeAPI
import FishyJoesCommonRuntime

extension Tuple2Converter: NodeConverter where T0: NodeConverter, T1: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
        var v0: napi_value?
        var v1: napi_value?
        try check(napi_get_element(env, value, 0, &v0))
        try check(napi_get_element(env, value, 1, &v1))
        return (
            try T0.fromNode(v0, env: env),
            try T1.fromNode(v1, env: env)
        )
    }

    public static func toNode(_ value: SwiftType, env: napi_env) throws -> napi_value? {
        var array: napi_value?
        try check(napi_create_array_with_length(env, 2, &array))
        try check(napi_set_element(env, array, 0, T0.toNode(value.0, env: env)))
        try check(napi_set_element(env, array, 1, T1.toNode(value.1, env: env)))
        return array
    }

    public static func nodeSetup(env: napi_env, module: napi_value) throws {
    }
}

extension Tuple3Converter: NodeConverter where T0: NodeConverter, T1: NodeConverter, T2: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
        var v0: napi_value?
        var v1: napi_value?
        var v2: napi_value?
        try check(napi_get_element(env, value, 0, &v0))
        try check(napi_get_element(env, value, 1, &v1))
        try check(napi_get_element(env, value, 2, &v2))
        return (
            try T0.fromNode(v0, env: env),
            try T1.fromNode(v1, env: env),
            try T2.fromNode(v2, env: env)
        )
    }

    public static func toNode(_ value: SwiftType, env: napi_env) throws -> napi_value? {
        var array: napi_value?
        try check(napi_create_array_with_length(env, 3, &array))
        try check(napi_set_element(env, array, 0, T0.toNode(value.0, env: env)))
        try check(napi_set_element(env, array, 1, T1.toNode(value.1, env: env)))
        try check(napi_set_element(env, array, 2, T2.toNode(value.2, env: env)))
        return array
    }

    public static func nodeSetup(env: napi_env, module: napi_value) throws {
    }
}

extension Tuple4Converter: NodeConverter where T0: NodeConverter, T1: NodeConverter, T2: NodeConverter, T3: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
        var v0: napi_value?
        var v1: napi_value?
        var v2: napi_value?
        var v3: napi_value?
        try check(napi_get_element(env, value, 0, &v0))
        try check(napi_get_element(env, value, 1, &v1))
        try check(napi_get_element(env, value, 2, &v2))
        try check(napi_get_element(env, value, 3, &v3))
        return (
            try T0.fromNode(v0, env: env),
            try T1.fromNode(v1, env: env),
            try T2.fromNode(v2, env: env),
            try T3.fromNode(v3, env: env)
        )
    }

    public static func toNode(_ value: SwiftType, env: napi_env) throws -> napi_value? {
        var array: napi_value?
        try check(napi_create_array_with_length(env, 4, &array))
        try check(napi_set_element(env, array, 0, T0.toNode(value.0, env: env)))
        try check(napi_set_element(env, array, 1, T1.toNode(value.1, env: env)))
        try check(napi_set_element(env, array, 2, T2.toNode(value.2, env: env)))
        try check(napi_set_element(env, array, 3, T3.toNode(value.3, env: env)))
        return array
    }

    public static func nodeSetup(env: napi_env, module: napi_value) throws {
    }
}

extension Tuple5Converter: NodeConverter where T0: NodeConverter, T1: NodeConverter, T2: NodeConverter, T3: NodeConverter, T4: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
        var v0: napi_value?
        var v1: napi_value?
        var v2: napi_value?
        var v3: napi_value?
        var v4: napi_value?
        try check(napi_get_element(env, value, 0, &v0))
        try check(napi_get_element(env, value, 1, &v1))
        try check(napi_get_element(env, value, 2, &v2))
        try check(napi_get_element(env, value, 3, &v3))
        try check(napi_get_element(env, value, 4, &v4))
        return (
            try T0.fromNode(v0, env: env),
            try T1.fromNode(v1, env: env),
            try T2.fromNode(v2, env: env),
            try T3.fromNode(v3, env: env),
            try T4.fromNode(v4, env: env)
        )
    }

    public static func toNode(_ value: SwiftType, env: napi_env) throws -> napi_value? {
        var array: napi_value?
        try check(napi_create_array_with_length(env, 5, &array))
        try check(napi_set_element(env, array, 0, T0.toNode(value.0, env: env)))
        try check(napi_set_element(env, array, 1, T1.toNode(value.1, env: env)))
        try check(napi_set_element(env, array, 2, T2.toNode(value.2, env: env)))
        try check(napi_set_element(env, array, 3, T3.toNode(value.3, env: env)))
        try check(napi_set_element(env, array, 4, T4.toNode(value.4, env: env)))
        return array
    }

    public static func nodeSetup(env: napi_env, module: napi_value) throws {
    }
}

extension Tuple6Converter: NodeConverter where T0: NodeConverter, T1: NodeConverter, T2: NodeConverter, T3: NodeConverter, T4: NodeConverter, T5: NodeConverter {
    public static func fromNode(_ value: napi_value?, env: napi_env) throws -> SwiftType {
        var v0: napi_value?
        var v1: napi_value?
        var v2: napi_value?
        var v3: napi_value?
        var v4: napi_value?
        var v5: napi_value?
        try check(napi_get_element(env, value, 0, &v0))
        try check(napi_get_element(env, value, 1, &v1))
        try check(napi_get_element(env, value, 2, &v2))
        try check(napi_get_element(env, value, 3, &v3))
        try check(napi_get_element(env, value, 4, &v4))
        try check(napi_get_element(env, value, 5, &v5))
        return (
            try T0.fromNode(v0, env: env),
            try T1.fromNode(v1, env: env),
            try T2.fromNode(v2, env: env),
            try T3.fromNode(v3, env: env),
            try T4.fromNode(v4, env: env),
            try T5.fromNode(v5, env: env)
        )
    }

    public static func toNode(_ value: SwiftType, env: napi_env) throws -> napi_value? {
        var array: napi_value?
        try check(napi_create_array_with_length(env, 6, &array))
        try check(napi_set_element(env, array, 0, T0.toNode(value.0, env: env)))
        try check(napi_set_element(env, array, 1, T1.toNode(value.1, env: env)))
        try check(napi_set_element(env, array, 2, T2.toNode(value.2, env: env)))
        try check(napi_set_element(env, array, 3, T3.toNode(value.3, env: env)))
        try check(napi_set_element(env, array, 4, T4.toNode(value.4, env: env)))
        try check(napi_set_element(env, array, 5, T5.toNode(value.5, env: env)))
        return array
    }

    public static func nodeSetup(env: napi_env, module: napi_value) throws {
    }
}

import FishyJoesCommonRuntime
import Foundation
import JNI

extension AsyncFunction0Converter: JavaConverter where R: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let jFutureFunc = try env.CallStaticObjectMethod(SwiftFunctionImpl.implClass, SwiftFunctionImpl.toDeferredMethods[arity], jvalue(l: value))
        let futureFunc = try FutureFunctionConverter.fromJava(jFutureFunc, env: env)
        return fromFutureFunction(futureFunc)
    }

    public static func toJava(_ value: @escaping SwiftType, env: Env) throws -> jobject? {
        let futureFunc = toFutureFunction(value)
        let jFutureFunc = try FutureFunctionConverter.toJavaObject(futureFunc, env: env)
        return try env.CallObjectMethod(jFutureFunc, SwiftFunctionImpl.toSuspendMethods[arity])
    }

    public static func javaSetup(env: Env) throws {
        try FutureFunctionConverter.javaSetup(env: env)
    }
}

extension AsyncFunction1Converter: JavaConverter where R: JavaConverter, P0: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let jFutureFunc = try env.CallStaticObjectMethod(SwiftFunctionImpl.implClass, SwiftFunctionImpl.toDeferredMethods[arity], jvalue(l: value))
        let futureFunc = try FutureFunctionConverter.fromJava(jFutureFunc, env: env)
        return fromFutureFunction(futureFunc)
    }

    public static func toJava(_ value: @escaping SwiftType, env: Env) throws -> jobject? {
        let futureFunc = toFutureFunction(value)
        let jFutureFunc = try FutureFunctionConverter.toJavaObject(futureFunc, env: env)
        return try env.CallObjectMethod(jFutureFunc, SwiftFunctionImpl.toSuspendMethods[arity])
    }

    public static func javaSetup(env: Env) throws {
        try FutureFunctionConverter.javaSetup(env: env)
    }
}

extension AsyncFunction2Converter: JavaConverter where R: JavaConverter, P0: JavaConverter, P1: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let jFutureFunc = try env.CallStaticObjectMethod(SwiftFunctionImpl.implClass, SwiftFunctionImpl.toDeferredMethods[arity], jvalue(l: value))
        let futureFunc = try FutureFunctionConverter.fromJava(jFutureFunc, env: env)
        return fromFutureFunction(futureFunc)
    }

    public static func toJava(_ value: @escaping SwiftType, env: Env) throws -> jobject? {
        let futureFunc = toFutureFunction(value)
        let jFutureFunc = try FutureFunctionConverter.toJavaObject(futureFunc, env: env)
        return try env.CallObjectMethod(jFutureFunc, SwiftFunctionImpl.toSuspendMethods[arity])
    }

    public static func javaSetup(env: Env) throws {
        try FutureFunctionConverter.javaSetup(env: env)
    }
}

extension AsyncFunction3Converter: JavaConverter where R: JavaConverter, P0: JavaConverter, P1: JavaConverter, P2: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let jFutureFunc = try env.CallStaticObjectMethod(SwiftFunctionImpl.implClass, SwiftFunctionImpl.toDeferredMethods[arity], jvalue(l: value))
        let futureFunc = try FutureFunctionConverter.fromJava(jFutureFunc, env: env)
        return fromFutureFunction(futureFunc)
    }

    public static func toJava(_ value: @escaping SwiftType, env: Env) throws -> jobject? {
        let futureFunc = toFutureFunction(value)
        let jFutureFunc = try FutureFunctionConverter.toJavaObject(futureFunc, env: env)
        return try env.CallObjectMethod(jFutureFunc, SwiftFunctionImpl.toSuspendMethods[arity])
    }

    public static func javaSetup(env: Env) throws {
        try FutureFunctionConverter.javaSetup(env: env)
    }
}

extension AsyncFunction4Converter: JavaConverter where R: JavaConverter, P0: JavaConverter, P1: JavaConverter, P2: JavaConverter, P3: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let jFutureFunc = try env.CallStaticObjectMethod(SwiftFunctionImpl.implClass, SwiftFunctionImpl.toDeferredMethods[arity], jvalue(l: value))
        let futureFunc = try FutureFunctionConverter.fromJava(jFutureFunc, env: env)
        return fromFutureFunction(futureFunc)
    }

    public static func toJava(_ value: @escaping SwiftType, env: Env) throws -> jobject? {
        let futureFunc = toFutureFunction(value)
        let jFutureFunc = try FutureFunctionConverter.toJavaObject(futureFunc, env: env)
        return try env.CallObjectMethod(jFutureFunc, SwiftFunctionImpl.toSuspendMethods[arity])
    }

    public static func javaSetup(env: Env) throws {
        try FutureFunctionConverter.javaSetup(env: env)
    }
}

extension AsyncFunction5Converter: JavaConverter where R: JavaConverter, P0: JavaConverter, P1: JavaConverter, P2: JavaConverter, P3: JavaConverter, P4: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let jFutureFunc = try env.CallStaticObjectMethod(SwiftFunctionImpl.implClass, SwiftFunctionImpl.toDeferredMethods[arity], jvalue(l: value))
        let futureFunc = try FutureFunctionConverter.fromJava(jFutureFunc, env: env)
        return fromFutureFunction(futureFunc)
    }

    public static func toJava(_ value: @escaping SwiftType, env: Env) throws -> jobject? {
        let futureFunc = toFutureFunction(value)
        let jFutureFunc = try FutureFunctionConverter.toJavaObject(futureFunc, env: env)
        return try env.CallObjectMethod(jFutureFunc, SwiftFunctionImpl.toSuspendMethods[arity])
    }

    public static func javaSetup(env: Env) throws {
        try FutureFunctionConverter.javaSetup(env: env)
    }
}

extension AsyncFunction6Converter: JavaConverter where R: JavaConverter, P0: JavaConverter, P1: JavaConverter, P2: JavaConverter, P3: JavaConverter, P4: JavaConverter, P5: JavaConverter {
    public static var javaClass: jclass? {
        SwiftFunctionImpl.implClass
    }

    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        let jFutureFunc = try env.CallStaticObjectMethod(SwiftFunctionImpl.implClass, SwiftFunctionImpl.toDeferredMethods[arity], jvalue(l: value))
        let futureFunc = try FutureFunctionConverter.fromJava(jFutureFunc, env: env)
        return fromFutureFunction(futureFunc)
    }

    public static func toJava(_ value: @escaping SwiftType, env: Env) throws -> jobject? {
        let futureFunc = toFutureFunction(value)
        let jFutureFunc = try FutureFunctionConverter.toJavaObject(futureFunc, env: env)
        return try env.CallObjectMethod(jFutureFunc, SwiftFunctionImpl.toSuspendMethods[arity])
    }

    public static func javaSetup(env: Env) throws {
        try FutureFunctionConverter.javaSetup(env: env)
    }
}

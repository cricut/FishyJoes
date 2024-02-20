// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import CommonInterface
import FishyJoesJavaRuntime
import Foundation
import TestAPI

struct _JavaAProtocol: AProtocol {
    let _javaWitness: JavaReference

    static var _fooGetMethodID: jmethodID?
    static var _fooSetMethodID: jmethodID?
    public var foo: String {
        get {
            let env = try! _javaWitness.currentThreadEnv()
            return try! Swift.String.fromJava(
                env.CallObjectMethod(_javaWitness.object, Self._fooGetMethodID),
                env: env
            )
        }
        set {
            let env = try! _javaWitness.currentThreadEnv()
            let javaNewValue = try! Swift.String.toJava(newValue, env: env)
            try! env.CallVoidMethod(_javaWitness.object, Self._fooSetMethodID, jvalue(javaNewValue))
        }
    }

    static var _bazGetMethodID: jmethodID?
    static var _bazSetMethodID: jmethodID?
    public var baz: Bool {
        get {
            let env = try! _javaWitness.currentThreadEnv()
            return try! Swift.Bool.fromJava(
                env.CallBooleanMethod(_javaWitness.object, Self._bazGetMethodID),
                env: env
            )
        }
        set {
            let env = try! _javaWitness.currentThreadEnv()
            let javaNewValue = try! Swift.Bool.toJava(newValue, env: env)
            try! env.CallVoidMethod(_javaWitness.object, Self._bazSetMethodID, jvalue(javaNewValue))
        }
    }

    static var _barMethodID: jmethodID?
    public func bar(x: Int, y: Int) -> AProtocol {
        let env = try! _javaWitness.currentThreadEnv()
        return try! _AProtocolConverter.fromJava(
            env.CallObjectMethod(
                _javaWitness.object,
                Self._barMethodID,
                jvalue(try Swift.Int.toJava(x, env: env)),
                jvalue(try Swift.Int.toJava(y, env: env))
            ),
            env: env
        )
    }

    static var _hasADefaultImplementationMethodID: jmethodID?
    public var hasADefaultImplementationImpl: ((Int, Double) -> String)?
    public func hasADefaultImplementation(x: Int, y: Double) -> String {
        guard let hasADefaultImplementationImpl = hasADefaultImplementationImpl else {
            return _JavaAProtocol_sans_hasADefaultImplementation(wrapped: self).hasADefaultImplementation(x: x, y: y)
        }
        return hasADefaultImplementationImpl(x, y)
    }

    static var _hasADefaultImplementation2MethodID: jmethodID?
    public var hasADefaultImplementation2Impl: ((String, Bool, Double) -> Double)?
    public func hasADefaultImplementation2(a: String, b: Bool, c: Double) -> Double {
        guard let hasADefaultImplementation2Impl = hasADefaultImplementation2Impl else {
            return _JavaAProtocol_sans_hasADefaultImplementation2(wrapped: self).hasADefaultImplementation2(a: a, b: b, c: c)
        }
        return hasADefaultImplementation2Impl(a, b, c)
    }
}

struct _JavaAProtocol_sans_hasADefaultImplementation: AProtocol {
    var wrapped: AProtocol

    public var foo: String {
        get {
            wrapped.foo
        }
        set {
            wrapped.foo = newValue
        }
    }

    public var baz: Bool {
        get {
            wrapped.baz
        }
        set {
            wrapped.baz = newValue
        }
    }

    public func bar(x: Int, y: Int) -> AProtocol {
        wrapped.bar(x: x, y: y)
    }

    public func hasADefaultImplementation2(a: String, b: Bool, c: Double) -> Double {
        wrapped.hasADefaultImplementation2(a: a, b: b, c: c)
    }
}

struct _JavaAProtocol_sans_hasADefaultImplementation2: AProtocol {
    var wrapped: AProtocol

    public var foo: String {
        get {
            wrapped.foo
        }
        set {
            wrapped.foo = newValue
        }
    }

    public var baz: Bool {
        get {
            wrapped.baz
        }
        set {
            wrapped.baz = newValue
        }
    }

    public func bar(x: Int, y: Int) -> AProtocol {
        wrapped.bar(x: x, y: y)
    }

    public func hasADefaultImplementation(x: Int, y: Double) -> String {
        wrapped.hasADefaultImplementation(x: x, y: y)
    }
}

extension _AProtocolConverter: JavaMutator {
    public typealias CType = jobject?
    public static var javaClass: jclass?
    public static var externalWitnessClass: jclass?
    public static var externalWitnessConstructor: jmethodID?
    public static var externalCompanionClass: jclass?
    public static func fromJava(_ value: jobject?, env: Env) throws -> SwiftType {
        if env.IsInstanceOf(value, AnyBox.javaClass) {
            return try Box<SwiftType>.fromJava(value, env: env).value
        }
        return _JavaAProtocol(_javaWitness: try JavaReference(local: value, env: env))
    }
    public static func toJava(_ value: SwiftType, env: Env) throws -> jobject? {
        try env.NewObject(
            externalWitnessClass,
            externalWitnessConstructor,
            jvalue(j: jlong(UInt(bitPattern: Box(value).retainedOpaque())))
        )
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout SwiftType) throws -> R) throws -> R {
        try body(&Box<SwiftType>.fromJava(this, env: env).value)
    }
    public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout SwiftType, inout Env) async throws -> R) async throws -> R {
        try await body(&Box<SwiftType>.fromJava(this, env: env).value, &env)
    }
    public static func javaSetup(env: Env) throws {
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/AProtocol"))
        externalWitnessClass = try env.globalRef(env.FindClass("com/cricut/testapi/_ExternalWitness_AProtocol"))
        externalWitnessConstructor = try env.GetMethodID(externalWitnessClass, "<init>", "(J)V")
        _JavaAProtocol._fooGetMethodID = try env.GetMethodID(javaClass, "getFoo", "()Ljava/lang/String;")
        _JavaAProtocol._fooSetMethodID = try env.GetMethodID(javaClass, "setFoo", "(Ljava/lang/String;)V")
        _JavaAProtocol._bazGetMethodID = try env.GetMethodID(javaClass, "getBaz", "()Z")
        _JavaAProtocol._bazSetMethodID = try env.GetMethodID(javaClass, "setBaz", "(Z)V")
        _JavaAProtocol._barMethodID = try env.GetMethodID(javaClass, "bar", "(JJ)Lcom/cricut/testapi/AProtocol;")
        externalCompanionClass = try env.globalRef(env.FindClass("com/cricut/testapi/AProtocol$Companion"))
        _JavaAProtocol._hasADefaultImplementationMethodID = try env.GetMethodID(javaClass, "hasADefaultImplementation", "(JD)Ljava/lang/String;")
        _JavaAProtocol._hasADefaultImplementation2MethodID = try env.GetMethodID(javaClass, "hasADefaultImplementation2", "(Ljava/lang/String;ZD)D")
    }
}

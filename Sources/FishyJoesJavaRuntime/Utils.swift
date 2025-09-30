@_exported import FishyJoesCommonRuntime
import Foundation
@_exported import JNI

public func javaNonNull<Result>(file: StaticString = #file, line: UInt = #line, _ result: Result?) throws -> Result {
    guard let result = result else {
        var message = ["\(file):\(line): Unexpected null"]
        Thread.callStackSymbols.forEach { message.append($0) }
        throw NullPointerError(message: message.joined(separator: "\n"))
    }
    return result
}

public func javaOk(file: StaticString = #file, line: UInt = #line, _ result: jint) throws {
    guard result == JNI_OK else {
        throw JNIError(message: "\(file):\(line): unknown jni call failed")
    }
}

public func callbackBody<Result: Defaultable>(
    _ env: UnsafeMutablePointer<JNIEnv?>,
    _ body: (_ env: Env) throws -> Result
) -> Result {
    let env = Env(env: env)
    do {
        return try body(env)
    } catch let e {
        if env.ExceptionCheck() {
            // no need to generate an exception, one is already pending and is probably the root cause
            return .default
        }
        if let nullError = e as? NullPointerError {
            guard let errorClass = try? env.FindClass("java/lang/NullPointerException"),
                  env.ThrowNew(errorClass, nullError.message) else {
                fatalError("error while throwing an error")
            }
            return .default
        } else if let throwableError = e as? JavaThrowableError {
            guard env.Throw(throwableError.ref.object) else {
                fatalError("error while throwing an error")
            }
            return .default
        } else {
            guard let errorClass = try? env.FindClass("java/lang/Error"),
                  env.ThrowNew(errorClass, "\(e)") else {
                fatalError("error while throwing an error")
            }
            return .default
        }
    }
}

public func callbackBody(
    _ env: UnsafeMutablePointer<JNIEnv?>,
    _ body: (_ env: Env) throws -> Void
) {
    let env = Env(env: env)
    do {
        try body(env)
    } catch let e {
        if env.ExceptionCheck() {
            // no need to generate an exception, one is already pending and is probably the root cause
            return
        }
        print("Caught swift error \(e). Re-throwing to java.")
        guard let errorClass = try? env.FindClass("java/lang/Error"),
              env.ThrowNew(errorClass, "\(e)") else {
            fatalError("error while throwing an error")
        }
    }
}

/// Calls the given body while ensuring that the body closure is attached to the JVM.
///
/// - Important: When a suspending function is called part of the state that must be protected by calling ``Env.relinquishJVMThread(on:)`` immediately before and ``Env.acquireJVMThread(on:)`` immediately after.
///     The returned `Env` should generally be assigned to the inout `javaEnv` in order to avoid shadowing and let the current environment propagate back out.
///
/// - Important: body **must** be in a balanced acquire/relinquish state before it throws.
public func swiftTask(env: Env, _ body: @escaping @Sendable (_ javaEnv: inout Env, _ javaVM: UnsafeMutablePointer<JavaVM?>) async throws -> jobject?) throws -> jobject? {
    guard let jvm = try env.GetJavaVM() else {
        fatalError("Unable to get JVM")
    }
    return try Future {
        var javaEnv = try Env.acquireJVMThread(on: jvm)
        defer { try! Env.relinquishJVMThread(on: jvm) }
        let value = try await body(&javaEnv, jvm)
        return try JavaReference(local: value, env: javaEnv)
    }.toJava(env: env)
}

enum JavaError {
    static var throwableClass: jclass!
    static var throwableInit: jmethodID!

    static var errorClass: jclass!
    static var nullPointerClass: jclass!

    public static func javaSetup(env: Env) throws {
        throwableClass = try env.globalRef(env.FindClass("java/lang/Throwable"))
        throwableInit = try env.GetMethodID(throwableClass, "<init>", "(Ljava/lang/String;)V")

        errorClass = try env.globalRef(env.FindClass("java/lang/Error"))
        nullPointerClass = try env.globalRef(env.FindClass("java/lang/NullPointerException"))
    }
}

public func javaError(error: any Error, env: Env) throws -> jobject? {
    if let throwableError = error as? JavaThrowableError {
        return throwableError.ref.createLocalRef(env: env)
    }

    let errorClass: jclass!
    let message: String
    if let nullError = error as? NullPointerError {
        errorClass = JavaError.nullPointerClass
        message = nullError.message
    } else {
        errorClass = JavaError.errorClass
        message = "\(error)"
    }
    return try env.NewObject(errorClass, JavaError.throwableInit, jvalue(l: String.toJava(message, env: env)))
}

public struct JavaExceptionPending: Error {}
public struct NullPointerError: Error {
    public let message: String
}

public struct JNIError: Error {
    public let message: String

    public init(message: String) {
        self.message = message
    }
}

public struct JavaThrowableError: Error {
    public let ref: JavaReference
    public let message: String

    public init(local throwable: jobject?, env: Env) throws {
        message = try env.javaDescription(throwable)
        ref = try JavaReference(local: throwable, env: env)
    }
}

public class CStringBag {
    private var strings: [UnsafeMutablePointer<CChar>] = []

    public init() {
    }

    public func add(_ string: String) -> UnsafeMutablePointer<CChar> {
        let len = string.utf8.count + 1
        let pointer = UnsafeMutablePointer<CChar>.allocate(capacity: len)
        strings.append(pointer)
        string.withCString { ptr in
            pointer.initialize(from: ptr, count: len)
        }
        return pointer
    }

    deinit {
        strings.forEach {
            $0.deallocate()
        }
        strings = []
    }
}

extension jlong {
    public static func from(pointer: UnsafeRawPointer) -> jlong {
        jlong(Int64(bitPattern: UInt64(UInt(bitPattern: pointer))))
    }
}

// HACK: These used to be in an extension of the `jvalue` type, but there's a bug in swift-android 6.2:
// C types, extended in one module, aren't visible from a different module (U+1F937 SHRUG).
// Type name is extra ugly on purpose.
public enum JVALUE {
    public static func from(_ value: jboolean) -> jvalue {
        jvalue(z: value)
    }
    public static func from(_ value: jbyte) -> jvalue {
        jvalue(b: value)
    }
    public static func from(_ value: jchar) -> jvalue {
        jvalue(c: value)
    }
    public static func from(_ value: jshort) -> jvalue {
        jvalue(s: value)
    }
    public static func from(_ value: jint) -> jvalue {
        jvalue(i: value)
    }
    public static func from(_ value: jlong) -> jvalue {
        jvalue(j: value)
    }
    public static func from(_ value: jfloat) -> jvalue {
        jvalue(f: value)
    }
    public static func from(_ value: jdouble) -> jvalue {
        jvalue(d: value)
    }
    public static func from(_ value: jobject?) -> jvalue {
        jvalue(l: value)
    }

    public static func from(pointer: UnsafeRawPointer) -> jvalue {
        jvalue(j: jlong.from(pointer: pointer))
    }
}

extension UInt {
    public init(pointerValue: jlong) {
        self = UInt(UInt64(bitPattern: Int64(pointerValue)))
    }
}

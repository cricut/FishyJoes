import Foundation
@_exported import JNI
@_exported import FishyJoesCommonRuntime

public func javaNonNull<Result>(_ result: Result?) throws -> Result {
    guard let result = result else {
        throw JavaExceptionPending()
    }
    return result
}

public func javaOk(_ result: jint) throws {
    guard result == JNI_OK else {
        throw JNIError(message: "unknown jni call failed")
    }
}

public struct Env {
    public var env: UnsafeMutablePointer<JNIEnv?>
    // public var vm: UnsafeMutablePointer<JavaVM?>

    @inlinable
    @inline(__always)
    public var fns: JNIEnv.Pointee {
        env.pointee!.pointee
    }

    public func globalRef(_ object: jobject?) throws -> jobject {
        try javaNonNull(fns.NewGlobalRef(env, javaNonNull(object)))
    }
}

public func callbackBody<Result: Default>(
    _ env: UnsafeMutablePointer<JNIEnv?>,
    _ body: (_ env: Env) throws -> Result
) -> Result {
    let env = Env(env: env)
    do {
        return try body(env)
    } catch let e {
        if(env.fns.ExceptionOccurred(env.env) != nil) {
            // no need to generate an exception, one is already pending and is probably the root cause
            return .default
        }
        print("Caught swift error \(e). Re-throwing to java.")
        guard let errorClass = env.fns.FindClass(env.env, "java/lang/Error"),
              env.fns.ThrowNew(env.env, errorClass, "\(e)") == JNI_OK else {
            fatalError("error while throwing an error")
        }
        return .default
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
        if(env.fns.ExceptionOccurred(env.env) != nil) {
            // no need to generate an exception, one is already pending and is probably the root cause
            return
        }
        print("Caught swift error \(e). Re-throwing to java.")
        guard let errorClass = env.fns.FindClass(env.env, "java/lang/Error"),
              env.fns.ThrowNew(env.env, errorClass, "\(e)") == JNI_OK else {
            fatalError("error while throwing an error")
        }
    }
}

public struct JavaExceptionPending: Error {
}

public struct JNIError: Error {
    public let message: String

    public init(message: String) {
        self.message = message
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

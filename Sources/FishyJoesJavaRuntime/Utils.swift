import Foundation
@_exported import JNI
@_exported import FishyJoesCommonRuntime

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

extension Env {
    public func callbackBody<Result: Default>(_ body: () throws -> Result) -> Result {
        do {
            return try body()
        } catch let e {
            if ExceptionCheck() {
                // no need to generate an exception, one is already pending and is probably the root cause
                ExceptionDescribe()
                return .default
            }
            print("Caught swift error \(e). Not Re-throwing to java.")
            if let nullError = e as? NullPointerError {
                guard let errorClass = try? FindClass("java/lang/NullPointerException"),
                      ThrowNew(errorClass, nullError.message) else {
                    fatalError("error while throwing an error")
                }
                return .default
            } else {
                guard let errorClass = try? FindClass("java/lang/Error"),
                      ThrowNew(errorClass, "\(e)") else {
                    fatalError("error while throwing an error")
                }
                return .default
            }
        }
    }

    public func callbackBody(_ body: () throws -> Void) {
        do {
            try body()
        } catch let e {
            if ExceptionCheck() {
                // no need to generate an exception, one is already pending and is probably the root cause
                ExceptionDescribe()
                return
            }
            print("Caught swift error \(e). Re-throwing to java.")
            guard let errorClass = try? FindClass("java/lang/Error"),
                  ThrowNew(errorClass, "\(e)") else {
                fatalError("error while throwing an error")
            }
        }
    }
}

public func callbackBody<Result: Default>(
    _ env: UnsafeMutablePointer<JNIEnv?>,
    _ body: (_ env: Env) throws -> Result
) -> Result {
    let env = Env(env: env)
    return env.callbackBody { try body(env) }
}

public func callbackBody(
    _ env: UnsafeMutablePointer<JNIEnv?>,
    _ body: (_ env: Env) throws -> Void
) {
    let env = Env(env: env)
    env.callbackBody { try body(env) }
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

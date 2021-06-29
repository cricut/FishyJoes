import Foundation
import NodeAPI

public struct JSException: Error {
    public let message: String

    public init(message: String) {
        self.message = message
    }
}

public func callbackBody(
    _ env: napi_env!,
    _ info: napi_callback_info!,
    name: String,
    expectedArgumentCount: Int,
    _ body: (_ env: CallbackEnv) throws -> napi_value?
) -> napi_value? {
    let env = CallbackEnv(env: env, info: info, name: name, expectedArgumentCount: expectedArgumentCount)
    return rethrowToNode(env: env.env) {
        if let ret = try body(env) {
            return ret
        } else {
            var null: napi_value?
            try check(napi_get_null(env.env, &null))
            return null
        }
    }
}

public func check(env: napi_env, _ status: napi_status) throws {
    guard status == napi_ok else {
        var err: UnsafePointer<napi_extended_error_info>?
        napi_get_last_error_info(env, &err)
        let message = err.flatMap(\.pointee.error_message).map(String.init) ?? "unknown error"
        throw JSException(message: "n-api error: \(message)")
    }
}

public func check(_ status: napi_status, file: StaticString = #file, line: UInt = #line) throws {
    guard status == napi_ok else {
        throw JSException(message: "n-api failure \(status) at \(file):\(line)")
    }
}

public func rethrowToNode(env: napi_env, _ body: () throws -> napi_value?) -> napi_value? {
    do {
        return try body()
    } catch let e {
        print("Caught swift error \(e). Re-throwing to node.")
        _ = napi_throw(env, try? e.localizedDescription.toNode(env: env))
        return nil
    }
}

public class ArgumentBuffer {
    public let count: Int
    let buffer: UnsafeMutablePointer<napi_value?>

    init(capacity: Int) {
        count = capacity
        buffer = .allocate(capacity: capacity)
    }

    public subscript(_ index: Int) -> napi_value? {
        precondition(0 <= index && index < count, "index \(index) out of bounds)")
        return buffer[index]
    }
}

public class CallbackEnv {
    public let env: napi_env
    public let info: napi_callback_info
    public let name: String
    public let expectedArgumentCount: Int

    // `this` is at index 0, arguments begin at index 1
    private var argumentBuffer: UnsafeMutablePointer<napi_value?>?

    public init(env: napi_env, info: napi_callback_info, name: String, expectedArgumentCount: Int) {
        self.env = env
        self.info = info
        self.name = name
        self.expectedArgumentCount = expectedArgumentCount
    }

    deinit {
        argumentBuffer?.deallocate()
    }
}

extension CallbackEnv {
    private func arguments() throws -> UnsafeMutablePointer<napi_value?> {
        if let args = argumentBuffer {
            return args
        }

        var argc = 0
        try check(napi_get_cb_info(env, info, &argc, nil, nil, nil))
        guard expectedArgumentCount == argc else {
            // TODO: print arguments.buffer
            throw JSException(message: "arity error, \(name) expects \(expectedArgumentCount) arguments, but got \(argc)")
        }
        // [this, arg0, arg1, ...]
        argumentBuffer = .allocate(capacity: argc + 1)
        try check(napi_get_cb_info(env, info, &argc, argumentBuffer! + 1, argumentBuffer, nil))
        return argumentBuffer!
    }

    public func this() throws -> napi_value? {
        try arguments()[0]
    }

    public func argument(at index: Int) throws -> napi_value? {
        try arguments()[index + 1]
    }

    public func argument<T: NodeConvertible>(at index: Int, as type: T.Type) throws -> T {
        try T(fromNode: argument(at: index), env: env)
    }

    public func argument<T0: NodeConvertible, T1: NodeConvertible>(at index: Int, as type: (T0, T1).Type) throws -> (T0, T1) {
        var value0: napi_value?
        var value1: napi_value?
        let argument = try arguments()[index + 1]
        try check(napi_get_property(env, argument, "0".toNode(env: env), &value0))
        try check(napi_get_property(env, argument, "1".toNode(env: env), &value1))
        return try (
            T0(fromNode: value0, env: env),
            T1(fromNode: value1, env: env)
        )
    }

    public func this<T: NodeConvertible>(as type: T.Type) throws -> T {
        try T(fromNode: this(), env: env)
    }
}

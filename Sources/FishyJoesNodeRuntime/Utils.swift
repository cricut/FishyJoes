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
        _ = napi_throw(env, try? String.toNode(e.localizedDescription, env: env))
        return nil
    }
}

public class CallbackEnv {
    public let env: napi_env
    public let info: napi_callback_info
    public let name: String
    public let expectedArgumentCount: Int

    // `this` is at index 0, arguments begin at index 1
    private var argumentBuffer: UnsafeMutablePointer<napi_value?>?
    private var _data: UnsafeMutableRawPointer?

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
        try check(napi_get_cb_info(env, info, &argc, nil, nil, &_data))
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

    public func data() throws -> UnsafeMutableRawPointer? {
        _ = try arguments()
        return _data
    }

    public func argument<T: NodeConverter>(at index: Int, converter type: T.Type) throws -> T.SwiftType {
        try T.fromNode(argument(at: index), env: env)
    }

    public func this<T: NodeConverter>(converter type: T.Type) throws -> T.SwiftType {
        try T.fromNode(this(), env: env)
    }
}

public func mergeDefinitionInto(env: napi_env, module: napi_value?, path: String, nodeClass: napi_value?) throws {
    var namespace = path.split(separator: ".").map(String.init)
    let name = namespace.last!
    _ = namespace.popLast()

    func findNamespace<S: Collection>(object: napi_value?, parts: S) throws -> napi_value? where S.Element == String {
        guard let name = parts.first else {
            return object
        }
        var property: napi_value?
        try check(napi_get_named_property(env, object, name, &property))

        if try nodeIsUndefiend(property, env: env) {
            try check(napi_create_object(env, &property))
            try check(napi_set_named_property(env, object, name, property))
        }

        return try findNamespace(object: property, parts: parts.dropFirst())
    }
    let namespaceObject = try findNamespace(object: module, parts: namespace)

    var existingObject: napi_value?
    try check(napi_get_named_property(env, namespaceObject, name, &existingObject))
    if try !nodeIsUndefiend(existingObject, env: env) {
        // Object.assign(nodeClass, existingObject)
        var global: napi_value?
        try check(napi_get_global(env, &global))
        var object: napi_value?
        try check(napi_get_named_property(env, global, "Object", &object))
        var assign: napi_value?
        try check(napi_get_named_property(env, object, "assign", &assign))

        var unusedResult: napi_value?
        let argv = [nodeClass, existingObject]
        try check(napi_call_function(env, global, assign, argv.count, argv, &unusedResult))
    }

    try check(napi_set_named_property(env, namespaceObject, name, nodeClass))
}

public func nodeDescribe(_ value: napi_value?, env: napi_env) throws -> String {
    guard value != nil else {
        return "<nil>"
    }
    var str: napi_value?
    try check(napi_coerce_to_string(env, value, &str))
    return try String.fromNode(str, env: env)
}

public func nodeIsUndefiend(_ value: napi_value?, env: napi_env) throws -> Bool {
    var type = napi_undefined
    try check(napi_typeof(env, value, &type))
    return type == napi_undefined
}

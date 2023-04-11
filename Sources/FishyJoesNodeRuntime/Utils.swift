import Foundation
import NodeAPI

public struct JSException: Error {
    public let message: String

    public init(message: String) {
        self.message = message
    }
}

// Node has already recorded an exception. Let it propigate.
public struct JSExceptionPending: Error {}

public func callbackBody(
    _ env: napi_env!,
    _ info: napi_callback_info!,
    name: String,
    expectedArgumentCount: Int,
    hasNamedOptions: Bool = false,
    _ body: (_ env: CallbackEnv) throws -> NAPI.Value?
) -> napi_value? {
    let env = CallbackEnv(
        env: NAPI.Env(ptr: env),
        napiInfo: .init(ptr: info),
        name: name,
        expectedArgumentCount: expectedArgumentCount,
        hasNamedOptions: hasNamedOptions
    )
    return rethrowToNode(env: env.env) {
        try body(env)
    }
}

public func rethrowToNode(env: NAPI.Env, _ body: () throws -> NAPI.Value?) -> napi_value? {
    do {
        return try body()?.ptr
    } catch is JSExceptionPending {
        // let js deal with the exception
        return nil
    } catch let e {
        print("Caught swift error \(e). Re-throwing to node.")
        try? env.throw(String.toNode(e.localizedDescription, env: env))
        return nil
    }
}
public func mergeDefinitionInto(env: NAPI.Env, module: NAPI.Value, path: String, nodeClass: NAPI.Value) throws {
    var namespace = path.split(separator: ".").map(String.init)
    let name = namespace.last!
    _ = namespace.popLast()

    func findNamespace<S: Collection>(object: NAPI.Value, parts: S) throws -> NAPI.Value where S.Element == String {
        guard let name = parts.first else {
            return object
        }
        var property = try env.getNamedProperty(object, name)

        if try nodeIsUndefiend(property, env: env) {
            property = try env.createObject()
            try env.setNamedProperty(object, name, property)
        }

        return try findNamespace(object: property, parts: parts.dropFirst())
    }
    let namespaceObject = try findNamespace(object: module, parts: namespace)

    let existingObject = try env.getNamedProperty(namespaceObject, name)
    if try !nodeIsUndefiend(existingObject, env: env) {
        // Object.assign(nodeClass, existingObject)
        let global = try env.getGlobal()
        let object = try env.getNamedProperty(global, "Object")
        let assign = try env.getNamedProperty(object, "assign")

        _ = try env.callFunction(global, assign, [nodeClass, existingObject])
    }

    try env.setNamedProperty(namespaceObject, name, nodeClass)
}

public func nodeDescribe(_ value: NAPI.Value?, env: NAPI.Env) throws -> String {
    guard let value = value else {
        return "<nil>"
    }
    return try String.fromNode(env.coerceToString(value), env: env)
}

public func nodeIsUndefiend(_ value: NAPI.Value, env: NAPI.Env) throws -> Bool {
    return try env.typeof(value) == napi_undefined
}

// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _NodeAProtocol: TestAPI.AProtocol {
    let _nodeWitness: NodeReference

    var foo: String {
        get throws {
            let env = _nodeWitness.env
            let napiValue = try _nodeWitness.value(env: env)
            let foo = try env.getNamedProperty(napiValue, "foo")
            return try String.fromNode(foo, env: env)
        }
    }
    var baz: Bool {
        get throws {
            let env = _nodeWitness.env
            let napiValue = try _nodeWitness.value(env: env)
            let baz = try env.getNamedProperty(napiValue, "baz")
            return try Bool.fromNode(baz, env: env)
        }
    }
    public func bar(x: Int, y: Int) throws -> AProtocol {
        let env = _nodeWitness.env
        let napiValue = try _nodeWitness.value(env: env)
        let bar = try env.getNamedProperty(napiValue, "bar")
        let result = try env.callFunction(napiValue, bar, [try Swift.Int.toNode(x, env: env),try Swift.Int.toNode(y, env: env)])
        return try TestAPI_CommonInterface._AProtocolConverter.fromNode(result, env: env)
    }
    public func hasADefaultImplementation(x: Int, y: Double) throws -> String {
        let env = _nodeWitness.env
        let napiValue = try _nodeWitness.value(env: env)
        let hasADefaultImplementation = try env.getNamedProperty(napiValue, "hasADefaultImplementation")
        let result = try env.callFunction(napiValue, hasADefaultImplementation, [try Swift.Int.toNode(x, env: env),try Swift.Double.toNode(y, env: env)])
        return try Swift.String.fromNode(result, env: env)
    }
    public func hasADefaultImplementation2(_ a: String, b: Bool, _ c: Double) throws -> Double {
        let env = _nodeWitness.env
        let napiValue = try _nodeWitness.value(env: env)
        let hasADefaultImplementation2 = try env.getNamedProperty(napiValue, "hasADefaultImplementation2")
        let result = try env.callFunction(napiValue, hasADefaultImplementation2, [try Swift.String.toNode(a, env: env),try Swift.Bool.toNode(b, env: env),try Swift.Double.toNode(c, env: env)])
        return try Swift.Double.fromNode(result, env: env)
    }
}

extension TestAPI_CommonInterface._AProtocolConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestAPI.AProtocol", env: env)
            if try env.instanceof(value, constructor) {
                guard let nonNilPointer = try env.unwrap(value) else {
                    throw JSException(message: "expected TestAPI.AProtocol, got nil")
                }
                return try Box<TestAPI.AProtocol>.takeUnretainedOpaque(nonNilPointer).value
            } else {
                return _NodeAProtocol(
                    _nodeWitness: try NodeReference(env: env, value: value),
                    foo: String(),
                    baz: Bool()
                )
            }
        } catch {
            throw error
        }
    }
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_AProtocol", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "ExternalWitness_AProtocol",
            properties: [
                "bar": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "bar", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try TestAPI_CommonInterface._AProtocolConverter.toNode(
                                env.this(converter: TestAPI.AProtocol.self).bar(
                                    x: try env.argument(at: 0, converter: Swift.Int.self),
                                    y: try env.argument(at: 1, converter: Swift.Int.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "hasADefaultImplementation": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "hasADefaultImplementation", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.AProtocol.self).hasADefaultImplementation(
                                    x: try env.argument(at: 0, converter: Swift.Int.self),
                                    y: try env.argument(at: 1, converter: Swift.Double.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "hasADefaultImplementation2": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "hasADefaultImplementation2", expectedArgumentCount: 3, hasNamedOptions: false) { env in
                            let result = try Swift.Double.toNode(
                                env.this(converter: TestAPI.AProtocol.self).hasADefaultImplementation2(
                                    try env.argument(at: 0, converter: Swift.String.self),
                                    b: try env.argument(at: 1, converter: Swift.Bool.self),
                                    try env.argument(at: 2, converter: Swift.Double.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "foo": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "foo", expectedArgumentCount: 0) { env in
                                try Swift.String.toNode(env.this(converter: TestAPI_CommonInterface._AProtocolConverter.self).foo, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "baz": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "baz", expectedArgumentCount: 0) { env in
                                try Swift.Bool.toNode(env.this(converter: TestAPI_CommonInterface._AProtocolConverter.self).baz, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "ExternalWitness_AProtocol_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.AProtocol>.construct(env: env)
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "ExternalWitness_AProtocol",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

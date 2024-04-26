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

    var foo: String { get throws {
        let env = _nodeWitness.env
        let napiValue = try _nodeWitness.value(env: env)
        let foo = try env.getNamedProperty(napiValue, "foo")
//        let str = try env.callFunction(napiValue, hasADefImpl, [])
        return try String.fromNode(foo, env: env)
    }
    }
    var baz: Bool
    var barImpl: (() -> AProtocol)?
    public func bar(x: Int, y: Int) throws -> AProtocol {
        barImpl!()
    }
    var hasADefaultImplementationImpl: (() -> String)?
    public func hasADefaultImplementation(x: Int, y: Double) throws -> String {
//        hasADefaultImplementationImpl!()
        // I want to call the node/javascript side hasADefaultImplementation on ExternalWitness_AProtocol
        // async code how to get environment
        // TODO get the env the right way for async
        // look at async functions
        
        // create a new ExternalWitness_AProtocol javascript object, with the Boxed _nodeWitness.value as the reference it stores from the constructor. It needs a swift pointer, a swift version of AProtocol
        
        // one for Swift object where it points to Javascript methods
        // one that is a javascript object points to swift methods. external witness
        
        let env = _nodeWitness.env
        let napiValue = try _nodeWitness.value(env: env)
        let hasADefImpl = try env.getNamedProperty(napiValue, "hasADefaultImplementation")
        let str = try env.callFunction(napiValue, hasADefImpl, [try Int.toNode(x, env: env), try Double.toNode(y, env: env)])
        return try String.fromNode(str, env: env)
        
        // If I just want to from here call the thing: "hasADefaultImplementation": (
//            .method { env, info in down below in this same file.
        // can I do it?
    }
    var hasADefaultImplementation2Impl: (() -> Double)?
    public func hasADefaultImplementation2(_ a: String, b: Bool, _ c: Double) throws -> Double {
        hasADefaultImplementation2Impl!()
    }
}

extension TestAPI_CommonInterface._AProtocolConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_AProtocol", env: env)
            if try env.instanceof(value, constructor) {
                guard let nonNilPointer = try env.unwrap(value) else {
                    throw JSException(message: "expected TestAPI.AProtocol, got nil")
                }
                return try Box<TestAPI.AProtocol>.takeUnretainedOpaque(nonNilPointer).value
            } else {
                return _NodeAProtocol(
                    _nodeWitness: try NodeReference(env: env, value: value),
//                    foo: String(),
                    baz: Bool()
                )
            }
        } catch {
            print("error: \(error)")
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
                                env.this(converter: TestAPI_CommonInterface._AProtocolConverter.self).bar(
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
                                env.this(converter: TestAPI_CommonInterface._AProtocolConverter.self).hasADefaultImplementation(
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
                                env.this(converter: TestAPI_CommonInterface._AProtocolConverter.self).hasADefaultImplementation2(
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

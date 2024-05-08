// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

struct _NodeTestMethodsProtocol: TestAPI.TestMethodsProtocol {
    let _nodeWitness: NodeReference

    public func foo() throws {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let foo = try env.getNamedProperty(napiValue, "foo")
            _ = try env.callFunction(napiValue, foo, [])
        }
    }
    public func bar() throws -> Bool {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let bar = try env.getNamedProperty(napiValue, "bar")
            let result = try env.callFunction(napiValue, bar, [])
            return try Swift.Bool.fromNode(result, env: env)
        }
    }
    public func baz(qux: Bool) throws {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let baz = try env.getNamedProperty(napiValue, "baz")
            _ = try env.callFunction(napiValue, baz, [try Swift.Bool.toNode(qux, env: env)])
        }
    }
    public func garply(_ _0: String) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let garply = try env.getNamedProperty(napiValue, "garply")
            let result = try env.callFunction(napiValue, garply, [try Swift.String.toNode(_0, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func xyzzy(thud: Int, grault: Array<Double>) throws -> String {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let xyzzy = try env.getNamedProperty(napiValue, "xyzzy")
            let result = try env.callFunction(napiValue, xyzzy, [try Swift.Int.toNode(thud, env: env), try ArrayConverter<Swift.Double>.toNode(grault, env: env)])
            return try Swift.String.fromNode(result, env: env)
        }
    }
    public func plugh(fred: (Bool, Double, Array<String>)) throws -> (Bool, Int, String) {
        try syncOnMainThread { env in
            let napiValue = try _nodeWitness.value(env: env)
            let plugh = try env.getNamedProperty(napiValue, "plugh")
            let result = try env.callFunction(napiValue, plugh, [try Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>.toNode(fred, env: env)])
            return try Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>.fromNode(result, env: env)
        }
    }
}

extension TestAPI_CommonInterface._TestMethodsProtocolConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestMethodsProtocol", env: env)
            if try env.instanceof(value, constructor) {
                guard let nonNilPointer = try env.unwrap(value) else {
                    throw JSException(message: "expected TestAPI.TestMethodsProtocol, got nil")
                }
                return try Box<TestAPI.TestMethodsProtocol>.takeUnretainedOpaque(nonNilPointer).value
            } else {
                return _NodeTestMethodsProtocol(
                    _nodeWitness: try NodeReference(env: env, value: value)
                )
            }
        }}
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestMethodsProtocol", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let coreObject = try env.createFunction(
            "TestMethodsProtocol",
            { env, info in
                fatalError("Constructor should not be called on \"TestMethodsProtocol\", only the \"fromCore\" static method ought to be called.")
            },
            nil
        )
        let fromCoreFunctionCallback: NAPI.Callback = { env, info in
            FishyJoesNodeRuntime.callbackBody(env, info, name: "fromCore", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                let coreArg = try env.argument(at: 0)

                let env = env.env
                let global = try env.getGlobal()
                let object = try env.getNamedProperty(global, "Object")
                let create = try env.getNamedProperty(object, "create")

                let result = try env.callFunction(object, create, [coreArg])

                return result
            }
        }
        let fromCoreFunction = try env.createFunction("fromCore", fromCoreFunctionCallback, nil)
        try env.setNamedProperty(fromCoreFunction, "static", env.getBoolean(true))
        try env.setNamedProperty(coreObject, "fromCore", fromCoreFunction)
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestMethodsProtocol",
            nodeClass: coreObject
        )

        let nodeClass = try NodeClass(
            env: env,
            name: "ExternalWitness_TestMethodsProtocol",
            properties: [
                "foo": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "foo", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestMethodsProtocolConverter.self).foo(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "bar": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "bar", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.Bool.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestMethodsProtocolConverter.self).bar(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "baz": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "baz", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestMethodsProtocolConverter.self).baz(
                                    qux: try env.argument(at: 0, converter: Swift.Bool.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "garply": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "garply", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestMethodsProtocolConverter.self).garply(
                                    try env.argument(at: 0, converter: Swift.String.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "xyzzy": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "xyzzy", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestMethodsProtocolConverter.self).xyzzy(
                                    thud: try env.argument(at: 0, converter: Swift.Int.self),
                                    grault: try env.argument(at: 1, converter: ArrayConverter<Swift.Double>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "plugh": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "plugh", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Tuple3Converter<Swift.Bool, Swift.Int, Swift.String>.toNode(
                                env.this(converter: TestAPI_CommonInterface._TestMethodsProtocolConverter.self).plugh(
                                    fred: try env.argument(at: 0, converter: Tuple3Converter<Swift.Bool, Swift.Double, ArrayConverter<Swift.String>>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "ExternalWitness_TestMethodsProtocol_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.TestMethodsProtocol>.construct(env: env)
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "ExternalWitness_TestMethodsProtocol",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

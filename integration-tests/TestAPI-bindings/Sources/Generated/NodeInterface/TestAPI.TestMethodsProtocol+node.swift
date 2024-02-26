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

    var fooImpl: (() -> Void)?
    public func foo() throws {
        fooImpl!()
    }
    var barImpl: (() -> Bool)?
    public func bar() throws -> Bool {
        barImpl!()
    }
    var bazImpl: (() -> Void)?
    public func baz(qux: Bool) throws {
        bazImpl!()
    }
    var garplyImpl: (() -> String)?
    public func garply(_ _1: String) throws -> String {
        garplyImpl!()
    }
    var xyzzyImpl: (() -> String)?
    public func xyzzy(thud: Int, grault: Array<Double>) throws -> String {
        xyzzyImpl!()
    }
    var plughImpl: (() -> (Bool, Int, String))?
    public func plugh(fred: (Bool, Double, Array<String>)) throws -> (Bool, Int, String) {
        plughImpl!()
    }
}
extension _TestMethodsProtocolConverter: NodeMutator {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        return _NodeTestMethodsProtocol(
            _nodeWitness: try NodeReference(env: env, value: value)
        )
    }
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestMethodsProtocol", env: env)
        let args: [NAPI.Value] = [
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: SwiftType, this: NAPI.Value, env: NAPI.Env) throws {
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestMethodsProtocol",
            properties: [
                "foo": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "foo", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                env.this(converter: _TestMethodsProtocolConverter.self).foo(
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
                                env.this(converter: _TestMethodsProtocolConverter.self).bar(
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
                                env.this(converter: _TestMethodsProtocolConverter.self).baz(
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
                                env.this(converter: _TestMethodsProtocolConverter.self).garply(
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
                                env.this(converter: _TestMethodsProtocolConverter.self).xyzzy(
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
                                env.this(converter: _TestMethodsProtocolConverter.self).plugh(
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
                callbackBody(env, info, name: "TestMethodsProtocol_constructor", expectedArgumentCount: 0) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestMethodsProtocol",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

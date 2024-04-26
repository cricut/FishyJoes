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
    public func garply(_ _0: String) throws -> String {
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

extension TestAPI_CommonInterface._TestMethodsProtocolConverter: NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> SwiftType {
        do {
            guard let nonNilPointer = try env.unwrap(value) else {
                throw JSException(message: "expected TestAPI.TestMethodsProtocol, got nil")
            }
            return try Box<TestAPI.TestMethodsProtocol>.takeUnretainedOpaque(nonNilPointer).value
        } catch {
            return _NodeTestMethodsProtocol(
                _nodeWitness: try NodeReference(env: env, value: value)
            )
        }
    }
    public static func toNode(_ value: SwiftType, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "ExternalWitness_TestMethodsProtocol", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
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

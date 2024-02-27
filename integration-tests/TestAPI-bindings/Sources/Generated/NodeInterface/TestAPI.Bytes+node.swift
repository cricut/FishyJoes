// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.Bytes: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.Bytes")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "Bytes",
            properties: [
                "echoBytes": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoBytes", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ArrayConverter<Swift.UInt8>.toNode(
                                TestAPI.Bytes.echo(
                                    bytes: try env.argument(at: 0, converter: ArrayConverter<Swift.UInt8>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "echoData": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoData", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Foundation.Data.toNode(
                                TestAPI.Bytes.echo(
                                    data: try env.argument(at: 0, converter: Foundation.Data.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "bytes": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "bytes", expectedArgumentCount: 0) { env in
                                try ArrayConverter<Swift.UInt8>.toNode(TestAPI.Bytes.bytes, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "data": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "data", expectedArgumentCount: 0) { env in
                                try Foundation.Data.toNode(TestAPI.Bytes.data, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "Bytes_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Bytes",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

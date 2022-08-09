// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Bytes: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected Bytes, got nil")
        }
        return try Box<Bytes>.takeUnretainedOpaque(nonNilPointer).value
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        // Uninhabited
    }
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Bytes",
            properties: [
                "echoBytes": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "echoBytes", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try ArrayConverter<UInt8>.toNode(
                                Bytes.echo(
                                    bytes: try env.argument(at: 0, converter: ArrayConverter<UInt8>.self)
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
                                Bytes.echo(
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
                                try ArrayConverter<UInt8>.toNode(Bytes.bytes, env: env.env)
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
                                try Foundation.Data.toNode(Bytes.data, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Bytes_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<Bytes>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Bytes",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

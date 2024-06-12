// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.TestNonExportedProtocolEnum: FishyJoesNodeRuntime.NodeConverter {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        fatalError("invalid enum for TestAPI.TestNonExportedProtocolEnum")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        // Uninhabited type
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "TestNonExportedProtocolEnum",
            properties: [
                "hoge": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "hoge", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.Double.toNode(
                                env.this(converter: TestAPI.TestNonExportedProtocolEnum.self).hoge(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "fuga": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "fuga", expectedArgumentCount: 0) { env in
                                return try Swift.Double.toNode(env.this(converter: TestAPI.TestNonExportedProtocolEnum.self).fuga, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "TestNonExportedProtocolEnum_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestNonExportedProtocolEnum",
            nodeClass: superclass.constructor.value(env: env)
        )
    }
}

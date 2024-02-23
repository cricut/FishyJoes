// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.TestOptionalsProtocol: NodeMutator {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            flarp: try { () -> Optional<Swift.String> in
                let fieldValue = try env.getNamedProperty(value, "flarp")
                return try OptionalConverter<Swift.String>.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestOptionalsProtocol", env: env)
        let args: [NAPI.Value] = [
            try OptionalConverter<Swift.String>.toNode(value.flarp, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestOptionalsProtocol",
            properties: [
                "wombat": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "wombat", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try OptionalConverter<Swift.Double>.toNode(
                                env.this(converter: TestAPI.TestOptionalsProtocol.self).wombat(
                                    zxc: try env.argument(at: 0, converter: OptionalConverter<Swift.Int>.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "spqr": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "spqr", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.Int.toNode(
                                env.this(converter: TestAPI.TestOptionalsProtocol.self).spqr(
                                    try env.argument(at: 0, converter: TestAPI.AssociatedDataEnum.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "flarp": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "flarp", expectedArgumentCount: 0) { env in
                                try OptionalConverter<Swift.String>.toNode(env.this(converter: TestAPI.TestOptionalsProtocol.self).flarp, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "flarp": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "TestOptionalsProtocol_constructor", expectedArgumentCount: 1) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "flarp", env.argument(at: 0))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestOptionalsProtocol",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

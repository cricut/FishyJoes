// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.TestMutatingCounter: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            count: try { () -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "count")
                return try Swift.Int.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestMutatingCounter", env: env)
        let args: [NAPI.Value] = [
            try Swift.Int.toNode(value.count, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "count", Swift.Int.toNode(value.count, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestMutatingCounter",
            properties: [
                "tick": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "tick", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: TestAPI.TestMutatingCounter.self)
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                mutatingSelf.tick(
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "witness": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "witness", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI_CommonInterface._TestMutatingCounterProtocolConverter.toNode(
                                env.this(converter: TestAPI.TestMutatingCounter.self).witness(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "count": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "TestMutatingCounter_constructor", expectedArgumentCount: 1) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "count", env.argument(at: 0))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestMutatingCounter",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

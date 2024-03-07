// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.AProtocolImplementation: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            foo: try { () -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "foo")
                return try Swift.Int.fromNode(fieldValue, env: env)
            }(),
            baz: try { () -> Swift.Bool in
                let fieldValue = try env.getNamedProperty(value, "baz")
                return try Swift.Bool.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "AProtocolImplementation", env: env)
        let args: [NAPI.Value] = [
            try Swift.Int.toNode(value.foo, env: env),
            try Swift.Bool.toNode(value.baz, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "foo", Swift.Int.toNode(value.foo, env: env))
        try env.setNamedProperty(this, "baz", Swift.Bool.toNode(value.baz, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "AProtocolImplementation",
            properties: [
                "increment": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "increment", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            var mutatingSelf = try env.this(converter: TestAPI.AProtocolImplementation.self)
                            let result = try FishyJoesCommonRuntime.VoidConverter.toNode(
                                mutatingSelf.increment(
                                ),
                                env: env.env
                            )
                            try Self.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                            return result
                        }
                    },
                    isStatic: false
                ),
                "foo": (.stored(mutable: true), isStatic: false),
                "baz": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "AProtocolImplementation_constructor", expectedArgumentCount: 2) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "foo", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "baz", env.argument(at: 1))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "AProtocolImplementation",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

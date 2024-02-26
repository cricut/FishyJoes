// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension Swift.String.PuttingTypesIntoQuestionablePlaces: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            x: try { () -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "x")
                return try Swift.String.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "String_PuttingTypesIntoQuestionablePlaces", env: env)
        let args: [NAPI.Value] = [
            try Swift.String.toNode(value.x, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "String_PuttingTypesIntoQuestionablePlaces",
            properties: [
                "testCall": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "testCall", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.Int.toNode(
                                env.this(converter: Swift.String.PuttingTypesIntoQuestionablePlaces.self).testCall(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "x": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "String_PuttingTypesIntoQuestionablePlaces_constructor", expectedArgumentCount: 1) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "x", env.argument(at: 0))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "String_PuttingTypesIntoQuestionablePlaces",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

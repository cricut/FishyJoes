// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.Structs.DougStruct: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            str: try { () -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "str")
                return try Swift.String.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "Structs.DougStruct", env: env)
        let args: [NAPI.Value] = [
            try Swift.String.toNode(value.str, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "str", Swift.String.toNode(value.str, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Structs.DougStruct",
            properties: [
                "cat": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "cat", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.Structs.DougStruct.self).cat(
                                    str: try env.argument(at: 0, converter: Swift.String.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try TestAPI.Structs.DougStruct.toNode(
                                TestAPI.Structs.DougStruct(
                                    str: try env.argument(at: 0, converter: Swift.String.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "str": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "Structs.DougStruct_constructor", expectedArgumentCount: 1) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "str", env.argument(at: 0))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "Structs.DougStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.TestDefaultComputedPropertiesStruct: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            spam: try { () -> Swift.Bool in
                let fieldValue = try env.getNamedProperty(value, "spam")
                return try Swift.Bool.fromNode(fieldValue, env: env)
            }(),
            noot: try { () -> Swift.Int in
                let fieldValue = try env.getNamedProperty(value, "noot")
                return try Swift.Int.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "TestDefaultComputedPropertiesStruct", env: env)
        let args: [NAPI.Value] = [
            try Swift.Bool.toNode(value.spam, env: env),
            try Swift.Int.toNode(value.noot, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "spam", Swift.Bool.toNode(value.spam, env: env))
        try env.setNamedProperty(this, "noot", Swift.Int.toNode(value.noot, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "TestDefaultComputedPropertiesStruct",
            properties: [
                "plutonic": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "plutonic", expectedArgumentCount: 0) { env in
                                try Swift.String.toNode(env.this(converter: TestAPI_CommonInterface._TestDefaultComputedPropertiesConverter.self).pluto, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "spam": (.stored(mutable: true), isStatic: false),
                "noot": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "TestDefaultComputedPropertiesStruct_constructor", expectedArgumentCount: 2) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "spam", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "noot", env.argument(at: 1))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "TestDefaultComputedPropertiesStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

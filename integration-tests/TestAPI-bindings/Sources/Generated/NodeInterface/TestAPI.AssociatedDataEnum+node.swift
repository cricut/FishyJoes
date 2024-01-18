// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.AssociatedDataEnum: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        if try env.instanceof(value, NodeClass.constructor(for: "AssociatedDataEnum.Thing", env: env)) {
            let _value = try env.getNamedProperty(value, "value")
            return Self.thing(
                value: try Swift.Int.fromNode(_value, env: env)
            )
        }

        fatalError("invalid enum for TestAPI.AssociatedDataEnum")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        switch value {
        case let .thing(value):
            return try env.newInstance(
                NodeClass.constructor(for: "AssociatedDataEnum.Thing", env: env),
                [
                    Swift.Int.toNode(value, env: env),
                ]
            )
        }
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let superclass = try NodeClass(
            env: env,
            name: "AssociatedDataEnum",
            properties: [
                "intValue": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "intValue", expectedArgumentCount: 0) { env in
                                try Swift.Int.toNode(env.this(converter: TestAPI.AssociatedDataEnum.self).intValue, env: env.env)
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
                    name: "AssociatedDataEnum_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    return try env.this()
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AssociatedDataEnum",
            nodeClass: superclass.constructor.value(env: env)
        )
        let thingClass = try NodeClass(
            env: env,
            name: "AssociatedDataEnum.Thing",
            superclass: superclass,
            properties: [
                "value": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "AssociatedDataEnum.Thing_constructor",
                    expectedArgumentCount: 1
                ) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "value", env.argument(at: 0))
                    return this
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AssociatedDataEnum.Thing",
            nodeClass: thingClass.constructor.value(env: env)
        )
    }
}

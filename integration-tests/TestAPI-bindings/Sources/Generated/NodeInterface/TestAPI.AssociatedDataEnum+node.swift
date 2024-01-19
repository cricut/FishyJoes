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

        if try env.instanceof(value, NodeClass.constructor(for: "AssociatedDataEnum.Other", env: env)) {
            let _unnamed = try env.getNamedProperty(value, "unnamed")
            let __1 = try env.getNamedProperty(value, "_1")
            return Self.other(
                try Swift.String.fromNode(_unnamed, env: env),
                try Swift.Int.fromNode(__1, env: env)
            )
        }

        if try env.instanceof(value, NodeClass.constructor(for: "AssociatedDataEnum.NoValue", env: env)) {
            return noValue
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
        case let .other(unnamed, _1):
            return try env.newInstance(
                NodeClass.constructor(for: "AssociatedDataEnum.Other", env: env),
                [
                    Swift.String.toNode(unnamed, env: env),
                    Swift.Int.toNode(_1, env: env),
                ]
            )
        case .noValue:
            return try env.newInstance(
                NodeClass.constructor(for: "AssociatedDataEnum.NoValue", env: env),
                [
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
                "plus": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "plus", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try TestAPI.AssociatedDataEnum.toNode(
                                env.this(converter: TestAPI.AssociatedDataEnum.self).plus(
                                    try env.argument(at: 0, converter: TestAPI.AssociatedDataEnum.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "staticThing": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticThing", expectedArgumentCount: 0) { env in
                                try TestAPI.AssociatedDataEnum.toNode(TestAPI.AssociatedDataEnum.staticThing, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
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
        let otherClass = try NodeClass(
            env: env,
            name: "AssociatedDataEnum.Other",
            superclass: superclass,
            properties: [
                "unnamed": (.stored(mutable: true), isStatic: false),
                "_1": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "AssociatedDataEnum.Other_constructor",
                    expectedArgumentCount: 2
                ) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "unnamed", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "_1", env.argument(at: 1))
                    return this
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AssociatedDataEnum.Other",
            nodeClass: otherClass.constructor.value(env: env)
        )
        let noValueClass = try NodeClass(
            env: env,
            name: "AssociatedDataEnum.NoValue",
            superclass: superclass,
            properties: [:],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "AssociatedDataEnum.NoValue_constructor",
                    expectedArgumentCount: 0
                ) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    return this
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AssociatedDataEnum.NoValue",
            nodeClass: noValueClass.constructor.value(env: env)
        )
    }
}

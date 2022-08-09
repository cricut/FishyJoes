// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension AssociatedDataEnum: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        let instanceData = try FishyJoesNodeRuntime.InstanceData.data(for: env)
        if try env.instanceof(value, instanceData.constructor(for: "AssociatedDataEnum.Thing", env: env)) {
            let _value = try env.getNamedProperty(value, "value")
            return Self.thing(
                value: try Int.fromNode(_value, env: env)
            )
        }

        if try env.instanceof(value, instanceData.constructor(for: "AssociatedDataEnum.Other", env: env)) {
            let _unnamed = try env.getNamedProperty(value, "unnamed")
            let __1 = try env.getNamedProperty(value, "_1")
            return Self.other(
                try Swift.String.fromNode(_unnamed, env: env),
                try Int.fromNode(__1, env: env)
            )
        }

        if try env.instanceof(value, instanceData.constructor(for: "AssociatedDataEnum.Bar", env: env)) {
            let _named = try env.getNamedProperty(value, "named")
            let __1 = try env.getNamedProperty(value, "_1")
            return Self.bar(
                named: try Swift.String.fromNode(_named, env: env),
                try AssociatedDataEnum.fromNode(__1, env: env)
            )
        }

        fatalError("invalid enum for AssociatedDataEnum")
    }

    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let instanceData = try FishyJoesNodeRuntime.InstanceData.data(for: env)
        switch value {
        case let .thing(value):
            return try env.newInstance(
                instanceData.constructor(for: "AssociatedDataEnum.Thing", env: env),
                [
                    Int.toNode(value, env: env),
                ]
            )
        case let .other(unnamed, _1):
            return try env.newInstance(
                instanceData.constructor(for: "AssociatedDataEnum.Other", env: env),
                [
                    Swift.String.toNode(unnamed, env: env),
                    Int.toNode(_1, env: env),
                ]
            )
        case let .bar(named, _1):
            return try env.newInstance(
                instanceData.constructor(for: "AssociatedDataEnum.Bar", env: env),
                [
                    Swift.String.toNode(named, env: env),
                    AssociatedDataEnum.toNode(_1, env: env),
                ]
            )
        }
    }

    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let thingClass = try NodeClass(
            env: env,
            name: "AssociatedDataEnum.Thing",
            properties: [
                "plus": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "plus", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AssociatedDataEnum.toNode(
                                env.this(converter: AssociatedDataEnum.self).plus(
                                    try env.argument(at: 0, converter: AssociatedDataEnum.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "intValue": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "intValue", expectedArgumentCount: 0) { env in
                                try Int.toNode(env.this(converter: AssociatedDataEnum.self).intValue, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
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
            properties: [
                "plus": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "plus", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AssociatedDataEnum.toNode(
                                env.this(converter: AssociatedDataEnum.self).plus(
                                    try env.argument(at: 0, converter: AssociatedDataEnum.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "intValue": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "intValue", expectedArgumentCount: 0) { env in
                                try Int.toNode(env.this(converter: AssociatedDataEnum.self).intValue, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
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
        let barClass = try NodeClass(
            env: env,
            name: "AssociatedDataEnum.Bar",
            properties: [
                "plus": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "plus", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let result = try AssociatedDataEnum.toNode(
                                env.this(converter: AssociatedDataEnum.self).plus(
                                    try env.argument(at: 0, converter: AssociatedDataEnum.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "intValue": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "intValue", expectedArgumentCount: 0) { env in
                                try Int.toNode(env.this(converter: AssociatedDataEnum.self).intValue, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "named": (.stored(mutable: true), isStatic: false),
                "_1": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(
                    env, info,
                    name: "AssociatedDataEnum.Bar_constructor",
                    expectedArgumentCount: 2
                ) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "named", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "_1", env.argument(at: 1))
                    return this
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "AssociatedDataEnum.Bar",
            nodeClass: barClass.constructor.value(env: env)
        )
    }
}

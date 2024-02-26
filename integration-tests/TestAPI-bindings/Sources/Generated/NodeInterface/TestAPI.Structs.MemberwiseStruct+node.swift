// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.Structs.MemberwiseStruct: NodeMutator {
    public typealias SwiftType = Self
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> Self {
        Self(
            immutable: try { () -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "immutable")
                return try Swift.String.fromNode(fieldValue, env: env)
            }(),
            mutable: try { () -> Swift.String in
                let fieldValue = try env.getNamedProperty(value, "mutable")
                return try Swift.String.fromNode(fieldValue, env: env)
            }()
        )
    }
    public static func toNode(_ value: Self, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try NodeClass.constructor(for: "Structs.MemberwiseStruct", env: env)
        let args: [NAPI.Value] = [
            try Swift.String.toNode(value.immutable, env: env),
            try Swift.String.toNode(value.mutable, env: env),
        ]
        return try env.newInstance(constructor, args)
    }
    public static func mutateNode(_ value: Self, this: NAPI.Value, env: NAPI.Env) throws {
        try env.setNamedProperty(this, "immutable", Swift.String.toNode(value.immutable, env: env))
        try env.setNamedProperty(this, "mutable", Swift.String.toNode(value.mutable, env: env))
    }
    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Structs.MemberwiseStruct",
            properties: [
                "asyncGetMutable": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncGetMutable", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Structs.MemberwiseStruct.self))
                            Task {
                                do {
                                    let taskResult: String = await swiftSelf.value.asyncGetMutable(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.String.toNode(taskResult, env: env)
                                        } catch {
                                            try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                            return
                                        }
                                        try env.resolveDeferred(deferred, convertedTaskResult)
                                    }
                                } catch {
                                    try onMainThread { env in
                                        try env.rejectDeferred(deferred, FishyJoesNodeRuntime.nodeError(error, env: env))
                                    }
                                }
                            }
                            return promise
                        }
                    },
                    isStatic: false
                ),
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.Structs.MemberwiseStruct.toNode(
                                TestAPI.Structs.MemberwiseStruct(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "immutable": (.stored(mutable: true), isStatic: false),
                "mutable": (.stored(mutable: true), isStatic: false),
            ],
            constructor: { env, info in
                callbackBody(env, info, name: "Structs.MemberwiseStruct_constructor", expectedArgumentCount: 2) { env in
                    // TODO: typecheck?
                    let this = try env.this()
                    try env.env.setNamedProperty(this, "immutable", env.argument(at: 0))
                    try env.env.setNamedProperty(this, "mutable", env.argument(at: 1))
                    return this
                }
            }
        )
        try mergeDefinitionInto(
            env: env,
            module: module,
            path: "Structs.MemberwiseStruct",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

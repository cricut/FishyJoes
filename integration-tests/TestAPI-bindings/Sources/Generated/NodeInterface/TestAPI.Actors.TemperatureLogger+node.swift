// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI
import TestAPI_CommonInterface

extension TestAPI.Actors.TemperatureLogger: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> TestAPI.Actors.TemperatureLogger {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected TestAPI.Actors.TemperatureLogger, got nil")
        }
        return try Box<TestAPI.Actors.TemperatureLogger>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: TestAPI.Actors.TemperatureLogger, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "Actors.TemperatureLogger", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: TestAPI.Actors.TemperatureLogger, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected TestAPI.Actors.TemperatureLogger, got nil")
        }
        try Box<TestAPI.Actors.TemperatureLogger>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Actors.TemperatureLogger",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let result = try TestAPI.Actors.TemperatureLogger.toNode(
                                TestAPI.Actors.TemperatureLogger(
                                    label: try env.argument(at: 0, converter: Swift.String.self),
                                    measurement: try env.argument(at: 1, converter: Swift.Int.self)
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "update": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "update", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Swift.Int.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Actors.TemperatureLogger.self))
                            Task {
                                do {
                                    let taskResult: Void = await swiftSelf.value.update(
                                        with: arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try FishyJoesCommonRuntime.VoidConverter.toNode(taskResult, env: env)
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
                "min": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "min", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Actors.TemperatureLogger.self))
                            Task {
                                do {
                                    let taskResult: Int = await swiftSelf.value.min(
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Int.toNode(taskResult, env: env)
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
                "extensionIsolatedGetLabel": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "extensionIsolatedGetLabel", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Actors.TemperatureLogger.self))
                            Task {
                                do {
                                    let taskResult: String = await swiftSelf.value.extensionIsolatedGetLabel(
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
                "extensionNonisolatedGetLabel": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "extensionNonisolatedGetLabel", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try Swift.String.toNode(
                                env.this(converter: TestAPI.Actors.TemperatureLogger.self).extensionNonisolatedGetLabel(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: false
                ),
                "backwardsLabel": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "backwardsLabel", expectedArgumentCount: 0) { env in
                                try Swift.String.toNode(env.this(converter: TestAPI.Actors.TemperatureLogger.self).backwardsLabel, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "extensionNonisolatedVarLabel": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "extensionNonisolatedVarLabel", expectedArgumentCount: 0) { env in
                                try Swift.String.toNode(env.this(converter: TestAPI.Actors.TemperatureLogger.self).extensionNonisolatedVarLabel, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "label": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "label", expectedArgumentCount: 0) { env in
                                try Swift.String.toNode(env.this(converter: TestAPI.Actors.TemperatureLogger.self).label, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Actors.TemperatureLogger_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.Actors.TemperatureLogger>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Actors.TemperatureLogger",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

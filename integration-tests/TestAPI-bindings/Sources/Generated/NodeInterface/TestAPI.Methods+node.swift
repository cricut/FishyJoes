// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesNodeRuntime
import Foundation
import TestAPI

extension TestAPI.Methods: FishyJoesNodeRuntime.NodeConverter {
    public static func fromNode(_ value: NAPI.Value, env: NAPI.Env) throws -> TestAPI.Methods {
        guard let nonNilPointer = try env.unwrap(value) else {
            throw JSException(message: "expected TestAPI.Methods, got nil")
        }
        return try Box<TestAPI.Methods>.takeUnretainedOpaque(nonNilPointer).value
    }

    public static func toNode(_ value: TestAPI.Methods, env: NAPI.Env) throws -> NAPI.Value {
        let constructor = try FishyJoesNodeRuntime.NodeClass.constructor(for: "Methods", env: env)
        let arg = try FishyJoesNodeRuntime.Box(value).retainedExternal(env: env)
        return try env.newInstance(constructor, [arg])
    }

    public static func mutateNode(_ value: TestAPI.Methods, this: NAPI.Value, env: NAPI.Env) throws {
        guard let pointer = try env.unwrap(this) else {
            throw JSException(message: "expected TestAPI.Methods, got nil")
        }
        try Box<TestAPI.Methods>.takeUnretainedOpaque(pointer).value = value
    }

    @available(*, deprecated, message: "Not actually deprecated, but this silences warnings because it may refer to deprecated methods")
    public static func nodeSetup(env: NAPI.Env, module: NAPI.Value) throws {
        let nodeClass = try NodeClass(
            env: env,
            name: "Methods",
            properties: [
                "create": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "create", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let result = try TestAPI.Methods.toNode(
                                TestAPI.Methods.create(
                                ),
                                env: env.env
                            )
                            return result
                        }
                    },
                    isStatic: true
                ),
                "async42": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "async42", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: Int = await swiftSelf.value.async42(
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
                "asyncYield": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncYield", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: Int = await swiftSelf.value.asyncYield(
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
                "asyncSleep": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncSleep", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: Int = try await swiftSelf.value.asyncSleep(
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
                "asyncVoid": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncVoid", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: Void = await swiftSelf.value.asyncVoid(
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
                "asyncDouble": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncDouble", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Swift.Double.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: Double = await swiftSelf.value.asyncDouble(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Double.toNode(taskResult, env: env)
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
                "asyncMultipleArgs": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncMultipleArgs", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Swift.Int.self))
                            let arg1 = UncheckedSendableBox(try env.argument(at: 1, converter: AsyncFunction0Converter<Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: Int = try await swiftSelf.value.asyncMultipleArgs(
                                        arg0.value,
                                        j: arg1.value
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
                "asyncThrowing": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncThrowing", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: Void = try await swiftSelf.value.asyncThrowing(
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
                "asyncCallbackFunc0": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "asyncCallbackFunc0", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction0Converter<Swift.Int>.self))
                            let swiftSelf = UncheckedSendableBox(try env.this(converter: TestAPI.Methods.self))
                            Task {
                                do {
                                    let taskResult: Int = try await swiftSelf.value.asyncCallbackFunc0(
                                        arg0.value
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
                "staticAsync42": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsync42", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            Task {
                                do {
                                    let taskResult: Int = await TestAPI.Methods.staticAsync42(
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
                    isStatic: true
                ),
                "staticAsyncYield": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsyncYield", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            Task {
                                do {
                                    let taskResult: Int = await TestAPI.Methods.staticAsyncYield(
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
                    isStatic: true
                ),
                "staticAsyncSleep": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsyncSleep", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Methods.staticAsyncSleep(
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
                    isStatic: true
                ),
                "staticAsyncVoid": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsyncVoid", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            Task {
                                do {
                                    let taskResult: Void = await TestAPI.Methods.staticAsyncVoid(
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
                    isStatic: true
                ),
                "staticAsyncDouble": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsyncDouble", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Swift.Double.self))
                            Task {
                                do {
                                    let taskResult: Double = await TestAPI.Methods.staticAsyncDouble(
                                        arg0.value
                                    )
                                    try onMainThread { env in
                                        let convertedTaskResult: NAPI.Value
                                        do {
                                            convertedTaskResult = try Swift.Double.toNode(taskResult, env: env)
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
                    isStatic: true
                ),
                "staticAsyncMultipleArgs": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsyncMultipleArgs", expectedArgumentCount: 2, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: Swift.Int.self))
                            let arg1 = UncheckedSendableBox(try env.argument(at: 1, converter: AsyncFunction0Converter<Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Methods.staticAsyncMultipleArgs(
                                        arg0.value,
                                        j: arg1.value
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
                    isStatic: true
                ),
                "staticAsyncThrowing": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsyncThrowing", expectedArgumentCount: 0, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            Task {
                                do {
                                    let taskResult: Void = try await TestAPI.Methods.staticAsyncThrowing(
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
                    isStatic: true
                ),
                "staticAsyncCallbackFunc0": (
                    .method { env, info in
                        FishyJoesNodeRuntime.callbackBody(env, info, name: "staticAsyncCallbackFunc0", expectedArgumentCount: 1, hasNamedOptions: false) { env in
                            let (deferred, promise) = try env.env.createPromise()
                            let arg0 = UncheckedSendableBox(try env.argument(at: 0, converter: AsyncFunction0Converter<Swift.Int>.self))
                            Task {
                                do {
                                    let taskResult: Int = try await TestAPI.Methods.staticAsyncCallbackFunc0(
                                        arg0.value
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
                    isStatic: true
                ),
                "staticGet": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticGet", expectedArgumentCount: 0) { env in
                                try Swift.Int.toNode(TestAPI.Methods.staticGet, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "staticGetMethod": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticGetMethod", expectedArgumentCount: 0) { env in
                                try Swift.Int.toNode(TestAPI.Methods.staticGetMethod, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: true
                ),
                "staticModifiable": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticModifiable", expectedArgumentCount: 0) { env in
                                try Swift.Int.toNode(TestAPI.Methods.staticModifiable, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticModifiable", expectedArgumentCount: 1) { env in
                                TestAPI.Methods.staticModifiable = try env.argument(at: 0, converter: Swift.Int.self)
                                return nil
                            }
                        }),
                    isStatic: true
                ),
                "staticStored": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticStored", expectedArgumentCount: 0) { env in
                                try Swift.Int.toNode(TestAPI.Methods.staticStored, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "staticStored", expectedArgumentCount: 1) { env in
                                TestAPI.Methods.staticStored = try env.argument(at: 0, converter: Swift.Int.self)
                                return nil
                            }
                        }),
                    isStatic: true
                ),
                "instanceGet": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceGet", expectedArgumentCount: 0) { env in
                                try Swift.Int.toNode(env.this(converter: TestAPI.Methods.self).instanceGet, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "instanceGetMethod": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceGetMethod", expectedArgumentCount: 0) { env in
                                try Swift.Int.toNode(env.this(converter: TestAPI.Methods.self).instanceGetMethod, env: env.env)
                            }
                        },
                        setter: nil
                    ),
                    isStatic: false
                ),
                "instanceModifiable": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceModifiable", expectedArgumentCount: 0) { env in
                                try Swift.Int.toNode(env.this(converter: TestAPI.Methods.self).instanceModifiable, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceModifiable", expectedArgumentCount: 1) { env in
                                var mutatingSelf = try env.this(converter: TestAPI.Methods.self)
                                mutatingSelf.instanceModifiable = try env.argument(at: 0, converter: Swift.Int.self)
                                try TestAPI.Methods.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                                return nil
                            }
                        }),
                    isStatic: false
                ),
                "instanceStored": (
                    .accessor(
                        getter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceStored", expectedArgumentCount: 0) { env in
                                try Swift.Int.toNode(env.this(converter: TestAPI.Methods.self).instanceStored, env: env.env)
                            }
                        },
                        setter: { env, info in
                            FishyJoesNodeRuntime.callbackBody(env, info, name: "instanceStored", expectedArgumentCount: 1) { env in
                                var mutatingSelf = try env.this(converter: TestAPI.Methods.self)
                                mutatingSelf.instanceStored = try env.argument(at: 0, converter: Swift.Int.self)
                                try TestAPI.Methods.mutateNode(mutatingSelf, this: env.this(), env: env.env)
                                return nil
                            }
                        }),
                    isStatic: false
                ),
            ],
            constructor: { env, info in
                FishyJoesNodeRuntime.callbackBody(env, info, name: "Methods_constructor", expectedArgumentCount: 1) { env in
                    try FishyJoesNodeRuntime.Box<TestAPI.Methods>.construct(env: env)
                }
            }
        )
        try FishyJoesNodeRuntime.mergeDefinitionInto(
            env: env,
            module: module,
            path: "Methods",
            nodeClass: nodeClass.constructor.value(env: env)
        )
    }
}

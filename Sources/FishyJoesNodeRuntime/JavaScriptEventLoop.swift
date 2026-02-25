//
// A modified version of the JavaScriptEventLoop.swift from JavaScriptKit.
// See: https://github.com/swiftwasm/JavaScriptKit/commit/096584bb6959f16d97daf3ebf52039f98c36fdbf
// Becuase of our modifications we have a shared copyright at this point.
//

//
// MIT License
//
// Copyright (c) 2020 Yuta Saito
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

#if os(WASI)

import NodeAPI
@_spi(ExperimentalCustomExecutors) import _Concurrency

// NOTE: `@available` annotations are semantically wrong, but they make it easier to develop applications targeting WebAssembly in Xcode.

/** Singleton type responsible for integrating JavaScript event loop as a Swift concurrency executor, conforming to
`SerialExecutor` protocol from the standard library. To utilize it:

1. Make sure that your target depends on `JavaScriptEventLoop` in your `Packages.swift`:

```swift
.target(
    name: "JavaScriptKitExample",
    dependencies: [
        "JavaScriptKit",
        .product(name: "JavaScriptEventLoop", package: "JavaScriptKit")
    ]
)
```

2. Add an explicit import in the code that executes **before* you start using `await` and/or `Task`
APIs (most likely in `main.swift`):

```swift
import JavaScriptEventLoop
```

3. Run this function **before* you start using `await` and/or `Task` APIs (again, most likely in
`main.swift`):

```swift
JavaScriptEventLoop.installGlobalExecutor()
```
*/

public final class JavaScriptEventLoop: SerialExecutor, @unchecked Sendable {
    /// A function that queues a given closure as a microtask into JavaScript event loop.
    /// See also: https://developer.mozilla.org/en-US/docs/Web/API/HTML_DOM_API/Microtask_guide
    public var queueMicrotask: @Sendable (@escaping () -> Void) -> Void
    /// A function that invokes a given closure after a specified number of milliseconds.
    public var setTimeout: @Sendable (Double, @escaping () -> Void) -> Void

    /// A mutable state to manage internal job queue
    /// Note that this should be guarded atomically when supporting multi-threaded environment.
    var queueState = QueueState()

    private init(
        queueMicrotask: @Sendable @escaping (_ job: @escaping () -> Void) -> Void,
        setTimeout: @Sendable @escaping (_ delay: Double, _ job: @escaping () -> Void) -> Void
    ) {
        self.queueMicrotask = queueMicrotask
        self.setTimeout = setTimeout
    }

    /// A singleton instance of the Executor.
    ///
    /// - Note: You must call `installGlobalExecutor(env:)` before accessing this property.
    public static var shared: JavaScriptEventLoop { _shared }
    private static var _shared: JavaScriptEventLoop!

    private static var didInstallGlobalExecutor = false

    /// Install ExecutorFactory and delay hooks for Swift 6.3 concurrency integration.
    ///
    /// Sets the JavaScript event loop as the global executor. This must be called before any async jobs are created.
    ///
    /// The ExecutorFactory API handles immediate job enqueueing, while delay hooks are still needed
    /// for Task.sleep and other time-based scheduling operations.
    public static func installGlobalExecutor(env: NAPI.Env) throws {
        guard !didInstallGlobalExecutor else { return }

        try setupShared(env: env)

        _Concurrency._createExecutors(factory: JavaScriptEventLoop.self)
        installDelayHooks()

        didInstallGlobalExecutor = true
    }

    /// Install delay-related hooks for time-based async operations.
    ///
    /// The ExecutorFactory handles immediate job enqueueing, but delay hooks are still needed
    /// for Task.sleep and other time-based scheduling operations.
    private static func installDelayHooks() {
        typealias swift_task_enqueueGlobalWithDelay_hook_Fn = @convention(thin) (UInt64, UnownedJob, swift_task_enqueueGlobalWithDelay_original) -> Void
        let swift_task_enqueueGlobalWithDelay_hook_impl: swift_task_enqueueGlobalWithDelay_hook_Fn = { delay, job, _ in
            JavaScriptEventLoop.shared.enqueue(job, withDelay: delay)
        }
        swift_task_enqueueGlobalWithDelay_hook = unsafeBitCast(
            swift_task_enqueueGlobalWithDelay_hook_impl,
            to: UnsafeMutableRawPointer?.self
        )

        #if os(WASI)
        typealias swift_task_enqueueGlobalWithDeadline_hook_Fn = @convention(thin) (Int64, Int64, Int64, Int64, Int32, UnownedJob, swift_task_enqueueGlobalWithDelay_original) -> Void
        let swift_task_enqueueGlobalWithDeadline_hook_impl: swift_task_enqueueGlobalWithDeadline_hook_Fn = { sec, nsec, tsec, tnsec, clock, job, _ in
            JavaScriptEventLoop.shared.enqueue(job, withDelay: sec, nsec, tsec, tnsec, clock)
        }
        swift_task_enqueueGlobalWithDeadline_hook = unsafeBitCast(
            swift_task_enqueueGlobalWithDeadline_hook_impl,
            to: UnsafeMutableRawPointer?.self
        )
        #endif
    }

    static func setupShared(env: NAPI.Env) throws {
        // A promise is used here in order to have the queueTask end firing its actula work as a javascript microtask.
        // A microtask is a piese of code run under special conditions including when promises have their `then` or `catch` functions called.
        // So by creating and resolving the promise right away it gives an easy way to enqueue things into javascript land in this way.
        // See the same documentation mentioned above: https://developer.mozilla.org/en-US/docs/Web/API/HTML_DOM_API/Microtask_guide
        let (resolved, promise) = try env.createPromise()
        // Make the promise resolve and finish firing off right away.
        // docs state that promises should run their executor function during construction so you can begin async work so it should be good to trigger right away
        try env.resolveDeferred(resolved, env.getUndefined())

        let thenFunction = try env.getNamedProperty(promise, "then")
        let setTimeoutFunction = try env.getNamedProperty(env.getGlobal(), "setTimeout")

        let promiseRef = try NodeReference(env: env, value: promise)
        let thenFunctionRef = try NodeReference(env: env, value: thenFunction)
        let setTimeoutFunctionRef = try NodeReference(env: env, value: setTimeoutFunction)

        _shared = JavaScriptEventLoop(
            queueMicrotask: { job in
                let jobBox = Box(job)

                let thenCallback: NAPI.Callback = { env, callbackInfo in
                    callbackBody(env, callbackInfo, name: "thenCallback", expectedArgumentCount: 1) { env in
                        guard let jobBox = try env.data().map(Box<() -> Void>.takeRetainedOpaque(_:)) else {
                            fatalError("env.data() should never be null for the async task event loop")
                        }
                        jobBox.value()

                        return try env.env.getUndefined()
                    }
                }
                do {
                    let thenCallbackFunction = try env.createFunction(nil, thenCallback, jobBox.retainedOpaque())
                    _ = try env.callFunction(promiseRef.value(env: env), thenFunctionRef.value(env: env), [thenCallbackFunction])
                } catch {
                    fatalError("\(error)")
                }
            },
            setTimeout: { delay, job in
                let jobBox = Box(job)

                let setTimeoutCallback: NAPI.Callback = { env, callbackInfo -> napi_value? in
                    callbackBody(env, callbackInfo, name: "setTimeoutCallback", expectedArgumentCount: 0) { env in
                        guard let jobBox = try env.data().map(Box<() -> Void>.takeRetainedOpaque(_:)) else {
                            fatalError("env.data() should never be null for the async task event loop")
                        }
                        jobBox.value()

                        return try env.env.getUndefined()
                    }
                }

                do {
                    let setTimeoutCallbackFunction: NAPI.Value = try env.createFunction(nil, setTimeoutCallback, jobBox.retainedOpaque())
                    _ = try env.callFunction(env.getGlobal(), setTimeoutFunctionRef.value(env: env), [setTimeoutCallbackFunction, env.createDouble(delay)])
                } catch {
                    fatalError("\(error)")
                }
            }
        )
    }

    private func enqueue(_ job: UnownedJob, withDelay nanoseconds: UInt64) {
        let milliseconds = nanoseconds / 1_000_000
        setTimeout(Double(milliseconds)) {
            job.runSynchronously(on: self.asUnownedSerialExecutor())
        }
    }

    public func enqueue(_ job: UnownedJob) {
        insertJobQueue(job: job)
    }

    public func asUnownedSerialExecutor() -> UnownedSerialExecutor {
        return UnownedSerialExecutor(ordinary: self)
    }
}

/// Taken from https://github.com/apple/swift/blob/d375c972f12128ec6055ed5f5337bfcae3ec67d8/stdlib/public/Concurrency/Clock.swift#L84-L88
@_silgen_name("swift_get_time")
internal func swift_get_time(
  _ seconds: UnsafeMutablePointer<Int64>,
  _ nanoseconds: UnsafeMutablePointer<Int64>,
  _ clock: CInt)

extension JavaScriptEventLoop {
    fileprivate func enqueue(
        _ job: UnownedJob, withDelay seconds: Int64, _ nanoseconds: Int64,
        _ toleranceSec: Int64, _ toleranceNSec: Int64,
        _ clock: Int32
    ) {
        var nowSec: Int64 = 0
        var nowNSec: Int64 = 0
        swift_get_time(&nowSec, &nowNSec, clock)
        let delayNanosec = (seconds - nowSec) * 1_000_000_000 + (nanoseconds - nowNSec)
        enqueue(job, withDelay: delayNanosec <= 0 ? 0 : UInt64(delayNanosec))
    }
}

// MARK: - ExecutorFactory Support

@_spi(ExperimentalCustomExecutors)
extension JavaScriptEventLoop: ExecutorFactory {
    /// Bridges Swift concurrency to the JavaScript event loop by delegating all jobs to JavaScriptEventLoop.shared.
    final class EventLoopExecutor: TaskExecutor, MainExecutor, SerialExecutor {
        static let shared = EventLoopExecutor()

        private init() {}

        func checkIsolated() {
            // No-op: JavaScript is single-threaded, so isolation is always satisfied
        }

        func enqueue(_ job: consuming ExecutorJob) {
            JavaScriptEventLoop.shared.enqueue(UnownedJob(job))
        }

        func asUnownedSerialExecutor() -> UnownedSerialExecutor {
            UnownedSerialExecutor(ordinary: self)
        }

        func run() throws {
            // No-op for JavaScript event loop - JavaScript controls the run loop
        }

        func stop() {
            // No-op for JavaScript event loop
        }
    }

    public static var mainExecutor: any MainExecutor {
        EventLoopExecutor.shared
    }

    public static var defaultExecutor: any TaskExecutor {
        EventLoopExecutor.shared
    }
}

#endif

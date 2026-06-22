import Foundation

#if canImport(WASILibc)
    import WASILibc
    import wasi_pthread
#endif

final class AtomicIntBox: @unchecked Sendable {
    let lock = NSLock()
    var counter: Int = 0

    // Returns the value of the counter before incrementing it.
    func fetchAndIncrement() -> Int {
        lock.withLock {
            let oldValue = counter
            counter += 1
            return oldValue
        }
    }

    func get() -> Int {
        return lock.withLock {
            counter
        }
    }
}

func blockingSleep(seconds: TimeInterval) {
    Thread.sleep(forTimeInterval: seconds)
}

/// Condition-variable + flag bundle for parking a thread until another
/// thread signals. Wait loop is spurious-wakeup safe.
final class SignalBox: @unchecked Sendable {
    private let condition = NSCondition()
    private var ready = false

    func signalReady() {
        condition.lock()
        ready = true
        condition.signal()
        condition.unlock()
    }

    /// Acquires the lock, runs `beforeWait` once (still holding the lock),
    /// then parks until `signalReady` is called. Returns true iff
    /// `condition.wait()` was actually invoked — i.e., we genuinely
    /// suspended rather than fast-pathing because `ready` was already set.
    @discardableResult
    func waitUntilReady(beforeWait: () -> Void = {}) -> Bool {
        var parked = false
        condition.lock()
        beforeWait()
        while !ready {
            condition.wait()
            parked = true
        }
        condition.unlock()
        return parked
    }
}

#if os(WASI)

    /// Fixed-size pool of persistent threads that pull jobs from a shared
    /// queue. On WASI each thread is hosted by a Node Worker, so threads
    /// are expensive to spawn; the pool spawns at most `maxThreads` workers
    /// over the executor's lifetime and reuses them across every Task
    /// suspension/resumption that lands on this executor.
    final class ThreadPoolTaskExecutor: TaskExecutor, @unchecked Sendable {
        static let shared = ThreadPoolTaskExecutor(maxThreads: 4)

        private let maxThreads: Int
        private let condition = NSCondition()

        // Protected by `condition`.
        nonisolated(unsafe) private var queue: [UnownedJob] = []
        nonisolated(unsafe) private var liveThreads: Int = 0

        init(maxThreads: Int) {
            precondition(maxThreads >= 1)
            self.maxThreads = maxThreads
        }

        func enqueue(_ job: consuming ExecutorJob) {
            let unownedJob = UnownedJob(job)

            condition.lock()
            unsafe queue.append(unownedJob)
            let shouldSpawn = liveThreads < maxThreads
            if shouldSpawn {
                liveThreads += 1
            } else {
                condition.signal()
            }
            condition.unlock()

            if shouldSpawn {
                spawnWorker()
            }
        }

        private func spawnWorker() {
            let opaque = unsafe Unmanaged.passUnretained(self).toOpaque()
            var thread = unsafe pthread_t(bitPattern: 0)
            _ = unsafe pthread_create(
                &thread,
                nil,
                { data in
                    guard let data = unsafe data else { return nil }
                    let executor = unsafe Unmanaged<ThreadPoolTaskExecutor>
                        .fromOpaque(data).takeUnretainedValue()
                    executor.workerLoop()
                    return nil
                },
                opaque
            )
            if let t = unsafe thread { unsafe pthread_detach(t) }
        }

        private func workerLoop() {
            let myExecutor = unsafe self.asUnownedTaskExecutor()
            while true {
                condition.lock()
                while unsafe queue.isEmpty {
                    condition.wait()
                }
                let job = unsafe queue.removeFirst()
                condition.unlock()

                unsafe job.runSynchronously(on: myExecutor)
            }
        }
    }

    func spawnBlocking<T: Sendable>(
        _ operation: @Sendable @escaping () async throws -> T
    ) async throws -> T {
        let task = Task(executorPreference: ThreadPoolTaskExecutor.shared) {
            try await operation()
        }
        return try await withTaskCancellationHandler {
            try await task.value
        } onCancel: {
            task.cancel()
        }
    }

#else

    func spawnBlocking<T: Sendable>(
        _ operation: @Sendable @escaping () async throws -> T
    ) async throws -> T {
        let task = Task.detached { try await operation() }
        return try await task.value
    }

#endif

import Foundation

/// <!-- FishyJoes.export(Threading) -->
public enum Threading {
    /// <!-- FishyJoes.export(runConcurrentJobs) -->
    /// Spawns `jobCount` jobs concurrently, each running `chunksPerJob`
    /// blocking sleeps off the calling thread. After each chunk, invokes
    /// `progress(jobIndex, totalChunks)` where `totalChunks` is the
    /// cumulative number of chunks completed across all jobs.
    public static func runConcurrentJobs(
        jobCount: Int,
        chunksPerJob: Int,
        progress: @escaping @Sendable (Int, Int) async throws -> Void
    ) async throws {
        let completed = AtomicIntBox()
        try await withThrowingTaskGroup(of: Void.self) { group in
            for jobIndex in 0..<jobCount {
                group.addTask {
                    try await spawnBlocking {
                        for _ in 0..<chunksPerJob {
                            blockingSleep(seconds: 0.01)
                            try await progress(jobIndex, completed.fetchAndIncrement())
                        }
                    }
                }
            }
            try await group.waitForAll()
        }
    }

    /// <!-- FishyJoes.export(proveParallelism) -->
    /// Returns true iff the compute thread and the calling thread can
    /// rendezvous via shared atomics — a one-sided proof of parallelism.
    /// Under serial execution the worker spins forever waiting for the
    /// main-thread release flag;
    public static func proveParallelism() async throws -> Bool {
        let workerStarted = AtomicIntBox()
        let mainReleased = AtomicIntBox()

        let worker = Task {
            try await spawnBlocking { () -> Bool in
                _ = workerStarted.fetchAndIncrement()
                while mainReleased.get() == 0 {
                    try await Task.sleep(nanoseconds: 1_000_000)
                }
                return true
            }
        }

        while workerStarted.get() == 0 {
            try await Task.sleep(nanoseconds: 1_000_000)
        }

        _ = mainReleased.fetchAndIncrement()
        return try await worker.value
    }

    /// <!-- FishyJoes.export(proveMainThreadCanPark) -->
    /// Returns true iff waiting on the wasm main thread truly suspends it
    /// — i.e., a condvar wait on this thread actually drives `atomic.wait`
    /// to its parking path. The test sets a flag inside the condvar's lock
    /// after acquiring it; a worker pthread (via `spawnBlocking`) spins on
    /// the flag and then signals. Because `condition.wait()` atomically
    /// releases the lock when parking, the worker can only acquire the
    /// lock — and therefore only signal — once the main thread has truly
    /// suspended. A `false` return means the wait fast-pathed and we never
    /// parked; in the browser without `__wasilibc_enable_futex_busywait`,
    /// the wait would instead trap on `atomic.wait32`.
    public static func proveMainThreadCanPark() async throws -> Bool {
        let box = SignalBox()
        let workerStarted = AtomicIntBox()
        let mainEnteredWait = AtomicIntBox()

        let worker = Task {
            try await spawnBlocking {
                _ = workerStarted.fetchAndIncrement()
                while mainEnteredWait.get() == 0 {
                    blockingSleep(seconds: 0.001)
                }
                box.signalReady()
            }
        }

        // Make sure the worker is actually running on its own thread before
        // we park — otherwise no one would be left to wake us.
        while workerStarted.get() == 0 {
            try await Task.sleep(nanoseconds: 1_000_000)
        }

        let parked = box.waitUntilReady {
            _ = mainEnteredWait.fetchAndIncrement()
        }
        try await worker.value
        return parked
    }
}

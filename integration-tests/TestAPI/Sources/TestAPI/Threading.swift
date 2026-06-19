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
}

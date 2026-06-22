package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(Threading) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class Threading {

    companion object {
        /**
         * <!-- FishyJoes.export(runConcurrentJobs) -->
         * Spawns `jobCount` jobs concurrently, each running `chunksPerJob`
         * blocking sleeps off the calling thread. After each chunk, invokes
         * `progress(jobIndex, totalChunks)` where `totalChunks` is the
         * cumulative number of chunks completed across all jobs.
         */
        suspend fun runConcurrentJobs(
            jobCount: Long,
            chunksPerJob: Long,
            progress: (suspend (Long, Long) -> kotlin.Unit)
        ): kotlin.Unit = __jni_runConcurrentJobs(jobCount, chunksPerJob, progress).await()
        @JvmStatic
        @JvmName("__jni_runConcurrentJobs")
        private external fun __jni_runConcurrentJobs(
            jobCount: Long,
            chunksPerJob: Long,
            progress: (suspend (Long, Long) -> kotlin.Unit)
        ): kotlinx.coroutines.Deferred<kotlin.Unit>

        /**
         * <!-- FishyJoes.export(proveParallelism) -->
         * Returns true iff the compute thread and the calling thread can
         * rendezvous via shared atomics — a one-sided proof of parallelism.
         * Under serial execution the worker spins forever waiting for the
         * main-thread release flag;
         */
        suspend fun proveParallelism(
        ): Boolean = __jni_proveParallelism().await()
        @JvmStatic
        @JvmName("__jni_proveParallelism")
        private external fun __jni_proveParallelism(
        ): kotlinx.coroutines.Deferred<Boolean>

        /**
         * <!-- FishyJoes.export(proveMainThreadCanPark) -->
         * Returns true iff waiting on the wasm main thread truly suspends it
         * — i.e., a condvar wait on this thread actually drives `atomic.wait`
         * to its parking path. The test sets a flag inside the condvar's lock
         * after acquiring it; a worker pthread (via `spawnBlocking`) spins on
         * the flag and then signals. Because `condition.wait()` atomically
         * releases the lock when parking, the worker can only acquire the
         * lock — and therefore only signal — once the main thread has truly
         * suspended. A `false` return means the wait fast-pathed and we never
         * parked; in the browser without `__wasilibc_enable_futex_busywait`,
         * the wait would instead trap on `atomic.wait32`.
         */
        suspend fun proveMainThreadCanPark(
        ): Boolean = __jni_proveMainThreadCanPark().await()
        @JvmStatic
        @JvmName("__jni_proveMainThreadCanPark")
        private external fun __jni_proveMainThreadCanPark(
        ): kotlinx.coroutines.Deferred<Boolean>

        init { loadNativeLibs() }
    }
}

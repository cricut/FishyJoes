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

        init { loadNativeLibs() }
    }
}

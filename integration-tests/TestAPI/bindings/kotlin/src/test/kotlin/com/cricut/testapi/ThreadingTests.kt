package com.cricut.testapi

import kotlinx.coroutines.test.runTest
import org.junit.jupiter.api.Assertions.*
import org.junit.jupiter.api.Test
import java.util.Collections
import kotlin.time.Duration.Companion.seconds

internal class ThreadingTests {
    @Test
    fun runConcurrentJobsInterleavesJobsAndReportsTheFullChunkCount() = runTest(timeout = 10.seconds) {
        val jobCount = 4L
        val chunksPerJob = 5L
        val expectedTotal = (jobCount * chunksPerJob).toInt()

        // Callback may be invoked from worker threads; synchronize collection.
        val observed = Collections.synchronizedList(mutableListOf<Pair<Long, Long>>())
        Threading.runConcurrentJobs(jobCount, chunksPerJob) { jobIndex, total ->
            observed.add(jobIndex to total)
        }

        assertEquals(expectedTotal, observed.size)

        val perJob = mutableMapOf<Long, Int>()
        for ((jobIndex, _) in observed) {
            perJob[jobIndex] = (perJob[jobIndex] ?: 0) + 1
        }
        assertEquals(jobCount.toInt(), perJob.size)
        for (count in perJob.values) {
            assertEquals(chunksPerJob.toInt(), count)
        }

        // Concurrent jobs interleave: a serial execution would yield exactly
        // `jobCount - 1` adjacent-index transitions (one per job boundary).
        // Real parallelism produces strictly more.
        var transitions = 0
        for (i in 1 until observed.size) {
            if (observed[i].first != observed[i - 1].first) transitions++
        }
        assertTrue(
            transitions > jobCount - 1,
            "expected interleaving (>${jobCount - 1} transitions) but saw $transitions",
        )
    }

    @Test
    fun computeRunsInParallelWithTheCallingThread() = runTest(timeout = 10.seconds) {
        assertTrue(Threading.proveParallelism())
    }

    @Test
    fun mainThreadGenuinelySuspendsOnACondvarWait() = runTest(timeout = 10.seconds) {
        assertTrue(Threading.proveMainThreadCanPark())
    }
}

using System.Collections.Generic;
using System.Threading.Tasks;
using Xunit;

namespace Cricut.TestAPI.Tests {
    [Collection("root")]
    public class ThreadingTests {
        [Fact]
        async Task RunConcurrentJobsInterleavesJobsAndReportsTheFullChunkCount() {
            const int jobCount = 4;
            const int chunksPerJob = 5;
            const int expectedTotal = jobCount * chunksPerJob;

            var observed = new List<(nint jobIndex, nint total)>();
            var gate = new object();
            await Threading.RunConcurrentJobs(jobCount, chunksPerJob, async (jobIndex, total) => {
                await Task.Yield();
                lock (gate) {
                    observed.Add((jobIndex, total));
                }
            });

            Assert.Equal(expectedTotal, observed.Count);

            var perJob = new Dictionary<nint, int>();
            foreach (var (jobIndex, _) in observed) {
                perJob[jobIndex] = perJob.GetValueOrDefault(jobIndex) + 1;
            }
            Assert.Equal(jobCount, perJob.Count);
            foreach (var count in perJob.Values) {
                Assert.Equal(chunksPerJob, count);
            }

            // Concurrent jobs interleave: a serial execution would yield exactly
            // `jobCount - 1` adjacent-index transitions (one per job boundary).
            // Real parallelism produces strictly more.
            var transitions = 0;
            for (var i = 1; i < observed.Count; i++) {
                if (observed[i].jobIndex != observed[i - 1].jobIndex) transitions++;
            }
            Assert.True(transitions > jobCount - 1, $"expected interleaving (>{jobCount - 1} transitions) but saw {transitions}");
        }

        [Fact]
        async Task ComputeRunsInParallelWithTheCallingThread() {
            Assert.True(await Threading.ProveParallelism());
        }

        [Fact]
        async Task MainThreadGenuinelySuspendsOnACondvarWait() {
            Assert.True(await Threading.ProveMainThreadCanPark());
        }
    }
}

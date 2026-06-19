import { TestAPI } from 'TestAPI';

test('runConcurrentJobs interleaves jobs and reports the full chunk count', async () => {
    const jobCount = 4;
    const chunksPerJob = 5;
    const expectedTotal = jobCount * chunksPerJob;

    const observed: Array<{ jobIndex: number; total: number }> = [];
    await TestAPI.Threading.runConcurrentJobs(jobCount, chunksPerJob, async (jobIndex, total) => {
        observed.push({ jobIndex, total });
    });

    // Every chunk produced exactly one progress tick.
    expect(observed.length).toEqual(expectedTotal);

    // Each job emitted exactly chunksPerJob ticks.
    const perJob = new Map<number, number>();
    for (const { jobIndex } of observed) {
        perJob.set(jobIndex, (perJob.get(jobIndex) ?? 0) + 1);
    }
    expect(perJob.size).toEqual(jobCount);
    for (const count of perJob.values()) {
        expect(count).toEqual(chunksPerJob);
    }

    // Concurrent jobs interleave: a serial execution would yield exactly
    // `jobCount - 1` adjacent-index transitions (one per job boundary).
    // Real parallelism produces strictly more.
    let transitions = 0;
    for (let i = 1; i < observed.length; i++) {
        if (observed[i].jobIndex !== observed[i - 1].jobIndex) transitions++;
    }
    expect(transitions).toBeGreaterThan(jobCount - 1);
}, 10_000);

test('compute runs in parallel with the calling thread (handshake)', async () => {
    const ok = await TestAPI.Threading.proveParallelism();
    expect(ok).toBe(true);
}, 10_000);

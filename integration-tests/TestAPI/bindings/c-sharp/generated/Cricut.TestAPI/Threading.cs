using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Threading) -->
    /// </summary>
    public record Threading {
        private Threading() {}

        /// <summary>
        /// <!-- FishyJoes.export(runConcurrentJobs) -->
        /// <para>Spawns `jobCount` jobs concurrently, each running `chunksPerJob`</para>
        /// <para>blocking sleeps off the calling thread. After each chunk, invokes</para>
        /// <para>`progress(jobIndex, totalChunks)` where `totalChunks` is the</para>
        /// <para>cumulative number of chunks completed across all jobs.</para>
        /// </summary>
        public static System.Threading.Tasks.Task RunConcurrentJobs(
            nint jobCount,
            nint chunksPerJob,
            System.Func<nint, nint, System.Threading.Tasks.Task> progress
        ) {
            using var _progressHandle = new GCRef(progress);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Threading_runConcurrentJobs(Loader.env, jobCount, chunksPerJob, _progressHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Threading_runConcurrentJobs(
            IntPtr envRef,
            nint jobCount,
            nint chunksPerJob,
            UnownedRef progress,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(proveParallelism) -->
        /// <para>Returns true iff the compute thread and the calling thread can</para>
        /// <para>rendezvous via shared atomics — a one-sided proof of parallelism.</para>
        /// <para>Under serial execution the worker spins forever waiting for the</para>
        /// <para>main-thread release flag;</para>
        /// </summary>
        public static System.Threading.Tasks.Task<bool> ProveParallelism(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Threading_proveParallelism(Loader.env, out _exn)).Consume<System.Threading.Tasks.Task<bool>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Threading_proveParallelism(
            IntPtr envRef,
            out CreatedRef exn
        );

        static Threading() { _TypeSetup._ensureLoaded(); }
    }
}

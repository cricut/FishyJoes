using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestMutatingCounter) -->
    /// </summary>
    public record TestMutatingCounter {
        public nint Count { get; internal set; }

        public TestMutatingCounter(
            nint Count
        ) {
            this.Count = Count;
        }

        /// <summary>
        /// <!-- FishyJoes.export(tick) -->
        /// </summary>
        public void Tick(
        ) {
            using var _thisHandle = new GCRef(this);
            Check((out CreatedRef _exn) => __iota_TestAPI_TestMutatingCounter_tick(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_TestAPI_TestMutatingCounter_tick(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(witness) -->
        /// </summary>
        public Cricut.TestAPI.TestMutatingCounterProtocol Witness(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestMutatingCounter_witness(Loader.env, _thisHandle.ptr, out _exn)).Consume<Cricut.TestAPI.TestMutatingCounterProtocol>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestMutatingCounter_witness(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        static TestMutatingCounter() { _TypeSetup._ensureLoaded(); }
    }
}

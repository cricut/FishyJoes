using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(MutatingCounter) -->
    /// </summary>
    public record MutatingCounter {
        public nint Count { get; internal set; }

        public MutatingCounter(
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
            Check((out CreatedRef _exn) => __iota_TestAPI_MutatingCounter_tick(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_TestAPI_MutatingCounter_tick(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        static MutatingCounter() { _TypeSetup._ensureLoaded(); }
    }
}

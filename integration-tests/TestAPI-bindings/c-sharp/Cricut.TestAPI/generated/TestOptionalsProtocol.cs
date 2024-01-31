using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestOptionalsProtocol) -->
    /// </summary>
    public record TestOptionalsProtocol {
        public string? Flarp { get; set; }

        public TestOptionalsProtocol(
            string? Flarp
        ) {
            this.Flarp = Flarp;
        }

        /// <summary>
        /// <!-- FishyJoes.export(wombat) -->
        /// </summary>
        public double? Wombat(
            nint? zxc
        ) {
            using var _thisHandle = new GCRef(this);
            using var _zxcHandle = new GCRef(zxc);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestOptionalsProtocol_wombat(Loader.env, _thisHandle.ptr, _zxcHandle.ptr, out _exn)).Consume<double?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestOptionalsProtocol_wombat(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef zxc,
            out CreatedRef exn
        );

        static TestOptionalsProtocol() { _TypeSetup._ensureLoaded(); }
    }
}

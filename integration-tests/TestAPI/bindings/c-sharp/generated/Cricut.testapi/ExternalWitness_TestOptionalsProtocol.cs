using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestOptionalsProtocol) -->
    /// </summary>
    public class ExternalWitness_TestOptionalsProtocol : SwiftReference, Cricut.TestAPI.TestOptionalsProtocol {
        internal ExternalWitness_TestOptionalsProtocol(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(flarp) -->
        /// </summary>
        public string? Flarp {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_TestOptionalsProtocol_flarp(Loader.env, thisHandle.ptr, out exn).Consume<string?>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestOptionalsProtocol_flarp(IntPtr envRef, UnownedRef self, out CreatedRef exn);

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

        /// <summary>
        /// <!-- FishyJoes.export(spqr) -->
        /// </summary>
        public nint Spqr(
            Cricut.TestAPI.AssociatedDataEnum pippo
        ) {
            using var _thisHandle = new GCRef(this);
            using var _pippoHandle = new GCRef(pippo);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestOptionalsProtocol_spqr(Loader.env, _thisHandle.ptr, _pippoHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_TestAPI_TestOptionalsProtocol_spqr(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef pippo,
            out CreatedRef exn
        );

        static ExternalWitness_TestOptionalsProtocol() { _TypeSetup._ensureLoaded(); }
    }
}

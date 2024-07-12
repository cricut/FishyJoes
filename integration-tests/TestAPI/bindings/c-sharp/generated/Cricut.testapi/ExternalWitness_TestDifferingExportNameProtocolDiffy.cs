namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestDifferingExportNameProtocolDiffy) -->
    /// </summary>
    public class ExternalWitness_TestDifferingExportNameProtocolDiffy : SwiftReference, Cricut.TestAPI.TestDifferingExportNameProtocolDiffy {
        internal ExternalWitness_TestDifferingExportNameProtocolDiffy(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(tata) -->
        /// </summary>
        public nint Tata {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_TestDifferingExportNameProtocol_tata(Loader.env, thisHandle.ptr, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_TestDifferingExportNameProtocol_tata(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        static ExternalWitness_TestDifferingExportNameProtocolDiffy() { _TypeSetup._ensureLoaded(); }
    }
}

using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

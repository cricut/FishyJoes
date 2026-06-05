using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestDifferingExportNameProtocolDiffy) -->
    /// </summary>
    public interface TestDifferingExportNameProtocolDiffy {
        /// <summary>
        /// <!-- FishyJoes.export(tata) -->
        /// </summary>
        publicnint GetTata() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestDifferingExportNameProtocol_tata(Loader.env, thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_TestDifferingExportNameProtocol_tata(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        static TestDifferingExportNameProtocolDiffy() { _TypeSetup._ensureLoaded(); }
    }
}

using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestNonExportedProtocolEnum) -->
    /// </summary>
    public record TestNonExportedProtocolEnum {
        private TestNonExportedProtocolEnum() {}

        /// <summary>
        /// <!-- FishyJoes.export(fuga) -->
        /// </summary>
        public double GetFuga() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestNonExportedProtocolEnum_fuga(Loader.env, thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern double __iota_get_TestAPI_TestNonExportedProtocolEnum_fuga(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(hoge) -->
        /// </summary>
        public double Hoge(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestNonExportedProtocolEnum_hoge(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern double __iota_TestAPI_TestNonExportedProtocolEnum_hoge(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        static TestNonExportedProtocolEnum() { _TypeSetup._ensureLoaded(); }
    }
}

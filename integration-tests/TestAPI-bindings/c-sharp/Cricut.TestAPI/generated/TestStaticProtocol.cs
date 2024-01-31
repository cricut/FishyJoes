using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestStaticProtocol) -->
    /// </summary>
    public record TestStaticProtocol {

        public TestStaticProtocol(
        ) {
        }

        /// <summary>
        /// <!-- FishyJoes.export(blarg) -->
        /// </summary>
        public static string Blarg {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_TestStaticProtocol_blarg(Loader.env, out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestStaticProtocol_blarg(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(wibble) -->
        /// </summary>
        public static string Wibble(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestStaticProtocol_wibble(Loader.env, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestStaticProtocol_wibble(
            IntPtr envRef,
            out CreatedRef exn
        );

        static TestStaticProtocol() { _TypeSetup._ensureLoaded(); }
    }
}

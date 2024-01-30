using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestProtocol) -->
    /// </summary>
    public record TestProtocol {

        public TestProtocol(
        ) {
        }

        /// <summary>
        /// <!-- FishyJoes.export(xyzzy) -->
        /// </summary>
        public string Xyzzy(
            nint thud,
            System.Collections.Generic.IList<double> grault
        ) {
            using var _thisHandle = new GCRef(this);
            using var _graultHandle = new GCRef(grault);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocol_xyzzy(Loader.env, _thisHandle.ptr, thud, _graultHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestProtocol_xyzzy(
            IntPtr envRef,
            UnownedRef self,
            nint thud,
            UnownedRef grault,
            out CreatedRef exn
        );

        static TestProtocol() { _TypeSetup._ensureLoaded(); }
    }
}

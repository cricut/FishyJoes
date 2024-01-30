using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestProtocolEnum, protocols: [TestProtocol]) -->
    /// </summary>
    public record TestProtocolEnum {
        private TestProtocolEnum() {}

        public sealed record Qux : TestProtocolEnum;

        /// <summary>
        /// <!-- FishyJoes.export(xyzzy) -->
        /// </summary>
        public void Xyzzy(
            nint thud,
            System.Collections.Generic.IList<double> grault
        ) {
            using var _thisHandle = new GCRef(this);
            using var _graultHandle = new GCRef(grault);
            Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolEnum_xyzzy(Loader.env, _thisHandle.ptr, thud, _graultHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_TestAPI_TestProtocolEnum_xyzzy(
            IntPtr envRef,
            UnownedRef self,
            nint thud,
            UnownedRef grault,
            out CreatedRef exn
        );

        static TestProtocolEnum() { _TypeSetup._ensureLoaded(); }
    }
}

using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestProtocolEnum) -->
    /// </summary>
    public record TestProtocolEnum {
        private TestProtocolEnum() {}

        public sealed record Qux : TestProtocolEnum;

        /// <summary>
        /// <!-- FishyJoes.export(waldo) -->
        /// </summary>
        public static string Waldo {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_TestProtocolEnum_waldo(Loader.env, out exn).Consume<string>()
                );
            }
            set {
                using var valueHandle = new GCRef(value);
                Check((out CreatedRef exn) =>
                    __iota_set_TestAPI_TestProtocolEnum_waldo(Loader.env, valueHandle.ptr, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestProtocolEnum_waldo(IntPtr envRef, out CreatedRef exn);

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_set_TestAPI_TestProtocolEnum_waldo(IntPtr envRef, UnownedRef value, out CreatedRef exn);

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

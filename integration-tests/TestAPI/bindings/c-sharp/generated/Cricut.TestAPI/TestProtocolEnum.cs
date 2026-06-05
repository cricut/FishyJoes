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
        /// <!-- FishyJoes.export(foo) -->
        /// </summary>
        publicvoid Foo(
        ) {
            using var _thisHandle = new GCRef(this);
            Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolEnum_foo(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_TestAPI_TestProtocolEnum_foo(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(bar) -->
        /// </summary>
        publicbool Bar(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolEnum_bar(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        [return: MarshalAs(UnmanagedType.I1)]
        private static extern bool __iota_TestAPI_TestProtocolEnum_bar(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(baz) -->
        /// </summary>
        publicvoid Baz(
            bool qux
        ) {
            using var _thisHandle = new GCRef(this);
            Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolEnum_baz(Loader.env, _thisHandle.ptr, qux, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_TestAPI_TestProtocolEnum_baz(
            IntPtr envRef,
            UnownedRef self,
            [MarshalAs(UnmanagedType.I1)] bool qux,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(garply) -->
        /// </summary>
        publicstring Garply(
            string str
        ) {
            using var _thisHandle = new GCRef(this);
            using var _strHandle = new GCRef(str);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolEnum_garply(Loader.env, _thisHandle.ptr, _strHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestProtocolEnum_garply(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef str,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(xyzzy) -->
        /// </summary>
        publicstring Xyzzy(
            nint thud,
            System.Collections.Generic.IList<double> grault
        ) {
            using var _thisHandle = new GCRef(this);
            using var _graultHandle = new GCRef(grault);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolEnum_xyzzy(Loader.env, _thisHandle.ptr, thud, _graultHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestProtocolEnum_xyzzy(
            IntPtr envRef,
            UnownedRef self,
            nint thud,
            UnownedRef grault,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(plugh) -->
        /// </summary>
        publicSystem.Tuple<bool, nint, string> Plugh(
            System.Tuple<bool, double, System.Collections.Generic.IList<string>> fred
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fredHandle = new GCRef(fred);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolEnum_plugh(Loader.env, _thisHandle.ptr, _fredHandle.ptr, out _exn)).Consume<System.Tuple<bool, nint, string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestProtocolEnum_plugh(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fred,
            out CreatedRef exn
        );

        static TestProtocolEnum() { _TypeSetup._ensureLoaded(); }
    }
}

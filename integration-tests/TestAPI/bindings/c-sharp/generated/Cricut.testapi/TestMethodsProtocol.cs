namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestMethodsProtocol) -->
    /// </summary>
    public interface TestMethodsProtocol {
        /// <summary>
        /// <!-- FishyJoes.export(foo) -->
        /// </summary>
        public void Foo(
        ) {
            using var _thisHandle = new GCRef(this);
            Check((out CreatedRef _exn) => __iota_TestAPI_TestMethodsProtocol_foo(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_TestAPI_TestMethodsProtocol_foo(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(bar) -->
        /// </summary>
        public bool Bar(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestMethodsProtocol_bar(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __iota_TestAPI_TestMethodsProtocol_bar(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(baz) -->
        /// </summary>
        public void Baz(
            bool qux
        ) {
            using var _thisHandle = new GCRef(this);
            Check((out CreatedRef _exn) => __iota_TestAPI_TestMethodsProtocol_baz(Loader.env, _thisHandle.ptr, qux, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_TestAPI_TestMethodsProtocol_baz(
            IntPtr envRef,
            UnownedRef self,
            bool qux,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(garply) -->
        /// </summary>
        public string Garply(
            string _0
        ) {
            using var _thisHandle = new GCRef(this);
            using var __0Handle = new GCRef(_0);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestMethodsProtocol_garply(Loader.env, _thisHandle.ptr, __0Handle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestMethodsProtocol_garply(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef _0,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(xyzzy) -->
        /// </summary>
        public string Xyzzy(
            nint thud,
            System.Collections.Generic.IList<double> grault
        ) {
            using var _thisHandle = new GCRef(this);
            using var _graultHandle = new GCRef(grault);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestMethodsProtocol_xyzzy(Loader.env, _thisHandle.ptr, thud, _graultHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestMethodsProtocol_xyzzy(
            IntPtr envRef,
            UnownedRef self,
            nint thud,
            UnownedRef grault,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(plugh) -->
        /// </summary>
        public System.Tuple<bool, nint, string> Plugh(
            System.Tuple<bool, double, System.Collections.Generic.IList<string>> fred
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fredHandle = new GCRef(fred);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestMethodsProtocol_plugh(Loader.env, _thisHandle.ptr, _fredHandle.ptr, out _exn)).Consume<System.Tuple<bool, nint, string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestMethodsProtocol_plugh(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fred,
            out CreatedRef exn
        );

        static TestMethodsProtocol() { _TypeSetup._ensureLoaded(); }
    }
}

using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

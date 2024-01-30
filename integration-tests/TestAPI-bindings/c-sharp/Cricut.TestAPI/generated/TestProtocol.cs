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
        /// <!-- FishyJoes.export(foo) -->
        /// </summary>
        public void Foo(
        ) {
            using var _thisHandle = new GCRef(this);
            Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocol_foo(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_TestAPI_TestProtocol_foo(
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocol_bar(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __iota_TestAPI_TestProtocol_bar(
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
            Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocol_baz(Loader.env, _thisHandle.ptr, qux, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_TestAPI_TestProtocol_baz(
            IntPtr envRef,
            UnownedRef self,
            bool qux,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(garply) -->
        /// </summary>
        public string Garply(
            string placeholder1
        ) {
            using var _thisHandle = new GCRef(this);
            using var _placeholder1Handle = new GCRef(placeholder1);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocol_garply(Loader.env, _thisHandle.ptr, _placeholder1Handle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestProtocol_garply(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef placeholder1,
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

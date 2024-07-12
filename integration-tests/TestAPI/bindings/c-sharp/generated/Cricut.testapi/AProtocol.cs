using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(AProtocol) -->
    /// </summary>
    public interface AProtocol {
        /// <summary>
        /// <!-- FishyJoes.export(baz) -->
        /// </summary>
        public bool GetBaz() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_AProtocol_baz(Loader.env, thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __iota_get_TestAPI_AProtocol_baz(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(foo) -->
        /// </summary>
        public string GetFoo() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_AProtocol_foo(Loader.env, thisHandle.ptr, out exn).Consume<string>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AProtocol_foo(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(bar) -->
        /// </summary>
        public Cricut.TestAPI.AProtocol Bar(
            nint x,
            nint y
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AProtocol_bar(Loader.env, _thisHandle.ptr, x, y, out _exn)).Consume<Cricut.TestAPI.AProtocol>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AProtocol_bar(
            IntPtr envRef,
            UnownedRef self,
            nint x,
            nint y,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(hasADefaultImplementation) -->
        /// </summary>
        public string HasADefaultImplementation(
            nint x,
            double y
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AProtocol_hasADefaultImplementation(Loader.env, _thisHandle.ptr, x, y, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AProtocol_hasADefaultImplementation(
            IntPtr envRef,
            UnownedRef self,
            nint x,
            double y,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(hasADefaultImplementation2) -->
        /// </summary>
        public string HasADefaultImplementation2(
            string a,
            bool b,
            string c
        ) {
            using var _thisHandle = new GCRef(this);
            using var _aHandle = new GCRef(a);
            using var _cHandle = new GCRef(c);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AProtocol_hasADefaultImplementation2(Loader.env, _thisHandle.ptr, _aHandle.ptr, b, _cHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AProtocol_hasADefaultImplementation2(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef a,
            bool b,
            UnownedRef c,
            out CreatedRef exn
        );

        static AProtocol() { _TypeSetup._ensureLoaded(); }
    }
}

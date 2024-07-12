namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(EmptyStruct2) -->
    /// </summary>
    public record EmptyStruct2 {

        public EmptyStruct2(
        ) {
        }

        /// <summary>
        /// <!-- FishyJoes.export(tatiana) -->
        /// </summary>
        public string GetTatiana() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_EmptyStruct2_tatiana(Loader.env, thisHandle.ptr, out exn).Consume<string>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_EmptyStruct2_tatiana(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(tutu) -->
        /// </summary>
        public nint GetTutu() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_EmptyStruct2_tutu(Loader.env, thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_EmptyStruct2_tutu(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(create) -->
        /// </summary>
        public static Cricut.TestAPI.EmptyStruct2 Create(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyStruct2_create(Loader.env, out _exn)).Consume<Cricut.TestAPI.EmptyStruct2>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_EmptyStruct2_create(
            IntPtr envRef,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(aap) -->
        /// </summary>
        public string Aap(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyStruct2_aap(Loader.env, _thisHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_EmptyStruct2_aap(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(zxccxz) -->
        /// </summary>
        public string Zxccxz(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyStruct2_zxccxz(Loader.env, _thisHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_EmptyStruct2_zxccxz(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        static EmptyStruct2() { _TypeSetup._ensureLoaded(); }
    }
}

using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

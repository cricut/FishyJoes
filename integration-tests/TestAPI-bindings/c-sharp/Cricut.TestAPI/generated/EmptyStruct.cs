using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(EmptyStruct) -->
    /// </summary>
    public record EmptyStruct {

        public EmptyStruct(
        ) {
        }

        /// <summary>
        /// <!-- FishyJoes.export(tatiana) -->
        /// </summary>
        public string GetTatiana() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_EmptyStruct_tatiana(Loader.env, thisHandle.ptr, out exn).Consume<string>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_EmptyStruct_tatiana(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(tutu) -->
        /// </summary>
        public nint GetTutu() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_EmptyStruct_tutu(Loader.env, thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_EmptyStruct_tutu(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(create) -->
        /// </summary>
        public static Cricut.TestAPI.EmptyStruct Create(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyStruct_create(Loader.env, out _exn)).Consume<Cricut.TestAPI.EmptyStruct>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_EmptyStruct_create(
            IntPtr envRef,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(aap) -->
        /// </summary>
        public string Aap(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyStruct_aap(Loader.env, _thisHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_EmptyStruct_aap(
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyStruct_zxccxz(Loader.env, _thisHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_EmptyStruct_zxccxz(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        static EmptyStruct() { _TypeSetup._ensureLoaded(); }
    }
}

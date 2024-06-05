using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(EmptyClass1) -->
    /// </summary>
    public class EmptyClass1 : SwiftReference {
        internal EmptyClass1(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(blarg) -->
        /// </summary>
        public string GetBlarg() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_EmptyClass_blarg(Loader.env, thisHandle.ptr, out exn).Consume<string>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_EmptyClass_blarg(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(wibbledyWobbledyTimeyWhimey) -->
        /// </summary>
        public string GetWibbledyWobbledyTimeyWhimey() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_EmptyClass_wibbledyWobbledyTimeyWhimey(Loader.env, thisHandle.ptr, out exn).Consume<string>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_EmptyClass_wibbledyWobbledyTimeyWhimey(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(create) -->
        /// </summary>
        public static Cricut.TestAPI.EmptyClass1 Create(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyClass_create(Loader.env, out _exn)).Consume<Cricut.TestAPI.EmptyClass1>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_EmptyClass_create(
            IntPtr envRef,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(shme) -->
        /// </summary>
        public string Shme(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyClass_shme(Loader.env, _thisHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_EmptyClass_shme(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(Gorpers) -->
        /// </summary>
        public string Gorpers(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyClass_Gorpers(Loader.env, _thisHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_EmptyClass_Gorpers(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        public override bool Equals(
            object? other
        ) {
            using var thisHandle = new GCRef(this);
            using var otherHandle = new GCRef(other as Cricut.TestAPI.EmptyClass1);
            return Check((out CreatedRef exn) => __iota_TestAPI_EmptyClass_equals(Loader.env, thisHandle.ptr, otherHandle.ptr, out exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __iota_TestAPI_EmptyClass_equals(
            IntPtr envRef,
            UnownedRef lhs,
            UnownedRef rhs,
            out CreatedRef exn
        );

        public override int GetHashCode(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyClass_hash(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __iota_TestAPI_EmptyClass_hash(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        static EmptyClass1() { _TypeSetup._ensureLoaded(); }
    }
}

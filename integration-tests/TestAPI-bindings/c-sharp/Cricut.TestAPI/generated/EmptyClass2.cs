using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(EmptyClass2) -->
    /// </summary>
    public class EmptyClass2 : SwiftReference {
        internal EmptyClass2(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(blorg) -->
        /// </summary>
        public string GetBlorg() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_EmptyClass2_blorg(Loader.env, thisHandle.ptr, out exn).Consume<string>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_EmptyClass2_blorg(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(wibble) -->
        /// </summary>
        public string GetWibble() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_EmptyClass2_wibble(Loader.env, thisHandle.ptr, out exn).Consume<string>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_EmptyClass2_wibble(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(make) -->
        /// </summary>
        public static Cricut.TestAPI.EmptyClass2 Make(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyClass2_make(Loader.env, out _exn)).Consume<Cricut.TestAPI.EmptyClass2>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_EmptyClass2_make(
            IntPtr envRef,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(shmee) -->
        /// </summary>
        public string Shmee(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyClass2_shmee(Loader.env, _thisHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_EmptyClass2_shmee(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(gorp) -->
        /// </summary>
        public string Gorp(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyClass2_gorp(Loader.env, _thisHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_EmptyClass2_gorp(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        public override bool Equals(
            object? other
        ) {
            if (other as Cricut.TestAPI.EmptyClass2 == null) { return false; }
            using var thisHandle = new GCRef(this);
            using var otherHandle = new GCRef(other as Cricut.TestAPI.EmptyClass2);
            return Check((out CreatedRef exn) => __iota_TestAPI_EmptyClass2_equals(Loader.env, thisHandle.ptr, otherHandle.ptr, out exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        [return: MarshalAs(UnmanagedType.I1)]
        private static extern bool __iota_TestAPI_EmptyClass2_equals(
            IntPtr envRef,
            UnownedRef lhs,
            UnownedRef rhs,
            out CreatedRef exn
        );

        public override int GetHashCode(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_get_TestAPI_EmptyClass2_hash(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __iota_get_TestAPI_EmptyClass2_hash(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        static EmptyClass2() { _TypeSetup._ensureLoaded(); }
    }
}

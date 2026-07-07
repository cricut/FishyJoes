using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(ReferenceOnlyTypes) -->
    /// </summary>
    public record ReferenceOnlyTypes {
        private ReferenceOnlyTypes() {}

        /// <summary>
        /// <!-- FishyJoes.export(marker) -->
        /// </summary>
        public static Cricut.TestAPI.ReferenceOnlyTypes.Marker Marker_(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_ReferenceOnlyTypes_marker(Loader.env, out _exn)).Consume<Cricut.TestAPI.ReferenceOnlyTypes.Marker>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ReferenceOnlyTypes_marker(
            IntPtr envRef,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.exportReference(ReferenceOnlyTypes.Marker) -->
        /// </summary>
        public class Marker : SwiftReference {
            internal Marker(ConsumedRef reference): base(reference) {}

            public override bool Equals(
                object? other
            ) {
                if (other as Cricut.TestAPI.ReferenceOnlyTypes.Marker == null) { return false; }
                using var thisHandle = new GCRef(this);
                using var otherHandle = new GCRef(other as Cricut.TestAPI.ReferenceOnlyTypes.Marker);
                return Check((out CreatedRef exn) => __iota_TestAPI_ReferenceOnlyTypes_Marker_equals(Loader.env, thisHandle.ptr, otherHandle.ptr, out exn));
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            [return: MarshalAs(UnmanagedType.I1)]
            private static extern bool __iota_TestAPI_ReferenceOnlyTypes_Marker_equals(
                IntPtr envRef,
                UnownedRef lhs,
                UnownedRef rhs,
                out CreatedRef exn
            );

            public override int GetHashCode(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_get_TestAPI_ReferenceOnlyTypes_Marker_hash(Loader.env, _thisHandle.ptr, out _exn));
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern int __iota_get_TestAPI_ReferenceOnlyTypes_Marker_hash(
                IntPtr envRef,
                UnownedRef self,
                out CreatedRef exn
            );

            static Marker() { _TypeSetup._ensureLoaded(); }
        }
        static ReferenceOnlyTypes() { _TypeSetup._ensureLoaded(); }
    }
}

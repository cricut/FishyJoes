using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(AssociatedDataEnum) -->
    /// </summary>
    public record AssociatedDataEnum {
        private AssociatedDataEnum() {}

        public sealed record Thing(
            nint Value
        ) : AssociatedDataEnum;

        /// <summary>
        /// <!-- FishyJoes.export(intValue) -->
        /// </summary>
        public nint GetIntValue() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_AssociatedDataEnum_intValue(Loader.env, thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_AssociatedDataEnum_intValue(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        static AssociatedDataEnum() { _TypeSetup._ensureLoaded(); }
    }
}

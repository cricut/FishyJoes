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

        public sealed record Other(
            string Unnamed,
            nint _1
        ) : AssociatedDataEnum;

        public sealed record Bar(
            string Named,
            Cricut.TestAPI.AssociatedDataEnum _1
        ) : AssociatedDataEnum;

        /// <summary>
        /// <!-- FishyJoes.export(intValue) -->
        /// </summary>
        public nint GetIntValue() {
            using var thisHandle = new GCRef(this);
            return Check((out IntPtr exn) => 
                __cs_get_AssociatedDataEnum_IntValue(thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __cs_get_AssociatedDataEnum_IntValue(IntPtr self, out IntPtr exn);

        /// <summary>
        /// <!-- FishyJoes.export(plus) -->
        /// </summary>
        public Cricut.TestAPI.AssociatedDataEnum Plus(
            Cricut.TestAPI.AssociatedDataEnum other
        ) {
            using var _thisHandle = new GCRef(this);
            using var _otherHandle = new GCRef(other);
            return ConsumeHandle<Cricut.TestAPI.AssociatedDataEnum>(
                Check((out IntPtr _exn) => __cs_AssociatedDataEnum_plus(_thisHandle.ptr, _otherHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_AssociatedDataEnum_plus(
            IntPtr self,
            IntPtr other,
            out IntPtr exn
        );

        static AssociatedDataEnum() { _TypeSetup._ensureLoaded(); }
    }
}

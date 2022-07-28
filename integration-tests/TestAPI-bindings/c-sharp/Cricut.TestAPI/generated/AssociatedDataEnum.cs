using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <para><!-- FishyJoes.export(AssociatedDataEnum) --></para>
    /// </summary>
    public record AssociatedDataEnum {
        private AssociatedDataEnum() {}

        public sealed record Thing : AssociatedDataEnum {
            public nint Value;

            public Thing(
                nint Value
            ) {
                this.Value = Value;
            }
        }
        public sealed record Other : AssociatedDataEnum {
            public string Unnamed;
            public nint _1;

            public Other(
                string Unnamed,
                nint _1
            ) {
                this.Unnamed = Unnamed;
                this._1 = _1;
            }
        }
        public sealed record Bar : AssociatedDataEnum {
            public string Named;
            public Cricut.TestAPI.AssociatedDataEnum _1;

            public Bar(
                string Named,
                Cricut.TestAPI.AssociatedDataEnum _1
            ) {
                this.Named = Named;
                this._1 = _1;
            }
        }
        /// <summary>
        /// <para><!-- FishyJoes.export(intValue) --></para>
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
        /// <para><!-- FishyJoes.export(plus) --></para>
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

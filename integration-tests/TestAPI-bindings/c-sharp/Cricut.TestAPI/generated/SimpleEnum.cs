using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <para><!-- FishyJoes.export(SimpleEnum) --></para>
    /// </summary>
    public record SimpleEnum {
        private SimpleEnum() {}

        public sealed record Red : SimpleEnum {
            public Red() {}
        }
        public sealed record Green : SimpleEnum {
            public Green() {}
        }
        public sealed record Blue : SimpleEnum {
            public Blue() {}
        }
        /// <summary>
        /// <para><!-- FishyJoes.export(hex) --></para>
        /// </summary>
        public nint GetHex() {
            using var thisHandle = new GCRef(this);
            return Check((out IntPtr exn) => 
                __cs_get_SimpleEnum_Hex(thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __cs_get_SimpleEnum_Hex(IntPtr self, out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(pickAColor) --></para>
        /// </summary>
        public static Cricut.TestAPI.SimpleEnum? PickAColor(
            nint rawValue
        ) {
            return ConsumeHandle<Cricut.TestAPI.SimpleEnum?>(
                Check((out IntPtr _exn) => __cs_SimpleEnum_pickAColor(rawValue, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_SimpleEnum_pickAColor(
            nint rawValue,
            out IntPtr exn
        );

        static SimpleEnum() { _TypeSetup._ensureLoaded(); }
    }
}

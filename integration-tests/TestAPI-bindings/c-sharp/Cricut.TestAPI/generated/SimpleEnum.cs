using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(SimpleEnum) -->
    /// </summary>
    public record SimpleEnum {
        private SimpleEnum() {}

        public sealed record Red : SimpleEnum;

        public sealed record Green : SimpleEnum;

        public sealed record Blue : SimpleEnum;

        /// <summary>
        /// <!-- FishyJoes.export(hex) -->
        /// </summary>
        public nint GetHex() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_SimpleEnum_Hex(thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __cs_get_SimpleEnum_Hex(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(pickAColor) -->
        /// </summary>
        public static Cricut.TestAPI.SimpleEnum? PickAColor(
            nint rawValue
        ) {
            return Check((out CreatedRef _exn) => __cs_SimpleEnum_pickAColor(rawValue, out _exn)).Consume<Cricut.TestAPI.SimpleEnum?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_SimpleEnum_pickAColor(
            nint rawValue,
            out CreatedRef exn
        );

        static SimpleEnum() { _TypeSetup._ensureLoaded(); }
    }
}

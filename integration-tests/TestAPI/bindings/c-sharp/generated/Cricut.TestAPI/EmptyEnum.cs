using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(EmptyEnum) -->
    /// </summary>
    public record EmptyEnum {
        private EmptyEnum() {}

        /// <summary>
        /// <!-- FishyJoes.export(noot) -->
        /// </summary>
        public static nint GetNoot() {
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_EmptyEnum_noot(Loader.env, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_EmptyEnum_noot(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->
        /// </summary>
        public static Cricut.TestAPI.EmptyEnum NotGoingToHappen(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyEnum_notGoingToHappen(Loader.env, out _exn)).Consume<Cricut.TestAPI.EmptyEnum>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_EmptyEnum_notGoingToHappen(
            IntPtr envRef,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(mies) -->
        /// </summary>
        public static nint Mies(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyEnum_mies(Loader.env, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_TestAPI_EmptyEnum_mies(
            IntPtr envRef,
            out CreatedRef exn
        );

        static EmptyEnum() { _TypeSetup._ensureLoaded(); }
    }
}

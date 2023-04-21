using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Ranges) -->
    /// </summary>
    public record Ranges {
        private Ranges() {}

        /// <summary>
        /// <!-- FishyJoes.export(closedIntRange) -->
        /// </summary>
        public static nint ClosedIntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_ClosedIntRange(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __cs_get_Ranges_ClosedIntRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echo) -->
        /// </summary>
        public static nint Echo(
            nint closedIntRange
        ) {
            return Check((out CreatedRef _exn) => __cs_Ranges_echo(closedIntRange, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __cs_Ranges_echo(
            nint closedIntRange,
            out CreatedRef exn
        );

        static Ranges() { _TypeSetup._ensureLoaded(); }
    }
}

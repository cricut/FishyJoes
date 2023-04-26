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
        public static TODO.TODO ClosedIntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Ranges_ClosedIntRange(out exn).Consume<TODO.TODO>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Ranges_ClosedIntRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echo) -->
        /// </summary>
        public static TODO.TODO Echo(
            TODO.TODO closedIntRange
        ) {
            using var _closedIntRangeHandle = new GCRef(closedIntRange);
            return Check((out CreatedRef _exn) => __cs_Ranges_echo(_closedIntRangeHandle.ptr, out _exn)).Consume<TODO.TODO>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Ranges_echo(
            UnownedRef closedIntRange,
            out CreatedRef exn
        );

        static Ranges() { _TypeSetup._ensureLoaded(); }
    }
}

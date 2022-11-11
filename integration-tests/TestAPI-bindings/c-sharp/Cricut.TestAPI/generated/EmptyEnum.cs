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
        /// <!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->
        /// </summary>
        public static Cricut.TestAPI.EmptyEnum NotGoingToHappen(
        ) {
            return Check((out CreatedRef _exn) => __cs_EmptyEnum_notGoingToHappen(out _exn)).Consume<Cricut.TestAPI.EmptyEnum>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_EmptyEnum_notGoingToHappen(
            out CreatedRef exn
        );

        static EmptyEnum() { _TypeSetup._ensureLoaded(); }
    }
}

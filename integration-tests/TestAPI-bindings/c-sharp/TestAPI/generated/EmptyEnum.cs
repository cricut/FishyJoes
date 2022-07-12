using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <para><!-- FishyJoes.export(EmptyEnum) --></para>
    /// </summary>
    public record EmptyEnum {
        private EmptyEnum() {}

        /// <summary>
        /// <para><!-- FishyJoes.export(notGoingToHappen, noReturn: true) --></para>
        /// </summary>
        public static Cricut.TestAPI.EmptyEnum NotGoingToHappen(
        ) {
            return ConsumeHandle<Cricut.TestAPI.EmptyEnum>(
                Check((out IntPtr _exn) => __cs_EmptyEnum_notGoingToHappen(out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_EmptyEnum_notGoingToHappen(
            out IntPtr exn
        );

        static EmptyEnum() { _TypeSetup._ensureLoaded(); }
    }
}

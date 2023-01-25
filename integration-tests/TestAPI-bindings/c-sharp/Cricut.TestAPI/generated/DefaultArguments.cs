using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(DefaultArguments) -->
    /// </summary>
    public record DefaultArguments {
        private DefaultArguments() {}

        /// <summary>
        /// <!-- FishyJoes.export(echoDefaults) -->
        /// </summary>
        public static string EchoDefaults(
            nint? x,
            nint? y = null,
            double /* theLabelForZ */ z = 3.14
        ) {
            using var _yHandle = new GCRef(y);
            using var _xHandle = new GCRef(x);
            return Check((out CreatedRef _exn) => __cs_DefaultArguments_echoDefaults(_yHandle.ptr, _xHandle.ptr, z, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_DefaultArguments_echoDefaults(
            UnownedRef y,
            UnownedRef x,
            double z,
            out CreatedRef exn
        );

        static DefaultArguments() { _TypeSetup._ensureLoaded(); }
    }
}

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
        /// <!-- FishyJoes.export(echoDefaults, compatibilityOrder: [z, y]) -->
        /// </summary>
        public static string EchoDefaults(
            nint? x,
            nint? y = null,
            double /* theLabelForZ */ z = 3.14
        ) {
            using var _yHandle = new GCRef(y);
            using var _xHandle = new GCRef(x);
            return Check((out CreatedRef _exn) => __iota_TestAPI_DefaultArguments_echoDefaults(Loader.env, _yHandle.ptr, _xHandle.ptr, z, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_DefaultArguments_echoDefaults(
            IntPtr envRef,
            UnownedRef y,
            UnownedRef x,
            double z,
            out CreatedRef exn
        );

        static DefaultArguments() { _TypeSetup._ensureLoaded(); }
    }
}

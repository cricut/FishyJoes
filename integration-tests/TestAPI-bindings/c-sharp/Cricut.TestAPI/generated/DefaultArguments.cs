using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(DefaultArguments) -->
    /// </summary>
    public class DefaultArguments : SwiftReference {
        internal DefaultArguments(IntPtr reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(echoDefaults, cSharp: TheBytes) -->
        /// </summary>
        public static string EchoDefaults(
            nint? x,
            nint? y = null,
            double z = 3.14
        ) {
            using var _yHandle = new GCRef(y);
            using var _xHandle = new GCRef(x);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_DefaultArguments_echoDefaults(_yHandle.ptr, _xHandle.ptr, z, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_DefaultArguments_echoDefaults(
            IntPtr y,
            IntPtr x,
            double z,
            out IntPtr exn
        );

        static DefaultArguments() { _TypeSetup._ensureLoaded(); }
    }
}

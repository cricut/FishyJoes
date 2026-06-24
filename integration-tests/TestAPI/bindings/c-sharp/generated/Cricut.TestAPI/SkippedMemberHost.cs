using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(SkippedMemberHost) -->
    /// </summary>
    public record SkippedMemberHost {
        private SkippedMemberHost() {}

        /// <summary>
        /// <para>A sibling member referencing only exported types — must still generate.</para>
        /// <!-- FishyJoes.export(echoInt) -->
        /// </summary>
        public static nint EchoInt(
            nint value
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_SkippedMemberHost_echoInt(Loader.env, value, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_TestAPI_SkippedMemberHost_echoInt(
            IntPtr envRef,
            nint value,
            out CreatedRef exn
        );

        static SkippedMemberHost() { _TypeSetup._ensureLoaded(); }
    }
}

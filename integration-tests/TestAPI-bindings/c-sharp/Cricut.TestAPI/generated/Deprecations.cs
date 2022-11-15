using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Deprecations) -->
    /// </summary>
    public record Deprecations {
        private Deprecations() {}

        /// <summary>
        /// <!-- FishyJoes.export(deprecatedVariable) -->
        /// </summary>
        [Obsolete("replace with `deprecatedMethod` ( <-- swift name, sorry )")]
        public static nint DeprecatedVariable {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_Deprecations_DeprecatedVariable(out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_Deprecations_DeprecatedVariable(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(deprecatedMethod) -->
        /// </summary>
        [Obsolete("don't use this")]
        public static string DeprecatedMethod(
        ) {
            return Check((out CreatedRef _exn) => __iota_Deprecations_deprecatedMethod(out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_Deprecations_deprecatedMethod(
            out CreatedRef exn
        );

        static Deprecations() { _TypeSetup._ensureLoaded(); }
    }
}

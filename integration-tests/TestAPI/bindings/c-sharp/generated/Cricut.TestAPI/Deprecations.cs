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
        [Obsolete("replace with `deprecatedMethod` (This is the swift name of the replacement function, due to technical limitations)")]
        public staticnint DeprecatedVariable {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Deprecations_deprecatedVariable(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_Deprecations_deprecatedVariable(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(deprecatedMethod) -->
        /// </summary>
        [Obsolete("don't use this")]
        public staticstring DeprecatedMethod(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Deprecations_deprecatedMethod(Loader.env, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Deprecations_deprecatedMethod(
            IntPtr envRef,
            out CreatedRef exn
        );

        static Deprecations() { _TypeSetup._ensureLoaded(); }
    }
}

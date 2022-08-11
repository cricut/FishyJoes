using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(Deprecated) -->
    /// </summary>
    public class Deprecated : SwiftReference {
        internal Deprecated(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(deprecatedVariable) -->
        /// </summary>
        [Obsolete("replace with `deprecatedMethod` ( <-- swift name, sorry )")]
        public static nint DeprecatedVariable {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Deprecated_DeprecatedVariable(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __cs_get_Deprecated_DeprecatedVariable(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(deprecatedMethod) -->
        /// </summary>
        [Obsolete("don't use this")]
        public static string DeprecatedMethod(
        ) {
            return Check((out CreatedRef _exn) => __cs_Deprecated_deprecatedMethod(out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Deprecated_deprecatedMethod(
            out CreatedRef exn
        );

        static Deprecated() { _TypeSetup._ensureLoaded(); }
    }
}

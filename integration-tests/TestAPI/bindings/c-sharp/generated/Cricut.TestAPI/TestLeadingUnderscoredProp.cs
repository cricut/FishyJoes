using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestLeadingUnderscoredProp) -->
    /// </summary>
    public interface TestLeadingUnderscoredProp {
        /// <summary>
        /// <!-- FishyJoes.export(_leadingUnderscoreProp) -->
        /// </summary>
        public string Get_leadingUnderscoreProp() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestLeadingUnderscoredProp__leadingUnderscoreProp(Loader.env, thisHandle.ptr, out exn).Consume<string>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestLeadingUnderscoredProp__leadingUnderscoreProp(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        static TestLeadingUnderscoredProp() { _TypeSetup._ensureLoaded(); }
    }
}

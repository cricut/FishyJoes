namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestLeadingUnderscoredProp) -->
    /// </summary>
    public class ExternalWitness_TestLeadingUnderscoredProp : SwiftReference, Cricut.TestAPI.TestLeadingUnderscoredProp {
        internal ExternalWitness_TestLeadingUnderscoredProp(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(_leadingUnderscoreProp) -->
        /// </summary>
        public string _leadingUnderscoreProp {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_TestLeadingUnderscoredProp__leadingUnderscoreProp(Loader.env, thisHandle.ptr, out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestLeadingUnderscoredProp__leadingUnderscoreProp(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        static ExternalWitness_TestLeadingUnderscoredProp() { _TypeSetup._ensureLoaded(); }
    }
}

using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestDefaultComputedProperties) -->
    /// </summary>
    public class ExternalWitness_TestDefaultComputedProperties : SwiftReference, Cricut.TestAPI.TestDefaultComputedProperties {
        internal ExternalWitness_TestDefaultComputedProperties(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(noot) -->
        /// </summary>
        public nint GetNoot() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestDefaultComputedProperties_noot(Loader.env, thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_TestDefaultComputedProperties_noot(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(plutonic) -->
        /// </summary>
        public string GetPlutonic() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestDefaultComputedProperties_plutonic(Loader.env, thisHandle.ptr, out exn).Consume<string>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestDefaultComputedProperties_plutonic(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        static ExternalWitness_TestDefaultComputedProperties() { _TypeSetup._ensureLoaded(); }
    }
}

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestDefaultComputedPropertiesStruct) -->
    /// </summary>
    public record TestDefaultComputedPropertiesStruct: Cricut.TestAPI.TestDefaultComputedProperties {
        public bool Spam { get; set; }
        public nint Noot { get; set; }

        public TestDefaultComputedPropertiesStruct(
            bool Spam,
            nint Noot
        ) {
            this.Spam = Spam;
            this.Noot = Noot;
        }

        /// <summary>
        /// <!-- FishyJoes.export(plutonic) -->
        /// </summary>
        public string GetPlutonic() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota__default_TestAPI_TestDefaultComputedPropertiesStruct_plutonic(Loader.env, thisHandle.ptr, out exn).Consume<string>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota__default_TestAPI_TestDefaultComputedPropertiesStruct_plutonic(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        public nint GetNoot(
        ) {
            return Noot;
        }

        static TestDefaultComputedPropertiesStruct() { _TypeSetup._ensureLoaded(); }
    }
}

using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

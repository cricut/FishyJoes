using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestDefaultComputedPropertiesEnum) -->
    /// </summary>
    public record TestDefaultComputedPropertiesEnum {
        private TestDefaultComputedPropertiesEnum() {}

        public sealed record Qux : TestDefaultComputedPropertiesEnum;

        /// <summary>
        /// <!-- FishyJoes.export(noot) -->
        /// </summary>
        public nint GetNoot() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestDefaultComputedPropertiesEnum_noot(Loader.env, thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_TestDefaultComputedPropertiesEnum_noot(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(plutonic) -->
        /// </summary>
        public string GetPlutonic() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota__default_TestAPI_TestDefaultComputedPropertiesEnum_plutonic(Loader.env, thisHandle.ptr, out exn).Consume<string>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota__default_TestAPI_TestDefaultComputedPropertiesEnum_plutonic(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(spam) -->
        /// </summary>
        public bool GetSpam() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestDefaultComputedPropertiesEnum_spam(Loader.env, thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __iota_get_TestAPI_TestDefaultComputedPropertiesEnum_spam(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        static TestDefaultComputedPropertiesEnum() { _TypeSetup._ensureLoaded(); }
    }
}

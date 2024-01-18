using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(SimpleEnum) -->
    /// </summary>
    public record SimpleEnum {
        private SimpleEnum() {}

        public sealed record Red : SimpleEnum;

        /// <summary>
        /// <!-- FishyJoes.export(testFuncCall) -->
        /// </summary>
        public nint TestFuncCall(
            nint x,
            nint y
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_SimpleEnum_testFuncCall(Loader.env, _thisHandle.ptr, x, y, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_TestAPI_SimpleEnum_testFuncCall(
            IntPtr envRef,
            UnownedRef self,
            nint x,
            nint y,
            out CreatedRef exn
        );

        static SimpleEnum() { _TypeSetup._ensureLoaded(); }
    }
}

using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(ReferenceEmptyEnum) -->
    /// </summary>
    public record ReferenceEmptyEnum {
        private ReferenceEmptyEnum() {}

        /// <summary>
        /// <!-- FishyJoes.export(aStaticProperty) -->
        /// </summary>
        public static nint GetAStaticProperty() {
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_ReferenceEmptyEnum_aStaticProperty(Loader.env, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_ReferenceEmptyEnum_aStaticProperty(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->
        /// </summary>
        public static Cricut.TestAPI.ReferenceEmptyEnum NotGoingToHappen(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_ReferenceEmptyEnum_notGoingToHappen(Loader.env, out _exn)).Consume<Cricut.TestAPI.ReferenceEmptyEnum>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ReferenceEmptyEnum_notGoingToHappen(
            IntPtr envRef,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(aStaticMethod) -->
        /// </summary>
        public static nint AStaticMethod(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_ReferenceEmptyEnum_aStaticMethod(Loader.env, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_TestAPI_ReferenceEmptyEnum_aStaticMethod(
            IntPtr envRef,
            out CreatedRef exn
        );

        static ReferenceEmptyEnum() { _TypeSetup._ensureLoaded(); }
    }
}

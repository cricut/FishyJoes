using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(EmptyEnum) -->
    /// </summary>
    public record EmptyEnum {
        private EmptyEnum() {}

        /// <summary>
        /// <!-- FishyJoes.export(aStaticProperty) -->
        /// </summary>
        public staticnint GetAStaticProperty() {
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_EmptyEnum_aStaticProperty(Loader.env, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_EmptyEnum_aStaticProperty(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->
        /// </summary>
        public staticCricut.TestAPI.EmptyEnum NotGoingToHappen(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyEnum_notGoingToHappen(Loader.env, out _exn)).Consume<Cricut.TestAPI.EmptyEnum>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_EmptyEnum_notGoingToHappen(
            IntPtr envRef,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(aStaticMethod) -->
        /// </summary>
        public staticnint AStaticMethod(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_EmptyEnum_aStaticMethod(Loader.env, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_TestAPI_EmptyEnum_aStaticMethod(
            IntPtr envRef,
            out CreatedRef exn
        );

        static EmptyEnum() { _TypeSetup._ensureLoaded(); }
    }
}

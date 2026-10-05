using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(ShadowBox) -->
    /// </summary>
    public record ShadowBox {
        private ShadowBox() {}

        public sealed record Shade(
            Cricut.TestAPI.Shade _0
        ) : ShadowBox;

        public sealed record Empty : ShadowBox;

        /// <summary>
        /// <!-- FishyJoes.export(allShades) -->
        /// </summary>
        public System.Collections.Generic.IList<Cricut.TestAPI.Shade> GetAllShades() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_ShadowBox_allShades(Loader.env, thisHandle.ptr, out exn).Consume<System.Collections.Generic.IList<Cricut.TestAPI.Shade>>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ShadowBox_allShades(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(darkest) -->
        /// </summary>
        public static Cricut.TestAPI.Shade? Darkest(
            System.Collections.Generic.IList<Cricut.TestAPI.Shade> /* of */ shades
        ) {
            using var _shadesHandle = new GCRef(shades);
            return Check((out CreatedRef _exn) => __iota_TestAPI_ShadowBox_darkest(Loader.env, _shadesHandle.ptr, out _exn)).Consume<Cricut.TestAPI.Shade?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ShadowBox_darkest(
            IntPtr envRef,
            UnownedRef shades,
            out CreatedRef exn
        );

        static ShadowBox() { _TypeSetup._ensureLoaded(); }
    }
}

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

        public sealed record Green : SimpleEnum;

        public sealed record Blue : SimpleEnum;

        /// <summary>
        /// <!-- FishyJoes.export(hex) -->
        /// </summary>
        public nint GetHex() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_TestAPI_SimpleEnum_Hex(thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __cs_get_TestAPI_SimpleEnum_Hex(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(favoriteColor) -->
        /// </summary>
        public static Cricut.TestAPI.SimpleEnum FavoriteColor {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_TestAPI_SimpleEnum_FavoriteColor(out exn).Consume<Cricut.TestAPI.SimpleEnum>()
                );
            }
            set {
                using var valueHandle = new GCRef(value);
                Check((out CreatedRef exn) =>
                    __cs_set_TestAPI_SimpleEnum_FavoriteColor(valueHandle.ptr, out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_TestAPI_SimpleEnum_FavoriteColor(out CreatedRef exn);

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_set_TestAPI_SimpleEnum_FavoriteColor(UnownedRef value, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(pickAColor) -->
        /// </summary>
        public static Cricut.TestAPI.SimpleEnum? PickAColor(
            nint rawValue
        ) {
            return Check((out CreatedRef _exn) => __cs_TestAPI_SimpleEnum_pickAColor(rawValue, out _exn)).Consume<Cricut.TestAPI.SimpleEnum?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_TestAPI_SimpleEnum_pickAColor(
            nint rawValue,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(hexMethod) -->
        /// </summary>
        public string HexMethod(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __cs_TestAPI_SimpleEnum_hexMethod(_thisHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_TestAPI_SimpleEnum_hexMethod(
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(resetFavoriteColor) -->
        /// </summary>
        public static void ResetFavoriteColor(
        ) {
            Check((out CreatedRef _exn) => __cs_TestAPI_SimpleEnum_resetFavoriteColor(out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_TestAPI_SimpleEnum_resetFavoriteColor(
            out CreatedRef exn
        );

        static SimpleEnum() { _TypeSetup._ensureLoaded(); }
    }
}

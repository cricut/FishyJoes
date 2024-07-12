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
        /// <!-- FishyJoes.export(favoriteColor) -->
        /// </summary>
        public static Cricut.TestAPI.SimpleEnum FavoriteColor {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_SimpleEnum_favoriteColor(Loader.env, out exn).Consume<Cricut.TestAPI.SimpleEnum>()
                );
            }
            set {
                using var valueHandle = new GCRef(value);
                Check((out CreatedRef exn) =>
                    __iota_set_TestAPI_SimpleEnum_favoriteColor(Loader.env, valueHandle.ptr, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_SimpleEnum_favoriteColor(IntPtr envRef, out CreatedRef exn);

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_set_TestAPI_SimpleEnum_favoriteColor(IntPtr envRef, UnownedRef value, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(hex) -->
        /// </summary>
        public nint GetHex() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_SimpleEnum_hex(Loader.env, thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_SimpleEnum_hex(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(pickAColor) -->
        /// </summary>
        public static Cricut.TestAPI.SimpleEnum? PickAColor(
            nint rawValue
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_SimpleEnum_pickAColor(Loader.env, rawValue, out _exn)).Consume<Cricut.TestAPI.SimpleEnum?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_SimpleEnum_pickAColor(
            IntPtr envRef,
            nint rawValue,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(hexMethod) -->
        /// </summary>
        public string HexMethod(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_SimpleEnum_hexMethod(Loader.env, _thisHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_SimpleEnum_hexMethod(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(resetFavoriteColor) -->
        /// </summary>
        public static void ResetFavoriteColor(
        ) {
            Check((out CreatedRef _exn) => __iota_TestAPI_SimpleEnum_resetFavoriteColor(Loader.env, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_TestAPI_SimpleEnum_resetFavoriteColor(
            IntPtr envRef,
            out CreatedRef exn
        );

        static SimpleEnum() { _TypeSetup._ensureLoaded(); }
    }
}

using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

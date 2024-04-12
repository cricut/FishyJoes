using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Primitives) -->
    /// </summary>
    public record Primitives {
        private Primitives() {}

        /// <summary>
        /// <!-- FishyJoes.export(falseBool) -->
        /// </summary>
        public static bool FalseBool {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_falseBool(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __iota_get_TestAPI_Primitives_falseBool(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(trueBool) -->
        /// </summary>
        public static bool TrueBool {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_trueBool(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __iota_get_TestAPI_Primitives_trueBool(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroUInt8) -->
        /// </summary>
        public static byte ZeroUInt8 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_zeroUInt8(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern byte __iota_get_TestAPI_Primitives_zeroUInt8(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minUInt8) -->
        /// </summary>
        public static byte MinUInt8 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_minUInt8(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern byte __iota_get_TestAPI_Primitives_minUInt8(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxUInt8) -->
        /// </summary>
        public static byte MaxUInt8 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_maxUInt8(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern byte __iota_get_TestAPI_Primitives_maxUInt8(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroUInt16) -->
        /// </summary>
        public static ushort ZeroUInt16 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_zeroUInt16(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ushort __iota_get_TestAPI_Primitives_zeroUInt16(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minUInt16) -->
        /// </summary>
        public static ushort MinUInt16 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_minUInt16(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ushort __iota_get_TestAPI_Primitives_minUInt16(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxUInt16) -->
        /// </summary>
        public static ushort MaxUInt16 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_maxUInt16(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ushort __iota_get_TestAPI_Primitives_maxUInt16(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroUInt32) -->
        /// </summary>
        public static uint ZeroUInt32 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_zeroUInt32(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern uint __iota_get_TestAPI_Primitives_zeroUInt32(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minUInt32) -->
        /// </summary>
        public static uint MinUInt32 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_minUInt32(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern uint __iota_get_TestAPI_Primitives_minUInt32(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxUInt32) -->
        /// </summary>
        public static uint MaxUInt32 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_maxUInt32(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern uint __iota_get_TestAPI_Primitives_maxUInt32(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroUInt64) -->
        /// </summary>
        public static ulong ZeroUInt64 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_zeroUInt64(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ulong __iota_get_TestAPI_Primitives_zeroUInt64(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minUInt64) -->
        /// </summary>
        public static ulong MinUInt64 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_minUInt64(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ulong __iota_get_TestAPI_Primitives_minUInt64(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxUInt64) -->
        /// </summary>
        public static ulong MaxUInt64 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_maxUInt64(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ulong __iota_get_TestAPI_Primitives_maxUInt64(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroUInt) -->
        /// </summary>
        public static nuint ZeroUInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_zeroUInt(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nuint __iota_get_TestAPI_Primitives_zeroUInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minUInt) -->
        /// </summary>
        public static nuint MinUInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_minUInt(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nuint __iota_get_TestAPI_Primitives_minUInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxUInt) -->
        /// </summary>
        public static nuint MaxUInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_maxUInt(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nuint __iota_get_TestAPI_Primitives_maxUInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroInt8) -->
        /// </summary>
        public static sbyte ZeroInt8 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_zeroInt8(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern sbyte __iota_get_TestAPI_Primitives_zeroInt8(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minInt8) -->
        /// </summary>
        public static sbyte MinInt8 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_minInt8(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern sbyte __iota_get_TestAPI_Primitives_minInt8(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxInt8) -->
        /// </summary>
        public static sbyte MaxInt8 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_maxInt8(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern sbyte __iota_get_TestAPI_Primitives_maxInt8(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroInt16) -->
        /// </summary>
        public static short ZeroInt16 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_zeroInt16(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern short __iota_get_TestAPI_Primitives_zeroInt16(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minInt16) -->
        /// </summary>
        public static short MinInt16 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_minInt16(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern short __iota_get_TestAPI_Primitives_minInt16(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxInt16) -->
        /// </summary>
        public static short MaxInt16 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_maxInt16(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern short __iota_get_TestAPI_Primitives_maxInt16(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroInt32) -->
        /// </summary>
        public static int ZeroInt32 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_zeroInt32(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __iota_get_TestAPI_Primitives_zeroInt32(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minInt32) -->
        /// </summary>
        public static int MinInt32 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_minInt32(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __iota_get_TestAPI_Primitives_minInt32(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxInt32) -->
        /// </summary>
        public static int MaxInt32 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_maxInt32(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __iota_get_TestAPI_Primitives_maxInt32(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroInt64) -->
        /// </summary>
        public static long ZeroInt64 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_zeroInt64(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern long __iota_get_TestAPI_Primitives_zeroInt64(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minInt64) -->
        /// </summary>
        public static long MinInt64 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_minInt64(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern long __iota_get_TestAPI_Primitives_minInt64(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxInt64) -->
        /// </summary>
        public static long MaxInt64 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_maxInt64(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern long __iota_get_TestAPI_Primitives_maxInt64(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroInt) -->
        /// </summary>
        public static nint ZeroInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_zeroInt(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_Primitives_zeroInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minInt) -->
        /// </summary>
        public static nint MinInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_minInt(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_Primitives_minInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxInt) -->
        /// </summary>
        public static nint MaxInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_maxInt(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_Primitives_maxInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroFloat) -->
        /// </summary>
        public static float ZeroFloat {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_zeroFloat(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern float __iota_get_TestAPI_Primitives_zeroFloat(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minFloat) -->
        /// </summary>
        public static float MinFloat {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_minFloat(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern float __iota_get_TestAPI_Primitives_minFloat(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxFloat) -->
        /// </summary>
        public static float MaxFloat {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_maxFloat(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern float __iota_get_TestAPI_Primitives_maxFloat(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroDouble) -->
        /// </summary>
        public static double ZeroDouble {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_zeroDouble(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern double __iota_get_TestAPI_Primitives_zeroDouble(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minDouble) -->
        /// </summary>
        public static double MinDouble {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_minDouble(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern double __iota_get_TestAPI_Primitives_minDouble(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxDouble) -->
        /// </summary>
        public static double MaxDouble {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_maxDouble(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern double __iota_get_TestAPI_Primitives_maxDouble(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(bitCountUInt) -->
        /// </summary>
        public static nint BitCountUInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_bitCountUInt(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_Primitives_bitCountUInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(bitCountInt) -->
        /// </summary>
        public static nint BitCountInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_bitCountInt(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_Primitives_bitCountInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyBool) -->
        /// </summary>
        public static System.Collections.Generic.IList<bool> ManyBool {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyBool(Loader.env, out exn).Consume<System.Collections.Generic.IList<bool>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyBool(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyUInt8) -->
        /// </summary>
        public static System.Collections.Generic.IList<byte> ManyUInt8 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyUInt8(Loader.env, out exn).Consume<System.Collections.Generic.IList<byte>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyUInt8(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyUInt16) -->
        /// </summary>
        public static System.Collections.Generic.IList<ushort> ManyUInt16 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyUInt16(Loader.env, out exn).Consume<System.Collections.Generic.IList<ushort>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyUInt16(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyUInt32) -->
        /// </summary>
        public static System.Collections.Generic.IList<uint> ManyUInt32 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyUInt32(Loader.env, out exn).Consume<System.Collections.Generic.IList<uint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyUInt32(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyUInt64) -->
        /// </summary>
        public static System.Collections.Generic.IList<ulong> ManyUInt64 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyUInt64(Loader.env, out exn).Consume<System.Collections.Generic.IList<ulong>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyUInt64(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyUInt) -->
        /// </summary>
        public static System.Collections.Generic.IList<nuint> ManyUInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyUInt(Loader.env, out exn).Consume<System.Collections.Generic.IList<nuint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyUInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyInt8) -->
        /// </summary>
        public static System.Collections.Generic.IList<sbyte> ManyInt8 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyInt8(Loader.env, out exn).Consume<System.Collections.Generic.IList<sbyte>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyInt8(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyInt16) -->
        /// </summary>
        public static System.Collections.Generic.IList<short> ManyInt16 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyInt16(Loader.env, out exn).Consume<System.Collections.Generic.IList<short>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyInt16(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyInt32) -->
        /// </summary>
        public static System.Collections.Generic.IList<int> ManyInt32 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyInt32(Loader.env, out exn).Consume<System.Collections.Generic.IList<int>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyInt32(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyInt64) -->
        /// </summary>
        public static System.Collections.Generic.IList<long> ManyInt64 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyInt64(Loader.env, out exn).Consume<System.Collections.Generic.IList<long>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyInt64(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyInt) -->
        /// </summary>
        public static System.Collections.Generic.IList<nint> ManyInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyInt(Loader.env, out exn).Consume<System.Collections.Generic.IList<nint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyFloat) -->
        /// </summary>
        public static System.Collections.Generic.IList<float> ManyFloat {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyFloat(Loader.env, out exn).Consume<System.Collections.Generic.IList<float>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyFloat(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyDouble) -->
        /// </summary>
        public static System.Collections.Generic.IList<double> ManyDouble {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyDouble(Loader.env, out exn).Consume<System.Collections.Generic.IList<double>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyDouble(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeBool) -->
        /// </summary>
        public static System.Collections.Generic.IList<bool?> ManyMaybeBool {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyMaybeBool(Loader.env, out exn).Consume<System.Collections.Generic.IList<bool?>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyMaybeBool(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeUInt8) -->
        /// </summary>
        public static System.Collections.Generic.IList<byte?> ManyMaybeUInt8 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyMaybeUInt8(Loader.env, out exn).Consume<System.Collections.Generic.IList<byte?>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyMaybeUInt8(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeUInt16) -->
        /// </summary>
        public static System.Collections.Generic.IList<ushort?> ManyMaybeUInt16 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyMaybeUInt16(Loader.env, out exn).Consume<System.Collections.Generic.IList<ushort?>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyMaybeUInt16(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeUInt32) -->
        /// </summary>
        public static System.Collections.Generic.IList<uint?> ManyMaybeUInt32 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyMaybeUInt32(Loader.env, out exn).Consume<System.Collections.Generic.IList<uint?>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyMaybeUInt32(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeUInt64) -->
        /// </summary>
        public static System.Collections.Generic.IList<ulong?> ManyMaybeUInt64 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyMaybeUInt64(Loader.env, out exn).Consume<System.Collections.Generic.IList<ulong?>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyMaybeUInt64(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeUInt) -->
        /// </summary>
        public static System.Collections.Generic.IList<nuint?> ManyMaybeUInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyMaybeUInt(Loader.env, out exn).Consume<System.Collections.Generic.IList<nuint?>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyMaybeUInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeInt8) -->
        /// </summary>
        public static System.Collections.Generic.IList<sbyte?> ManyMaybeInt8 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyMaybeInt8(Loader.env, out exn).Consume<System.Collections.Generic.IList<sbyte?>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyMaybeInt8(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeInt16) -->
        /// </summary>
        public static System.Collections.Generic.IList<short?> ManyMaybeInt16 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyMaybeInt16(Loader.env, out exn).Consume<System.Collections.Generic.IList<short?>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyMaybeInt16(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeInt32) -->
        /// </summary>
        public static System.Collections.Generic.IList<int?> ManyMaybeInt32 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyMaybeInt32(Loader.env, out exn).Consume<System.Collections.Generic.IList<int?>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyMaybeInt32(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeInt64) -->
        /// </summary>
        public static System.Collections.Generic.IList<long?> ManyMaybeInt64 {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyMaybeInt64(Loader.env, out exn).Consume<System.Collections.Generic.IList<long?>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyMaybeInt64(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeInt) -->
        /// </summary>
        public static System.Collections.Generic.IList<nint?> ManyMaybeInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyMaybeInt(Loader.env, out exn).Consume<System.Collections.Generic.IList<nint?>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyMaybeInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeFloat) -->
        /// </summary>
        public static System.Collections.Generic.IList<float?> ManyMaybeFloat {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyMaybeFloat(Loader.env, out exn).Consume<System.Collections.Generic.IList<float?>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyMaybeFloat(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeDouble) -->
        /// </summary>
        public static System.Collections.Generic.IList<double?> ManyMaybeDouble {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_manyMaybeDouble(Loader.env, out exn).Consume<System.Collections.Generic.IList<double?>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_manyMaybeDouble(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(defaultPrimitiveHolder) -->
        /// </summary>
        public static Cricut.TestAPI.Primitives.PrimitiveHolder DefaultPrimitiveHolder {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Primitives_defaultPrimitiveHolder(Loader.env, out exn).Consume<Cricut.TestAPI.Primitives.PrimitiveHolder>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Primitives_defaultPrimitiveHolder(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echoBool) -->
        /// </summary>
        public static bool EchoBool(
            bool value
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_echoBool(Loader.env, value, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __iota_TestAPI_Primitives_echoBool(
            IntPtr envRef,
            bool value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt8) -->
        /// </summary>
        public static byte EchoUInt8(
            byte value
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_echoUInt8(Loader.env, value, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern byte __iota_TestAPI_Primitives_echoUInt8(
            IntPtr envRef,
            byte value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt16) -->
        /// </summary>
        public static ushort EchoUInt16(
            ushort value
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_echoUInt16(Loader.env, value, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ushort __iota_TestAPI_Primitives_echoUInt16(
            IntPtr envRef,
            ushort value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt32) -->
        /// </summary>
        public static uint EchoUInt32(
            uint value
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_echoUInt32(Loader.env, value, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern uint __iota_TestAPI_Primitives_echoUInt32(
            IntPtr envRef,
            uint value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt64) -->
        /// </summary>
        public static ulong EchoUInt64(
            ulong value
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_echoUInt64(Loader.env, value, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ulong __iota_TestAPI_Primitives_echoUInt64(
            IntPtr envRef,
            ulong value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt) -->
        /// </summary>
        public static nuint EchoUInt(
            nuint value
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_echoUInt(Loader.env, value, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nuint __iota_TestAPI_Primitives_echoUInt(
            IntPtr envRef,
            nuint value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt8) -->
        /// </summary>
        public static sbyte EchoInt8(
            sbyte value
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_echoInt8(Loader.env, value, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern sbyte __iota_TestAPI_Primitives_echoInt8(
            IntPtr envRef,
            sbyte value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt16) -->
        /// </summary>
        public static short EchoInt16(
            short value
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_echoInt16(Loader.env, value, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern short __iota_TestAPI_Primitives_echoInt16(
            IntPtr envRef,
            short value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt32) -->
        /// </summary>
        public static int EchoInt32(
            int value
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_echoInt32(Loader.env, value, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __iota_TestAPI_Primitives_echoInt32(
            IntPtr envRef,
            int value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt64) -->
        /// </summary>
        public static long EchoInt64(
            long value
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_echoInt64(Loader.env, value, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern long __iota_TestAPI_Primitives_echoInt64(
            IntPtr envRef,
            long value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt) -->
        /// </summary>
        public static nint EchoInt(
            nint value
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_echoInt(Loader.env, value, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_TestAPI_Primitives_echoInt(
            IntPtr envRef,
            nint value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoFloat) -->
        /// </summary>
        public static float EchoFloat(
            float value
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_echoFloat(Loader.env, value, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern float __iota_TestAPI_Primitives_echoFloat(
            IntPtr envRef,
            float value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoDouble) -->
        /// </summary>
        public static double EchoDouble(
            double value
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_echoDouble(Loader.env, value, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern double __iota_TestAPI_Primitives_echoDouble(
            IntPtr envRef,
            double value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(maybeEchoBool) -->
        /// </summary>
        public static bool? MaybeEchoBool(
            bool? value
        ) {
            using var _valueHandle = new GCRef(value);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_maybeEchoBool(Loader.env, _valueHandle.ptr, out _exn)).Consume<bool?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Primitives_maybeEchoBool(
            IntPtr envRef,
            UnownedRef value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(maybeEchoUInt8) -->
        /// </summary>
        public static byte? MaybeEchoUInt8(
            byte? value
        ) {
            using var _valueHandle = new GCRef(value);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_maybeEchoUInt8(Loader.env, _valueHandle.ptr, out _exn)).Consume<byte?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Primitives_maybeEchoUInt8(
            IntPtr envRef,
            UnownedRef value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(maybeEchoUInt16) -->
        /// </summary>
        public static ushort? MaybeEchoUInt16(
            ushort? value
        ) {
            using var _valueHandle = new GCRef(value);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_maybeEchoUInt16(Loader.env, _valueHandle.ptr, out _exn)).Consume<ushort?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Primitives_maybeEchoUInt16(
            IntPtr envRef,
            UnownedRef value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(maybeEchoUInt32) -->
        /// </summary>
        public static uint? MaybeEchoUInt32(
            uint? value
        ) {
            using var _valueHandle = new GCRef(value);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_maybeEchoUInt32(Loader.env, _valueHandle.ptr, out _exn)).Consume<uint?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Primitives_maybeEchoUInt32(
            IntPtr envRef,
            UnownedRef value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(maybeEchoUInt64) -->
        /// </summary>
        public static ulong? MaybeEchoUInt64(
            ulong? value
        ) {
            using var _valueHandle = new GCRef(value);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_maybeEchoUInt64(Loader.env, _valueHandle.ptr, out _exn)).Consume<ulong?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Primitives_maybeEchoUInt64(
            IntPtr envRef,
            UnownedRef value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(maybeEchoUInt) -->
        /// </summary>
        public static nuint? MaybeEchoUInt(
            nuint? value
        ) {
            using var _valueHandle = new GCRef(value);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_maybeEchoUInt(Loader.env, _valueHandle.ptr, out _exn)).Consume<nuint?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Primitives_maybeEchoUInt(
            IntPtr envRef,
            UnownedRef value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(maybeEchoInt8) -->
        /// </summary>
        public static sbyte? MaybeEchoInt8(
            sbyte? value
        ) {
            using var _valueHandle = new GCRef(value);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_maybeEchoInt8(Loader.env, _valueHandle.ptr, out _exn)).Consume<sbyte?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Primitives_maybeEchoInt8(
            IntPtr envRef,
            UnownedRef value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(maybeEchoInt16) -->
        /// </summary>
        public static short? MaybeEchoInt16(
            short? value
        ) {
            using var _valueHandle = new GCRef(value);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_maybeEchoInt16(Loader.env, _valueHandle.ptr, out _exn)).Consume<short?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Primitives_maybeEchoInt16(
            IntPtr envRef,
            UnownedRef value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(maybeEchoInt32) -->
        /// </summary>
        public static int? MaybeEchoInt32(
            int? value
        ) {
            using var _valueHandle = new GCRef(value);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_maybeEchoInt32(Loader.env, _valueHandle.ptr, out _exn)).Consume<int?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Primitives_maybeEchoInt32(
            IntPtr envRef,
            UnownedRef value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(maybeEchoInt64) -->
        /// </summary>
        public static long? MaybeEchoInt64(
            long? value
        ) {
            using var _valueHandle = new GCRef(value);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_maybeEchoInt64(Loader.env, _valueHandle.ptr, out _exn)).Consume<long?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Primitives_maybeEchoInt64(
            IntPtr envRef,
            UnownedRef value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(maybeEchoInt) -->
        /// </summary>
        public static nint? MaybeEchoInt(
            nint? value
        ) {
            using var _valueHandle = new GCRef(value);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_maybeEchoInt(Loader.env, _valueHandle.ptr, out _exn)).Consume<nint?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Primitives_maybeEchoInt(
            IntPtr envRef,
            UnownedRef value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(maybeEchoFloat) -->
        /// </summary>
        public static float? MaybeEchoFloat(
            float? value
        ) {
            using var _valueHandle = new GCRef(value);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_maybeEchoFloat(Loader.env, _valueHandle.ptr, out _exn)).Consume<float?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Primitives_maybeEchoFloat(
            IntPtr envRef,
            UnownedRef value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(maybeEchoDouble) -->
        /// </summary>
        public static double? MaybeEchoDouble(
            double? value
        ) {
            using var _valueHandle = new GCRef(value);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_maybeEchoDouble(Loader.env, _valueHandle.ptr, out _exn)).Consume<double?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Primitives_maybeEchoDouble(
            IntPtr envRef,
            UnownedRef value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(valueMapper) -->
        /// </summary>
        public static byte? ValueMapper(
            byte? value,
            System.Func<byte?, byte?> mapper
        ) {
            using var _valueHandle = new GCRef(value);
            using var _mapperHandle = new GCRef(mapper);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Primitives_valueMapper(Loader.env, _valueHandle.ptr, _mapperHandle.ptr, out _exn)).Consume<byte?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Primitives_valueMapper(
            IntPtr envRef,
            UnownedRef value,
            UnownedRef mapper,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(Primitives.PrimitiveHolder) -->
        /// </summary>
        public record PrimitiveHolder {
            public bool GetB() {
                return B;
            }
            public bool B { get; set; }
            public bool? GetBq() {
                return Bq;
            }
            public bool? Bq { get; set; }
            public byte GetUi8() {
                return Ui8;
            }
            public byte Ui8 { get; set; }
            public byte? GetUi8q() {
                return Ui8q;
            }
            public byte? Ui8q { get; set; }
            public ushort GetUi16() {
                return Ui16;
            }
            public ushort Ui16 { get; set; }
            public ushort? GetUi16q() {
                return Ui16q;
            }
            public ushort? Ui16q { get; set; }
            public uint GetUi32() {
                return Ui32;
            }
            public uint Ui32 { get; set; }
            public uint? GetUi32q() {
                return Ui32q;
            }
            public uint? Ui32q { get; set; }
            public ulong GetUi64() {
                return Ui64;
            }
            public ulong Ui64 { get; set; }
            public ulong? GetUi64q() {
                return Ui64q;
            }
            public ulong? Ui64q { get; set; }
            public nuint GetUi() {
                return Ui;
            }
            public nuint Ui { get; set; }
            public nuint? GetUiq() {
                return Uiq;
            }
            public nuint? Uiq { get; set; }
            public sbyte GetI8() {
                return I8;
            }
            public sbyte I8 { get; set; }
            public sbyte? GetI8q() {
                return I8q;
            }
            public sbyte? I8q { get; set; }
            public short GetI16() {
                return I16;
            }
            public short I16 { get; set; }
            public short? GetI16q() {
                return I16q;
            }
            public short? I16q { get; set; }
            public int GetI32() {
                return I32;
            }
            public int I32 { get; set; }
            public int? GetI32q() {
                return I32q;
            }
            public int? I32q { get; set; }
            public long GetI64() {
                return I64;
            }
            public long I64 { get; set; }
            public long? GetI64q() {
                return I64q;
            }
            public long? I64q { get; set; }
            public nint GetI() {
                return I;
            }
            public nint I { get; set; }
            public nint? GetIq() {
                return Iq;
            }
            public nint? Iq { get; set; }
            public float GetF() {
                return F;
            }
            public float F { get; set; }
            public float? GetFq() {
                return Fq;
            }
            public float? Fq { get; set; }
            public double GetD() {
                return D;
            }
            public double D { get; set; }
            public double? GetDq() {
                return Dq;
            }
            public double? Dq { get; set; }

            public PrimitiveHolder(
                bool B,
                bool? Bq,
                byte Ui8,
                byte? Ui8q,
                ushort Ui16,
                ushort? Ui16q,
                uint Ui32,
                uint? Ui32q,
                ulong Ui64,
                ulong? Ui64q,
                nuint Ui,
                nuint? Uiq,
                sbyte I8,
                sbyte? I8q,
                short I16,
                short? I16q,
                int I32,
                int? I32q,
                long I64,
                long? I64q,
                nint I,
                nint? Iq,
                float F,
                float? Fq,
                double D,
                double? Dq
            ) {
                this.B = B;
                this.Bq = Bq;
                this.Ui8 = Ui8;
                this.Ui8q = Ui8q;
                this.Ui16 = Ui16;
                this.Ui16q = Ui16q;
                this.Ui32 = Ui32;
                this.Ui32q = Ui32q;
                this.Ui64 = Ui64;
                this.Ui64q = Ui64q;
                this.Ui = Ui;
                this.Uiq = Uiq;
                this.I8 = I8;
                this.I8q = I8q;
                this.I16 = I16;
                this.I16q = I16q;
                this.I32 = I32;
                this.I32q = I32q;
                this.I64 = I64;
                this.I64q = I64q;
                this.I = I;
                this.Iq = Iq;
                this.F = F;
                this.Fq = Fq;
                this.D = D;
                this.Dq = Dq;
            }

            /// <summary>
            /// <!-- FishyJoes.export(staticProperty) -->
            /// </summary>
            public static System.Collections.Generic.IList<byte?> StaticProperty {
                get {
                    return Check((out CreatedRef exn) =>
                        __iota_get_TestAPI_Primitives_PrimitiveHolder_staticProperty(Loader.env, out exn).Consume<System.Collections.Generic.IList<byte?>>()
                    );
                }
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_TestAPI_Primitives_PrimitiveHolder_staticProperty(IntPtr envRef, out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(staticMutableProperty) -->
            /// </summary>
            public static System.Collections.Generic.IList<byte?> StaticMutableProperty {
                get {
                    return Check((out CreatedRef exn) =>
                        __iota_get_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty(Loader.env, out exn).Consume<System.Collections.Generic.IList<byte?>>()
                    );
                }
                set {
                    using var valueHandle = new GCRef(value);
                    Check((out CreatedRef exn) =>
                        __iota_set_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty(Loader.env, valueHandle.ptr, out exn)
                    );
                }
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty(IntPtr envRef, out CreatedRef exn);

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __iota_set_TestAPI_Primitives_PrimitiveHolder_staticMutableProperty(IntPtr envRef, UnownedRef value, out CreatedRef exn);

            static PrimitiveHolder() { _TypeSetup._ensureLoaded(); }
        }
        static Primitives() { _TypeSetup._ensureLoaded(); }
    }
}

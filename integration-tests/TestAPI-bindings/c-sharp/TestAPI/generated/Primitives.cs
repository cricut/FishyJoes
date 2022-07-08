using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /**
     * <!-- FishyJoes.exportReference(Primitives) -->
     */
    public class Primitives : SwiftReference {
        internal Primitives(IntPtr reference): base(reference) {}

        /**
         * <!-- FishyJoes.export(falseBool) -->
         */
        public static bool falseBool {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_falseBool(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern bool __cs_get_Primitives_falseBool(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(trueBool) -->
         */
        public static bool trueBool {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_trueBool(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern bool __cs_get_Primitives_trueBool(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(zeroUInt8) -->
         */
        public static byte zeroUInt8 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_zeroUInt8(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern byte __cs_get_Primitives_zeroUInt8(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(minUInt8) -->
         */
        public static byte minUInt8 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_minUInt8(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern byte __cs_get_Primitives_minUInt8(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maxUInt8) -->
         */
        public static byte maxUInt8 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_maxUInt8(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern byte __cs_get_Primitives_maxUInt8(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(zeroUInt16) -->
         */
        public static ushort zeroUInt16 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_zeroUInt16(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern ushort __cs_get_Primitives_zeroUInt16(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(minUInt16) -->
         */
        public static ushort minUInt16 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_minUInt16(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern ushort __cs_get_Primitives_minUInt16(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maxUInt16) -->
         */
        public static ushort maxUInt16 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_maxUInt16(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern ushort __cs_get_Primitives_maxUInt16(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(zeroUInt32) -->
         */
        public static uint zeroUInt32 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_zeroUInt32(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern uint __cs_get_Primitives_zeroUInt32(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(minUInt32) -->
         */
        public static uint minUInt32 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_minUInt32(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern uint __cs_get_Primitives_minUInt32(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maxUInt32) -->
         */
        public static uint maxUInt32 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_maxUInt32(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern uint __cs_get_Primitives_maxUInt32(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(zeroUInt64) -->
         */
        public static ulong zeroUInt64 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_zeroUInt64(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern ulong __cs_get_Primitives_zeroUInt64(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(minUInt64) -->
         */
        public static ulong minUInt64 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_minUInt64(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern ulong __cs_get_Primitives_minUInt64(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maxUInt64) -->
         */
        public static ulong maxUInt64 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_maxUInt64(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern ulong __cs_get_Primitives_maxUInt64(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(zeroInt8) -->
         */
        public static sbyte zeroInt8 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_zeroInt8(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern sbyte __cs_get_Primitives_zeroInt8(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(minInt8) -->
         */
        public static sbyte minInt8 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_minInt8(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern sbyte __cs_get_Primitives_minInt8(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maxInt8) -->
         */
        public static sbyte maxInt8 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_maxInt8(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern sbyte __cs_get_Primitives_maxInt8(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(zeroInt16) -->
         */
        public static short zeroInt16 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_zeroInt16(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern short __cs_get_Primitives_zeroInt16(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(minInt16) -->
         */
        public static short minInt16 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_minInt16(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern short __cs_get_Primitives_minInt16(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maxInt16) -->
         */
        public static short maxInt16 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_maxInt16(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern short __cs_get_Primitives_maxInt16(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(zeroInt32) -->
         */
        public static int zeroInt32 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_zeroInt32(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern int __cs_get_Primitives_zeroInt32(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(minInt32) -->
         */
        public static int minInt32 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_minInt32(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern int __cs_get_Primitives_minInt32(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maxInt32) -->
         */
        public static int maxInt32 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_maxInt32(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern int __cs_get_Primitives_maxInt32(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(zeroInt64) -->
         */
        public static long zeroInt64 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_zeroInt64(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern long __cs_get_Primitives_zeroInt64(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(minInt64) -->
         */
        public static long minInt64 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_minInt64(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern long __cs_get_Primitives_minInt64(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maxInt64) -->
         */
        public static long maxInt64 {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_maxInt64(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern long __cs_get_Primitives_maxInt64(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(zeroInt) -->
         */
        public static nint zeroInt {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_zeroInt(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern nint __cs_get_Primitives_zeroInt(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(minInt) -->
         */
        public static nint minInt {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_minInt(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern nint __cs_get_Primitives_minInt(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maxInt) -->
         */
        public static nint maxInt {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_maxInt(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern nint __cs_get_Primitives_maxInt(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(zeroFloat) -->
         */
        public static float zeroFloat {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_zeroFloat(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern float __cs_get_Primitives_zeroFloat(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(minFloat) -->
         */
        public static float minFloat {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_minFloat(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern float __cs_get_Primitives_minFloat(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maxFloat) -->
         */
        public static float maxFloat {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_maxFloat(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern float __cs_get_Primitives_maxFloat(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(zeroDouble) -->
         */
        public static double zeroDouble {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_zeroDouble(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern double __cs_get_Primitives_zeroDouble(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(minDouble) -->
         */
        public static double minDouble {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_minDouble(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern double __cs_get_Primitives_minDouble(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maxDouble) -->
         */
        public static double maxDouble {
            get => Check((out IntPtr exn) => {
                return __cs_get_Primitives_maxDouble(out exn);
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern double __cs_get_Primitives_maxDouble(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyBool) -->
         */
        public static bool[] manyBool {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<bool[]>(__cs_get_Primitives_manyBool(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyBool(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyUInt8) -->
         */
        public static byte[] manyUInt8 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<byte[]>(__cs_get_Primitives_manyUInt8(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyUInt8(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyUInt16) -->
         */
        public static ushort[] manyUInt16 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<ushort[]>(__cs_get_Primitives_manyUInt16(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyUInt16(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyUInt32) -->
         */
        public static uint[] manyUInt32 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<uint[]>(__cs_get_Primitives_manyUInt32(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyUInt32(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyUInt64) -->
         */
        public static ulong[] manyUInt64 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<ulong[]>(__cs_get_Primitives_manyUInt64(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyUInt64(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyInt8) -->
         */
        public static sbyte[] manyInt8 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<sbyte[]>(__cs_get_Primitives_manyInt8(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyInt8(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyInt16) -->
         */
        public static short[] manyInt16 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<short[]>(__cs_get_Primitives_manyInt16(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyInt16(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyInt32) -->
         */
        public static int[] manyInt32 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<int[]>(__cs_get_Primitives_manyInt32(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyInt32(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyInt64) -->
         */
        public static long[] manyInt64 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<long[]>(__cs_get_Primitives_manyInt64(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyInt64(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyFloat) -->
         */
        public static float[] manyFloat {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<float[]>(__cs_get_Primitives_manyFloat(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyFloat(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyDouble) -->
         */
        public static double[] manyDouble {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<double[]>(__cs_get_Primitives_manyDouble(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyDouble(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyMaybeBool) -->
         */
        public static bool?[] manyMaybeBool {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<bool?[]>(__cs_get_Primitives_manyMaybeBool(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyMaybeBool(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyMaybeUInt8) -->
         */
        public static byte?[] manyMaybeUInt8 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<byte?[]>(__cs_get_Primitives_manyMaybeUInt8(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyMaybeUInt8(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyMaybeUInt16) -->
         */
        public static ushort?[] manyMaybeUInt16 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<ushort?[]>(__cs_get_Primitives_manyMaybeUInt16(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyMaybeUInt16(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyMaybeUInt32) -->
         */
        public static uint?[] manyMaybeUInt32 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<uint?[]>(__cs_get_Primitives_manyMaybeUInt32(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyMaybeUInt32(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyMaybeUInt64) -->
         */
        public static ulong?[] manyMaybeUInt64 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<ulong?[]>(__cs_get_Primitives_manyMaybeUInt64(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyMaybeUInt64(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyMaybeInt8) -->
         */
        public static sbyte?[] manyMaybeInt8 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<sbyte?[]>(__cs_get_Primitives_manyMaybeInt8(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyMaybeInt8(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyMaybeInt16) -->
         */
        public static short?[] manyMaybeInt16 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<short?[]>(__cs_get_Primitives_manyMaybeInt16(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyMaybeInt16(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyMaybeInt32) -->
         */
        public static int?[] manyMaybeInt32 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<int?[]>(__cs_get_Primitives_manyMaybeInt32(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyMaybeInt32(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyMaybeInt64) -->
         */
        public static long?[] manyMaybeInt64 {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<long?[]>(__cs_get_Primitives_manyMaybeInt64(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyMaybeInt64(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyMaybeFloat) -->
         */
        public static float?[] manyMaybeFloat {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<float?[]>(__cs_get_Primitives_manyMaybeFloat(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyMaybeFloat(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(manyMaybeDouble) -->
         */
        public static double?[] manyMaybeDouble {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<double?[]>(__cs_get_Primitives_manyMaybeDouble(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_manyMaybeDouble(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(defaultPrimitiveHolder) -->
         */
        public static Cricut.TestAPI.Primitives.PrimitiveHolder defaultPrimitiveHolder {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<Cricut.TestAPI.Primitives.PrimitiveHolder>(__cs_get_Primitives_defaultPrimitiveHolder(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Primitives_defaultPrimitiveHolder(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(echoBool) -->
         */
        public static bool echoBool(
            bool value
        ) {
            return Check((out IntPtr _exn) => __cs_Primitives_echoBool(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern bool __cs_Primitives_echoBool(
            bool value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoUInt8) -->
         */
        public static byte echoUInt8(
            byte value
        ) {
            return Check((out IntPtr _exn) => __cs_Primitives_echoUInt8(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern byte __cs_Primitives_echoUInt8(
            byte value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoUInt16) -->
         */
        public static ushort echoUInt16(
            ushort value
        ) {
            return Check((out IntPtr _exn) => __cs_Primitives_echoUInt16(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern ushort __cs_Primitives_echoUInt16(
            ushort value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoUInt32) -->
         */
        public static uint echoUInt32(
            uint value
        ) {
            return Check((out IntPtr _exn) => __cs_Primitives_echoUInt32(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern uint __cs_Primitives_echoUInt32(
            uint value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoUInt64) -->
         */
        public static ulong echoUInt64(
            ulong value
        ) {
            return Check((out IntPtr _exn) => __cs_Primitives_echoUInt64(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern ulong __cs_Primitives_echoUInt64(
            ulong value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoInt8) -->
         */
        public static sbyte echoInt8(
            sbyte value
        ) {
            return Check((out IntPtr _exn) => __cs_Primitives_echoInt8(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern sbyte __cs_Primitives_echoInt8(
            sbyte value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoInt16) -->
         */
        public static short echoInt16(
            short value
        ) {
            return Check((out IntPtr _exn) => __cs_Primitives_echoInt16(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern short __cs_Primitives_echoInt16(
            short value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoInt32) -->
         */
        public static int echoInt32(
            int value
        ) {
            return Check((out IntPtr _exn) => __cs_Primitives_echoInt32(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern int __cs_Primitives_echoInt32(
            int value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoInt64) -->
         */
        public static long echoInt64(
            long value
        ) {
            return Check((out IntPtr _exn) => __cs_Primitives_echoInt64(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern long __cs_Primitives_echoInt64(
            long value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoFloat) -->
         */
        public static float echoFloat(
            float value
        ) {
            return Check((out IntPtr _exn) => __cs_Primitives_echoFloat(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern float __cs_Primitives_echoFloat(
            float value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoDouble) -->
         */
        public static double echoDouble(
            double value
        ) {
            return Check((out IntPtr _exn) => __cs_Primitives_echoDouble(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern double __cs_Primitives_echoDouble(
            double value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoBool) -->
         */
        public static bool? maybeEchoBool(
            bool? value
        ) {
            using var _valueHandle = new GCRef(value);
            return ConsumeHandle<bool?>(
                Check((out IntPtr _exn) => __cs_Primitives_maybeEchoBool(_valueHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Primitives_maybeEchoBool(
            IntPtr value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoUInt8) -->
         */
        public static byte? maybeEchoUInt8(
            byte? value
        ) {
            using var _valueHandle = new GCRef(value);
            return ConsumeHandle<byte?>(
                Check((out IntPtr _exn) => __cs_Primitives_maybeEchoUInt8(_valueHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Primitives_maybeEchoUInt8(
            IntPtr value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoUInt16) -->
         */
        public static ushort? maybeEchoUInt16(
            ushort? value
        ) {
            using var _valueHandle = new GCRef(value);
            return ConsumeHandle<ushort?>(
                Check((out IntPtr _exn) => __cs_Primitives_maybeEchoUInt16(_valueHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Primitives_maybeEchoUInt16(
            IntPtr value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoUInt32) -->
         */
        public static uint? maybeEchoUInt32(
            uint? value
        ) {
            using var _valueHandle = new GCRef(value);
            return ConsumeHandle<uint?>(
                Check((out IntPtr _exn) => __cs_Primitives_maybeEchoUInt32(_valueHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Primitives_maybeEchoUInt32(
            IntPtr value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoUInt64) -->
         */
        public static ulong? maybeEchoUInt64(
            ulong? value
        ) {
            using var _valueHandle = new GCRef(value);
            return ConsumeHandle<ulong?>(
                Check((out IntPtr _exn) => __cs_Primitives_maybeEchoUInt64(_valueHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Primitives_maybeEchoUInt64(
            IntPtr value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoInt8) -->
         */
        public static sbyte? maybeEchoInt8(
            sbyte? value
        ) {
            using var _valueHandle = new GCRef(value);
            return ConsumeHandle<sbyte?>(
                Check((out IntPtr _exn) => __cs_Primitives_maybeEchoInt8(_valueHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Primitives_maybeEchoInt8(
            IntPtr value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoInt16) -->
         */
        public static short? maybeEchoInt16(
            short? value
        ) {
            using var _valueHandle = new GCRef(value);
            return ConsumeHandle<short?>(
                Check((out IntPtr _exn) => __cs_Primitives_maybeEchoInt16(_valueHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Primitives_maybeEchoInt16(
            IntPtr value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoInt32) -->
         */
        public static int? maybeEchoInt32(
            int? value
        ) {
            using var _valueHandle = new GCRef(value);
            return ConsumeHandle<int?>(
                Check((out IntPtr _exn) => __cs_Primitives_maybeEchoInt32(_valueHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Primitives_maybeEchoInt32(
            IntPtr value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoInt64) -->
         */
        public static long? maybeEchoInt64(
            long? value
        ) {
            using var _valueHandle = new GCRef(value);
            return ConsumeHandle<long?>(
                Check((out IntPtr _exn) => __cs_Primitives_maybeEchoInt64(_valueHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Primitives_maybeEchoInt64(
            IntPtr value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoFloat) -->
         */
        public static float? maybeEchoFloat(
            float? value
        ) {
            using var _valueHandle = new GCRef(value);
            return ConsumeHandle<float?>(
                Check((out IntPtr _exn) => __cs_Primitives_maybeEchoFloat(_valueHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Primitives_maybeEchoFloat(
            IntPtr value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoDouble) -->
         */
        public static double? maybeEchoDouble(
            double? value
        ) {
            using var _valueHandle = new GCRef(value);
            return ConsumeHandle<double?>(
                Check((out IntPtr _exn) => __cs_Primitives_maybeEchoDouble(_valueHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Primitives_maybeEchoDouble(
            IntPtr value,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(Primitives.PrimitiveHolder) -->
         */
        public struct PrimitiveHolder {
            public bool b;
            public bool? bq;
            public byte ui8;
            public byte? ui8q;
            public ushort ui16;
            public ushort? ui16q;
            public uint ui32;
            public uint? ui32q;
            public ulong ui64;
            public ulong? ui64q;
            public sbyte i8;
            public sbyte? i8q;
            public short i16;
            public short? i16q;
            public int i32;
            public int? i32q;
            public long i64;
            public long? i64q;
            public float f;
            public float? fq;
            public double d;
            public double? dq;

            public PrimitiveHolder(
                bool b,
                bool? bq,
                byte ui8,
                byte? ui8q,
                ushort ui16,
                ushort? ui16q,
                uint ui32,
                uint? ui32q,
                ulong ui64,
                ulong? ui64q,
                sbyte i8,
                sbyte? i8q,
                short i16,
                short? i16q,
                int i32,
                int? i32q,
                long i64,
                long? i64q,
                float f,
                float? fq,
                double d,
                double? dq
            ) {
                this.b = b;
                this.bq = bq;
                this.ui8 = ui8;
                this.ui8q = ui8q;
                this.ui16 = ui16;
                this.ui16q = ui16q;
                this.ui32 = ui32;
                this.ui32q = ui32q;
                this.ui64 = ui64;
                this.ui64q = ui64q;
                this.i8 = i8;
                this.i8q = i8q;
                this.i16 = i16;
                this.i16q = i16q;
                this.i32 = i32;
                this.i32q = i32q;
                this.i64 = i64;
                this.i64q = i64q;
                this.f = f;
                this.fq = fq;
                this.d = d;
                this.dq = dq;
            }

            /**
             * <!-- FishyJoes.export(staticPropery) -->
             */
            public static byte?[] staticPropery {
                get => Check((out IntPtr exn) => {
                    return ConsumeHandle<byte?[]>(__cs_get_Primitives_PrimitiveHolder_staticPropery(out exn));
                });
            }

            [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
            private static extern IntPtr __cs_get_Primitives_PrimitiveHolder_staticPropery(out IntPtr exn);

            /**
             * <!-- FishyJoes.export(staticMutablePropery) -->
             */
            public static byte?[] staticMutablePropery {
                get => Check((out IntPtr exn) => {
                    return ConsumeHandle<byte?[]>(__cs_get_Primitives_PrimitiveHolder_staticMutablePropery(out exn));
                });
                set {
                    Check((out IntPtr exn) => {
                        using var valueHandle = new GCRef(value);
                        __cs_set_Primitives_PrimitiveHolder_staticMutablePropery(valueHandle.ptr, out exn);
                    });
                }
            }

            [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
            private static extern IntPtr __cs_get_Primitives_PrimitiveHolder_staticMutablePropery(out IntPtr exn);

            [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
            private static extern void __cs_set_Primitives_PrimitiveHolder_staticMutablePropery(IntPtr value, out IntPtr exn);

            static PrimitiveHolder() { _TypeSetup._ensureLoaded(); }
        }
        static Primitives() { _TypeSetup._ensureLoaded(); }
    }
}

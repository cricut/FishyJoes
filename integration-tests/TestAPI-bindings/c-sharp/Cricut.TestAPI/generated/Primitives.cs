using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(Primitives) -->
    /// </summary>
    public class Primitives : SwiftReference {
        internal Primitives(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(falseBool) -->
        /// </summary>
        public static bool FalseBool {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_FalseBool(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __cs_get_Primitives_FalseBool(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(trueBool) -->
        /// </summary>
        public static bool TrueBool {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_TrueBool(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __cs_get_Primitives_TrueBool(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroUInt8) -->
        /// </summary>
        public static byte ZeroUInt8 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ZeroUInt8(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern byte __cs_get_Primitives_ZeroUInt8(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minUInt8) -->
        /// </summary>
        public static byte MinUInt8 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MinUInt8(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern byte __cs_get_Primitives_MinUInt8(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxUInt8) -->
        /// </summary>
        public static byte MaxUInt8 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MaxUInt8(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern byte __cs_get_Primitives_MaxUInt8(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroUInt16) -->
        /// </summary>
        public static ushort ZeroUInt16 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ZeroUInt16(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ushort __cs_get_Primitives_ZeroUInt16(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minUInt16) -->
        /// </summary>
        public static ushort MinUInt16 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MinUInt16(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ushort __cs_get_Primitives_MinUInt16(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxUInt16) -->
        /// </summary>
        public static ushort MaxUInt16 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MaxUInt16(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ushort __cs_get_Primitives_MaxUInt16(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroUInt32) -->
        /// </summary>
        public static uint ZeroUInt32 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ZeroUInt32(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern uint __cs_get_Primitives_ZeroUInt32(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minUInt32) -->
        /// </summary>
        public static uint MinUInt32 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MinUInt32(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern uint __cs_get_Primitives_MinUInt32(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxUInt32) -->
        /// </summary>
        public static uint MaxUInt32 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MaxUInt32(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern uint __cs_get_Primitives_MaxUInt32(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroUInt64) -->
        /// </summary>
        public static ulong ZeroUInt64 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ZeroUInt64(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ulong __cs_get_Primitives_ZeroUInt64(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minUInt64) -->
        /// </summary>
        public static ulong MinUInt64 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MinUInt64(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ulong __cs_get_Primitives_MinUInt64(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxUInt64) -->
        /// </summary>
        public static ulong MaxUInt64 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MaxUInt64(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ulong __cs_get_Primitives_MaxUInt64(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroInt8) -->
        /// </summary>
        public static sbyte ZeroInt8 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ZeroInt8(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern sbyte __cs_get_Primitives_ZeroInt8(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minInt8) -->
        /// </summary>
        public static sbyte MinInt8 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MinInt8(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern sbyte __cs_get_Primitives_MinInt8(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxInt8) -->
        /// </summary>
        public static sbyte MaxInt8 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MaxInt8(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern sbyte __cs_get_Primitives_MaxInt8(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroInt16) -->
        /// </summary>
        public static short ZeroInt16 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ZeroInt16(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern short __cs_get_Primitives_ZeroInt16(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minInt16) -->
        /// </summary>
        public static short MinInt16 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MinInt16(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern short __cs_get_Primitives_MinInt16(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxInt16) -->
        /// </summary>
        public static short MaxInt16 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MaxInt16(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern short __cs_get_Primitives_MaxInt16(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroInt32) -->
        /// </summary>
        public static int ZeroInt32 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ZeroInt32(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __cs_get_Primitives_ZeroInt32(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minInt32) -->
        /// </summary>
        public static int MinInt32 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MinInt32(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __cs_get_Primitives_MinInt32(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxInt32) -->
        /// </summary>
        public static int MaxInt32 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MaxInt32(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __cs_get_Primitives_MaxInt32(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroInt64) -->
        /// </summary>
        public static long ZeroInt64 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ZeroInt64(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern long __cs_get_Primitives_ZeroInt64(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minInt64) -->
        /// </summary>
        public static long MinInt64 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MinInt64(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern long __cs_get_Primitives_MinInt64(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxInt64) -->
        /// </summary>
        public static long MaxInt64 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MaxInt64(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern long __cs_get_Primitives_MaxInt64(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroInt) -->
        /// </summary>
        public static nint ZeroInt {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ZeroInt(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __cs_get_Primitives_ZeroInt(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minInt) -->
        /// </summary>
        public static nint MinInt {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MinInt(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __cs_get_Primitives_MinInt(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxInt) -->
        /// </summary>
        public static nint MaxInt {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MaxInt(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __cs_get_Primitives_MaxInt(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroFloat) -->
        /// </summary>
        public static float ZeroFloat {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ZeroFloat(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern float __cs_get_Primitives_ZeroFloat(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minFloat) -->
        /// </summary>
        public static float MinFloat {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MinFloat(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern float __cs_get_Primitives_MinFloat(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxFloat) -->
        /// </summary>
        public static float MaxFloat {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MaxFloat(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern float __cs_get_Primitives_MaxFloat(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(zeroDouble) -->
        /// </summary>
        public static double ZeroDouble {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ZeroDouble(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern double __cs_get_Primitives_ZeroDouble(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(minDouble) -->
        /// </summary>
        public static double MinDouble {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MinDouble(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern double __cs_get_Primitives_MinDouble(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maxDouble) -->
        /// </summary>
        public static double MaxDouble {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_MaxDouble(out exn)
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern double __cs_get_Primitives_MaxDouble(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyBool) -->
        /// </summary>
        public static System.Collections.Generic.IList<bool> ManyBool {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyBool(out exn).Consume<System.Collections.Generic.IList<bool>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyBool(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyUInt8) -->
        /// </summary>
        public static System.Collections.Generic.IList<byte> ManyUInt8 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyUInt8(out exn).Consume<System.Collections.Generic.IList<byte>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyUInt8(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyUInt16) -->
        /// </summary>
        public static System.Collections.Generic.IList<ushort> ManyUInt16 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyUInt16(out exn).Consume<System.Collections.Generic.IList<ushort>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyUInt16(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyUInt32) -->
        /// </summary>
        public static System.Collections.Generic.IList<uint> ManyUInt32 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyUInt32(out exn).Consume<System.Collections.Generic.IList<uint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyUInt32(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyUInt64) -->
        /// </summary>
        public static System.Collections.Generic.IList<ulong> ManyUInt64 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyUInt64(out exn).Consume<System.Collections.Generic.IList<ulong>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyUInt64(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyInt8) -->
        /// </summary>
        public static System.Collections.Generic.IList<sbyte> ManyInt8 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyInt8(out exn).Consume<System.Collections.Generic.IList<sbyte>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyInt8(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyInt16) -->
        /// </summary>
        public static System.Collections.Generic.IList<short> ManyInt16 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyInt16(out exn).Consume<System.Collections.Generic.IList<short>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyInt16(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyInt32) -->
        /// </summary>
        public static System.Collections.Generic.IList<int> ManyInt32 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyInt32(out exn).Consume<System.Collections.Generic.IList<int>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyInt32(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyInt64) -->
        /// </summary>
        public static System.Collections.Generic.IList<long> ManyInt64 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyInt64(out exn).Consume<System.Collections.Generic.IList<long>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyInt64(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyFloat) -->
        /// </summary>
        public static System.Collections.Generic.IList<float> ManyFloat {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyFloat(out exn).Consume<System.Collections.Generic.IList<float>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyFloat(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyDouble) -->
        /// </summary>
        public static System.Collections.Generic.IList<double> ManyDouble {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyDouble(out exn).Consume<System.Collections.Generic.IList<double>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyDouble(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeBool) -->
        /// </summary>
        public static System.Collections.Generic.IList<bool?> ManyMaybeBool {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyMaybeBool(out exn).Consume<System.Collections.Generic.IList<bool?>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyMaybeBool(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeUInt8) -->
        /// </summary>
        public static System.Collections.Generic.IList<byte?> ManyMaybeUInt8 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyMaybeUInt8(out exn).Consume<System.Collections.Generic.IList<byte?>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyMaybeUInt8(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeUInt16) -->
        /// </summary>
        public static System.Collections.Generic.IList<ushort?> ManyMaybeUInt16 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyMaybeUInt16(out exn).Consume<System.Collections.Generic.IList<ushort?>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyMaybeUInt16(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeUInt32) -->
        /// </summary>
        public static System.Collections.Generic.IList<uint?> ManyMaybeUInt32 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyMaybeUInt32(out exn).Consume<System.Collections.Generic.IList<uint?>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyMaybeUInt32(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeUInt64) -->
        /// </summary>
        public static System.Collections.Generic.IList<ulong?> ManyMaybeUInt64 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyMaybeUInt64(out exn).Consume<System.Collections.Generic.IList<ulong?>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyMaybeUInt64(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeInt8) -->
        /// </summary>
        public static System.Collections.Generic.IList<sbyte?> ManyMaybeInt8 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyMaybeInt8(out exn).Consume<System.Collections.Generic.IList<sbyte?>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyMaybeInt8(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeInt16) -->
        /// </summary>
        public static System.Collections.Generic.IList<short?> ManyMaybeInt16 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyMaybeInt16(out exn).Consume<System.Collections.Generic.IList<short?>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyMaybeInt16(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeInt32) -->
        /// </summary>
        public static System.Collections.Generic.IList<int?> ManyMaybeInt32 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyMaybeInt32(out exn).Consume<System.Collections.Generic.IList<int?>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyMaybeInt32(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeInt64) -->
        /// </summary>
        public static System.Collections.Generic.IList<long?> ManyMaybeInt64 {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyMaybeInt64(out exn).Consume<System.Collections.Generic.IList<long?>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyMaybeInt64(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeFloat) -->
        /// </summary>
        public static System.Collections.Generic.IList<float?> ManyMaybeFloat {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyMaybeFloat(out exn).Consume<System.Collections.Generic.IList<float?>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyMaybeFloat(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(manyMaybeDouble) -->
        /// </summary>
        public static System.Collections.Generic.IList<double?> ManyMaybeDouble {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_ManyMaybeDouble(out exn).Consume<System.Collections.Generic.IList<double?>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_ManyMaybeDouble(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(defaultPrimitiveHolder) -->
        /// </summary>
        public static Cricut.TestAPI.Primitives.PrimitiveHolder DefaultPrimitiveHolder {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Primitives_DefaultPrimitiveHolder(out exn).Consume<Cricut.TestAPI.Primitives.PrimitiveHolder>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Primitives_DefaultPrimitiveHolder(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echoBool) -->
        /// </summary>
        public static bool EchoBool(
            bool value
        ) {
            return Check((out CreatedRef _exn) => __cs_Primitives_echoBool(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __cs_Primitives_echoBool(
            bool value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt8) -->
        /// </summary>
        public static byte EchoUInt8(
            byte value
        ) {
            return Check((out CreatedRef _exn) => __cs_Primitives_echoUInt8(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern byte __cs_Primitives_echoUInt8(
            byte value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt16) -->
        /// </summary>
        public static ushort EchoUInt16(
            ushort value
        ) {
            return Check((out CreatedRef _exn) => __cs_Primitives_echoUInt16(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ushort __cs_Primitives_echoUInt16(
            ushort value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt32) -->
        /// </summary>
        public static uint EchoUInt32(
            uint value
        ) {
            return Check((out CreatedRef _exn) => __cs_Primitives_echoUInt32(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern uint __cs_Primitives_echoUInt32(
            uint value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt64) -->
        /// </summary>
        public static ulong EchoUInt64(
            ulong value
        ) {
            return Check((out CreatedRef _exn) => __cs_Primitives_echoUInt64(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern ulong __cs_Primitives_echoUInt64(
            ulong value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt8) -->
        /// </summary>
        public static sbyte EchoInt8(
            sbyte value
        ) {
            return Check((out CreatedRef _exn) => __cs_Primitives_echoInt8(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern sbyte __cs_Primitives_echoInt8(
            sbyte value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt16) -->
        /// </summary>
        public static short EchoInt16(
            short value
        ) {
            return Check((out CreatedRef _exn) => __cs_Primitives_echoInt16(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern short __cs_Primitives_echoInt16(
            short value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt32) -->
        /// </summary>
        public static int EchoInt32(
            int value
        ) {
            return Check((out CreatedRef _exn) => __cs_Primitives_echoInt32(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __cs_Primitives_echoInt32(
            int value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt64) -->
        /// </summary>
        public static long EchoInt64(
            long value
        ) {
            return Check((out CreatedRef _exn) => __cs_Primitives_echoInt64(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern long __cs_Primitives_echoInt64(
            long value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoFloat) -->
        /// </summary>
        public static float EchoFloat(
            float value
        ) {
            return Check((out CreatedRef _exn) => __cs_Primitives_echoFloat(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern float __cs_Primitives_echoFloat(
            float value,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoDouble) -->
        /// </summary>
        public static double EchoDouble(
            double value
        ) {
            return Check((out CreatedRef _exn) => __cs_Primitives_echoDouble(value, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern double __cs_Primitives_echoDouble(
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
            return Check((out CreatedRef _exn) => __cs_Primitives_maybeEchoBool(_valueHandle.ptr, out _exn)).Consume<bool?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Primitives_maybeEchoBool(
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
            return Check((out CreatedRef _exn) => __cs_Primitives_maybeEchoUInt8(_valueHandle.ptr, out _exn)).Consume<byte?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Primitives_maybeEchoUInt8(
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
            return Check((out CreatedRef _exn) => __cs_Primitives_maybeEchoUInt16(_valueHandle.ptr, out _exn)).Consume<ushort?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Primitives_maybeEchoUInt16(
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
            return Check((out CreatedRef _exn) => __cs_Primitives_maybeEchoUInt32(_valueHandle.ptr, out _exn)).Consume<uint?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Primitives_maybeEchoUInt32(
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
            return Check((out CreatedRef _exn) => __cs_Primitives_maybeEchoUInt64(_valueHandle.ptr, out _exn)).Consume<ulong?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Primitives_maybeEchoUInt64(
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
            return Check((out CreatedRef _exn) => __cs_Primitives_maybeEchoInt8(_valueHandle.ptr, out _exn)).Consume<sbyte?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Primitives_maybeEchoInt8(
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
            return Check((out CreatedRef _exn) => __cs_Primitives_maybeEchoInt16(_valueHandle.ptr, out _exn)).Consume<short?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Primitives_maybeEchoInt16(
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
            return Check((out CreatedRef _exn) => __cs_Primitives_maybeEchoInt32(_valueHandle.ptr, out _exn)).Consume<int?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Primitives_maybeEchoInt32(
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
            return Check((out CreatedRef _exn) => __cs_Primitives_maybeEchoInt64(_valueHandle.ptr, out _exn)).Consume<long?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Primitives_maybeEchoInt64(
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
            return Check((out CreatedRef _exn) => __cs_Primitives_maybeEchoFloat(_valueHandle.ptr, out _exn)).Consume<float?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Primitives_maybeEchoFloat(
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
            return Check((out CreatedRef _exn) => __cs_Primitives_maybeEchoDouble(_valueHandle.ptr, out _exn)).Consume<double?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Primitives_maybeEchoDouble(
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
            return Check((out CreatedRef _exn) => __cs_Primitives_valueMapper(_valueHandle.ptr, _mapperHandle.ptr, out _exn)).Consume<byte?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Primitives_valueMapper(
            UnownedRef value,
            UnownedRef mapper,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(Primitives.PrimitiveHolder) -->
        /// </summary>
        public record PrimitiveHolder {
            public bool B;
            public bool? Bq;
            public byte Ui8;
            public byte? Ui8q;
            public ushort Ui16;
            public ushort? Ui16q;
            public uint Ui32;
            public uint? Ui32q;
            public ulong Ui64;
            public ulong? Ui64q;
            public sbyte I8;
            public sbyte? I8q;
            public short I16;
            public short? I16q;
            public int I32;
            public int? I32q;
            public long I64;
            public long? I64q;
            public float F;
            public float? Fq;
            public double D;
            public double? Dq;

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
                sbyte I8,
                sbyte? I8q,
                short I16,
                short? I16q,
                int I32,
                int? I32q,
                long I64,
                long? I64q,
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
                this.I8 = I8;
                this.I8q = I8q;
                this.I16 = I16;
                this.I16q = I16q;
                this.I32 = I32;
                this.I32q = I32q;
                this.I64 = I64;
                this.I64q = I64q;
                this.F = F;
                this.Fq = Fq;
                this.D = D;
                this.Dq = Dq;
            }

            /// <summary>
            /// <!-- FishyJoes.export(staticPropery) -->
            /// </summary>
            public static System.Collections.Generic.IList<byte?> StaticPropery {
                get {
                    return Check((out CreatedRef exn) => 
                        __cs_get_Primitives_PrimitiveHolder_StaticPropery(out exn).Consume<System.Collections.Generic.IList<byte?>>()
                    );
                }
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_Primitives_PrimitiveHolder_StaticPropery(out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(staticMutablePropery) -->
            /// </summary>
            public static System.Collections.Generic.IList<byte?> StaticMutablePropery {
                get {
                    return Check((out CreatedRef exn) => 
                        __cs_get_Primitives_PrimitiveHolder_StaticMutablePropery(out exn).Consume<System.Collections.Generic.IList<byte?>>()
                    );
                }
                set {
                    using var valueHandle = new GCRef(value);
                    Check((out CreatedRef exn) => 
                        __cs_set_Primitives_PrimitiveHolder_StaticMutablePropery(valueHandle.ptr, out exn)
                    );
                }
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_Primitives_PrimitiveHolder_StaticMutablePropery(out CreatedRef exn);

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __cs_set_Primitives_PrimitiveHolder_StaticMutablePropery(UnownedRef value, out CreatedRef exn);

            static PrimitiveHolder() { _TypeSetup._ensureLoaded(); }
        }
        static Primitives() { _TypeSetup._ensureLoaded(); }
    }
}

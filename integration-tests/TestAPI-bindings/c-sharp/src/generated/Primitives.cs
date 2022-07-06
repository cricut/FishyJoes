using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using Cricut.FishyJoesRuntime;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /**
     * <!-- FishyJoes.exportReference(Primitives) -->
     */
    public class Primitives : SwiftReference {
        Primitives(IntPtr reference): base(reference) {}

        /**
         * <!-- FishyJoes.export(falseBool) -->
         */
        public bool falseBool {
            get => Check((out Exception? exn) => __cs_get_Primitives_falseBool(out exn));
        }

        [DllImport("TestAPI")]
        private static extern bool __cs_get_Primitives_falseBool(out Exception? exn);

        /**
         * <!-- FishyJoes.export(trueBool) -->
         */
        public bool trueBool {
            get => Check((out Exception? exn) => __cs_get_Primitives_trueBool(out exn));
        }

        [DllImport("TestAPI")]
        private static extern bool __cs_get_Primitives_trueBool(out Exception? exn);

        /**
         * <!-- FishyJoes.export(zeroUInt8) -->
         */
        public byte zeroUInt8 {
            get => Check((out Exception? exn) => __cs_get_Primitives_zeroUInt8(out exn));
        }

        [DllImport("TestAPI")]
        private static extern byte __cs_get_Primitives_zeroUInt8(out Exception? exn);

        /**
         * <!-- FishyJoes.export(minUInt8) -->
         */
        public byte minUInt8 {
            get => Check((out Exception? exn) => __cs_get_Primitives_minUInt8(out exn));
        }

        [DllImport("TestAPI")]
        private static extern byte __cs_get_Primitives_minUInt8(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maxUInt8) -->
         */
        public byte maxUInt8 {
            get => Check((out Exception? exn) => __cs_get_Primitives_maxUInt8(out exn));
        }

        [DllImport("TestAPI")]
        private static extern byte __cs_get_Primitives_maxUInt8(out Exception? exn);

        /**
         * <!-- FishyJoes.export(zeroUInt16) -->
         */
        public ushort zeroUInt16 {
            get => Check((out Exception? exn) => __cs_get_Primitives_zeroUInt16(out exn));
        }

        [DllImport("TestAPI")]
        private static extern ushort __cs_get_Primitives_zeroUInt16(out Exception? exn);

        /**
         * <!-- FishyJoes.export(minUInt16) -->
         */
        public ushort minUInt16 {
            get => Check((out Exception? exn) => __cs_get_Primitives_minUInt16(out exn));
        }

        [DllImport("TestAPI")]
        private static extern ushort __cs_get_Primitives_minUInt16(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maxUInt16) -->
         */
        public ushort maxUInt16 {
            get => Check((out Exception? exn) => __cs_get_Primitives_maxUInt16(out exn));
        }

        [DllImport("TestAPI")]
        private static extern ushort __cs_get_Primitives_maxUInt16(out Exception? exn);

        /**
         * <!-- FishyJoes.export(zeroUInt32) -->
         */
        public uint zeroUInt32 {
            get => Check((out Exception? exn) => __cs_get_Primitives_zeroUInt32(out exn));
        }

        [DllImport("TestAPI")]
        private static extern uint __cs_get_Primitives_zeroUInt32(out Exception? exn);

        /**
         * <!-- FishyJoes.export(minUInt32) -->
         */
        public uint minUInt32 {
            get => Check((out Exception? exn) => __cs_get_Primitives_minUInt32(out exn));
        }

        [DllImport("TestAPI")]
        private static extern uint __cs_get_Primitives_minUInt32(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maxUInt32) -->
         */
        public uint maxUInt32 {
            get => Check((out Exception? exn) => __cs_get_Primitives_maxUInt32(out exn));
        }

        [DllImport("TestAPI")]
        private static extern uint __cs_get_Primitives_maxUInt32(out Exception? exn);

        /**
         * <!-- FishyJoes.export(zeroUInt64) -->
         */
        public ulong zeroUInt64 {
            get => Check((out Exception? exn) => __cs_get_Primitives_zeroUInt64(out exn));
        }

        [DllImport("TestAPI")]
        private static extern ulong __cs_get_Primitives_zeroUInt64(out Exception? exn);

        /**
         * <!-- FishyJoes.export(minUInt64) -->
         */
        public ulong minUInt64 {
            get => Check((out Exception? exn) => __cs_get_Primitives_minUInt64(out exn));
        }

        [DllImport("TestAPI")]
        private static extern ulong __cs_get_Primitives_minUInt64(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maxUInt64) -->
         */
        public ulong maxUInt64 {
            get => Check((out Exception? exn) => __cs_get_Primitives_maxUInt64(out exn));
        }

        [DllImport("TestAPI")]
        private static extern ulong __cs_get_Primitives_maxUInt64(out Exception? exn);

        /**
         * <!-- FishyJoes.export(zeroInt8) -->
         */
        public sbyte zeroInt8 {
            get => Check((out Exception? exn) => __cs_get_Primitives_zeroInt8(out exn));
        }

        [DllImport("TestAPI")]
        private static extern sbyte __cs_get_Primitives_zeroInt8(out Exception? exn);

        /**
         * <!-- FishyJoes.export(minInt8) -->
         */
        public sbyte minInt8 {
            get => Check((out Exception? exn) => __cs_get_Primitives_minInt8(out exn));
        }

        [DllImport("TestAPI")]
        private static extern sbyte __cs_get_Primitives_minInt8(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maxInt8) -->
         */
        public sbyte maxInt8 {
            get => Check((out Exception? exn) => __cs_get_Primitives_maxInt8(out exn));
        }

        [DllImport("TestAPI")]
        private static extern sbyte __cs_get_Primitives_maxInt8(out Exception? exn);

        /**
         * <!-- FishyJoes.export(zeroInt16) -->
         */
        public short zeroInt16 {
            get => Check((out Exception? exn) => __cs_get_Primitives_zeroInt16(out exn));
        }

        [DllImport("TestAPI")]
        private static extern short __cs_get_Primitives_zeroInt16(out Exception? exn);

        /**
         * <!-- FishyJoes.export(minInt16) -->
         */
        public short minInt16 {
            get => Check((out Exception? exn) => __cs_get_Primitives_minInt16(out exn));
        }

        [DllImport("TestAPI")]
        private static extern short __cs_get_Primitives_minInt16(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maxInt16) -->
         */
        public short maxInt16 {
            get => Check((out Exception? exn) => __cs_get_Primitives_maxInt16(out exn));
        }

        [DllImport("TestAPI")]
        private static extern short __cs_get_Primitives_maxInt16(out Exception? exn);

        /**
         * <!-- FishyJoes.export(zeroInt32) -->
         */
        public int zeroInt32 {
            get => Check((out Exception? exn) => __cs_get_Primitives_zeroInt32(out exn));
        }

        [DllImport("TestAPI")]
        private static extern int __cs_get_Primitives_zeroInt32(out Exception? exn);

        /**
         * <!-- FishyJoes.export(minInt32) -->
         */
        public int minInt32 {
            get => Check((out Exception? exn) => __cs_get_Primitives_minInt32(out exn));
        }

        [DllImport("TestAPI")]
        private static extern int __cs_get_Primitives_minInt32(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maxInt32) -->
         */
        public int maxInt32 {
            get => Check((out Exception? exn) => __cs_get_Primitives_maxInt32(out exn));
        }

        [DllImport("TestAPI")]
        private static extern int __cs_get_Primitives_maxInt32(out Exception? exn);

        /**
         * <!-- FishyJoes.export(zeroInt64) -->
         */
        public long zeroInt64 {
            get => Check((out Exception? exn) => __cs_get_Primitives_zeroInt64(out exn));
        }

        [DllImport("TestAPI")]
        private static extern long __cs_get_Primitives_zeroInt64(out Exception? exn);

        /**
         * <!-- FishyJoes.export(minInt64) -->
         */
        public long minInt64 {
            get => Check((out Exception? exn) => __cs_get_Primitives_minInt64(out exn));
        }

        [DllImport("TestAPI")]
        private static extern long __cs_get_Primitives_minInt64(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maxInt64) -->
         */
        public long maxInt64 {
            get => Check((out Exception? exn) => __cs_get_Primitives_maxInt64(out exn));
        }

        [DllImport("TestAPI")]
        private static extern long __cs_get_Primitives_maxInt64(out Exception? exn);

        /**
         * <!-- FishyJoes.export(zeroInt) -->
         */
        public nint zeroInt {
            get => Check((out Exception? exn) => __cs_get_Primitives_zeroInt(out exn));
        }

        [DllImport("TestAPI")]
        private static extern nint __cs_get_Primitives_zeroInt(out Exception? exn);

        /**
         * <!-- FishyJoes.export(minInt) -->
         */
        public nint minInt {
            get => Check((out Exception? exn) => __cs_get_Primitives_minInt(out exn));
        }

        [DllImport("TestAPI")]
        private static extern nint __cs_get_Primitives_minInt(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maxInt) -->
         */
        public nint maxInt {
            get => Check((out Exception? exn) => __cs_get_Primitives_maxInt(out exn));
        }

        [DllImport("TestAPI")]
        private static extern nint __cs_get_Primitives_maxInt(out Exception? exn);

        /**
         * <!-- FishyJoes.export(zeroFloat) -->
         */
        public float zeroFloat {
            get => Check((out Exception? exn) => __cs_get_Primitives_zeroFloat(out exn));
        }

        [DllImport("TestAPI")]
        private static extern float __cs_get_Primitives_zeroFloat(out Exception? exn);

        /**
         * <!-- FishyJoes.export(minFloat) -->
         */
        public float minFloat {
            get => Check((out Exception? exn) => __cs_get_Primitives_minFloat(out exn));
        }

        [DllImport("TestAPI")]
        private static extern float __cs_get_Primitives_minFloat(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maxFloat) -->
         */
        public float maxFloat {
            get => Check((out Exception? exn) => __cs_get_Primitives_maxFloat(out exn));
        }

        [DllImport("TestAPI")]
        private static extern float __cs_get_Primitives_maxFloat(out Exception? exn);

        /**
         * <!-- FishyJoes.export(zeroDouble) -->
         */
        public double zeroDouble {
            get => Check((out Exception? exn) => __cs_get_Primitives_zeroDouble(out exn));
        }

        [DllImport("TestAPI")]
        private static extern double __cs_get_Primitives_zeroDouble(out Exception? exn);

        /**
         * <!-- FishyJoes.export(minDouble) -->
         */
        public double minDouble {
            get => Check((out Exception? exn) => __cs_get_Primitives_minDouble(out exn));
        }

        [DllImport("TestAPI")]
        private static extern double __cs_get_Primitives_minDouble(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maxDouble) -->
         */
        public double maxDouble {
            get => Check((out Exception? exn) => __cs_get_Primitives_maxDouble(out exn));
        }

        [DllImport("TestAPI")]
        private static extern double __cs_get_Primitives_maxDouble(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyBool) -->
         */
        public bool[] manyBool {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyBool(out exn));
        }

        [DllImport("TestAPI")]
        private static extern bool[] __cs_get_Primitives_manyBool(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyUInt8) -->
         */
        public byte[] manyUInt8 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyUInt8(out exn));
        }

        [DllImport("TestAPI")]
        private static extern byte[] __cs_get_Primitives_manyUInt8(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyUInt16) -->
         */
        public ushort[] manyUInt16 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyUInt16(out exn));
        }

        [DllImport("TestAPI")]
        private static extern ushort[] __cs_get_Primitives_manyUInt16(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyUInt32) -->
         */
        public uint[] manyUInt32 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyUInt32(out exn));
        }

        [DllImport("TestAPI")]
        private static extern uint[] __cs_get_Primitives_manyUInt32(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyUInt64) -->
         */
        public ulong[] manyUInt64 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyUInt64(out exn));
        }

        [DllImport("TestAPI")]
        private static extern ulong[] __cs_get_Primitives_manyUInt64(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyInt8) -->
         */
        public sbyte[] manyInt8 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyInt8(out exn));
        }

        [DllImport("TestAPI")]
        private static extern sbyte[] __cs_get_Primitives_manyInt8(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyInt16) -->
         */
        public short[] manyInt16 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyInt16(out exn));
        }

        [DllImport("TestAPI")]
        private static extern short[] __cs_get_Primitives_manyInt16(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyInt32) -->
         */
        public int[] manyInt32 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyInt32(out exn));
        }

        [DllImport("TestAPI")]
        private static extern int[] __cs_get_Primitives_manyInt32(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyInt64) -->
         */
        public long[] manyInt64 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyInt64(out exn));
        }

        [DllImport("TestAPI")]
        private static extern long[] __cs_get_Primitives_manyInt64(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyFloat) -->
         */
        public float[] manyFloat {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyFloat(out exn));
        }

        [DllImport("TestAPI")]
        private static extern float[] __cs_get_Primitives_manyFloat(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyDouble) -->
         */
        public double[] manyDouble {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyDouble(out exn));
        }

        [DllImport("TestAPI")]
        private static extern double[] __cs_get_Primitives_manyDouble(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyMaybeBool) -->
         */
        public bool?[] manyMaybeBool {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyMaybeBool(out exn));
        }

        [DllImport("TestAPI")]
        private static extern bool?[] __cs_get_Primitives_manyMaybeBool(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyMaybeUInt8) -->
         */
        public byte?[] manyMaybeUInt8 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyMaybeUInt8(out exn));
        }

        [DllImport("TestAPI")]
        private static extern byte?[] __cs_get_Primitives_manyMaybeUInt8(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyMaybeUInt16) -->
         */
        public ushort?[] manyMaybeUInt16 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyMaybeUInt16(out exn));
        }

        [DllImport("TestAPI")]
        private static extern ushort?[] __cs_get_Primitives_manyMaybeUInt16(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyMaybeUInt32) -->
         */
        public uint?[] manyMaybeUInt32 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyMaybeUInt32(out exn));
        }

        [DllImport("TestAPI")]
        private static extern uint?[] __cs_get_Primitives_manyMaybeUInt32(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyMaybeUInt64) -->
         */
        public ulong?[] manyMaybeUInt64 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyMaybeUInt64(out exn));
        }

        [DllImport("TestAPI")]
        private static extern ulong?[] __cs_get_Primitives_manyMaybeUInt64(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyMaybeInt8) -->
         */
        public sbyte?[] manyMaybeInt8 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyMaybeInt8(out exn));
        }

        [DllImport("TestAPI")]
        private static extern sbyte?[] __cs_get_Primitives_manyMaybeInt8(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyMaybeInt16) -->
         */
        public short?[] manyMaybeInt16 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyMaybeInt16(out exn));
        }

        [DllImport("TestAPI")]
        private static extern short?[] __cs_get_Primitives_manyMaybeInt16(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyMaybeInt32) -->
         */
        public int?[] manyMaybeInt32 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyMaybeInt32(out exn));
        }

        [DllImport("TestAPI")]
        private static extern int?[] __cs_get_Primitives_manyMaybeInt32(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyMaybeInt64) -->
         */
        public long?[] manyMaybeInt64 {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyMaybeInt64(out exn));
        }

        [DllImport("TestAPI")]
        private static extern long?[] __cs_get_Primitives_manyMaybeInt64(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyMaybeFloat) -->
         */
        public float?[] manyMaybeFloat {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyMaybeFloat(out exn));
        }

        [DllImport("TestAPI")]
        private static extern float?[] __cs_get_Primitives_manyMaybeFloat(out Exception? exn);

        /**
         * <!-- FishyJoes.export(manyMaybeDouble) -->
         */
        public double?[] manyMaybeDouble {
            get => Check((out Exception? exn) => __cs_get_Primitives_manyMaybeDouble(out exn));
        }

        [DllImport("TestAPI")]
        private static extern double?[] __cs_get_Primitives_manyMaybeDouble(out Exception? exn);

        /**
         * <!-- FishyJoes.export(defaultPrimitiveHolder) -->
         */
        public Cricut.TestAPI.Primitives.PrimitiveHolder defaultPrimitiveHolder {
            get => Check((out Exception? exn) => __cs_get_Primitives_defaultPrimitiveHolder(out exn));
        }

        [DllImport("TestAPI")]
        private static extern Cricut.TestAPI.Primitives.PrimitiveHolder __cs_get_Primitives_defaultPrimitiveHolder(out Exception? exn);

        /**
         * <!-- FishyJoes.export(echoBool) -->
         */
        public bool echoBool(
            bool value
        ) => Check((out Exception? exn) => __cs_Primitives_echoBool(value, out exn));
        [DllImport("TestAPI")]
        static extern bool __cs_Primitives_echoBool(
            bool value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoUInt8) -->
         */
        public byte echoUInt8(
            byte value
        ) => Check((out Exception? exn) => __cs_Primitives_echoUInt8(value, out exn));
        [DllImport("TestAPI")]
        static extern byte __cs_Primitives_echoUInt8(
            byte value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoUInt16) -->
         */
        public ushort echoUInt16(
            ushort value
        ) => Check((out Exception? exn) => __cs_Primitives_echoUInt16(value, out exn));
        [DllImport("TestAPI")]
        static extern ushort __cs_Primitives_echoUInt16(
            ushort value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoUInt32) -->
         */
        public uint echoUInt32(
            uint value
        ) => Check((out Exception? exn) => __cs_Primitives_echoUInt32(value, out exn));
        [DllImport("TestAPI")]
        static extern uint __cs_Primitives_echoUInt32(
            uint value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoUInt64) -->
         */
        public ulong echoUInt64(
            ulong value
        ) => Check((out Exception? exn) => __cs_Primitives_echoUInt64(value, out exn));
        [DllImport("TestAPI")]
        static extern ulong __cs_Primitives_echoUInt64(
            ulong value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoInt8) -->
         */
        public sbyte echoInt8(
            sbyte value
        ) => Check((out Exception? exn) => __cs_Primitives_echoInt8(value, out exn));
        [DllImport("TestAPI")]
        static extern sbyte __cs_Primitives_echoInt8(
            sbyte value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoInt16) -->
         */
        public short echoInt16(
            short value
        ) => Check((out Exception? exn) => __cs_Primitives_echoInt16(value, out exn));
        [DllImport("TestAPI")]
        static extern short __cs_Primitives_echoInt16(
            short value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoInt32) -->
         */
        public int echoInt32(
            int value
        ) => Check((out Exception? exn) => __cs_Primitives_echoInt32(value, out exn));
        [DllImport("TestAPI")]
        static extern int __cs_Primitives_echoInt32(
            int value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoInt64) -->
         */
        public long echoInt64(
            long value
        ) => Check((out Exception? exn) => __cs_Primitives_echoInt64(value, out exn));
        [DllImport("TestAPI")]
        static extern long __cs_Primitives_echoInt64(
            long value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoFloat) -->
         */
        public float echoFloat(
            float value
        ) => Check((out Exception? exn) => __cs_Primitives_echoFloat(value, out exn));
        [DllImport("TestAPI")]
        static extern float __cs_Primitives_echoFloat(
            float value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoDouble) -->
         */
        public double echoDouble(
            double value
        ) => Check((out Exception? exn) => __cs_Primitives_echoDouble(value, out exn));
        [DllImport("TestAPI")]
        static extern double __cs_Primitives_echoDouble(
            double value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoBool) -->
         */
        public bool? maybeEchoBool(
            bool? value
        ) => Check((out Exception? exn) => __cs_Primitives_maybeEchoBool(value, out exn));
        [DllImport("TestAPI")]
        static extern bool? __cs_Primitives_maybeEchoBool(
            bool? value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoUInt8) -->
         */
        public byte? maybeEchoUInt8(
            byte? value
        ) => Check((out Exception? exn) => __cs_Primitives_maybeEchoUInt8(value, out exn));
        [DllImport("TestAPI")]
        static extern byte? __cs_Primitives_maybeEchoUInt8(
            byte? value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoUInt16) -->
         */
        public ushort? maybeEchoUInt16(
            ushort? value
        ) => Check((out Exception? exn) => __cs_Primitives_maybeEchoUInt16(value, out exn));
        [DllImport("TestAPI")]
        static extern ushort? __cs_Primitives_maybeEchoUInt16(
            ushort? value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoUInt32) -->
         */
        public uint? maybeEchoUInt32(
            uint? value
        ) => Check((out Exception? exn) => __cs_Primitives_maybeEchoUInt32(value, out exn));
        [DllImport("TestAPI")]
        static extern uint? __cs_Primitives_maybeEchoUInt32(
            uint? value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoUInt64) -->
         */
        public ulong? maybeEchoUInt64(
            ulong? value
        ) => Check((out Exception? exn) => __cs_Primitives_maybeEchoUInt64(value, out exn));
        [DllImport("TestAPI")]
        static extern ulong? __cs_Primitives_maybeEchoUInt64(
            ulong? value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoInt8) -->
         */
        public sbyte? maybeEchoInt8(
            sbyte? value
        ) => Check((out Exception? exn) => __cs_Primitives_maybeEchoInt8(value, out exn));
        [DllImport("TestAPI")]
        static extern sbyte? __cs_Primitives_maybeEchoInt8(
            sbyte? value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoInt16) -->
         */
        public short? maybeEchoInt16(
            short? value
        ) => Check((out Exception? exn) => __cs_Primitives_maybeEchoInt16(value, out exn));
        [DllImport("TestAPI")]
        static extern short? __cs_Primitives_maybeEchoInt16(
            short? value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoInt32) -->
         */
        public int? maybeEchoInt32(
            int? value
        ) => Check((out Exception? exn) => __cs_Primitives_maybeEchoInt32(value, out exn));
        [DllImport("TestAPI")]
        static extern int? __cs_Primitives_maybeEchoInt32(
            int? value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoInt64) -->
         */
        public long? maybeEchoInt64(
            long? value
        ) => Check((out Exception? exn) => __cs_Primitives_maybeEchoInt64(value, out exn));
        [DllImport("TestAPI")]
        static extern long? __cs_Primitives_maybeEchoInt64(
            long? value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoFloat) -->
         */
        public float? maybeEchoFloat(
            float? value
        ) => Check((out Exception? exn) => __cs_Primitives_maybeEchoFloat(value, out exn));
        [DllImport("TestAPI")]
        static extern float? __cs_Primitives_maybeEchoFloat(
            float? value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(maybeEchoDouble) -->
         */
        public double? maybeEchoDouble(
            double? value
        ) => Check((out Exception? exn) => __cs_Primitives_maybeEchoDouble(value, out exn));
        [DllImport("TestAPI")]
        static extern double? __cs_Primitives_maybeEchoDouble(
            double? value,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(Primitives.PrimitiveHolder) -->
         */
        public class PrimitiveHolder {
            bool b;
            bool? bq;
            byte ui8;
            byte? ui8q;
            ushort ui16;
            ushort? ui16q;
            uint ui32;
            uint? ui32q;
            ulong ui64;
            ulong? ui64q;
            sbyte i8;
            sbyte? i8q;
            short i16;
            short? i16q;
            int i32;
            int? i32q;
            long i64;
            long? i64q;
            float f;
            float? fq;
            double d;
            double? dq;

            PrimitiveHolder(
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
            public byte?[] staticPropery {
                get => Check((out Exception? exn) => __cs_get_Primitives_PrimitiveHolder_staticPropery(out exn));
            }

            [DllImport("TestAPI")]
            private static extern byte?[] __cs_get_Primitives_PrimitiveHolder_staticPropery(out Exception? exn);

            /**
             * <!-- FishyJoes.export(staticMutablePropery) -->
             */
            public byte?[] staticMutablePropery {
                get => Check((out Exception? exn) => __cs_get_Primitives_PrimitiveHolder_staticMutablePropery(out exn));
                set { Check((out Exception? exn) => __cs_set_Primitives_PrimitiveHolder_staticMutablePropery(value, out exn)); }
            }

            [DllImport("TestAPI")]
            private static extern byte?[] __cs_get_Primitives_PrimitiveHolder_staticMutablePropery(out Exception? exn);

            [DllImport("TestAPI")]
            private static extern void __cs_set_Primitives_PrimitiveHolder_staticMutablePropery(byte?[] value, out Exception? exn);

            static PrimitiveHolder() { _TypeSetup._ensureLoaded(); }
        }
        static Primitives() { _TypeSetup._ensureLoaded(); }
    }
}

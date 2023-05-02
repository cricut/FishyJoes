using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(ClosedRanges) -->
    /// </summary>
    public record ClosedRanges {
        private ClosedRanges() {}

        /// <summary>
        /// <!-- FishyJoes.export(uInt8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<byte> UInt8Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_UInt8Range(out exn).Consume<Cricut.FishyJoesRuntime.ClosedRange<byte>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_UInt8Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<ushort> UInt16Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_UInt16Range(out exn).Consume<Cricut.FishyJoesRuntime.ClosedRange<ushort>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_UInt16Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<uint> UInt32Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_UInt32Range(out exn).Consume<Cricut.FishyJoesRuntime.ClosedRange<uint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_UInt32Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<ulong> UInt64Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_UInt64Range(out exn).Consume<Cricut.FishyJoesRuntime.ClosedRange<ulong>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_UInt64Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uIntRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<nuint> UIntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_UIntRange(out exn).Consume<Cricut.FishyJoesRuntime.ClosedRange<nuint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_UIntRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<sbyte> Int8Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_Int8Range(out exn).Consume<Cricut.FishyJoesRuntime.ClosedRange<sbyte>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_Int8Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<short> Int16Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_Int16Range(out exn).Consume<Cricut.FishyJoesRuntime.ClosedRange<short>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_Int16Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<int> Int32Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_Int32Range(out exn).Consume<Cricut.FishyJoesRuntime.ClosedRange<int>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_Int32Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<long> Int64Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_Int64Range(out exn).Consume<Cricut.FishyJoesRuntime.ClosedRange<long>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_Int64Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(intRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<nint> IntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_IntRange(out exn).Consume<Cricut.FishyJoesRuntime.ClosedRange<nint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_IntRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(floatRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<float> FloatRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_FloatRange(out exn).Consume<Cricut.FishyJoesRuntime.ClosedRange<float>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_FloatRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(doubleRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<double> DoubleRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_DoubleRange(out exn).Consume<Cricut.FishyJoesRuntime.ClosedRange<double>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_DoubleRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(stringRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<string> StringRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_StringRange(out exn).Consume<Cricut.FishyJoesRuntime.ClosedRange<string>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_StringRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<byte> EchoUInt8Range(
            Cricut.FishyJoesRuntime.ClosedRange<byte> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoUInt8Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.ClosedRange<byte>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoUInt8Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<ushort> EchoUInt16Range(
            Cricut.FishyJoesRuntime.ClosedRange<ushort> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoUInt16Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.ClosedRange<ushort>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoUInt16Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<uint> EchoUInt32Range(
            Cricut.FishyJoesRuntime.ClosedRange<uint> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoUInt32Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.ClosedRange<uint>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoUInt32Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<ulong> EchoUInt64Range(
            Cricut.FishyJoesRuntime.ClosedRange<ulong> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoUInt64Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.ClosedRange<ulong>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoUInt64Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUIntRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<nuint> EchoUIntRange(
            Cricut.FishyJoesRuntime.ClosedRange<nuint> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoUIntRange(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.ClosedRange<nuint>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoUIntRange(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<sbyte> EchoInt8Range(
            Cricut.FishyJoesRuntime.ClosedRange<sbyte> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoInt8Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.ClosedRange<sbyte>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoInt8Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<short> EchoInt16Range(
            Cricut.FishyJoesRuntime.ClosedRange<short> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoInt16Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.ClosedRange<short>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoInt16Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<int> EchoInt32Range(
            Cricut.FishyJoesRuntime.ClosedRange<int> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoInt32Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.ClosedRange<int>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoInt32Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<long> EchoInt64Range(
            Cricut.FishyJoesRuntime.ClosedRange<long> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoInt64Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.ClosedRange<long>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoInt64Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoIntRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<nint> EchoIntRange(
            Cricut.FishyJoesRuntime.ClosedRange<nint> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoIntRange(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.ClosedRange<nint>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoIntRange(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoFloatRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<float> EchoFloatRange(
            Cricut.FishyJoesRuntime.ClosedRange<float> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoFloatRange(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.ClosedRange<float>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoFloatRange(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoDoubleRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<double> EchoDoubleRange(
            Cricut.FishyJoesRuntime.ClosedRange<double> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoDoubleRange(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.ClosedRange<double>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoDoubleRange(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoStringRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.ClosedRange<string> EchoStringRange(
            Cricut.FishyJoesRuntime.ClosedRange<string> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoStringRange(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.ClosedRange<string>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoStringRange(
            UnownedRef range,
            out CreatedRef exn
        );

        static ClosedRanges() { _TypeSetup._ensureLoaded(); }
    }
}

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
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<byte> UInt8Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_UInt8Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<byte>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_UInt8Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<ushort> UInt16Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_UInt16Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<ushort>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_UInt16Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<uint> UInt32Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_UInt32Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<uint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_UInt32Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<ulong> UInt64Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_UInt64Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<ulong>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_UInt64Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uIntRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<nuint> UIntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_UIntRange(out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<nuint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_UIntRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<sbyte> Int8Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_Int8Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<sbyte>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_Int8Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<short> Int16Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_Int16Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<short>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_Int16Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<int> Int32Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_Int32Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<int>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_Int32Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<long> Int64Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_Int64Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<long>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_Int64Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(intRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<nint> IntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_IntRange(out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<nint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_IntRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(floatRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<float> FloatRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_FloatRange(out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<float>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_FloatRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(doubleRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<double> DoubleRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_DoubleRange(out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<double>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_DoubleRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(stringRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<string> StringRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_ClosedRanges_StringRange(out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<string>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_ClosedRanges_StringRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<byte> EchoUInt8Range(
            Cricut.FishyJoesRuntime.SwiftClosedRange<byte> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoUInt8Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<byte>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoUInt8Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<ushort> EchoUInt16Range(
            Cricut.FishyJoesRuntime.SwiftClosedRange<ushort> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoUInt16Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<ushort>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoUInt16Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<uint> EchoUInt32Range(
            Cricut.FishyJoesRuntime.SwiftClosedRange<uint> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoUInt32Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<uint>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoUInt32Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<ulong> EchoUInt64Range(
            Cricut.FishyJoesRuntime.SwiftClosedRange<ulong> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoUInt64Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<ulong>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoUInt64Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUIntRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<nuint> EchoUIntRange(
            Cricut.FishyJoesRuntime.SwiftClosedRange<nuint> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoUIntRange(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<nuint>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoUIntRange(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<sbyte> EchoInt8Range(
            Cricut.FishyJoesRuntime.SwiftClosedRange<sbyte> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoInt8Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<sbyte>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoInt8Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<short> EchoInt16Range(
            Cricut.FishyJoesRuntime.SwiftClosedRange<short> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoInt16Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<short>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoInt16Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<int> EchoInt32Range(
            Cricut.FishyJoesRuntime.SwiftClosedRange<int> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoInt32Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<int>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoInt32Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<long> EchoInt64Range(
            Cricut.FishyJoesRuntime.SwiftClosedRange<long> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoInt64Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<long>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoInt64Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoIntRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<nint> EchoIntRange(
            Cricut.FishyJoesRuntime.SwiftClosedRange<nint> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoIntRange(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<nint>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoIntRange(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoFloatRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<float> EchoFloatRange(
            Cricut.FishyJoesRuntime.SwiftClosedRange<float> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoFloatRange(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<float>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoFloatRange(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoDoubleRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<double> EchoDoubleRange(
            Cricut.FishyJoesRuntime.SwiftClosedRange<double> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoDoubleRange(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<double>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoDoubleRange(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoStringRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<string> EchoStringRange(
            Cricut.FishyJoesRuntime.SwiftClosedRange<string> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_ClosedRanges_echoStringRange(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<string>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_ClosedRanges_echoStringRange(
            UnownedRef range,
            out CreatedRef exn
        );

        static ClosedRanges() { _TypeSetup._ensureLoaded(); }
    }
}

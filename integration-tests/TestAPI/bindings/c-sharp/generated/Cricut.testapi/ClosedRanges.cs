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
                    __iota_get_TestAPI_ClosedRanges_uInt8Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<byte>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ClosedRanges_uInt8Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<ushort> UInt16Range {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_ClosedRanges_uInt16Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<ushort>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ClosedRanges_uInt16Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<uint> UInt32Range {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_ClosedRanges_uInt32Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<uint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ClosedRanges_uInt32Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<ulong> UInt64Range {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_ClosedRanges_uInt64Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<ulong>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ClosedRanges_uInt64Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uIntRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<nuint> UIntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_ClosedRanges_uIntRange(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<nuint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ClosedRanges_uIntRange(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<sbyte> Int8Range {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_ClosedRanges_int8Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<sbyte>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ClosedRanges_int8Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<short> Int16Range {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_ClosedRanges_int16Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<short>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ClosedRanges_int16Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<int> Int32Range {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_ClosedRanges_int32Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<int>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ClosedRanges_int32Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<long> Int64Range {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_ClosedRanges_int64Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<long>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ClosedRanges_int64Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(intRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<nint> IntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_ClosedRanges_intRange(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<nint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ClosedRanges_intRange(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(floatRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<float> FloatRange {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_ClosedRanges_floatRange(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<float>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ClosedRanges_floatRange(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(doubleRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<double> DoubleRange {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_ClosedRanges_doubleRange(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<double>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ClosedRanges_doubleRange(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(stringRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<string> StringRange {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_ClosedRanges_stringRange(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<string>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_ClosedRanges_stringRange(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftClosedRange<byte> EchoUInt8Range(
            Cricut.FishyJoesRuntime.SwiftClosedRange<byte> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __iota_TestAPI_ClosedRanges_echoUInt8Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<byte>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ClosedRanges_echoUInt8Range(
            IntPtr envRef,
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_ClosedRanges_echoUInt16Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<ushort>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ClosedRanges_echoUInt16Range(
            IntPtr envRef,
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_ClosedRanges_echoUInt32Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<uint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ClosedRanges_echoUInt32Range(
            IntPtr envRef,
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_ClosedRanges_echoUInt64Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<ulong>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ClosedRanges_echoUInt64Range(
            IntPtr envRef,
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_ClosedRanges_echoUIntRange(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<nuint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ClosedRanges_echoUIntRange(
            IntPtr envRef,
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_ClosedRanges_echoInt8Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<sbyte>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ClosedRanges_echoInt8Range(
            IntPtr envRef,
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_ClosedRanges_echoInt16Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<short>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ClosedRanges_echoInt16Range(
            IntPtr envRef,
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_ClosedRanges_echoInt32Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<int>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ClosedRanges_echoInt32Range(
            IntPtr envRef,
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_ClosedRanges_echoInt64Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<long>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ClosedRanges_echoInt64Range(
            IntPtr envRef,
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_ClosedRanges_echoIntRange(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<nint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ClosedRanges_echoIntRange(
            IntPtr envRef,
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_ClosedRanges_echoFloatRange(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<float>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ClosedRanges_echoFloatRange(
            IntPtr envRef,
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_ClosedRanges_echoDoubleRange(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<double>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ClosedRanges_echoDoubleRange(
            IntPtr envRef,
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_ClosedRanges_echoStringRange(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftClosedRange<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ClosedRanges_echoStringRange(
            IntPtr envRef,
            UnownedRef range,
            out CreatedRef exn
        );

        static ClosedRanges() { _TypeSetup._ensureLoaded(); }
    }
}

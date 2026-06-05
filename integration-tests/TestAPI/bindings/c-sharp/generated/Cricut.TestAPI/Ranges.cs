using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Ranges) -->
    /// </summary>
    public record Ranges {
        private Ranges() {}

        /// <summary>
        /// <!-- FishyJoes.export(int16Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<short> Int16Range {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Ranges_int16Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<short>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Ranges_int16Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int32Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<int> Int32Range {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Ranges_int32Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<int>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Ranges_int32Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int64Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<long> Int64Range {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Ranges_int64Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<long>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Ranges_int64Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int8Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<sbyte> Int8Range {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Ranges_int8Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<sbyte>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Ranges_int8Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(intRange) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<nint> IntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Ranges_intRange(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<nint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Ranges_intRange(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt16Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<ushort> UInt16Range {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Ranges_uInt16Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<ushort>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Ranges_uInt16Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt32Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<uint> UInt32Range {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Ranges_uInt32Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<uint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Ranges_uInt32Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt64Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<ulong> UInt64Range {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Ranges_uInt64Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<ulong>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Ranges_uInt64Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt8Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<byte> UInt8Range {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Ranges_uInt8Range(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<byte>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Ranges_uInt8Range(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uIntRange) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<nuint> UIntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Ranges_uIntRange(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<nuint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Ranges_uIntRange(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt8Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<byte> EchoUInt8Range(
            Cricut.FishyJoesRuntime.SwiftRange<byte> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Ranges_echoUInt8Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<byte>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Ranges_echoUInt8Range(
            IntPtr envRef,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt16Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<ushort> EchoUInt16Range(
            Cricut.FishyJoesRuntime.SwiftRange<ushort> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Ranges_echoUInt16Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<ushort>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Ranges_echoUInt16Range(
            IntPtr envRef,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt32Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<uint> EchoUInt32Range(
            Cricut.FishyJoesRuntime.SwiftRange<uint> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Ranges_echoUInt32Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<uint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Ranges_echoUInt32Range(
            IntPtr envRef,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt64Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<ulong> EchoUInt64Range(
            Cricut.FishyJoesRuntime.SwiftRange<ulong> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Ranges_echoUInt64Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<ulong>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Ranges_echoUInt64Range(
            IntPtr envRef,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUIntRange) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<nuint> EchoUIntRange(
            Cricut.FishyJoesRuntime.SwiftRange<nuint> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Ranges_echoUIntRange(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<nuint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Ranges_echoUIntRange(
            IntPtr envRef,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt8Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<sbyte> EchoInt8Range(
            Cricut.FishyJoesRuntime.SwiftRange<sbyte> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Ranges_echoInt8Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<sbyte>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Ranges_echoInt8Range(
            IntPtr envRef,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt16Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<short> EchoInt16Range(
            Cricut.FishyJoesRuntime.SwiftRange<short> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Ranges_echoInt16Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<short>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Ranges_echoInt16Range(
            IntPtr envRef,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt32Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<int> EchoInt32Range(
            Cricut.FishyJoesRuntime.SwiftRange<int> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Ranges_echoInt32Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<int>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Ranges_echoInt32Range(
            IntPtr envRef,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt64Range) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<long> EchoInt64Range(
            Cricut.FishyJoesRuntime.SwiftRange<long> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Ranges_echoInt64Range(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<long>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Ranges_echoInt64Range(
            IntPtr envRef,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoIntRange) -->
        /// </summary>
        public staticCricut.FishyJoesRuntime.SwiftRange<nint> EchoIntRange(
            Cricut.FishyJoesRuntime.SwiftRange<nint> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Ranges_echoIntRange(Loader.env, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<nint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Ranges_echoIntRange(
            IntPtr envRef,
            UnownedRef range,
            out CreatedRef exn
        );

        static Ranges() { _TypeSetup._ensureLoaded(); }
    }
}

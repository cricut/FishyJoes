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
        /// <!-- FishyJoes.export(uInt8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<byte> UInt8Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_TestAPI_Ranges_UInt8Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<byte>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_TestAPI_Ranges_UInt8Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<ushort> UInt16Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_TestAPI_Ranges_UInt16Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<ushort>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_TestAPI_Ranges_UInt16Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<uint> UInt32Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_TestAPI_Ranges_UInt32Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<uint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_TestAPI_Ranges_UInt32Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uInt64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<ulong> UInt64Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_TestAPI_Ranges_UInt64Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<ulong>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_TestAPI_Ranges_UInt64Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(uIntRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<nuint> UIntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_TestAPI_Ranges_UIntRange(out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<nuint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_TestAPI_Ranges_UIntRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<sbyte> Int8Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_TestAPI_Ranges_Int8Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<sbyte>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_TestAPI_Ranges_Int8Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<short> Int16Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_TestAPI_Ranges_Int16Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<short>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_TestAPI_Ranges_Int16Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<int> Int32Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_TestAPI_Ranges_Int32Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<int>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_TestAPI_Ranges_Int32Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(int64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<long> Int64Range {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_TestAPI_Ranges_Int64Range(out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<long>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_TestAPI_Ranges_Int64Range(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(intRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<nint> IntRange {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_TestAPI_Ranges_IntRange(out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<nint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_TestAPI_Ranges_IntRange(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<byte> EchoUInt8Range(
            Cricut.FishyJoesRuntime.SwiftRange<byte> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_TestAPI_Ranges_echoUInt8Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<byte>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_TestAPI_Ranges_echoUInt8Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<ushort> EchoUInt16Range(
            Cricut.FishyJoesRuntime.SwiftRange<ushort> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_TestAPI_Ranges_echoUInt16Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<ushort>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_TestAPI_Ranges_echoUInt16Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<uint> EchoUInt32Range(
            Cricut.FishyJoesRuntime.SwiftRange<uint> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_TestAPI_Ranges_echoUInt32Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<uint>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_TestAPI_Ranges_echoUInt32Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUInt64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<ulong> EchoUInt64Range(
            Cricut.FishyJoesRuntime.SwiftRange<ulong> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_TestAPI_Ranges_echoUInt64Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<ulong>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_TestAPI_Ranges_echoUInt64Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoUIntRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<nuint> EchoUIntRange(
            Cricut.FishyJoesRuntime.SwiftRange<nuint> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_TestAPI_Ranges_echoUIntRange(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<nuint>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_TestAPI_Ranges_echoUIntRange(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt8Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<sbyte> EchoInt8Range(
            Cricut.FishyJoesRuntime.SwiftRange<sbyte> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_TestAPI_Ranges_echoInt8Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<sbyte>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_TestAPI_Ranges_echoInt8Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt16Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<short> EchoInt16Range(
            Cricut.FishyJoesRuntime.SwiftRange<short> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_TestAPI_Ranges_echoInt16Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<short>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_TestAPI_Ranges_echoInt16Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt32Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<int> EchoInt32Range(
            Cricut.FishyJoesRuntime.SwiftRange<int> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_TestAPI_Ranges_echoInt32Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<int>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_TestAPI_Ranges_echoInt32Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoInt64Range) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<long> EchoInt64Range(
            Cricut.FishyJoesRuntime.SwiftRange<long> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_TestAPI_Ranges_echoInt64Range(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<long>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_TestAPI_Ranges_echoInt64Range(
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoIntRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<nint> EchoIntRange(
            Cricut.FishyJoesRuntime.SwiftRange<nint> range
        ) {
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_TestAPI_Ranges_echoIntRange(_rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<nint>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_TestAPI_Ranges_echoIntRange(
            UnownedRef range,
            out CreatedRef exn
        );

        static Ranges() { _TypeSetup._ensureLoaded(); }
    }
}
